//
//  FeedCellViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import Foundation
import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    var timeStampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamps.dateValue(), to: Date()) ?? ""
    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
        fetchUser()
    }
    
    func like(){
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                NotificationsViewModel.uploadNotifications(toUid: self.post.ownerId, type: .like, post: self.post)
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unlike(){
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost(){
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(post.ownerId).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.post.user = user
        }
    }
}
