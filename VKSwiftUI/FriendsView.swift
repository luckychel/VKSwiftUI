//
//  FriendsView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct FriendsView: View {

    @State var friends : [Friend] = [
        Friend(logo: "marina", firstName: "Марина", lastName: "Антоненко", groupName: "Команда ВКонтакте"),
        Friend(logo: "violetta", firstName: "Виолетта", lastName: "Силенина", groupName: "Команда ВКонтакте"),
        Friend(logo: "kristina", firstName: "Крись", lastName: "Третьякова", groupName: "Команда ВКонтакте")
    ]
    
    var body: some View {
        ZStack
        {
            VStack(alignment: .center, spacing: 0) {
//                    //MARK: Panel header
                //NavigationPanelViewCell(title: "Друзья")
                    //.background(.orange)

                //MARK: Panel searching
                SearchViewCell(searchField: .constant(""))
                    //.background(.green)
                ScrollView() {
                    //MARK: Friends list
                    ForEach(friends, id: \.id) { friend in
                         NavigationLink {
                             FriendPhotosView(friend: friend)
                         }
                         label: {
                             FriendViewCell(friend: friend)
                         }
                         .buttonStyle(PlainButtonStyle())
                     }
                    //.background(.yellow)
                }
            }

        }
        //.navigationBarItems(leading: NavigationPanelViewCell(title: "Друзья"))
        //.navigationBarTitle("Друзья")
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
