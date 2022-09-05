//
//  MainTabView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.app")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: loggoutButton)
            .accentColor(.black)
        }
    }
    
    var loggoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout").foregroundColor(.black)
        }
    }
}

