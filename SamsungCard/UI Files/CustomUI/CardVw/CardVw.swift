//
//  CardVw.swift
//  SamsungCard
//
//  Created by 한세미 on 8/22/24.
//

import UIKit
import FLAnimatedImage
import RxSwift

class CardVw: UIView {
    
    @IBOutlet weak var cardNm: UILabel!
    @IBOutlet weak var cardNum: UILabel!
    @IBOutlet weak var cardImgVw: FLAnimatedImageView!
    @IBOutlet weak var tpStackVw: UIStackView!
    @IBOutlet weak var linkBtn: UIButton!
    
    let disposeBag = DisposeBag()
    var cardInfo: CardInfo? {
        didSet {
            self.setting()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setting() {
        
        guard let info = cardInfo else { return }
        cardNm.text = info.name
        cardNum.text = info.num
        if info.type < tpStackVw.subviews.count {
            tpStackVw.subviews[info.type].isHidden = false
        }
        
        Task {
            if info.isGif {
                guard let gif = await info.imgUrl.loadGif() else { return }
                    DispatchQueue.main.async {
                    self.cardImgVw.animatedImage = gif
                }
            } else {
                guard let image = await info.imgUrl.loadImage() else { return }
                    DispatchQueue.main.async {
                    self.cardImgVw.image = image
                }
            }
        }
        
        self.linkBtn.rx.tap
            .bind{
                let wv = WebVC(title: info.name, url: URL(string: info.moreInfo)!)
                guard let rootView = UIApplication.shared.keyWindow?.rootViewController else {
                    return
                }
                rootView.present(wv, animated: true)
            }.disposed(by: disposeBag)
    }
}
