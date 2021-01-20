//
//  StubPublicRepositoryLoader.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import RxSwift

class StubPublicRepositoryLoader: PublicRepositoryLoader {
    func fetch(since: Int) -> Observable<[Repository]> {
        let repos: [Repository]
        
        if since == 0 {
            repos = [
                .init(owner: .init(login: "Sanya"), id: 1, name: "SibGU Timetable", description: "Good app"),
                .init(owner: .init(login: "Sanya"), id: 2, name: "Simple Weather App", description: "Good app"),
                .init(owner: .init(login: "Sanya"), id: 3, name: "Pixabay Image List", description: "Good app")
            ]
        } else {
            repos = [
                .init(owner: .init(login: "Sanya"), id: 4, name: "DetailsIntoProduction", description: "Good app"),
                .init(owner: .init(login: "Sanya"), id: 5, name: "VideoFilters", description: "Good app"),
                .init(owner: .init(login: "Sanya"), id: 6, name: "Logic", description: "Good app")
            ]
        }
        
        return Observable<[Repository]>.of(repos)
    }
}
