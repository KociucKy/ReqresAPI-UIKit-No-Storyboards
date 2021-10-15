//
//  Constants.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 15/10/2021.
//

import UIKit

enum K{
    enum Alerts{
        static let anErrorOccured   = "Bad Stuff Happend"
        static let alertAction      = "OK"
    }
    
    enum TableView{
        static let numberOfRows = 1
        static let paddingBetweenCells = 1.0
        static let rowHeight = 70.0
        static let cellCornerRadius = 20.0
        static let tableViewHorizontalPadding = 12.0
    }
    
    enum Container{
        static let containerCornerRadius = 20.0
        static let containerHeight = 300.0
        static let containerWidth = 300.0
    }
    
    enum Labels{
        static let labelHorizontalPadding = 20.0
        static let labelHeight = 30.0
        static let labelFontSize = 20.0
        static let labelSmallPadding = 5.0
        static let labelBigPadding = 25.0
    }
}
