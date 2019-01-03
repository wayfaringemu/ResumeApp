//
//  ModelViewController.swift
//  RyanResume
//
//  Created by ryan kowalski on 11/13/18.
//  Copyright © 2018 ryan kowalski. All rights reserved.
//

import UIKit

enum CellTypes {
    case cellLabel
    case cellButton
}

enum CellJustification {
    case leftJustify
    case centerJustify
    case rightJustify
}

class TextObject: NSObject {
    var labelString: String?
    var labelType: CellTypes?
    var fontType: UIFont?
    var buttonString: String?
    var justification: CellJustification?
}
// MARK: - Fonts

struct chalkBoardFont {
    static let bold = UIFont(name: "ChalkboardSE-Bold", size: 22)
    static let regular = UIFont(name: "ChalkboardSE-Regular", size: 18)
}

struct helveticaFont {
    static let regular = UIFont(name: "Helvetica", size: 18)
    static let bold = UIFont(name: "Helvetica-Bold", size: 18)
    static let italic = UIFont(name: "Helvetica-Oblique ", size: 18)
    static let italicBold = UIFont(name: "Helvetica-BoldOblique", size: 18)
}
