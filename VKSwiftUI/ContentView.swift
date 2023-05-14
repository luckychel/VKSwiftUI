//
//  ContentView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 24.04.2023.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice("Iphone 14")
            FriendsView()
                .previewDevice("Iphone 14")
            GroupsView()
                .previewDevice("Iphone 14")
        }
    }
}
