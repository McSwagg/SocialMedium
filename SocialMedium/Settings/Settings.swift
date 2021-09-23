//
//  Settings.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/21/21.
//

import SwiftUI

struct Settings: View {
    @StateObject var model = SettingModel()
    var body: some View {
        NavigationView {
            VStack {
                Color.gray
            }
            .navigationTitle("Setting")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: model.signOut) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
