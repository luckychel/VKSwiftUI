//
//  FriendsView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct FriendsView: View {

    var body: some View {
        ZStack
        {
            //ScrollView() {
                VStack(alignment: .center, spacing: 0) {
                    //MARK: Panel header
                    NavigationPanelViewCell(title: "Друзья")
                        //.background(.orange)
                    
                    //MARK: Panel searching
                    SearchViewCell()
                        //.background(.green)
                    ScrollView() {
                        //MARK: Friends list
                        FriendViewCell()
                        //.background(.yellow)
                    }
                }
            //}
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
