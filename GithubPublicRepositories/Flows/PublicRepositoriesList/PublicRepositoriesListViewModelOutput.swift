//
//  PublicRepositoriesListViewModelOutput.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol PublicRepositoriesListViewModelOutput: AnyObject {
    var onOpenDetails: ((URL) -> Void)? { get set }
}
