//
//  PublicRepositoriesListViewModel.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import RxSwift
import RxCocoa

class PublicRepositoriesListViewModel: PublicRepositoriesListViewModelOutput {
    
    var onOpenDetails: ((URL) -> Void)?
    
    private let repositoryLoader: PublicRepositoryLoader
    private var lastId: Int = 0
    private var isLoading = false
    private var cellViewModels: [RepositoryCellViewModel] = []
    
    var count: Int {
        return cellViewModels.count
    }
    
    init(repositoryLoader: PublicRepositoryLoader) {
        self.repositoryLoader = repositoryLoader
    }
    
    func transform(input: Input) -> Output {
        let cellsOutput = PublishRelay<[RepositoryCellViewModel]>()
        let repositories = input
            .loadRepositories
            .flatMapLatest { [weak self] () -> Observable<[Repository]> in
                guard let self = self else {
                    return .empty()
                }
                return self.repositoryLoader.fetch(since: self.lastId)
            }
            .do(onNext: { [weak self] repos in
                guard let self = self else {
                    return
                }
                self.lastId = repos.last!.id
                self.cellViewModels.append(contentsOf: repos.map { RepositoryCellViewModel.init(repository: $0) })
                cellsOutput.accept(self.cellViewModels)
            })
            .map { _ in Void() }
            .asDriver(onErrorJustReturn: Void())
        
        return .init(didLoad: repositories, cells: cellsOutput.asDriver(onErrorJustReturn: []))
    }
    
    func cellViewModel(at indexPath: IndexPath) -> RepositoryCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
}

extension PublicRepositoriesListViewModel {
    struct Input {
        let loadRepositories: Observable<Void>
    }
    
    struct Output {
        let didLoad: Driver<Void>
        let cells: Driver<[RepositoryCellViewModel]>
    }
}
