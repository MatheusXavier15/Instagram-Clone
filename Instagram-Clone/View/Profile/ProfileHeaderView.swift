//
//  ProfileHeaderView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 16/07/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .symbolVariant(.circle)
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipped()
                .clipShape(Circle())
                .padding(.leading, 12)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 16) {
                    UserStatView(value: 1, title: "Posts")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 3, title: "Following")
                }.padding(.trailing)
            }.padding()
            VStack(alignment: .leading, spacing: nil) {
                Text(viewModel.user.fullname)
                    .font(.system(size: 16, weight: .semibold))
                    .padding([.leading, .top])
                Text("User's test biography")
                    .font(.system(size: 16))
                    .padding(.horizontal)
                    .padding(.top, 1)
                
            }.padding(.horizontal)
            ProfileActionButtonView(viewModel: viewModel).padding()

        }
    }
}
