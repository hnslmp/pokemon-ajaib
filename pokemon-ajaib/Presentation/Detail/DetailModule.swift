//
//  DetailModule.swift
//  Project: pokemon-ajaib
//
//  Module: Detail
//
//  By Hansel Matthew 20/03/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import SwiftyVIPER
import UIKit
import RxSwift
import RxCocoa

// MARK: -

/// Used to initialize the Detail VIPER module
final class DetailModule: ModuleProtocol {

	// MARK: - Variables

	private(set) lazy var interactor: DetailInteractor = {
		DetailInteractor()
	}()

	private(set) lazy var router: DetailRouter = {
		DetailRouter()
	}()

	private(set) lazy var presenter: DetailPresenter = {
		DetailPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: DetailViewController = {
		DetailViewController(presenter: self.presenter)
	}()

	// MARK: - Module Protocol Variables

	var viewController: UIViewController {
		return view
	}

	// MARK: Inits

    init(card: Cards) {
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
        interactor.obsCard.accept(card)
	}
}
