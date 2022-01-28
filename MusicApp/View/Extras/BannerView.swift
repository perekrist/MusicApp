//
//  BannerView.swift
//  MusicApp
//

import SwiftUI

struct BannerView: ViewModifier {
  @Binding var show: Bool
  @Binding var text: String
  @State var isError: Bool
  
  func body(content: Content) -> some View {
    ZStack {
      content
      if show {
        Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
        VStack {
          Text(isError ? "Error": "Success!")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black.opacity(0.7))
          
          Text(text)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.black.opacity(0.7))
            .padding(25)
          
          Button(action: {
            show.toggle()
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
    }
  }
}

extension View {
  func showBannerView(show: Binding<Bool>, text: Binding<String>, isError: Bool = true) -> some View {
    self.modifier(BannerView(show: show, text: text, isError: isError))
  }
}
