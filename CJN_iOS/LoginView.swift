//
//  ContentView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var userType = Int()
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var showInvalidParams = false
    var body: some View {
        
        NavigationStack {
            VStack {
                
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:250)
                    
                }
                .padding()

                VStack(alignment: .center) {
                        Text("User Login")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                            .padding(.bottom, 20)

                        Picker("Select User Type", selection: $userType) {
                            Text("Select User Type").bold().tag(-1)
                            Text("Candidate").tag(0)
                            Text("Employer").tag(1)
                            Text("Viewer").tag(2)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)

                        TextField("Enter a valid email address", text: $email)
                        .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                            .padding(.top, 10)

                        SecureField("Enter password", text: $password)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                            .padding(.top, 10)

                        
                            Toggle("Remember me", isOn: $rememberMe)
                        .padding(.vertical)
                            Button("Forgot password?") {
                                // Forgot password action
                            }
                            .foregroundColor(.blue)
                            .padding(.vertical)

                        Button {
                            if email=="" || password == "" || userType == -1 {
                                showInvalidParams = true
                                return
                            }
                            else{
                                loginViewModel.login(email:email,password: password,type: userType)
                                
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

                // Footer
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
                .padding(.bottom, 10)
                .alert(isPresented: $showInvalidParams) {
                    Alert(title: Text("Important message"), message: Text("Invalid Params"), dismissButton: .default(Text("Got it!")))
                        
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
