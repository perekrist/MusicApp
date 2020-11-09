//
//  AuthViewModel.swift
//  MusicApp
//
//  Created by Кристина Перегудова on 09.11.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import Firebase

class AuthViewModel {
  var onDidSuccess: (() -> Void)?
  var onDidError: ((Error) -> Void)?
  
  func login(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { (res, error) in
      if error != nil {
        self.onDidError?(error!)
        return
      }
      UserDefaults.standard.set(true, forKey: "status")
      NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
      self.onDidSuccess?()
    }
  }
  
  func register(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { (res, error) in
      if error != nil {
        self.onDidError?(error!)
        return
      }
      UserDefaults.standard.set(true, forKey: "status")
      NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
      self.onDidSuccess?()
    }
  }
}
