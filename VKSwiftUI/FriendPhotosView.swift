//
//  FriendPhotosView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 21.05.2023.
//

import ASCollectionView
import SwiftUI

struct FriendPhotosView: View {

    var friend: Friend
    
    @State var photos : [String] = ["marina", "kristina", "violetta"]
    let columnLayout = Array(repeating: GridItem(.flexible(minimum: 50, maximum: .infinity)), count: 2)
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columnLayout, alignment: .center, spacing: 6) {
                    ForEach(photos, id: \.self) { index in
                        VStack {
                            Image(String(index))
                        }
                    }
                    .frame(height: geometry.size.width/2)
                }
                .padding()
            }
            .navigationTitle(friend.firstName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}

struct FriendPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotosView(friend: Friend(logo: "marina", firstName: "Марина", lastName: "Антоненко", groupName: "Команда ВКонтакте"))
    }
}
