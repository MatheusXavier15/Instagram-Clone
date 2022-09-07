//
//  NotificationsViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init(){
        fetchNotifications()
    }
    
    func fetchNotifications(){
        guard let uid = AuthViewModel.shared.currentUser?.id else {return}
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self) })
        }
    }
    
    static func uploadNotifications(toUid uid: String, type: NotificationType, post: Post? = nil){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.id else { return }
        guard let id = user.id else { return }
        var data: [String: Any] = [
            "profileImageUrl": user.profileImageUrl,
            "timestamp": Timestamp(date: Date()),
            "type": type.rawValue,
            "uid": id,
            "username": user.username,
        ]
        if let post = post, let postId = post.id {
            data["postId"] = postId
        }
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
        
    }
}
