//
//  SearchView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    @State var inSearchMode = false

    var body: some View {
        ScrollView{
            SearchBar(text: $text, isEditing: $inSearchMode)
                .padding()
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: "Search...")
    }
}
