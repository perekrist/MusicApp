//
//  ViewModifiers.swift
//  MusicApp
//

import SwiftUI

struct TopModifier: ViewModifier {
  func body(content: Content) -> some View {
    content.background(Color.bg)
      .cornerRadius(15)
      .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
      .shadow(color: .white.opacity(0.5), radius: 6, x: -8, y: -8)
  }
}

struct TextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(20)
      .background(Color.bg)
      .cornerRadius(15)
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(.black.opacity(0.05), lineWidth: 4)
          .shadow(color: .black.opacity(0.2), radius: 3, x: 5, y: 5)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .shadow(color: .black.opacity(0.2), radius: 3, x: -5, y: -5)
          .clipShape(RoundedRectangle(cornerRadius: 15))
      )
  }
}

