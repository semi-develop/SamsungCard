//
//  PaginatedView.swift
//  SamsungCard
//
//  Created by 한세미 on 8/22/24.
//

import Foundation
import UIKit
import SnapKit

class PaginatedView: UIScrollView {
    private var stackVw: UIStackView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInit()
    }
    
    private func setInit() {
        
        self.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        self.isPagingEnabled = true
        self.clipsToBounds = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        stackVw = UIStackView()
        self.addSubview(stackVw)
        self.stackVw.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.height.equalToSuperview()
        }
        
    }
    func setDelegate(vc: UIScrollViewDelegate) {
        self.delegate = vc
    }
    
    func setSubvw(views: [UIView]) {
        
        _ = self.stackVw.subviews.map { $0.removeFromSuperview()
        }
        for vw in views {
            stackVw.addArrangedSubview(vw)
            vw.translatesAutoresizingMaskIntoConstraints = false
            vw.snp.makeConstraints {
                $0.width.equalTo(self)
            }
        }
    }
    
    func getSubWidth() -> CGFloat {
        return self.frame.width
    }
}
