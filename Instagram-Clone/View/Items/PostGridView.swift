//
//  PostGridView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<100) { _ in
                NavigationLink {
                    FeedView()
                } label: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }

            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
