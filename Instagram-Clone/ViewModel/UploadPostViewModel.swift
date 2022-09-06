//
//  UploadPostViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 05/09/22.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        ImageUploader.uploadImage(image: image, type: .post) { imageURL in
            let data = [
                "caption": caption,
                "timestamps": Timestamp(date: Date()),
                "likes": 0,
                "imageUrl": imageURL,
                "ownerId": user.id ?? "",
                "ownerImageUrl": user.profileImageUrl,
                "ownerUsername": user.username
            ] as [String: Any]
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}
