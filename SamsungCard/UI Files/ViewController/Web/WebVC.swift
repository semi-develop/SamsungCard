//
//  webVC.swift
//  SamsungCard
//
//  Created by 한세미 on 8/25/24.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import SnapKit

class WebVC: BaseVC, WKNavigationDelegate {
    
    var headerVw = UIView()
    var headerLb = UILabel()
    var headerBtn = UIButton()
    
    var webview: WKWebView?
    
    let headerTitle: String!
    let webVwUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경색 설정
        self.view.backgroundColor = .white
        
    }
    
    override func setUI() {
        self.view.addSubview(self.headerVw)
        self.headerVw.addSubview(self.headerLb)
        self.headerVw.addSubview(self.headerBtn)
        
        // 헤더
        self.headerVw.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(58.0)
        }
        self.headerVw.backgroundColor = .white
        
        self.headerLb.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24.0)
            make.centerY.equalToSuperview()
        }
        self.headerLb.text = self.headerTitle
        self.headerLb.font = UIFont(name: "NanumGothicBold", size: 18)
        
        self.headerBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(8.0)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(headerBtn.snp.height).multipliedBy(1.0)
        }
        self.headerBtn.setImage(UIImage(named: "top_btn_close"), for: .normal)
        
        // 웹뷰
        let wkConfig = WKWebViewConfiguration()
        self.webview = WKWebView(frame: .zero, configuration: wkConfig)
        self.webview?.navigationDelegate = self
        self.view.addSubview(self.webview!)
        self.webview?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.headerVw.snp.bottom)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        })
        
        if let url = self.webVwUrl {
            self.webview!.load(URLRequest(url: url))
        }
    }
    
    override func setRX() {
        headerBtn.rx.tap
        .bind(onNext: { [weak self] in
            self?.dismiss(animated: true)
        })
        .disposed(by: disposeBag)
    }
    
    init(title: String, url: URL) {
        self.headerTitle = title
        self.webVwUrl = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.headerTitle = ""
        self.webVwUrl = URL(string: "")
        super.init(coder: aDecoder)
    }
    
}
