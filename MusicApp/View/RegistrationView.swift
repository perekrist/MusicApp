//
//  RegistrationView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 16.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var rePassword = ""
    
    var body: some View {
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
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    
                    TextField("UserName", text: self.$name)
                }
                .modifier(TextModifier())
                
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
                
                HStack(spacing: 15) {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    
                    SecureField("RePassword", text: self.$rePassword)
                }
                .modifier(TextModifier())
                
                Button(action: {
                    
                }) {
                    Text("Registration")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                }
                .buttonStyle(ButtonModifier())
                
            }.padding(.horizontal, 30)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
