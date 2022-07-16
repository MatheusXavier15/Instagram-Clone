//
//  UploadPostView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var text: String = ""
    @State var imagePickerPresented = false
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    self.imagePickerPresented.toggle()
                } label: {
                    VStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.black)
                        Text("Photo")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                    }.padding(.top, 36)
                }.sheet(isPresented: $imagePickerPresented, onDismiss: {
                    guard let selectedImage = selectedImage else { return }
                    postImage = Image(uiImage: selectedImage)
                }) {
                    ImagePicker(image: $selectedImage)
                }
            } else if let postImage = postImage {
                HStack(alignment: .top) {
                    postImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption...", text: $text)
                }.padding()
                Button {
                    //
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }.padding()

            }
            Spacer()
        }
        
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
