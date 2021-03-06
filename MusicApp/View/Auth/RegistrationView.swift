//
//  RegistrationView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 16.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI
import Firebase

struct RegistrationView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var rePassword = ""
    
    @State var status = false
    
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
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
                            .autocapitalization(.none)
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
                        self.register()
                    }) {
                        Text("Registration")
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                    }
                    .buttonStyle(ButtonModifier())
                    
                }.padding(.horizontal, 30)
            }
            if alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, error) in
            if error != nil {
                self.error = error?.localizedDescription as! String
                self.alert.toggle()
                return
            }
            UserDefaults.standard.set(true, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            self.status.toggle()
        }
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
