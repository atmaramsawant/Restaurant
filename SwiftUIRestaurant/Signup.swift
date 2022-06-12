////

//Signup

//SwiftUIRestaurant

//Created by: Atmaram Sawant on 01/12/21

//

//

import SwiftUI

struct Signup: View {
      @State private var email: String = ""
      @State private var password: String = ""
      @State private var confirmpassword: String = ""
      @StateObject var order = Order()
      @State private var isLoginValid: Bool = false
      @State private var shouldShowLoginAlert: Bool = false
      @EnvironmentObject var viewModel: AppViewModel
      
      var body: some View {
            VStack(){
                
                TextField("email", text: self.$email)
                    .padding()
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
                SecureField("password", text: self.$password)
                    .padding()
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
                SecureField("confirm password", text: self.$confirmpassword)
                    .padding()
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else{
                        return
                    }
                    guard password == confirmpassword else {return}
                    viewModel.signUp(email: email, password: password)
                    
                }, label: {
                    Text("Sign Up")
                        .frame(width: 200, height: 45, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                })
            }
          .padding(20)
          .navigationBarTitle("Sign up")
          .alert(isPresented: $shouldShowLoginAlert) {
            Alert(title: Text("Email/Password incorrect"))
          }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
