//
//  iPadLoginView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 27/05/24.
//

import SwiftUI

struct iPadLoginView: View {
    @StateObject private var loginViewModel = LoginViewModel(loginResponse: LoginResponse(responseMessage: "", responseStatus: false))
    @State private var userType = UserType.candidate
    @State private var isPasswordVisible = false
    @State private var rememberMe = false
    @State private var showInvalidParams = false
    @State private var showLoginSuccess  = false
    
    
    
     private var smallPassword: Bool {
        if loginViewModel.password.count < 6{
            return true
        } else {
            return false
        }
        
    }
    var body: some View {
        
        GeometryReader { geo in
            NavigationStack {
                VStack(alignment:.center,spacing: 20){
                    
                    Spacer()
                    VStack(alignment:.leading){
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Enter your details to create an Account")
                            .font(.title2)
                    }
                    
                    VStack(alignment:.center,spacing: 20){
                        Picker("Select User Type", selection: $userType) {
                           
                            Text("Candidate").tag(UserType.candidate)
                            Text("Employer").tag(UserType.employer)
                            Text("Viewer").tag(UserType.viewer)
                            
                           
                              
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(10)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(.rect(cornerRadius: 10))
                        
                            VStack(alignment:.leading){
                                Text("Email Address")
                                
                                TextField("Enter a valid email address", text: $loginViewModel.email)
                                .textInputAutocapitalization(.never)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .clipShape(.rect(cornerRadius: 16))
                                   

                            }
                            .frame(width: geo.size.width/2)
                            VStack (alignment:.leading){
                                Text("Password")
                                if smallPassword {
                                    Text("Password should be longer than 6 characters")
                                        .foregroundStyle(.red)
                                }
                                HStack {
                                    ZStack {
                                        
                                        TextField("Enter password", text: $loginViewModel.password)
                                            .textInputAutocapitalization(.never)
                                            .padding()
                                            .background(Color(UIColor.systemGray6))
                                            .clipShape(.rect(cornerRadius: 16))
                                            .frame(height: 44)
                                            .opacity(isPasswordVisible ? 1 : 0)
                                        
                                        SecureField("Enter password", text: $loginViewModel.password)
                                            .textInputAutocapitalization(.never)
                                            .padding()
                                            .background(Color(UIColor.systemGray6))
                                            .clipShape(.rect(cornerRadius: 16))
                                            .frame(height: 44)
                                            .opacity(isPasswordVisible ? 0 : 1)
                                        
                                        HStack {
                                            Spacer()
                                            Button(action: {
                                                isPasswordVisible.toggle()
                                            }) {
                                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                                    .foregroundColor(Color(UIColor.systemGray))
                                                    .padding()
                                                    .frame(maxHeight:15)
                                            }
                                        }
                                    }
                                    
                                }
                                
                            }.padding(.top,10)
                            .frame(width: geo.size.width/2)
                        
                       
                    }
                    .frame(width: geo.size.width)
                    VStack(spacing:16){
                      
                                Toggle("Remember me", isOn: $rememberMe)
                                .tint(.blue)
                                // persist session token
                        
                            .padding(.vertical)
                                Button("Forgot password?") {
                                    
                                }
                                .foregroundColor(.blue)


                            Button {
                                if loginViewModel.email=="" || loginViewModel.password == "" || userType.rawValue == -1 {
                                    showInvalidParams = true
                                    return
                                }
                                else{
                                    Task {
                                        await loginViewModel.login( type: userType.rawValue)
                                        showLoginSuccess = true
                                        print(loginViewModel.loginResponse)
                                                   }
                                   
                                }
                             
                            } label: {
                                Text("Login")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .cornerRadius(8)
                                    
                            }
                            
                        HStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: iPadRegistrationView()
                                .navigationBarBackButtonHidden(true)
                            ){
                                Text("Register")
                                    .foregroundColor(.red)
                            }
                           
                        }
                        
                        }
                    .frame(width: geo.size.width/2)
                    
                    VStack{
                        Text("Copyright © 2024. All rights reserved.")
                            .font(.footnote)
                            .padding(.bottom, 5)

                        HStack(spacing: 15) {
                            Button {
                                
                            } label :{
                                Image(systemName: "f.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }

                            Button {
                              
                            } label : {
                                Image(systemName: "t.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }

                            Button {
                               
                            } label: {
                                Image(systemName: "g.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }

                            Button {
                               
                            } label :{
                                Image(systemName: "l.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            
                        }
                    }
                    .padding(.top,30)
                    Spacer()
                    NavigationLink(destination: iPadUserdashView().navigationBarBackButtonHidden(true), isActive:  $showLoginSuccess) {
                                    EmptyView()
                                }
                }
            }
            
           
            }
           
        }
    }


#Preview {
    iPadLoginView()
}
