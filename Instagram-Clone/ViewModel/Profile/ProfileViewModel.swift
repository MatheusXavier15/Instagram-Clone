//
//  ProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 05/09/22.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User){
        self.user = user
        self.checkIfUserIsFollowed()
        self.fetchUserStats()
    }
    
    func follow(){
        guard let uid = user.id else { return }
        UserServices.follow(uid: uid) { _ in
            NotificationsViewModel.uploadNotifications(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
    }
    
    func unfollow(){
        guard let uid = user.id else { return }
        UserServices.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed(){
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserServices.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserStats(){
        guard let uid = user.id else { return }
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                COLLECTION_POSTS.whereField("ownerId", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
                }
            }
        }
    }
}
