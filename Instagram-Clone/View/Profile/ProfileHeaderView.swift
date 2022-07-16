//
//  ProfileHeaderView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 16/07/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
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
            }
            Text("User test")
                .font(.system(size: 16, weight: .semibold))
                .padding([.leading, .top])
            Text("User's test biography")
                .font(.system(size: 16))
                .padding(.horizontal)
                .padding(.top, 1)
            
            ProfileActionButtonView().padding()

        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
