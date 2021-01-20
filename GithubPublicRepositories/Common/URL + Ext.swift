//
//  URL + Ext.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

extension URL {
    static func makeGET(path: String, params: [String: String]) -> URL? {
        var urlComponents = URLComponents(string: path)
        urlComponents?.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return urlComponents?.url
    }
}
