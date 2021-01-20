//
//  RepositoryDetailsView.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol RepositoryDetailsView: BaseView {
    var output: RepositoryDetailsViewModelOutput { get }
}
