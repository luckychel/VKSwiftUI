//
//  FriendModel.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 21.05.2023.
//

import Foundation

class Friend: Identifiable {
    
    internal init(logo: String, firstName: String, lastName: String, groupName: String) {
        self.logo = logo
        self.firstName = firstName
        self.lastName = lastName
        self.groupName = groupName
    }
    
    let id: UUID = UUID()
    let logo: String
    let firstName: String
    let lastName: String
    let groupName: String
}
