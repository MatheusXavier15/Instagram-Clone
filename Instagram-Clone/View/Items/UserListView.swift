//
//  UserListView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    NavigationLink {
                        ProfileView()
                    } label: {
                        UserCell()
                            .padding(.leading)
                    }

                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
