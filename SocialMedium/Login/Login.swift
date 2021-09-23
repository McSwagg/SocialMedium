//
//  ContentView.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/21/21.
//

import SwiftUI

struct Login: View {
    @StateObject var model = LoginModel()
    var body: some View {
        VStack {
            
            HStack(spacing: 0) {
                Text("Social")
                    .bold()
                    .foregroundColor(.cyan)
                Text("Medium")
                    .italic()
                    .fontWeight(.black)
            }
                .font(.largeTitle)
            
                TextField("Username", text: $model.username)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.cyan)
                )
            
            Button(action: model.signIn) {
                Text("Sign in")
                    .padding()
                    .frame(width: 160)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
