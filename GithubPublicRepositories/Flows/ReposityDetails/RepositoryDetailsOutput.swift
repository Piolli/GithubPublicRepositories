//
//  RepositoryDetailsOutput.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol RepositoryDetailsOutput: AnyObject {
    var finishFlow: (() -> Void)? { get set }
}
