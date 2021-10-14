//
//  CustomBodyLabel.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import UIKit

class CustomBodyLabel: UILabel {

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    //MARK: - Methods
    private func configure(){
        textColor                   = .secondaryLabel
        font                        = UIFont.preferredFont(forTextStyle: .caption1)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.75
        lineBreakMode               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
