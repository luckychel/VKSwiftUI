//
//  GroupsView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 15.05.2023.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        ZStack
        {
            //ScrollView() {
                VStack(alignment: .center, spacing: 0) {
                    //MARK: Panel header
                    NavigationPanelViewCell(title: "Сообщества")
                        //.background(.orange)
                    
                    //MARK: Panel searching
                    SearchViewCell()
                        //.background(.green)
                    
                    ScrollView() {
                        //MARK: Groups list
                        VStack (spacing: 0) {
                            GroupViewCell(imageStr: "figma", groupName: "Figma Design", groupDescription: "Программное обеспечение", checkMarkOk: true)
                            GroupViewCell(imageStr: "tg", groupName: "TG", groupDescription: "Интернет-СМИ", checkMarkOk: false)
                        }
                    }
                }
            //}
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
