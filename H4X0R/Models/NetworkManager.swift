//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Marcio Silva on 18/05/21.
//

import Foundation

class NetworManager: ObservableObject  {
    
   @Published var posts = [Post]()
    
    func fectchData() {
        if  let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from:  safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
