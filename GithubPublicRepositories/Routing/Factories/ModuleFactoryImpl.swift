//
//  ModuleFactoryImpl.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class ModuleFactoryImpl: PublicRepositoriesModuleFactory {
    func makePublicRepositoriesList() -> PublicRepositoriesListView {
        let viewModel = PublicRepositoriesListViewModel()
        let viewController = PublicRepositoriesListViewController(viewModel: viewModel)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = "Public repositories"
        return viewController
    }
    
    func makeRepositoryDetails() -> BaseView {
        fatalError()
    }
}
