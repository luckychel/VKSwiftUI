//
//  CircleShadow.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowOpacity: Double

    func body(content: Content) -> some View {
        content
            .background(Circle()
            .fill(Color.white)
            .shadow(color: shadowColor.opacity(shadowOpacity), radius: shadowRadius))
    }
}
