//
//  LoginView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 16.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State var status = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(UIColor.bg).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 25) {
                    
                    VStack(spacing: 18) {
                        Image("logo")
                    }
                    .padding(20)
                    .modifier(TopModifier())
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.gray)
                        
                        TextField("Email", text: self.$email)
                    }
                    .modifier(TextModifier())
                    
                    HStack(spacing: 15) {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                        
                        SecureField("Password", text: self.$password)
                        
                        
                    }
                    .modifier(TextModifier())
                    
                    Button(action: {
                        Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, error) in
                            if error != nil {
                                print(error)
                                return
                            }
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                            self.status.toggle()
                        }
                    }) {
                        Text("Login")
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                    }
                    .buttonStyle(ButtonModifier())
                    
                    Text("--OR--")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 15) {
                        Button(action: {
                            
                        }) {
                            Image("vk")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(20)
                        }.buttonStyle(OthersModifier())
                        
                        Button(action: {
                            
                        }) {
                            Image("google")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(20)
                        }.buttonStyle(OthersModifier())
                    }
                    
                }.padding(.horizontal, 30)
            }.navigationBarItems(trailing:
                HStack {
                    Spacer()
                    NavigationLink(destination: RegistrationView(status: self.status)) {
                        Text("Create account")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                }
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
