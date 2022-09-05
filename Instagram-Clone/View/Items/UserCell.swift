//
//  UserCell.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .symbolVariant(.circle)
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.username).font(.system(size: 14, weight: .semibold))
                Text(user.fullname).font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}
