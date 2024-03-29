//
//  FeedViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 05/09/22.
//

import Foundation
import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        self.fetchPosts()
    }
    
    func fetchPosts(){
        COLLECTION_POSTS.order(by: "timestamps", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
