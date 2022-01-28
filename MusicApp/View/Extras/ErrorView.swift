//
//  ErrorView.swift
//  MusicApp
//

import SwiftUI

struct ErrorView: View {
  @Binding var showAlert: Bool
  @Binding var errorText: String
  
  var body: some View {
    GeometryReader { _ in
      VStack {
        Text("Error")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.black.opacity(0.7))
        
        Text(errorText)
          .multilineTextAlignment(.center)
          .foregroundColor(Color.black.opacity(0.7))
          .padding(25)
        
        Button(action: {
          showAlert.toggle()
        }) {
          Text("Cancel")
            .foregroundColor(.black.opacity(0.7))
            .padding(.vertical)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonModifier())
        .padding(.horizontal, 75)
      }
      .padding(.vertical, 25)
      .frame(maxWidth: .infinity)
      .background(Color.bg)
      .cornerRadius(15)
      .padding(.horizontal, 35)
    }
    .background(Color.black.opacity(0.3).edgesIgnoringSafeArea(.all))
  }
}
