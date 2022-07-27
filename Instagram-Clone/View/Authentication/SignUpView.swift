//
//  SignUpView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 16/07/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing: 20) {
                ZStack {
                    if let postImage = postImage {
                        postImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    } else {
                        Button {
                            self.imagePickerPresented.toggle()
                        } label: {
                            VStack {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .foregroundColor(.white)
                                    .font(.system(size: 40, weight: .light))
                                Text("Photo")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }.padding(.top, 36)
                        }.sheet(isPresented: $imagePickerPresented, onDismiss: {
                            guard let selectedImage = selectedImage else { return }
                            postImage = Image(uiImage: selectedImage)
                            
                        }) {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                }

                Spacer()
                CustomTextField(text: $email, placeholder: Text("E-mail"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                CustomTextField(text: $fullname, placeholder: Text("Full name"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                CustomSecureField(text: $password, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)
                
                Button {
                    viewModel.register(withEmail: email, password: password, username: username, fullname: fullname, image: selectedImage)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.white, lineWidth:  1)
                                .background(.clear)
                                .padding(.horizontal, 20)
                        )
                }
                
                Spacer()
                
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("Already have an account?")
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                        Text("Sign In!")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
