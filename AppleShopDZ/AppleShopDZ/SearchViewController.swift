//
//  ViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер экрана поиска
final class SearchViewController: UIViewController, UIScrollViewDelegate {

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
    }
    
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
        scrollView.frame = CGRect(x: 20, y: 250, width: view.frame.width - 20, height: 200)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 600, height: 200)
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
        super.viewWillAppear(true)
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    // MARK: - Private method
    private func setupUI() {
        view.backgroundColor = .black
        navigationItem.title = " "
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
        
        createSearchLabel(title: Constants.airPodsText, coordinateY: 530)
        createSearchLabel(title: Constants.appleText, coordinateY: 580)
        createSearchLabel(title: Constants.beatsText, coordinateY: 630)
        createSearchLabel(title: Constants.appleText, coordinateY: 680)
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
        let funcView = UIView(frame: CGRect(x: 30, y: coordinateY, width: 240, height: 50))
        
        let imageView = UIImageView(image: UIImage(systemName: Constants.glassImageName))
        imageView.frame = CGRect(x: 0, y: 13, width: 15, height: 15)
        imageView.tintColor = .systemGray2
        funcView.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 25, y: 5, width: 300, height: 30))
        label.text = title
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        funcView.addSubview(label)
        
        let lineView = UIView()
        lineView.backgroundColor = .systemGray2
        lineView.frame = CGRect(x: 0, y: 43, width: view.bounds.width - 50, height: 0.3)
        funcView.addSubview(lineView)
        
        view.addSubview(funcView)
        
    }
    
    private func goToProductVC(image: UIImage?, text: String) {
        let productVC = ProductViewController()
        productVC.picture = image
        productVC.text = text
        navigationController?.pushViewController(productVC, animated: true)
    }
    
    // MARK: - Private Action
    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        switch sender.view?.tag {
        case 0: goToProductVC(image: UIImage(named: Constants.caseImageName),
                              text: Constants.caseMacText)
        case 1: goToProductVC(image: UIImage(named: Constants.beltImageName),
                              text: Constants.beltText)
        case 2: goToProductVC(image: UIImage(named: Constants.leatherImageName),
                              text: Constants.leatherCaseText)
        default: break
        }
    }
}
