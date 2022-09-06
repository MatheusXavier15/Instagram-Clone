//
//  Post.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 05/09/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamps: Timestamp
    var likes: Int
    let imageUrl: String
    let ownerId: String
    let ownerImageUrl: String
    let ownerUsername: String
    
    var didLike: Bool? = false
}
