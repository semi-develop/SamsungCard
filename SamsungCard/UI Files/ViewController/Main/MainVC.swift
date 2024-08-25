//
//  MainVC.swift
//  SamsungCard
//
//  Created by 한세미 on 8/22/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MainVC: BaseVC {

    @IBOutlet weak var pagingVw: PaginatedView!
    @IBOutlet weak var descLb: UILabel!
    
    let mainVM = MainVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.mainVM.refresh()
    }
    
    override func setRX() {
        self.mainVM.cardList
            .subscribe (onNext: { [weak self] infos in
                guard let ws = self else { return }
                var cardList = [CardVw]()
                for info in infos {
                    let cardVw = Bundle.main.loadNibNamed("CardVw", owner: self, options: nil)?.first as! CardVw
                    
                    cardVw.cardInfo = info
                    cardList.append(cardVw)
                }
                ws.pagingVw.setSubvw(views: cardList)
                if !infos.isEmpty {
                    ws.descLb.text = infos.first!.descrip
                }
            }).disposed(by: disposeBag)
        
        self.pagingVw.rx.didScroll
            .withLatestFrom(self.mainVM.cardList) { _, cardList in
                return cardList
            }
            .subscribe(onNext: { [weak self] cardList in
                guard let ws = self else { return }

                let idx = Int(ws.pagingVw.contentOffset.x / ws.pagingVw.getSubWidth())
                ws.descLb.text = idx < cardList.count ? cardList[idx].descrip : ""
                
            }).disposed(by: disposeBag)
    }
}

