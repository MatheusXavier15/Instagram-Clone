//
//  AuthViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 26/07/22.
//

import Foundation
import SwiftUI
import Firebase
import UIKit

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully logged in user...")
        }
    }
    
    func register(withEmail email: String, password: String, username: String, fullname: String, image: UIImage?){
        guard let image = image else {
            return
        }
        ImageUploader.uploadImage(image: image) { imageURL in
            print("Successfully uploaded user image...")
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                print("Successfully registered user...")
                guard let user = result?.user else { return }
                self.userSession = user
                let data = ["email": email, "username": username, "fullname": fullname, "profileImageUrl": imageURL, "uid": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    self.userSession = user
                    print("Successfully uploaded user data...")
                }
            }
        }
    }
    
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let userSession = userSession else {
            return
        }
        COLLECTION_USERS.document(userSession.uid).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else { return }
        }
    }
    
    func resetPassword(){
        
    }
}
