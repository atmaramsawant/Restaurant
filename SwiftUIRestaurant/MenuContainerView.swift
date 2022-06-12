////

//MenuContainerView

//SwiftUIRestaurant

//Created by: Atmaram Sawant on 01/12/21

//

//

import SwiftUI
import FirebaseAuth


struct MenuContainerView: View {
    let auth = Auth.auth()
    @StateObject var order = Order()
    @StateObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            
           if viewModel.signedIn {
                MainView()
                 .environmentObject(order)
            }else{
                
                   Login()
                      .environmentObject(viewModel)
            }

        }.onAppear {
            do{
                try auth.signOut()
            } catch {
               print("This is not possible...")
            }
           
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct MenuContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MenuContainerView(order: Order(), viewModel: AppViewModel())
    }
}
