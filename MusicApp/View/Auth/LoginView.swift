//
//  LoginView.swift
//  MusicApp
//

import SwiftUI
import Firebase

struct LoginView: View {
  
  @State private var email = ""
  @State private var password = ""
  
  @State var status = false
  
  @State var alert = false
  @State var error = ""
  
  var body: some View {
    NavigationView {
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
              Image(systemName: "envelope.fill")
                .foregroundColor(.gray)
              
              TextField("Email", text: self.$email)
                .autocapitalization(.none)
            }.modifier(TextModifier())
            
            HStack(spacing: 15) {
              Image(systemName: "lock.fill")
                .foregroundColor(.gray)
              
              SecureField("Password", text: self.$password)
              
            }.modifier(TextModifier())
            
            Button(action: {
              self.verify()
            }) {
              Text("Login")
                .foregroundColor(.black.opacity(0.7))
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 75)
            }.buttonStyle(ButtonModifier())
            
            Text("--OR--")
              .foregroundColor(.gray)
            
            HStack(spacing: 15) {
              Button(action: {
                // TODO: VK Auth
              }) {
                Image("vk")
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 40, height: 40)
              }.buttonStyle(OthersModifier())
              
              Button(action: {
                // TODO: Google Auth
              }) {
                Image("google")
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 40, height: 40)
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
        })
        
        if self.alert { // TODO: remake with view modifier
          ErrorView(showAlert: self.$alert, errorText: self.$error)
        }
      }
    }
  }
  
  func verify() {
    Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, error) in
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
