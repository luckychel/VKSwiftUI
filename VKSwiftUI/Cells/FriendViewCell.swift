//
//  FriendViewCell.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct FriendViewCell: View {
    var body: some View {
        VStack (spacing: 0) {
            FriendCell
            FriendCell
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
                Image("marina")
            }
            .padding([.trailing], 5)
            
            VStack(alignment: .leading, spacing: 5) {

                HStack(alignment: .top, spacing: 5) {
                    Text("Марина")
                        .font(.system(size: 16))
                    Text("Антоненко")
                        .font(.system(size: 16))
                }
                Text("Команда ВКонтакте")
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
        
        .padding([.top, .bottom], 8)
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
            FriendViewCell()
        }
    }
}
