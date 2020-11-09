//
//  Extentios.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 16.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct TopModifier: ViewModifier {
  func body(content: Content) -> some View {
    content.background(Color.bg)
      .cornerRadius(15)
      .shadow(color: Color.black.opacity(0.2), radius: 6, x: 10, y: 10)
      .shadow(color: Color.white.opacity(0.5), radius: 6, x: -8, y: -8)
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
          .stroke(Color.black.opacity(0.05), lineWidth: 4)
          .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
          .clipShape(RoundedRectangle(cornerRadius: 15))
      )
  }
}

struct CircleButtonModifier: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(15)
      .clipShape(Circle())
      .background(
        Group {
          if configuration.isPressed {
            Circle()
              .fill(Color.bg)
              .overlay(
                Circle()
                  .stroke(Color.gray, lineWidth: 4)
                  .blur(radius: 4)
                  .offset(x: 2, y: 2)
                  .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
              )
              .overlay(
                Circle()
                  .stroke(Color.white, lineWidth: 8)
                  .blur(radius: 4)
                  .offset(x: -2, y: -2)
                  .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
              )
          } else {
            Circle()
              .fill(Color.bg)
              .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
              .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
          }
        }
      )
  }
}

struct SimpleButtonModifier: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.horizontal, 15)
      .padding(.vertical, 5)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .background(
        Group {
          if configuration.isPressed {
            RoundedRectangle(cornerRadius: 15)
              .fill(Color.bg)
              .overlay(
                RoundedRectangle(cornerRadius: 15)
                  .stroke(Color.gray, lineWidth: 4)
                  .blur(radius: 4)
                  .offset(x: 2, y: 2)
                  .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.black, Color.clear)))
              )
              .overlay(
                RoundedRectangle(cornerRadius: 15)
                  .stroke(Color.white, lineWidth: 8)
                  .blur(radius: 4)
                  .offset(x: -2, y: -2)
                  .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.clear, Color.black)))
              )
          } else {
            RoundedRectangle(cornerRadius: 15)
              .fill(Color.bg)
              .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
              .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
          }
        }
      )
  }
}

extension Color {
  static let bg = Color(red: 233 / 255, green: 242 / 255, blue: 252 / 255)
}

extension LinearGradient {
  init(_ colors: Color...) {
    self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
  }
}
