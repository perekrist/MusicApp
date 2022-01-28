//
//  RegistrationView.swift
//  MusicApp
//

import SwiftUI
import Firebase

struct RegistrationView: View {
  @State var status = false
  
  @State private var name = ""
  @State private var email = ""
  @State private var password = ""
  @State private var rePassword = ""
  
  @State private var showAlert = false
  @State private var errorText = ""
  
  var body: some View {
    ZStack {
      ZStack {
        Color.bg.edgesIgnoringSafeArea(.all)
        
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
            
            TextField("UserName", text: $name)
          }
          .modifier(TextModifier())
          
          HStack(spacing: 15) {
            Image(systemName: "envelope.fill")
              .foregroundColor(.gray)
            
            TextField("Email", text: $email)
              .autocapitalization(.none)
          }
          .modifier(TextModifier())
          
          HStack(spacing: 15) {
            Image(systemName: "lock.fill")
              .foregroundColor(.gray)
            
            SecureField("Password", text: $password)
          }
          .modifier(TextModifier())
          
          HStack(spacing: 15) {
            Image(systemName: "lock.fill")
              .foregroundColor(.gray)
            
            SecureField("RePassword", text: $rePassword)
          }
          .modifier(TextModifier())
          
          Button(action: {
            register()
          }) {
            Text("Registration")
              .foregroundColor(.black.opacity(0.7))
              .padding(.vertical)
              .frame(maxWidth: .infinity)
              .padding(.horizontal, 75)
          }
          .buttonStyle(ButtonModifier())
          
        }.padding(.horizontal, 30)
      }
    }.showBannerView(show: $showAlert, text: $errorText)
  }
  
  func register() {
    Auth.auth().createUser(withEmail: email, password: password) { (res, error) in
      if let error = error {
        self.errorText = error.localizedDescription
        self.showAlert.toggle()
        return
      }
      UserDefaults.standard.set(true, forKey: "status")
      NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
      self.status.toggle()
    }
  }
}
