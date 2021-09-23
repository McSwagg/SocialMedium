//
//  Home.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/21/21.
//

import SwiftUI

struct Home: View {
    @StateObject var model = HomeModel()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(model.moments) { moment in
                        Text(moment.contents)
                        Text(moment.timestamp.formatted)
                        Text(moment.username)
                    }
                    
                    ProgressView()
                        .padding()
                        .onAppear {
                            model.fetchMoments()
                        }
                }
                .background (
                LinearGradient(
                    colors: [.red, .white, .blue],
                    startPoint: .top,
                    endPoint: .bottom),
                ignoresSafeAreaEdges: .horizontal)
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
