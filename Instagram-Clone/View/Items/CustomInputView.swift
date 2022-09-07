//
//  CustomInputView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 06/09/22.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    var action: () -> Void
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack{
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 35)
                
                Button(action: action){
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
                
            }
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}
