//
//  GroupViewCell.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct GroupViewCell: View {
    var imageStr: String = ""
    var groupName: String = ""
    var groupDescription: String = ""
    var checkMarkOk: Bool = false
    
    init(imageStr: String, groupName: String, groupDescription: String, checkMarkOk: Bool) {
        self.imageStr = imageStr
        self.groupName = groupName
        self.groupDescription = groupDescription
        self.checkMarkOk = checkMarkOk
    }
    
    var body: some View {
        VStack (spacing: 0) {
            
            return HStack {
                
                Avatar {
                    Image(imageStr)
                }
                .padding([.trailing], 5)
                
                VStack(alignment: .leading, spacing: 5) {

                    HStack(alignment: .top, spacing: 5) {
                        Text(groupName)
                            .font(.system(size: 16))
                    }
                    Text(groupDescription)
                        .foregroundColor(Color(UIColor(rgb: 0x818A99)))
                        .font(.system(size: 13))
                }
                .padding(0)
                
                Spacer()
                
                if checkMarkOk {
                    Button(action: {
                        print("checkmark pressed")
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(UIColor.init(rgb: 0x2688EB)))
                            .font(.system(size: 22))
                    }
                    .padding([.leading], 8)
                }

            }
            
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], 12)
            
    //        .overlay(
    //                RoundedRectangle(cornerRadius: 10)
    //                    .stroke(Color(UIColor.init(rgb: 0x818A99)), lineWidth: 0)
    //            )
            
        }
    }
}


struct GroupViewCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 0) {
            GroupViewCell(imageStr: "figma", groupName: "Figma Design", groupDescription: "Программное обеспечение", checkMarkOk: true)
            GroupViewCell(imageStr: "tg", groupName: "TG", groupDescription: "Интернет-СМИ", checkMarkOk: false)
        }
    }
}
