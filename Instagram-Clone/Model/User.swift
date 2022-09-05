//
//  User.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 26/07/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    let email: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    @DocumentID var id: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}
