//
//  DetailRouter.swift
//  Project: pokemon-ajaib
//
//  Module: Detail
//
//  By Hansel Matthew 20/03/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import UIKit

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `DetailRouter` and referenced by `DetailPresenter`
protocol DetailPresenterRouterProtocol: PresenterRouterProtocol {

}

// MARK: -

/// The Router for the Detail module
final class DetailRouter: RouterProtocol, DetailPresenterRouterProtocol {

	// MARK: - Variables

	weak var viewController: UIViewController?
}
