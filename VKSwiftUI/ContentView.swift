//
//  ContentView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 24.04.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(
    NotificationCenter.default.publisher(for:
        UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for:
        UIResponder.keyboardWillHideNotification)
    .map { _ in false }
    )
    .removeDuplicates()
    
    var body: some View {
        ZStack
        {
            GeometryReader { _ in
                Image("vk_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    if shouldShowLogo {
                        Spacer()
                            .padding(.top, 20)
                        Image("vk_logo")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 7)
                    }
                    Text("Vkontakte")
                        .font(.system(size: 35))
                    Spacer()
                        .padding(.bottom, 50)
                    
                    VStack{
                        HStack {
                            Text("Login:")
                                .font(.system(size: 20))
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 180)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Password:")
                                .font(.system(size: 20))
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 180)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }.frame(maxWidth: 280)
                    
                    Button(action: { print("Hello") },
                           label: {
                        Text("Log in")
                            .frame(minWidth: 0, maxWidth: 150)
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }.padding()
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct Friends: View {
    
    @State private var searchField = ""
    
    var body: some View {
        ZStack
        {
            ScrollView() {
                VStack(alignment: .center, spacing: 0) {
                    HStack {
                        Button(action: {
                              print("button back pressed")
                            }) {
                                Image(systemName: "chevron.backward")
                            }
                        Spacer()
                        Text("Друзья")
                        Spacer()
                        Text("")
                    }
                    .padding(8)
                    .background(.orange)
                    HStack {
                        TextField("", text: $searchField)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(8)
                    .background(.green)
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("Iphone 14 Pro")
            Friends()
                .previewDevice("Iphone 14")
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}
