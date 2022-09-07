//
//  CommentsCell.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                KFImage(URL(string: comment.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                Text(comment.username)
                    .font(.system(size: 14, weight: .semibold, design: .default)) +
                Text(" \(comment.comment)")
                    .font(.system(size: 14))
            }
            Text("2 d")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding([.leading,.top], 4)
        }.padding(.horizontal, 8)
    }
}
