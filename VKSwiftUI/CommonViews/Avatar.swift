//
//  FriendAvatar.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct Avatar: View {
    var content: Image

    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }

    var body: some View {
        content
            .resizable()
            .frame(width: 48, height: 48)
            .cornerRadius(15)
            .modifier(CircleShadow(shadowColor: .black, shadowRadius: 4, shadowOpacity: 0.7))
            .padding(0)
    }
}


