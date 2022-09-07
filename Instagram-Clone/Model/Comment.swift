//
//  Comments.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let comment: String
    let postOwnerUid: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let uid: String
    let username: String
}
