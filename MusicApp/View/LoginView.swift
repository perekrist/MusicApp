//
//  LoginView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 16.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
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
                    
                }) {
                    Text("Login")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                }
                .buttonStyle(ButtonModifier())
                
            }.padding(.horizontal, 30)
        }
    }
}

struct TopModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.background(Color.init(UIColor.bg))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.5), radius: 6, x: -8, y: -8)
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color.init(UIColor.bg))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black.opacity(0.05), lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
        )
    }
}

struct ButtonModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.init(UIColor.bg))
            .cornerRadius(15)
            .overlay(
                VStack {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black.opacity(0.05), lineWidth: 4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
        )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6), radius: 3, x: -5, y: -5)
    }
}

extension UIColor {
    static let bg = UIColor(red: 233 / 255, green: 242 / 255, blue: 252 / 255, alpha: 1)
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
