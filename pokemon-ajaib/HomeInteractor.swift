//
//  HomeInteractor.swift
//  Project: pokemon-ajaib
//
//  Module: Home
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

/// Should be conformed to by the `HomeInteractor` and referenced by `HomePresenter`
protocol HomePresenterInteractorProtocol {
    func getObsCards() -> BehaviorRelay<[Cards]>
    func getObsIsLoadingCards() -> BehaviorRelay<Bool>
    func requestCards()
}

// MARK: -

/// The Interactor for the Home module
final class HomeInteractor: HomePresenterInteractorProtocol {

    // MARK: - Variables

    weak var presenter: HomeInteractorPresenterProtocol?
    
    private let disposeBag = DisposeBag()
    private var obsCards: BehaviorRelay<[Cards]> = BehaviorRelay(value: [])
    private var obsIsLoadingCards = BehaviorRelay<Bool>(value: false)
    
    private let service = Service.shared

    // MARK: - Home Presenter to Interactor Protocol
    init() {
        setupObserver()
    }
    
    func setupObserver() {
        obsCards.subscribe { [weak self] _ in
            self?.presenter?.performUpdates()
        }.disposed(by: disposeBag)
        
        obsIsLoadingCards.subscribe { [weak self] _ in
            self?.presenter?.performUpdates()
        }.disposed(by: disposeBag)
    }
    
    func getObsCards() -> BehaviorRelay<[Cards]> {
        obsCards
    }
    
    func getObsIsLoadingCards() -> BehaviorRelay<Bool> {
        obsIsLoadingCards
    }
    
    func requestCards() {
        obsIsLoadingCards.accept(true)
        service.requestCards { result in
            switch result {
            case .success(let result):
                var cards = self.obsCards.value
                cards.append(contentsOf: result.data)
                self.obsCards.accept(cards)
                self.obsIsLoadingCards.accept(false)
            case .failure(let error):
                self.obsIsLoadingCards.accept(false)
                print(error.localizedDescription)
                
                // TODO: show error state snackbar
            }
        }
        
    }
}
