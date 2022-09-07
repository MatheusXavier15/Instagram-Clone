//
//  Edit.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 07/09/22.
//

import SwiftUI

struct EditProfileView: View {
    @State var bioText: String
    @ObservedObject var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bios ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Button {
                    viewModel.saveUserData(bioText)
                } label: {
                    Text("Done").bold()
                }
            }
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: UIScreen.main.bounds.width - 30, height: 50)
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete, perform: { complete in
            if complete {
                self.mode.wrappedValue.dismiss()
                self.user.bios = viewModel.user.bios ?? ""
            }
        })
    }
}
