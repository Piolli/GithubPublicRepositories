//
//  RepositoryDetailsViewModel.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoryDetailsViewModel: RepositoryDetailsViewModelOutput {
    
    var didDisappear: (() -> Void)?
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
}
