//
//  ModuleFactoryImpl.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class ModuleFactoryImpl: PublicRepositoriesModuleFactory {
    
    let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func makePublicRepositoriesList() -> PublicRepositoriesListView {
        let viewModel = PublicRepositoriesListViewModel(repositoryLoader: assembler.resolve())
        let viewController = PublicRepositoriesListViewController(viewModel: viewModel)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = "Public repositories"
        return viewController
    }
    
    func makeRepositoryDetails() -> BaseView {
        fatalError()
    }
}
