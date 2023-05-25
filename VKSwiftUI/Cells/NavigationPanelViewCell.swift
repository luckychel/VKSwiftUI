//
//  NavigationPanelViewCell.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct NavigationPanelViewCell: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private var title = ""
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Group {
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(Color(UIColor.init(rgb: 0x2688EB)))
                .font(.system(size: 20))
        })

        
        
//        HStack {
//            Button(action: {
//                  print("button back pressed")
//                }) {
//                    Image(systemName: "chevron.backward")
//                        .foregroundColor(Color(UIColor.init(rgb: 0x2688EB)))
//                        .font(.system(size: 28))
//                }
//                .padding([.leading], 8)
//            Spacer()
//            Text(self.title)
//                .bold()
//                .font(.system(size: 26))
//                .padding(0)
//            Spacer()
//            Text("")
//                .padding([.trailing], 8)
//        }
//        .padding(8)
////        .frame(
////              minWidth: 0,
////              maxWidth: .infinity,
////              minHeight: 0,
////              maxHeight: .infinity,
////              alignment: .topLeading
////            )
//        .lineLimit(1)
    }
}

struct NavigationPanelViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPanelViewCell(title: "Тестовая группа")
    }
}
