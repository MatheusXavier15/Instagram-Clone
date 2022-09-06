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
    @ObservedObject var viewModel = SearchViewModel()

    var body: some View {
        ScrollView{
            SearchBar(text: $text, isEditing: $inSearchMode)
                .padding()
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $text)
                } else {
                    PostGridView(config: .explore)
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
