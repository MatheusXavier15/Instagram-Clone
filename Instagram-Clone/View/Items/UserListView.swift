//
//  UserListView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(users) { user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserCell(user: user)
                            .padding(.leading)
                    }

                }
            }
        }
    }
}
