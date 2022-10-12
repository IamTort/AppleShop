//
//  FoyYouViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 06.10.2022.
//

import UIKit

/// Контроллер экрана Для Вас
final class ForYouViewController: UIViewController {

    // MARK: - Private Enum
    private enum Constants {
        static let titleText = "Вот что нового"
        static let chevronRight = "chevron.right"
        static let recommendText = "Рекомeндуется вам"
        static let devicesText = "Ваши устройства"
        static let airpodImage = "apple-airpod"
        static let sendOrderText = "Ваш заказ отправлен."
        static let tomorrowDeliveryText = "1 товар, доставка завтра"
        static let processText = "Обрабатывается"
        static let postText = "Отправлено"
        static let deliveredText = "Доставлено"
        static let badgeImage = "app.badge"
        static let newsText = "Получайте новости о своем \nзаказе в режиме реального \nвремени."
        static let notificationText = "Включите уведомления, чтобы получать \nновости о своем заказе."
        static let showAllText = "Показать все"
        static let startImage = "case2"
        static let colorGray = "gray"
        static let avaKey = "ava"
    }
    
    // MARK: - Private Visual Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleText
        label.frame = CGRect(x: 20, y: 30, width: 300, height: 40)
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var recommendLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recommendText
        label.frame = CGRect(x: 20, y: 340, width: 400, height: 40)
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var devicesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.devicesText
        label.frame = CGRect(x: 20, y: 580, width: 400, height: 40)
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var verticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 110, width: view.bounds.width, height: view.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        return scrollView
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray2
        lineView.frame = CGRect(x: 20, y: 0, width: view.bounds.width, height: 0.4)
        return lineView
    }()
    
    private lazy var contentView: UIView = {
        let contentview = UIView()
        contentview.frame = CGRect(x: 15, y: 90, width: view.bounds.width - 30, height: 170)
        contentview.layer.cornerRadius = 15
        contentview.backgroundColor = .white
        contentview.layer.shadowColor = UIColor.black.cgColor
        contentview.layer.shadowOpacity = 0.3
        contentview.layer.shadowRadius = 8
        contentview.layer.shadowOffset = CGSize(width: 2, height: 3)
        contentview.layer.masksToBounds = false
        return contentview
    }()
    
    private lazy var caseImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.airpodImage))
        imageView.frame = CGRect(x: 10, y: 20, width: 70, height: 70)
        return imageView
    }()
    
    private lazy var lineContentView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray2
        lineView.frame = CGRect(x: 0, y: 100, width: contentView.bounds.width, height: 0.4)
        return lineView
    }()
    
    private lazy var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.setProgress(0.5, animated: false)
        progress.progressTintColor = .green
        progress.layer.transform = CATransform3DMakeScale(1, 1.5, 0)
        progress.frame = CGRect(x: 20, y: 120, width: contentView.bounds.width - 40, height: 50)
        return progress
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sendOrderText
        label.frame = CGRect(x: 90, y: 20, width: 200, height: 30)
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.tomorrowDeliveryText
        label.frame = CGRect(x: 90, y: 55, width: 200, height: 30)
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.chevronRight))
        imageView.frame = CGRect(x: contentView.bounds.width - 40, y: 50, width: 40, height: 40)
        imageView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 0)
        imageView.sizeToFit()
        imageView.tintColor = .systemGray
        return imageView
    }()

    private lazy var processLabel = createStateLabel(text: Constants.processText, coordinateX: 20)
    private lazy var postLabel = createStateLabel(text: Constants.postText, coordinateX: 160)
    private lazy var deliveredLabel = createStateLabel(text: Constants.deliveredText, coordinateX: 290)
    
    private lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.badgeImage))
        imageView.frame = CGRect(x: 60, y: 440, width: 70, height: 70)
        imageView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 0)
        imageView.sizeToFit()
        imageView.tintColor = .systemPink
        return imageView
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.newsText
        label.frame = CGRect(x: 80, y: 400, width: 300, height: 100)
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    private lazy var notificationsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.notificationText
        label.frame = CGRect(x: 80, y: 460, width: 400, height: 100)
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private lazy var chevronScrollImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.chevronRight))
        imageView.frame = CGRect(x: verticalScrollView.bounds.width - 40, y: 470, width: 40, height: 40)
        imageView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 0)
        imageView.sizeToFit()
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    private lazy var lineAfterView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray2
        lineView.frame = CGRect(x: 20, y: 550, width: view.bounds.width, height: 0.4)
        return lineView
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton(configuration: UIButton.Configuration.plain())
        button.setTitle(Constants.showAllText, for: .normal)
        button.frame = CGRect(x: verticalScrollView.bounds.width - 140, y: 587, width: 150, height: 30)
        return button
    }()
    
    // MARK: - Private property
    private var avatarButton = UIButton()
    
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarSettings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        navigationSettings()
        createBarButtonItem()
        view.addSubview(verticalScrollView)
        verticalScrollView.addSubview(titleLabel)
        verticalScrollView.addSubview(lineView)
        verticalScrollView.addSubview(contentView)
        verticalScrollView.addSubview(recommendLabel)
        contentView.addSubview(caseImageView)
        contentView.addSubview(lineContentView)
        contentView.addSubview(progressView)
        contentView.addSubview(processLabel)
        contentView.addSubview(postLabel)
        deliveredLabel.textColor = .systemGray
        contentView.addSubview(deliveredLabel)
        contentView.addSubview(orderLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(chevronImageView)
        verticalScrollView.addSubview(badgeImageView)
        verticalScrollView.addSubview(newsLabel)
        verticalScrollView.addSubview(notificationsLabel)
        verticalScrollView.addSubview(lineAfterView)
        verticalScrollView.addSubview(devicesLabel)
        verticalScrollView.addSubview(showButton)
        verticalScrollView.addSubview(chevronScrollImageView)
    }
    
    private func navigationSettings() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(named: Constants.startImage),
            style: .plain, target: nil, action: nil)
    }
    
    private func tabBarSettings() {
        tabBarController?.overrideUserInterfaceStyle = .light
        overrideUserInterfaceStyle = .light
        tabBarController?.tabBar.unselectedItemTintColor = .lightGray
    }
    
    private func createBarButtonItem() {
        avatarButton.addTarget(self, action: #selector(changeAvatarImage), for: .allEvents)
        avatarButton.layer.cornerRadius = 25
        avatarButton.clipsToBounds = true
        navigationController?.navigationBar.addSubview(avatarButton)
        avatarButton.frame = CGRect(x: view.frame.width - 70, y: 20, width: 50, height: 50)
        avatarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([avatarButtonTrailingConstraint(), avatarButtonBottomConstraint()])
        guard let data = UserDefaults.standard.value(forKey: Constants.avaKey) as? Data,
              let picture = UIImage(data: data)?.resizeImage(to: CGSize(width: 50, height: 50))
        else {
            let picture = Constants.startImage
            avatarButton.setBackgroundImage(UIImage(
                named: picture)?.resizeImage(to: CGSize(width: 50, height: 50)), for: .normal)
            return
        }
        avatarButton.setBackgroundImage(picture, for: .normal)
    }
    
    private func avatarButtonTrailingConstraint() -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: avatarButton,
            attribute: .trailingMargin,
            relatedBy: .equal,
            toItem: navigationController?.navigationBar,
            attribute: .trailingMargin,
            multiplier: 1.0,
            constant: -20)
    }
    
    private func avatarButtonBottomConstraint() -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: avatarButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: navigationController?.navigationBar,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -8)
    }
    
    private func createStateLabel(text: String, coordinateX: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: coordinateX, y: 130, width: 200, height: 30)
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }
    
    @objc private  func changeAvatarImage(_ sender: UIButton) {
        let albumPickerController = UIImagePickerController()
        albumPickerController.sourceType = .savedPhotosAlbum
        albumPickerController.allowsEditing = true
        albumPickerController.delegate = self
        present(albumPickerController, animated: true)
    }
}

// MARK: - UINavigationControllerDelegate, UIImagePickerControllerDelegate
extension ForYouViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let picture = image.resizeImage(to: CGSize(width: 50, height: 50))
        avatarButton.setBackgroundImage(picture, for: .normal)
        guard let data = picture.pngData() else { return }
        UserDefaults.standard.set(data, forKey: Constants.avaKey)
        
        dismiss(animated: true)
    }
}
