//
//  ProfileView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: user)
                PostGridView()
            }.padding(.top)
        }
    }
}
