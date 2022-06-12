//
//  Login.swift
//  SwiftUIRestaurant
//
//  Created by SJI on 16/06/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
           // DispatchQueue.main.async {
                self?.signedIn = true
           // }
          
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
}

struct Login: View {
      @State private var email: String = ""
      @State private var password: String = ""
      @StateObject var order = Order()
      @State private var isLoginValid: Bool = false
      @State private var shouldShowLoginAlert: Bool = false
      @EnvironmentObject var viewModel: AppViewModel
      
      var body: some View {
        //  NavigationView {
              VStack(alignment: .center){
                  
                  TextField("email", text: self.$email)
                      .padding()
                      .border(Color.gray, width: 1)
                      .cornerRadius(5)
                      .disableAutocorrection(true)
                      .autocapitalization(.none)
                  
                  SecureField("password", text: self.$password)
                      .padding()
                      .border(Color.gray, width: 1)
                      .cornerRadius(5)
                      .disableAutocorrection(true)
                      .autocapitalization(.none)
                  
                  Button(action: {
                      guard !email.isEmpty, !password.isEmpty else{
                          return
                      }
                      viewModel.signIn(email: email, password: password)
                      
                  }, label: {
                      Text("Sign In")
                          .frame(width: 200, height: 45, alignment: .center)
                          .background(Color.blue)
                          .foregroundColor(Color.white)
                          .cornerRadius(8)
                  })
                  
                  NavigationLink("Create account", destination: Signup())
                      .padding()
                  
                      
              }
              .padding(20)
              .navigationBarTitle("Login Screen")
              .alert(isPresented: $shouldShowLoginAlert) {
                  Alert(title: Text("Email/Password incorrect"))
              }
        //  }
          
      
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
