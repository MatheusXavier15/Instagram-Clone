//
//  CommentsViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import Foundation
import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    private let post: Post
    
    init(post: Post){
        self.post = post
        fetchComments()
    }
    
    func uploadComment(commentText: String){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String: Any] = [
            "comment": commentText,
            "postOwnerUid": post.ownerId,
            "profileImageUrl": user.profileImageUrl,
            "timestamp": Timestamp(date: Date()),
            "uid":  user.id ?? "",
            "username": user.username
        ]
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { _ in
            NotificationsViewModel.uploadNotifications(toUid: self.post.ownerId, type: .comment, post: self.post)
        }
    }
    
    func fetchComments(){
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
        }
    }
}
