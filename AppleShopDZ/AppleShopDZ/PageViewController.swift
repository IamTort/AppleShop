//
//  PageViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 12.10.2022.
//

import UIKit

protocol protocolPageViewController {
    func goForward()
}

/// Контроллер логики переключения страниц с обучением
final class PageViewController: UIPageViewController {
    
    // MARK: - Private Enum
    private enum Constants {
        static let titleOne = "Получайте рекомендации"
        static let titleTwo = "Следите за Вашими заказами"
        static let titleThree = "Узнавайте актуальные цены"
        static let textDescriptionOne = "В разделе Для Вас вы можете ознакомиться с новинками техники Apple"
        static let textDescriptionTwo = "Также вам доступно отслеживание вашего заказа в реальном времени"
        static let textDescriptionThree =
        "Актуальные цены и количество доступной техники вы можете узнать в разделе Поиск"
        static let firstImage = "5"
        static let secondImage = "6"
        static let thirdImage = "7"
        static let defaultsKey = "presentationWasViewed"
    }
    
    // MARK: - Private property
    private let presentScreenContent = [Constants.titleOne, Constants.titleTwo, Constants.titleThree]
    private let emojiArray = [Constants.textDescriptionOne, Constants.textDescriptionTwo,
                              Constants.textDescriptionThree]
    private let images = [Constants.firstImage, Constants.secondImage, Constants.thirdImage]
    private let pageControl = UIPageControl.appearance()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        dataSource = self
        view.backgroundColor = .white
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .systemBlue
    }

    private func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            UserDefaults.standard.set(true, forKey: Constants.defaultsKey)
            return nil}
        
        let contentViewController = ContentViewController()
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.textDescription = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        contentViewController.imageText = images[index]
        contentViewController.delegate = self
        
        return contentViewController
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? ContentViewController else { return nil }
        var pageNumber = vc.currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? ContentViewController else { return nil }
        var pageNumber = vc.currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}

// MARK: - UIPageViewControllerDelegate, protocolPageViewController
extension PageViewController: UIPageViewControllerDelegate, protocolPageViewController {
    func goForward() {
        guard let currentPage = viewControllers?.first else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        setViewControllers([nextPage], direction: .forward, animated: true)
    }
}
