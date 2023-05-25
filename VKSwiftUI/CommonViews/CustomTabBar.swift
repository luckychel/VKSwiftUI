//
//  CustomTabBar.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 21.05.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case friends = "person.2"
    case groups = "person.3"
    case news = "newspaper"
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    VStack {
                        if selectedTab == tab {
                            Image(systemName: fillImage)
                                .padding()
                                .background(
                                    .linearGradient(
                                        colors: [.white, .blue, .red],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(.white, lineWidth: 1).shadow(radius: 2)
                                }
                                .offset(y: -30)
                                .padding(.bottom , -20)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        selectedTab = tab
                                    }
                                }
                            Text(tab.rawValue == "person.2" ? "friends" : (tab.rawValue == "person.3" ? "groups" : "news" ))
                                .offset(y: -10)
                                .foregroundColor(.blue)
                                .bold()
                        } else {
                            Image(systemName:  tab.rawValue)
                                 .onTapGesture {
                                     withAnimation(.easeIn(duration: 0.1)) {
                                         selectedTab = tab
                                     }
                             }
                            Text(tab.rawValue == "person.2" ? "friends" : (tab.rawValue == "person.3" ? "groups" : "news" ))
                                .offset(y: -10)
                                .hidden()
                        }
                    }
                    .foregroundColor(selectedTab == tab ? .white: .blue)
                    Spacer()
                }
            }
            .padding(.vertical, -20)
            .frame(width: nil, height: 70)
            .background(.thinMaterial)
            .shadow(radius: 2)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.friends))
    }
}
