//
//  EditProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 07/09/22.
//

import Foundation
import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User){
        self.user = user
    }
    
    func saveUserData(_ bio: String){
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bios":bio]){ _ in
            self.user.bios = bio
            self.uploadComplete = true
        }
    }
}
