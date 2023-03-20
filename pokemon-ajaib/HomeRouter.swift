//
//  HomeRouter.swift
//  Project: pokemon-ajaib
//
//  Module: Home
//
//  By Hansel Matthew 20/03/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import UIKit

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `HomeRouter` and referenced by `HomePresenter`
protocol HomePresenterRouterProtocol: PresenterRouterProtocol {

}

// MARK: -

/// The Router for the Home module
final class HomeRouter: RouterProtocol, HomePresenterRouterProtocol {

	// MARK: - Variables

	weak var viewController: UIViewController?
}
