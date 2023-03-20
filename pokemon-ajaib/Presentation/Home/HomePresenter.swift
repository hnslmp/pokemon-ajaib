//
//  HomePresenter.swift
//  Project: pokemon-ajaib
//
//  Module: Home
//
//  By Hansel Matthew 20/03/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import UIKit
import RxSwift
import RxCocoa
import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `HomePresenter` and referenced by `HomeViewController`
protocol HomeViewPresenterProtocol: ViewPresenterProtocol {
    func getObsCards() -> BehaviorRelay<[Cards]>
    func getObsIsLoadingCards() -> BehaviorRelay<Bool>
    func goToCardsDetail(_ selectedCard : Cards)
    func requestCards()
}

/// Should be conformed to by the `HomePresenter` and referenced by `HomeInteractor`
protocol HomeInteractorPresenterProtocol: AnyObject {
    func performUpdates()
}

// MARK: -

/// The Presenter for the Home module
final class HomePresenter: HomeViewPresenterProtocol, HomeInteractorPresenterProtocol {


    // MARK: - Constants

    let router: HomePresenterRouterProtocol
    let interactor: HomePresenterInteractorProtocol

    // MARK: Variables

    weak var view: HomePresenterViewProtocol?

    // MARK: Inits

    init(router: HomePresenterRouterProtocol, interactor: HomePresenterInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }

    // MARK: - Home View to Presenter Protocol

    func viewLoaded() {
        
    }
    
    func requestCards() {
        interactor.requestCards()
    }
    
    func getObsCards() -> RxRelay.BehaviorRelay<[Cards]> {
        interactor.getObsCards()
    }
    
    func getObsIsLoadingCards() -> RxRelay.BehaviorRelay<Bool> {
        interactor.getObsIsLoadingCards()
    }

    // MARK: - Home Interactor to Presenter Protocol
    func performUpdates() {
        view?.performUpdates()
    }
    
    func goToCardsDetail(_ selectedCard : Cards) {
        router.goToCardsDetail(selectedCard)
    }
    
    
}
