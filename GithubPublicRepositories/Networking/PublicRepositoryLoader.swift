//
//  PublicRepositoryLoader.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import RxSwift


protocol PublicRepositoryLoader {
    func fetch(since: Int) -> Observable<[Repository]>
}
