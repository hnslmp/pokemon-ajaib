//
//  HomeViewController.swift
//  Project: pokemon-ajaib
//
//  Module: Home
//
//  By Hansel Matthew 20/03/23
//  ___ORGANIZATIONNAME___ 2023
//

// MARK: Imports

import UIKit
import SnapKit
import SwiftyVIPER
import RxSwift
import RxCocoa

// MARK: Protocols

/// Should be conformed to by the `HomeViewController` and referenced by `HomePresenter`
protocol HomePresenterViewProtocol: AnyObject {
    func performUpdates()
}

// MARK: -

/// The View Controller for the Home module
class HomeViewController: UIViewController, HomePresenterViewProtocol {

    // MARK: - Constants
    let presenter: HomeViewPresenterProtocol
    var obsCards: BehaviorRelay<[Cards]>?
    var obsIsLoadingCards: BehaviorRelay<Bool>?

    // MARK: Variables
    private let spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .white
        return view
    }()
    
    private let searchBar:UISearchBar = {
        let search = UISearchBar()
        
        let textFieldInsideSearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        
        search.tintColor = .white
        search.barTintColor = .white
        return search
    }()
    
    private let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    // MARK: Inits
    init(presenter: HomeViewPresenterProtocol) {
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
        

        obsCards = presenter.getObsCards()
        obsIsLoadingCards = presenter.getObsIsLoadingCards()
        
        
        presenter.requestCards()
        
        setupNavbar()
        setupCollectionView()
        setupView()

    }
    
    private func setupNavbar() {
        self.navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
        collectionView.backgroundColor = .clear

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8;
        layout.minimumLineSpacing = 8;
        collectionView.collectionViewLayout = layout
        
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(50)
        }
    }
    
    @objc func cancelButtonTapped() {
        
    }

    // MARK: - Home Presenter to View Protocol
    func performUpdates() {
        if let isLoadingCards = obsIsLoadingCards?.value {
            print("DIBAK: isLoading \(isLoadingCards)")
            if isLoadingCards {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
        }
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cards = obsCards?.value else { return 0 }
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath) as! HomeCollectionViewCell
        
        if let cards = obsCards?.value {
            cell.setupView(card: cards[indexPath.row])
        } else {
            cell.setupBroken()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = AppHelper.shared.screenWidth / 2.5
        let cellHeight = cellWidth / 2 * 3
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cards = obsCards?.value else { return }
        let selectedCard = cards[indexPath.row]
        presenter.goToCardsDetail(selectedCard)

    }
    
    
}
