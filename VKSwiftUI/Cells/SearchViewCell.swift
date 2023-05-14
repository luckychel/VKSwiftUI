//
//  SearchViewCell.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI

struct SearchViewCell: View {
    
    @State private var searchField = ""
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(UIColor(rgb: 0x818C99)))
                    .font(.system(size: 17))
                TextField("Поиск", text: $searchField)
                    .foregroundColor(Color(UIColor(rgb: 0x818C99)))
                    .font(.system(size: 17))
            }
            .padding(5)
            .background(Color(UIColor(rgb: 0xEBEDF0)))
            .cornerRadius(10)
        }
        .padding(12)

    }
}
