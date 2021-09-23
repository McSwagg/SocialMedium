//
//  HomeCard.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/22/21.
//

import SwiftUI

struct HomeCard: View {
    let moment: Moment
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(moment.contents)
            Text(moment.timestamp.formatted)
                .foregroundColor(.secondary)
                .font(.caption)
            
            HStack {
                Spacer()
                Text(moment.username)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}

struct HomeCard_Previews: PreviewProvider {
    static let moment = Moment(id: "", timestamp: Date(), username: "dolor", contents: "lorem ipsum")
    static var previews: some View {
        HomeCard(moment: moment)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
