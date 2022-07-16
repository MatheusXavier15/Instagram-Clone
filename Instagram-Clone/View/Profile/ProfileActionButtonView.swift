//
//  ProfileActionButtonView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 16/07/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    var isCurrentUser = false
    var isFollowed = false
    var body: some View {
        if isCurrentUser {
            Button {
                //
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding()
            }
        } else {
            HStack {
                Button {
                    //
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

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView()
    }
}
