//
//  ProfileActionButtonView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 16/07/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var showEditProfile = false
    var isFollowed: Bool {
        return viewModel.user.isFollowed ?? false
    }
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button( action: { showEditProfile.toggle() }, label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding()
            })
            .sheet(isPresented:  $showEditProfile) {
                EditProfileView(user: $viewModel.user)
            }
        } else {
            HStack {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isFollowed ? .black : .white)
                            .frame(width: 172, height: 32)
                            .background(isFollowed ? .white : .blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(.gray, lineWidth: isFollowed ? 1 : 0)
                            )
                            .cornerRadius(3)
                            .padding(.leading)
                }
                Button {
                    //
                } label: {
                    Text("Message")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 172, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .padding(.trailing)
                }
            }
        }
    }
}
