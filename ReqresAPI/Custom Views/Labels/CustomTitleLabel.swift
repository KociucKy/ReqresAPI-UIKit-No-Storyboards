//
//  CustomTitleLabel.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import UIKit

class CustomTitleLabel: UILabel {

    //MARK: - Initializers
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat, textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textAlignment = textAlignment
        configure()
    }
    
    
    //MARK: - Methods
    private func configure(){
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
