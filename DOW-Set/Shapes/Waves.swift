//
//  Waves.swift
//  DOW(Set Game)
//
//  Created by Денис Никитин on 03.07.2024.
//

import SwiftUI

struct Waves: Shape{
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: .zero)
        p.addCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control1: CGPoint(x: rect.maxX * 0.3, y: rect.midY*0.4), control2: CGPoint(x: rect.midX, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY*0.8))
        p.addCurve(to: CGPoint(x: rect.minX, y: rect.midY*0.8), control1: CGPoint(x: rect.maxX*0.7, y: rect.midY*0.6), control2: CGPoint(x: rect.midX, y: rect.midY))
        p.addLine(to: .zero)
        
        return p
    }
}
