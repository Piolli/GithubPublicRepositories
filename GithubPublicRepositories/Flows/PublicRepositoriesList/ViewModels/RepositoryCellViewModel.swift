//
//  RepositoryCellViewModel.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

struct RepositoryCellViewModel {
    
    let repository: Repository
    
    var id: String {
        return "\(repository.id)"
    }
    
    var name: String {
        return "\(repository.name)"
    }
    
    var ownerLogin: String {
        return "\(repository.owner.login)"
    }
    
    var description: String {
        return "\(repository.description)"
    }
    
}
