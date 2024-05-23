//
//  ContentView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var userType : UserType = .candidate
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var showInvalidParams = false
    @State private var isPasswordVisible: Bool = false
    @State private var loginResponse: LoginResponse?
    @State private var errorMessage: String?
    @State private var showLoginSuccess  = false
    @State private var showLoginError  = false
    @State private var loginErrorMessage = ""
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:250)
                        .padding(.top)

                VStack(alignment: .center) {
                        Text("User Login")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                            .padding(.bottom, 10)

                        Picker("Select User Type", selection: $userType) {
                           
                            Text("Candidate").tag(UserType.candidate)
                            Text("Employer").tag(UserType.employer)
                            Text("Viewer").tag(UserType.viewer)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                    VStack(alignment:.leading){
                        Text("Email Address")
                        
                        TextField("Enter a valid email address", text: $email)
                        .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                            .padding(.top, 10)
                    }
                       

                    VStack (alignment:.leading){
                        Text("Password")
                        HStack {
                            ZStack {
                                
                                TextField("Enter password", text: $password)
                                    .textInputAutocapitalization(.never)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(8)
                                    .frame(height: 44)
                                    .opacity(isPasswordVisible ? 1 : 0)
                                
                                SecureField("Enter password", text: $password)
                                    .textInputAutocapitalization(.never)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(8)
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
                                    }
                                }
                            }
                            .padding(.bottom, 10)
                        }
                        
                    }.padding(.top,10)




                        
                            Toggle("Remember me", isOn: $rememberMe)
                            .tint(.blue)
                            // persist session token
                    
                        .padding(.vertical)
                            Button("Forgot password?") {
                                // Forgot password action
                            }
                            .foregroundColor(.blue)
//                            .padding(.vertical)

                        Button {
                            if email=="" || password == "" || userType.rawValue == -1 {
                                showInvalidParams = true
                                return
                            }
                            else{
                                loginViewModel.login(email: email, password: password, type: userType.rawValue) { result in
                                                    switch result {
                                                    case .success(let response):
                                                        self.loginResponse = response
                                                        self.errorMessage = nil
                                                    case .failure(let error):
                                                        self.loginResponse = nil
                                                        self.errorMessage = error.localizedDescription
                                                    }
                                                }
                                guard let loginResponse = loginResponse else {
                                    print("\(String(describing: errorMessage))")
                                    return
                                }
                                if loginResponse.responseStatus {
                                    showLoginSuccess = true
                                } else {
                                    showLoginError = true
                                    errorMessage = loginResponse.responseMessage
                                }
                                
                            }
                         
                        } label: {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.top, 10)

                        HStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: RegistrationView()){
                                Text("Register")
                                    .foregroundColor(.red)
                            }
                           
                        }
                        .padding(.top, 20)
                    }
                    .padding()
                
                .padding()

                Spacer()

                
                VStack {
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
                .padding(.bottom, 5)
                .alert(isPresented: $showInvalidParams) {
                    Alert(title: Text("Important message"), message: Text("Please enter all the required fields"), dismissButton: .default(Text("Got it!")))
                        
                        }
                .sheet(isPresented: $showLoginSuccess, content: {
                    Text("login successful")
                })
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
