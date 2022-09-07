//
//  LoginView.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 16/07/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack(spacing: 20) {
                    Image("Instagram_logo_white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20){                    CustomTextField(text: $email, placeholder: Text("E-mail"), imageName: "envelope")
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
                        .padding(.horizontal, 32)}
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            ResetPasswordView(email: $email)
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.trailing, 32)
                        }
                    }
                    
                    Button {
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        Text("Sign In")
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
                    NavigationLink {
                        SignUpView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            Text("Sign Up!")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
