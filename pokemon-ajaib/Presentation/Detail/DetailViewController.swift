//
//  DetailViewController.swift
//  Project: pokemon-ajaib
//
//  Module: Detail
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

/// Should be conformed to by the `DetailViewController` and referenced by `DetailPresenter`
protocol DetailPresenterViewProtocol: AnyObject {
    func performUpdates()
}

// MARK: -

/// The View Controller for the Detail module
class DetailViewController: UIViewController, DetailPresenterViewProtocol {

	// MARK: - Constants

	let presenter: DetailViewPresenterProtocol

	// MARK: Variables
    var obsCard: BehaviorRelay<Cards?>?
	// MARK: Inits

	init(presenter: DetailViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Load Functions

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter.viewLoaded()
        
        obsCard = presenter.getObsCard()
        
        
        setupNavbar()
		view.backgroundColor = .backgroundColor
    }
    
    func setupNavbar() {
        guard let card = obsCard?.value, let name = card.name else { return }
        navigationController?.navigationBar.topItem?.backButtonTitle = "\(name)"
    }

	// MARK: - Detail Presenter to View Protocol

    func performUpdates() {
        // TODO: refresh the view
    }
}
