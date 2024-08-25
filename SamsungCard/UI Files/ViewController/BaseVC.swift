//
//  BaseVC.swift
//  SamsungCard
//
//  Created by 한세미 on 8/22/24.
//

import UIKit
import RxSwift

protocol BaseVCProtocol {
    func setUI()
    func setRX()
    func updateLocalized()
}

class BaseVC: UIViewController, BaseVCProtocol {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setRX()
        self.updateLocalized()
    }
    
    func setUI() {}
    
    func setRX() {}
    
    func updateLocalized() {}
}
