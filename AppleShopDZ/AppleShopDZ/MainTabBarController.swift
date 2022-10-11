//
//  someViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер tapBara
final class MainTabBarController: UITabBarController {
    
    // MARK: - Private property
    private let buyVC = BuyViewController()
    private let forYouVC = ForYouViewController()
    private let searchVC = SearchViewController()
    private let basketVC = BasketViewController()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private method
    private func setup() {
        let navController = UINavigationController(rootViewController: searchVC)
        let navForYouController = UINavigationController(rootViewController: forYouVC)
        viewControllers = [buyVC, navForYouController, navController, basketVC]
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .systemGray6
        tabBar.unselectedItemTintColor = .gray
        setupViewContoller(buyVC, title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"))
        setupViewContoller(forYouVC, title: "Для Вас", image: UIImage(systemName: "person.crop.circle.fill"))
        setupViewContoller(searchVC, title: "Поиск", image: UIImage(systemName: "magnifyingglass"))
        setupViewContoller(basketVC, title: "Корзина", image: UIImage(systemName: "case"))
    }
    
    private func setupViewContoller(_ viewController: UIViewController, title: String, image: UIImage?) {
        viewController.title = title
        viewController.tabBarItem.image = image?.withTintColor(.white)
        viewController.tabBarItem.selectedImage = image
    }
}
