//
//  BuiltInPublicRepositoryLoader.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import RxSwift

class BuiltInPublicRepositoryLoader: PublicRepositoryLoader {
    
    func fetch(since: Int) -> Observable<[Repository]> {
        let params: [String : String] = [
            "since": "\(since)",
        ]
        
        guard let url = URL.makeGET(path: "https://api.github.com/repositories", params: params) else {
            return .empty()
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        return URLSession.shared.doRequest(request).asObservable()
    }
}
