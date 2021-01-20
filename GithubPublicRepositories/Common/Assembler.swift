//
//  Assembler.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class Assembler:
    PublicRepositoryLoaderAssembler
//    StubPublicRepositoryLoaderAssembler
{

    public static let shared = Assembler()

    private init() { }
    
}

protocol PublicRepositoryLoaderAssembler {
    func resolve() -> PublicRepositoryLoader
}

extension PublicRepositoryLoaderAssembler {
    func resolve() -> PublicRepositoryLoader {
        return BuiltInPublicRepositoryLoader()
    }
}

protocol StubPublicRepositoryLoaderAssembler {
    func resolve() -> PublicRepositoryLoader
}

extension StubPublicRepositoryLoaderAssembler {
    func resolve() -> PublicRepositoryLoader {
        return StubPublicRepositoryLoader()
    }
}

