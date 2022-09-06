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
    }
    
    func follow(){
        guard let uid = user.id else { return }
        UserServices.follow(uid: uid) { _ in
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
}
