//
//  BuyViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер экрана Купить
final class BuyViewController: UIViewController {
    
    // MARK: - Private Enum
    private enum Constants {
        static let defaultsKey = "presentationWasViewed"
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarSettings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
    }
    
    // MARK: - Private methods
    private func tabBarSettings() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        overrideUserInterfaceStyle = .dark
    }
    
    private func startPresentation() {
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: Constants.defaultsKey)
        if presentationWasViewed == false {
            let pageViewController = PageViewController(transitionStyle: .scroll,
                navigationOrientation: .horizontal, options: nil)
            present(pageViewController, animated: true, completion: nil)
        }
    }
}
