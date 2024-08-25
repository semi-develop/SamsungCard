//
//  CardInfo.swift
//  SamsungCard
//
//  Created by 한세미 on 8/22/24.
//

enum CardType: Int {
    case CHECK = 0
    case CREDIT = 1
}

class CardInfoRVO: Decodable {
    var name: String
    var num: String
    var imgUrl: String
    var type: Int
    var descrip: String?
    var moreInfo: String
}

class CardInfo{
    var name: String
    var num: String
    var imgUrl: String
    var type: Int
    var descrip: String?
    var moreInfo: String
    var isGif: Bool
    
    init(cardInfo: CardInfoRVO) {
        self.name = cardInfo.name.removingPercentEncoding ?? ""
        self.num = cardInfo.num
        self.imgUrl = "\(Const.DefaultHost)/\(Const.CardImgPath)\(cardInfo.imgUrl)"
        self.type = cardInfo.type
        self.descrip = cardInfo.descrip?.removingPercentEncoding
        self.moreInfo = cardInfo.moreInfo.removingPercentEncoding ?? ""
        
        guard let imgTp = cardInfo.imgUrl.components(separatedBy: ".").last else { 
            self.isGif = false
            return
        }
        self.isGif = imgTp.lowercased() == "gif"
    }
}

