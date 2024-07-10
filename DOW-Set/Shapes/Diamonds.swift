//
//  Diamonds.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 03.07.2024.
//

import SwiftUI

struct Diamonds: Shape{

    func path(in rect: CGRect) -> Path {
        let firstPoint = CGPoint(x: rect.midX, y: rect.maxY)
        let secondPoint = CGPoint(x: rect.minX, y: rect.midY)
        let thirdPoint = CGPoint(x: rect.midX, y: rect.minY)
        let fourthPoint = CGPoint(x: rect.maxX, y: rect.midY)
        
        var p = Path()
        
        p.move(to: firstPoint)
        p.addLine(to: secondPoint)
        p.addLine(to: thirdPoint)
        p.addLine(to: fourthPoint)
        p.addLine(to: firstPoint)
        
        return p
    }
}
