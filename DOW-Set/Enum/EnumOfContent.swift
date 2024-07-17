//
//  EnumOfContent.swift
//  DOW-Set
//
//  Created by Денис Никитин on 14.07.2024.
//

import Foundation

enum Contents{
    case color
    case numberOfShapes
    case filling
    case content
    
    static let allValue: [Contents] = [color, numberOfShapes, filling, content]
}
