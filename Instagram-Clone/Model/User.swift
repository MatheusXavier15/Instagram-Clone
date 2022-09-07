//
//  User.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 26/07/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    var isFollowed: Bool? = false
    var stats: UserStats?
    var bios: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
