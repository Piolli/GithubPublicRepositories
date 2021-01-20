//
//  RepositoryDetailsViewModelOutput.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol RepositoryDetailsViewModelOutput: AnyObject {
    var didDisappear: (() -> Void)? { get set }
}
