//
//  NotificationCell.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = true
    var isFollowed: Bool {
        return viewModel.notification.userIsFollowed ?? false
    }
    
    init(viewModel: NotificationCellViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .symbolVariant(.circle)
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .clipShape(Circle())
                    HStack(spacing: 5) {
                        Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold))
                        Text(viewModel.notification.type.notificationMessage).font(.system(size: 15))
                    }.padding(.horizontal, 8)
                }
            }

            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink {
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    } label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
            } else {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(isFollowed ? .black : .white)
                            .frame(width: 100, height: 32)
                            .background(isFollowed ? .white : .blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(.gray, lineWidth: isFollowed ? 1 : 0)
                            )}
            }
        }.padding(.horizontal)
    }
}
