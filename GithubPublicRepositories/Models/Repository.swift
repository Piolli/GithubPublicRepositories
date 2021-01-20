//
//  Repository.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

struct Repository: Decodable {
    let owner: Owner
    let id: Int
    let name: String
    let html_url: String
    let description: String?
}

struct Owner: Decodable {
    let login: String
}
