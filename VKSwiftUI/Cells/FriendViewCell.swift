//
//  FriendViewCell.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct FriendViewCell: View {
    
    var logo: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var groupName: String = ""
    
    init(logo: String, firstName: String, lastName: String, groupName: String) {
        self.logo = logo
        self.firstName = firstName
        self.lastName = lastName
        self.groupName = groupName
    }
    
    init(friend: Friend) {
        self.logo = friend.logo
        self.firstName = friend.firstName
        self.lastName = friend.lastName
        self.groupName = friend.groupName
    }
    
    var body: some View {
        VStack (spacing: 0) {
            FriendCell
        }
//        .frame(
//              minWidth: 0,
//              maxWidth: .infinity,
//              minHeight: 0,
//              maxHeight: .infinity,
//              alignment: .topLeading
//            )
    }
}

private extension FriendViewCell {
   
    var FriendCell: some View {
        HStack {
            Avatar {
                Image(logo)
            }
            .padding([.trailing], 5)
            
            VStack(alignment: .leading, spacing: 5) {

                HStack(alignment: .top, spacing: 5) {
                    Text(firstName)
                        .font(.system(size: 16))
                    Text(lastName)
                        .font(.system(size: 16))
                }
                Text(groupName)
                    .foregroundColor(Color(UIColor(rgb: 0x818A99)))
                    .font(.system(size: 13))
            }
            .padding(0)
            
            Spacer()
            
            Button(action: {
                  print("message pressed")
                }) {
                    Image(systemName: "message")
                        .foregroundColor(Color(UIColor.init(rgb: 0x2688EB)))
                        .font(.system(size: 22))
                }
                .padding([.leading], 8)

        }
        
        .padding([.top], 6)
        .padding([.bottom], 0)
        .padding([.leading, .trailing], 12)
        
//        .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color(UIColor.init(rgb: 0x818A99)), lineWidth: 0)
//            )
    }

}

struct FriendViewCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendViewCell(logo: "marina", firstName: "Марина", lastName: "Антоненко", groupName: "Команда Вконтакте")
        }
    }
}
