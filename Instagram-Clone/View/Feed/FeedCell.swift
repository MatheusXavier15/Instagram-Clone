//
//  FeedCell.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    var didLike: Bool {
        return viewModel.post.didLike ?? false
    }
    
    init(viewModel: FeedCellViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .symbolVariant(.circle)
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
                
            }.padding([.leading, .bottom], 8)
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.size.width, maxHeight: 380)
                .clipped()
            HStack(spacing: 8) {
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                }.padding(4)
                Button {} label: {
                    Image(systemName: "bubble.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }.padding(4)
                Button {} label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }.padding(4)
            }.foregroundColor(.black)
                .padding([.leading, .bottom], 8)
            
            Text(viewModel.likeString).font(.system(size: 14, weight: .semibold)).padding(.leading, 8).padding(.bottom, 4)
            
            HStack(spacing: 5) {
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold))
                Text(" \(viewModel.post.caption)").font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("2d").font(.system(size: 14)).foregroundColor(.gray).padding(.leading, 8).padding(.top, -4)
            
        }
    }
}
