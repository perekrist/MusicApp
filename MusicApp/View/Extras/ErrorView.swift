//
//  ErrorView.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 16.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View {
        ZStack {
          Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Error")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(0.7))
                                
                Text(self.error)
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(25)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                }
                .buttonStyle(SimpleButtonModifier())
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.bg)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
    }
}
