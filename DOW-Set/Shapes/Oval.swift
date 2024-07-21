//
//  Oval.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 03.07.2024.
//

import SwiftUI

struct Oval: Shape{
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.addEllipse(in: rect)
        
        return p
    }
}
