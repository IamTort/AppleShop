//
//  ProductViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер экрана выбранного продукта
final class ProductViewController: UIViewController {

    // MARK: - Visual components
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 20, y: 100, width: 400, height: 40)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView(image: pictureImage)
        imageView.frame = CGRect(x: view.center.x - 150, y: 150, width: 300, height: 300)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Public property
    var pictureImage: UIImage?
    var text: String?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private method
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(productLabel)
        view.addSubview(productImageView)
        navigationController?.navigationBar.topItem?.title = "Поиск"
    }
    
}
