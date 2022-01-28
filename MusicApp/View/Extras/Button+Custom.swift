//
//  Button+Custom.swift
//  MusicApp
//

import SwiftUI

struct ButtonModifier: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(Color.bg)
      .cornerRadius(15)
      .overlay(
        VStack {
          if configuration.isPressed {
            RoundedRectangle(cornerRadius: 15)
              .stroke(.black.opacity(0.05), lineWidth: 4)
              .shadow(color: .black.opacity(0.2), radius: 3, x: 5, y: 5)
              .clipShape(RoundedRectangle(cornerRadius: 15))
              .shadow(color: .black.opacity(0.2), radius: 3, x: -5, y: -5)
              .clipShape(RoundedRectangle(cornerRadius: 15))
          }
        }
      )
      .shadow(color: .black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
      .shadow(color: .white.opacity(configuration.isPressed ? 0 : 0.6), radius: 3, x: -5, y: -5)
  }
}

struct OthersModifier: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .background(Color.bg)
      .clipShape(Circle())
      .overlay(
        VStack {
          if configuration.isPressed {
            Circle()
              .stroke(.black.opacity(0.05), lineWidth: 4)
              .shadow(color: .black.opacity(0.2), radius: 3, x: 5, y: 5)
              .clipShape(Circle())
              .shadow(color: .black.opacity(0.2), radius: 3, x: -5, y: -5)
              .clipShape(Circle())
          }
        }
      )
      .shadow(color: .black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
      .shadow(color: .white.opacity(configuration.isPressed ? 0 : 0.6), radius: 3, x: -5, y: -5)
  }
}
