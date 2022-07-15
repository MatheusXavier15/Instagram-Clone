//
//  NotificationCell.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .symbolVariant(.circle)
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .clipShape(Circle())
            HStack(spacing: 5) {
                Text("User01").font(.system(size: 14, weight: .semibold))
                Text("A test photo").font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Spacer()
            
            if showPostImage {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else {
                Button {
                    //
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())                }
                        .font(.system(size: 14, weight: .semibold))
            }
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
