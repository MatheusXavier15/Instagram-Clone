//
//  NotificationCellViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import Foundation
import SwiftUI

class NotificationCellViewModel : ObservableObject {
    
    @Published var notification: Notification
    
    var timeStampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(notification: Notification){
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow(){
        UserServices.follow(uid: notification.uid) { _ in
            NotificationsViewModel.uploadNotifications(toUid: self.notification.uid, type: .follow)
            self.notification.userIsFollowed = true
        }
    }
    
    func unfollow(){
        UserServices.unfollow(uid: notification.uid) { _ in
            self.notification.userIsFollowed = false
        }
    }
    
    func checkIfUserIsFollowed(){
        guard notification.type == .follow else { return }
        UserServices.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.userIsFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost(){
        guard let postId = notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    
    func fetchNotificationUser(){
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
            
        }
    }
}
