//
//  AddPresenter.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import Foundation

public protocol AddPresenter : AddInteractorOutput {
	// MARK: - Property
    
    var view: AddViewInterface? { get set }
    var interactor: AddInteractorInput? { get }
    var wireframe: AddWireframe? { get set }
    var delegate : AddModuleDelegate? { get }
}

public extension AddPresenter {

    public func add(owner: String, repository: String) {
        self.interactor?.addSource(Github.Repository.Identifier(owner: owner, name: repository))
    }

    func didAddSource() {
        self.view?.dismiss()
        self.delegate?.addSucceed()
    }

    public func cancelAddSource() {
        self.view?.dismiss()
        self.delegate?.addCancelled()
    }
    
    // MARK: - Add interactor output interface

    // MARK: - Converting entities
}