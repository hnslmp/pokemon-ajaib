//
//  DetailInteractor.swift
//  Project: pokemon-ajaib
//
//  Module: Detail
//
//  By Hansel Matthew 20/03/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import Foundation
import SwiftyVIPER
import RxSwift
import RxCocoa

// MARK: Protocols

/// Should be conformed to by the `DetailInteractor` and referenced by `DetailPresenter`
protocol DetailPresenterInteractorProtocol {
    func getObsCard() -> BehaviorRelay<Cards?>
}

// MARK: -

/// The Interactor for the Detail module
final class DetailInteractor: DetailPresenterInteractorProtocol {

	// MARK: - Variables
    var obsCard: BehaviorRelay<Cards?> = BehaviorRelay(value: nil)
	weak var presenter: DetailInteractorPresenterProtocol?
    private let disposeBag = DisposeBag()

	// MARK: - Detail Presenter to Interactor Protocol
    
    init() {
        setupObserver()
    }
    
    func setupObserver() {
        obsCard.subscribe { [weak self] _ in
            self?.presenter?.performUpdates()
        }.disposed(by: disposeBag)
    }
    
    func getObsCard() -> BehaviorRelay<Cards?> {
        obsCard
    }
    
}
