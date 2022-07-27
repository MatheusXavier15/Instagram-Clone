//
//  User.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 26/07/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    let email: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    @DocumentID var id: String?
}