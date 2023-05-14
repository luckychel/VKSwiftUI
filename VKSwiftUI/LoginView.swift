//
//  LoginView.swift
//  VKSwiftUI
//
//  Created by Александр Кукоба on 14.05.2023.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var showPassword: Bool = false
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
                            TextField("Email or phone", text: $login)
                        }
                        .padding(8)
                        .background(.white)
                        .cornerRadius(10)
                        HStack {
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            Button(action: { self.showPassword.toggle()}) {
                                Image(systemName: "eye")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(8)
                        .background(.white)
                        .cornerRadius(10)
                        
                    }.frame(maxWidth: 280)
                    
                    Button(action: { print("Hello") },
                           label: {
                        Text("Sign in")
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

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
