//
//  LoginView.swift
//  MusicApp
//

import SwiftUI
import Firebase

struct LoginView: View {
  @State var isLoggedIn = false
  
  @State private var email = ""
  @State private var password = ""
  
  @State private var showAlert = false
  @State private var errorText = ""
  
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
              
              TextField("Email", text: $email)
                .autocapitalization(.none)
            }.modifier(TextModifier())
            
            HStack(spacing: 15) {
              Image(systemName: "lock.fill")
                .foregroundColor(.gray)
              
              SecureField("Password", text: $password)
              
            }.modifier(TextModifier())
            
            Button(action: {
              verify()
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
          NavigationLink(destination: RegistrationView(status: isLoggedIn)) {
            Text("Create account")
              .foregroundColor(.gray)
              .padding(.horizontal)
          }
        })
      }.showBannerView(show: $showAlert, text: $errorText)
    }
  }
  
  private func verify() { // TODO: extract to viewModel
    Auth.auth().signIn(withEmail: email, password: password) { (res, error) in
      if let error = error {
        self.errorText = error.localizedDescription
        self.showAlert.toggle()
        return
      }
      UserDefaults.standard.set(true, forKey: "isLoggedIn")
      NotificationCenter.default.post(name: NSNotification.Name("isLoggedIn"), object: nil)
      self.isLoggedIn.toggle()
    }
  }
}
