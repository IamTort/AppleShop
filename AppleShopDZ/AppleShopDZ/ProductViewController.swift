//
//  ProductViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер экрана выбранного продукта
final class ProductViewController: UIViewController {

    // MARK: - Private Enum
    private enum Constants {
        static let heart = "heart"
        static let share = "square.and.arrow.up"
        static let price = "3 990.00 руб."
        static let image = "Image"
        static let caseImage = "case3"
        static let circle = "circle"
        static let compatible = "Cовместимо с"
        static let macPro = "MackBook Pro - Angelina"
        static let checkmark = "checkmark.circle.fill"
        static let addBasket = "Добавить в корзину"
        static let boxImage = "shippingbox"
        static let orderInfo = "Заказ сегодня в течении дня, доставка:"
        static let dateTime = "Чт 25 Фев - Бесплатно"
        static let address = "Варианты доставки для местоположения: 115533"
        static let search = "Поиск"
    }
    
    // MARK: - Visual components
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.heart), for: .normal)
        button.frame = CGRect(x: view.bounds.width - 40, y: 10, width: 26, height: 26)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.layer.transform = CATransform3DMakeScale(1.2, 1.2, 0)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.share), for: .normal)
        button.frame = CGRect(x: view.bounds.width - 90, y: 7, width: 30, height: 30)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.layer.transform = CATransform3DMakeScale(1.2, 1.2, 0)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        label.text = productInfo?.infoText
        label.textAlignment = .center
        label.frame = CGRect(x: view.center.x - 200, y: 110, width: 400, height: 40)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = productInfo?.price
        label.textAlignment = .center
        label.frame = CGRect(x: view.center.x - 200, y: 135, width: 400, height: 40)
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var horisontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 250)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var repeatInfoLabel: UILabel = {
        let label = UILabel()
        label.text = productInfo?.infoText
        label.textAlignment = .center
        label.frame = CGRect(x: view.center.x - 200, y: 460, width: 400, height: 40)
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    private lazy var colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 17
        button.frame = CGRect(x: (view.bounds.width / 2) - 40, y: 540, width: 34, height: 34)
        return button
    }()
    
    private lazy var colorDarkButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 17
        button.frame = CGRect(x: (view.bounds.width / 2) + 10, y: 540, width: 34, height: 34)
        return button
    }()
    
    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.circle))
        imageView.frame = CGRect(x: (view.bounds.width / 2) - 1, y: 529, width: 56, height: 55)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var compatibleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.compatible
        label.textAlignment = .left
        label.frame = CGRect(x: 100, y: 620, width: 150, height: 30)
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    private lazy var macLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.macPro
        label.textAlignment = .left
        label.frame = CGRect(x: 185, y: 620, width: 150, height: 30)
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 11)
        return label
    }()
    
    private lazy var checkImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.checkmark))
        imageView.frame = CGRect(x: 70, y: 625, width: 20, height: 20)
        imageView.tintColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var addBasketButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.addBasket, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 10, y: 670, width: 400, height: 40)
        return button
    }()
    
    private lazy var boxImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.boxImage))
        imageView.frame = CGRect(x: 20, y: 750, width: 18, height: 18)
        imageView.tintColor = .systemGray2
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.orderInfo
        label.textAlignment = .left
        label.frame = CGRect(x: 55, y: 740, width: 300, height: 30)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.dateTime
        label.textAlignment = .left
        label.frame = CGRect(x: 55, y: 755, width: 150, height: 30)
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var placeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.address
        label.textAlignment = .left
        label.frame = CGRect(x: 55, y: 770, width: 300, height: 30)
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 11.5)
        return label
    }()
    
    // MARK: - Public property
    var productInfo: Product?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationController?.navigationBar.addSubview(heartButton)
        navigationController?.navigationBar.addSubview(shareButton)
        view.backgroundColor = .black
        addImageViewToScrollView()
        view.addSubview(productLabel)
        view.addSubview(costLabel)
        view.addSubview(repeatInfoLabel)
        view.addSubview(colorButton)
        view.addSubview(colorDarkButton)
        view.addSubview(compatibleLabel)
        view.addSubview(macLabel)
        view.addSubview(checkImageView)
        view.addSubview(addBasketButton)
        view.addSubview(boxImageView)
        view.addSubview(orderLabel)
        view.addSubview(dateLabel)
        view.addSubview(placeLabel)
        view.addSubview(horisontalScrollView)
        view.addSubview(circleImageView)
        navigationController?.navigationBar.topItem?.title = Constants.search
    }
    
    private func addImageViewToScrollView() {
        var coordinateX = 0
        guard let images = productInfo?.images else { return }
        for image in images {
            let imageView = makeImageView(image: image)
            imageView.frame = CGRect(x: coordinateX, y: 0, width: 400, height: 200)
            horisontalScrollView.addSubview(imageView)
            coordinateX += 420
        }
        let maxXContentSizeProductsScrollView = horisontalScrollView.subviews.map { $0.frame.maxX }.max()
        horisontalScrollView.contentSize = CGSize(width: maxXContentSizeProductsScrollView ?? 0, height: 200)
    }
    
    private func makeImageView(image: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
