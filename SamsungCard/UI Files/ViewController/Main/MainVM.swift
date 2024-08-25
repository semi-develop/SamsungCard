//
//  MainVM.swift
//  SamsungCard
//
//  Created by 한세미 on 8/22/24.
//

import Foundation
import RxSwift
import RxCocoa

class MainVM {
    
    let cardList = PublishSubject<[CardInfo]>()
    
    func refresh() {
        guard let url = Bundle.main.url(forResource: "CardInfo", withExtension: "json") else {
            Utility.print("not found json file")
            self.cardList.onNext([])
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            Utility.print("failed to data conversion")
            self.cardList.onNext([])
            return
        }
        
        guard let list = CodableManager.decodeArray(type: CardInfoRVO.self, data) else {
            self.cardList.onNext([])
            return
        }
        self.cardList.onNext(list.map{CardInfo(cardInfo: $0)})
    }
    
    
}
