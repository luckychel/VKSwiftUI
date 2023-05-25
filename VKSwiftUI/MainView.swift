//
//  MainView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 21.05.2023.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .friends
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selection) {
                    switch selection {
                    case .friends :
                        FriendsView()
                            .tag(Tab.friends)
                    case .groups:
                        GroupsView()
                            .tag(Tab.groups)
                    case .news:
                        NewsView()
                            .tag(Tab.news)
                    }
                }
                
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selection)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        //.navigationBarBackButtonHidden(true)
        .navigationTitle(getTitle())
    }
    
    func getTitle() -> String {
        var result: String = ""
        switch selection {
            case .friends :
                result = "Друзья"
            case .groups:
                result = "Сообщества"
            case .news:
                result = "Новости"
        }
        return result
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
