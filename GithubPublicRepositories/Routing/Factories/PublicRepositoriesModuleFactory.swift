//
//  PublicRepositoriesModuleFactory.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol PublicRepositoriesModuleFactory {
    func makePublicRepositoriesList() -> PublicRepositoriesListView
    func makeRepositoryDetails(url: URL) -> RepositoryDetailsView
}
