//
//  PublicRepositoriesListView.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol PublicRepositoriesListView: BaseView {
    var output: PublicRepositoriesListViewModelOutput { get }
}
