//
//  Notification.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let postId: String?
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    let username: String
    
    var userIsFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked your post."
        case .comment: return " commented in your post."
        case .follow: return " started following you."
        }
    }
}
