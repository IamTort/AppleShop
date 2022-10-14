//
//  ContentViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 12.10.2022.
//

import UIKit

/// Контроллер отображения страниц с обучением
final class ContentViewController: UIViewController {
    
    // MARK: - Private Enum
    private enum Constants {
        static let titleFont = "Cochin-Bold"
        static let textFont = "Georgia"
        static let skipText = "SKIP"
        static let nextText = "NEXT"
        static let startedText = "GET STARTED!"
        static let emptyText = ""
        static let defaultsKey = "presentationWasViewed"
    }
    
    // MARK: - Private Visual Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 550, width: view.bounds.width - 60, height: 60)
        label.textColor = .black
        label.font = UIFont(name: Constants.titleFont, size: 23)
        label.alpha = 0.3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 580, width: view.bounds.width - 60, height: 120)
        label.font = UIFont(name: Constants.textFont, size: 16)
        label.textColor = .systemGray5
        label.alpha = 0.3
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.contentHorizontalAlignment = .center
        control.frame = CGRect(x: 0, y: view.bounds.height - 120, width: view.bounds.width, height: 30)
        return control
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 100)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.gray, for: .normal)
        button.setTitle(Constants.skipText, for: .normal)
        
        button.frame = CGRect(x: 70, y: view.bounds.height - 120, width: 100, height: 30)
        button.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setTitle(Constants.nextText, for: .normal)
        button.frame = CGRect(x: view.bounds.width - 160, y: view.bounds.height - 120, width: 100, height: 30)
        return button
    }()
    
    private lazy var startedButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setTitle(Constants.startedText, for: .normal)
        button.frame = CGRect(x: 110, y: view.bounds.height - 120, width: 200, height: 30)
        button.addTarget(self, action: #selector(skipAction), for: .allEvents)
        return button
    }()
    
    // MARK: - Public property
    var presentText = Constants.emptyText
    var textDescription = Constants.emptyText
    var imageText = Constants.emptyText
    var currentPage = 0
    var pagesNumber = 0
    weak var delegate: protocolPageViewDelegate?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimations()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        disappearAnimations()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        backgroundImageView.addSubview(pageControl)
        backgroundImageView.addSubview(skipButton)
        backgroundImageView.addSubview(nextButton)
        backgroundImageView.addSubview(titleLabel)
        backgroundImageView.addSubview(textLabel)
        view.addSubview(backgroundImageView)
        backgroundImageView.image = UIImage(named: imageText)
        pageControl.numberOfPages = pagesNumber
        nextButton.addTarget(self, action: #selector(goForwardAction), for: .allEvents)
        pageControl.currentPage = currentPage
        titleLabel.text = presentText
        textLabel.text = textDescription
        setButtons()
    }
    
    private func setButtons() {
        if currentPage == 2 {
            backgroundImageView.addSubview(startedButton)
            nextButton.isHidden = true
            skipButton.isHidden = true
            pageControl.isHidden = true
        }
    }
    
    private func disappearAnimations() {
        titleLabel.alpha = 0.3
        textLabel.alpha = 0.3
    }
    
    private func startAnimations() {
        UILabel.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut) {
            self.titleLabel.alpha = 1
            self.textLabel.alpha = 1
        }
    }
    
    // MARK: - Private Actions
    @objc func goForwardAction(_ sender: UIButton) {
        if currentPage < pagesNumber {
            delegate?.goForward()
        }
    }
    
    @objc func skipAction(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: Constants.defaultsKey)
        dismiss(animated: true, completion: nil)
    }
}
