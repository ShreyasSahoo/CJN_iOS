//
//  ContentView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel(loginResponse: LoginResponse(responseMessage: "", responseStatus: false))
    @State private var userType : UserType = .candidate
    @State private var rememberMe = false
    @State private var showInvalidParams = false
    @State private var isPasswordVisible = false

    
    
    @State private var errorMessage: String?
    @State private var showLoginSuccess  = false
    @State private var showLoginError  = false
    
//    @State private var loginErrorMessage = ""
//    
//    private var shortPassword: Bool {
//        
//        if loginViewModel.password.count < 6 {
//            return true
//        } else {
//            return false
//        }
//        
//    }
    
    @State private var emailMessage: String = ""
    @State private var passwordMessage: String = ""
    
    private var validEmail : Bool {
        
        if loginViewModel.email.count < 6 {
            return true
        } else {
            return false
        }
        
    }
    var body: some View {
        
        GeometryReader { geo in
            NavigationStack {
                
                ScrollView(showsIndicators:false) {
                    ZStack {
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
                                        .foregroundColor(.accentColor)
                                        .padding(.bottom, 10)

                                    Picker("Select User Type", selection: $userType) {
                                       
                                        Text("Candidate").tag(UserType.candidate)
                                        Text("Employer").tag(UserType.employer)
                                        Text("Viewer").tag(UserType.viewer)
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                    .padding(10)
                                    .background(Color(UIColor.systemGray6))
                                    .clipShape(.rect(cornerRadius: 8))
                                VStack(alignment:.leading){
                                    Text("Email Address")
                                    if !emailMessage.isEmpty {
                                        
                                        Text(emailMessage)
                                            .font(.footnote)
                                            .foregroundStyle(.red)
                                    }
                                    
                                    TextField("Enter a valid email address", text: $loginViewModel.email)
                                    .textInputAutocapitalization(.never)
                                        .padding()
                                        .background(Color(UIColor.systemGray6))
                                        .cornerRadius(8)
                                        .padding(.top, 10)
                                        .onChange(of: loginViewModel.email) { newValue in validateEmail() }
                                }
                                   

                                VStack (alignment:.leading){
                                    Text("Password")
                                    if !passwordMessage.isEmpty {
                                        Text(passwordMessage)
                                            .font(.footnote)
                                            .foregroundStyle(.red)
                                    }
                                 
                                    HStack {
                                        ZStack {
                                            
                                            TextField("Enter password", text: $loginViewModel.password)
                                                .textInputAutocapitalization(.never)
                                                .padding()
                                                .background(Color(UIColor.systemGray6))
                                                .cornerRadius(8)
                                                .frame(height: 44)
                                                .opacity(isPasswordVisible ? 1 : 0)
                                            
                                            SecureField("Enter password", text: $loginViewModel.password)
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
                                                        .frame(maxHeight: 10)
                                                }
                                            }
                                        }
                                        .onChange(of: loginViewModel.password) { newValue in validatePassword() }
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
                                        if loginViewModel.email=="" || loginViewModel.password == "" || userType.rawValue == -1 {
                                            showInvalidParams = true
                                            return
                                        }
                                                else{
                                                    Task {
                                                        await loginViewModel.login( type: userType.rawValue)
                                                        
                                                        if loginViewModel.loginResponse.responseStatus == true {
                                                            showLoginSuccess = true
                                                            print(loginViewModel.loginResponse)
                                                        } else {
                                                            print("failed \(loginViewModel.loginResponse)")
                                                            withAnimation(.easeInOut){
                                                                showLoginError = true
                                                            }
                                                            
                                                        }
                                                        
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
                                    .padding(.top, 10)

                                    HStack {
                                        Text("Don't have an account?")
                                        NavigationLink(destination: RegistrationView()
                                            .navigationBarBackButtonHidden(true)
                                        ){
                                            Text("Register")
                                                .foregroundColor(.red)
                                        }
                                       
                                    }
                                    .padding(.top, 20)
                                }
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
                            
                            NavigationLink(destination: UserDashView(), isActive:  $showLoginSuccess) {
                                            EmptyView()
                                        }
                            
                        }
                        .frame(width: geo.size.width*9/10)
                        .alert(isPresented: $showInvalidParams) {
                            Alert(title: Text("Important message"), message: Text("Please enter all the required fields"), dismissButton: .default(Text("Got it!")))
                                
                    }
                        VStack{
                            if showLoginError {
                                VStack{
                                    Text(loginViewModel.loginResponse.responseMessage)
                                        .foregroundStyle(.red)
                                        
                                }
                                .padding()
                                .background(.white)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black)
                                }
                                .transition(.move(edge: .top))
                               
                            }
                           Spacer()
                        }
                        .animation(.easeIn(duration:2),value:showLoginError)
                    }
                    .onChange(of: showLoginError){ newVal in
                        if newVal {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                withAnimation(.easeIn){
                                    showLoginError.toggle()
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    private func validateEmail() {
        if loginViewModel.email.isEmpty {
              emailMessage = "Email cannot be empty."
          } else if !isValidEmail(loginViewModel.email) {
              emailMessage = "Enter a valid email."
          } else {
              emailMessage = ""
          }
      }
      
      private func validatePassword() {
          if loginViewModel.password.isEmpty {
              passwordMessage = "Password cannot be empty."
          } else if loginViewModel.password.count < 6 {
              passwordMessage = "Password should have at least 6 characters."
          } else {
              passwordMessage = ""
          }
      }
      
      private func isValidEmail(_ email: String) -> Bool {
          // Simple regex for validating email
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
          let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPredicate.evaluate(with: email)
      }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
