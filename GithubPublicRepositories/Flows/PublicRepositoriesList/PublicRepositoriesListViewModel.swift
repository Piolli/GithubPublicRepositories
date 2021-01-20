//
//  PublicRepositoriesListViewModel.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class PublicRepositoriesListViewModel: PublicRepositoriesListViewModelOutput {
    var onOpenDetails: ((URL) -> Void)?
}
