//
//  PostGridViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 05/09/22.
//

import Foundation
import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration){
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration){
        switch config {
        case .explore:
            fetchExplorePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePosts(){
        COLLECTION_POSTS.order(by: "likes", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    func fetchUserPosts(forUid uid: String){
        COLLECTION_POSTS
            .whereField("ownerId", isEqualTo: uid)
            .order(by: "timestamps", descending: true).whereField("ownerId", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
