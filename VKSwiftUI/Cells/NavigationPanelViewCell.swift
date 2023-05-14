//
//  NavigationPanelViewCell.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct NavigationPanelViewCell: View {
    
    private var title = ""
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Button(action: {
                  print("button back pressed")
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color(UIColor.init(rgb: 0x2688EB)))
                        .font(.system(size: 28))
                }
                .padding([.leading], 8)
            Spacer()
            Text(self.title)
                .bold()
                .font(.system(size: 26))
            Spacer()
            Text("")
        }
        .padding(8)
    }
}
