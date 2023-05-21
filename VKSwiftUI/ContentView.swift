//
//  ContentView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 24.04.2023.
//

import SwiftUI

struct ContainerView: View {

    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationStack {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                    .navigationDestination(isPresented: $shouldShowMainView) {
                        FriendsView()
                    }
                    .navigationBarTitle("")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView(isUserLoggedIn: Binding<Bool>(get: { false}, set: { _ in }))
                .previewDevice("Iphone 14")
            FriendsView()
                .previewDevice("Iphone 14")
            GroupsView()
                .previewDevice("Iphone 14")
        }
    }
}
