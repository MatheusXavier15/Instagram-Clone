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
    @Binding var tagIndex: Int
    @ObservedObject var viewModel: UploadPostViewModel = UploadPostViewModel()
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
                    
                    TextArea(text: $text, placeholder: "Enter your caption...")
                        .frame(height: 150)
                }.padding()
                VStack {
                    Button {
                        if let selectedImage = selectedImage {
                            viewModel.uploadPost(caption: text, image: selectedImage) { _ in
                                self.text = ""
                                self.postImage = nil
                                self.tagIndex = 0
                            }
                        }
                    } label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 360, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                    
                    Button {
                        self.text = ""
                        self.postImage = nil
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 360, height: 50)
                            .background(Color.clear)
                            .border(.red, width: 1)
                            .foregroundColor(.red)
                    }.padding(.horizontal)
                }
            }
            Spacer()
        }
        
    }
}
