//
//  ViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер экрана поиска
final class SearchViewController: UIViewController {

    // MARK: - Private enum
    private enum Constants {
        static let title = "Поиск"
        static let placeholder = "Поиск по продуктам и магазинам"
        static let sawLabl = "Недавно просмотренные"
        static let delete = "Очистить"
        static let searches = "Варианты запросов"
        static let caseMacText = "Чехол Incase Flat для MacBook pro 16 дюймов"
        static let beltText = "Спортивный ремешок Black Unity (для к..."
        static let leatherCaseText = "Кожаный чехол для MacBook Pro 16 дюймов, золотой"
        static let caseImageName = "case2"
        static let beltImageName = "4"
        static let leatherImageName = "2"
        static let glassImageName = "magnifyingglass"
        static let airPodsText = "AirPods"
        static let appleText = "AppleCare"
        static let beatsText = "Beats"
        static let iphoneText = "Cравните модели IPhone"
        static let iphoneProText = "IPhone 12 Pro"
        static let iphoneProImageName = "Iphone"
        static let emptyTitle = " "
        static let linkOneText = "https://www.apple.com/shop/product/HQ292ZM/A/incase-compact-sleeve-in-flight-nylon-for-16-macbook-pro?fnode=b10a84384e071436553a2da8ea3de23027afd3e6eeb03bbedcdfb2f71eee40e63e00f20899b8924b0d44461da0369a1e64d7d06a8e86212315349d6e5a7de934116ecb75655b673967277d9727696683343f17b21d8d6c649059bb2148a6b4fb0756eac5dfc406b7c161b557cdc05fc1"
        static let linkTwoText = "https://www.apple.com/shop/product/MJ4V3AM/A/40mm-black-unity-sport-band-regular?fnode=fa281a0a903d3f92b5cad11ca7162ba813b011f1cef41072ee7f88d7b428ef56b4394c07449a37b1347c245e88e311d657e0200aedd7650751cd77f655bac590f811072d9296ec0386bf0a675d35df8d"
        static let linkThreeText = "https://www.apple.com/shop/product/HPFG2ZM/A/von-holzhausen-macbook-sleeve-for-13-macbook?fnode=b407190a49ac9cb3006112edaeb3a768de20f06db85f95b59f53f882c8548f609e5806982c667ad7f362cadd2582866c00f2e62c48af6bc2a94b9a9670defbcf62cf1ae91e5a33fa3c3a51a6f4ca01acef7c03a758293632760d62fd0db93448885ef2182d2117b15c7560060f5701eb"
        static let linkFourText = "https://www.apple.com/shop/buy-iphone/iphone-14-pro"
        static let caseMacPrice = "3 990.00 руб."
        static let beltPrice = "2 990.00 руб."
        static let leatherCasePrice = "7 990.00 руб."
        static let iphonePrice = "127 990.00 руб."
        static let macTwoImageName = "Image"
        static let macThreeImageName = "case3"
        static let beltTwoImageName = "clock2"
        static let leatherTwoImageName = "caseBrown2"
        static let leatherThreeImageName = "caseBrown3"
    }
    
    var productsInfo = [Product(infoText: Constants.caseMacText, images:
                                    [Constants.caseImageName, Constants.macTwoImageName, Constants.macThreeImageName],
                                price: Constants.caseMacPrice, link: Constants.linkOneText),
                        Product(infoText: Constants.beltText, images:
                                    [Constants.beltImageName, Constants.beltTwoImageName],
                                price: Constants.beltPrice, link: Constants.linkTwoText),
                        Product(infoText: Constants.leatherCaseText, images:
                                    [Constants.leatherImageName, Constants.leatherTwoImageName,
                                     Constants.leatherThreeImageName],
                                price: Constants.leatherCasePrice, link: Constants.linkThreeText),
                        Product(infoText: Constants.iphoneProText, images: [Constants.iphoneProImageName],
                                price: Constants.iphonePrice, link: Constants.linkFourText)]
    
    // MARK: - Visual components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.title
        label.frame = CGRect(x: 20, y: 80, width: 200, height: 40)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = Constants.placeholder
        search.frame = CGRect(x: 10, y: 130, width: 400, height: 40)
        search.barTintColor = .black
        return search
    }()
    
    private lazy var sawLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sawLabl
        label.frame = CGRect(x: 20, y: 200, width: 400, height: 40)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.delete, for: .normal)
        button.frame = CGRect(x: view.frame.width - 100, y: 205, width: 100, height: 30)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var horisontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 20, y: 250, width: view.frame.width - 35, height: 200)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 550, height: 200)
        return scrollView
    }()
    
    private lazy var searchesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.searches
        label.frame = CGRect(x: 20, y: 480, width: 400, height: 40)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabAndNavigattionSettings()
    }
    
    // MARK: - Private method
    private func setupUI() {
        view.backgroundColor = .black
        navigationItem.title = Constants.emptyTitle
        tabBarController?.title = Constants.title
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(sawLabel)
        view.addSubview(deleteButton)
        view.addSubview(horisontalScrollView)
        view.addSubview(searchesLabel)
        
        createItemsView(title: Constants.caseMacText,
                        image: UIImage(named: Constants.caseImageName), tag: 0, coordinateX: 0)
        createItemsView(title: Constants.beltText,
                        image: UIImage(named: Constants.beltImageName), tag: 1, coordinateX: 140)
        createItemsView(title: Constants.leatherCaseText,
                        image: UIImage(named: Constants.leatherImageName), tag: 2, coordinateX: 280)
        createItemsView(title: Constants.iphoneProText,
                        image: UIImage(named: Constants.iphoneProImageName), tag: 3, coordinateX: 420)
        
        createSearchLabel(title: Constants.airPodsText, coordinateY: 530)
        createSearchLabel(title: Constants.appleText, coordinateY: 580)
        createSearchLabel(title: Constants.beatsText, coordinateY: 630)
        createSearchLabel(title: Constants.appleText, coordinateY: 680)
    }
    
    private func tabAndNavigattionSettings() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.title = Constants.emptyTitle
    }
    
    private func createItemsView(title: String, image: UIImage?, tag: Int, coordinateX: Int) {
        let view = UIView(frame: CGRect(x: coordinateX, y: 0, width: 130, height: 200))
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 10
        view.isUserInteractionEnabled = true
        view.tag = tag
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 15, y: 30, width: 100, height: 75)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 10, y: 110, width: 110, height: 80))
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 3
        view.addSubview(label)
        horisontalScrollView.addSubview(view)
    }
    
    private func createSearchLabel(title: String, coordinateY: Int) {
        let cellView = UIView(frame: CGRect(x: 30, y: coordinateY, width: 240, height: 50))
        
        let imageView = UIImageView(image: UIImage(systemName: Constants.glassImageName))
        imageView.frame = CGRect(x: 0, y: 13, width: 15, height: 15)
        imageView.tintColor = .systemGray2
        cellView.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 25, y: 5, width: 300, height: 30))
        label.text = title
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        cellView.addSubview(label)
        
        let lineView = UIView()
        lineView.backgroundColor = .systemGray2
        lineView.frame = CGRect(x: 0, y: 43, width: view.bounds.width - 50, height: 0.3)
        cellView.addSubview(lineView)
        
        view.addSubview(cellView)
    }
    
    // MARK: - Private Action
    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        let productVC = ProductViewController()
        productVC.productInfo = productsInfo[tag]
        navigationController?.pushViewController(productVC, animated: true)
    }
}
