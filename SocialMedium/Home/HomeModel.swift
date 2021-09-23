//
//  HomeModel.swift
//  SocialMedium
//
//  Created by Nathan Wawro on 9/22/21.
//

import Foundation

class HomeModel: ObservableObject {
    @Published var moments: [Moment] = []
    @Published var isLoading = true
    private var page = 1
    
    func fetchMoments() {
        guard let url = URL(string: "https://socialmedium.herokuapp.com/moments") else {
            updateView()
            return
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "apiKey", value: "SmFyV2FycmVu"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        guard let finalURL = components?.url else {
            updateView()
            return
        }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                print(error)
                self.updateView()
                return
            }
            
            guard let data = data else {
                self.updateView()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(SocialMediumResponse.self, from: data)
                self.updateView(moments: response.items)
            } catch {
                print(error)
                self.updateView()
            }
        }.resume()
    }
    
    private func updateView(moments: [Moment] = []) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.moments = moments
        }
    }
}
