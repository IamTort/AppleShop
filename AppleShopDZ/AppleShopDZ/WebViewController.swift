//
//  WebViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 10.10.2022.
//

import UIKit
import WebKit

/// Контроллер экрана браузер
final class WebViewController: UIViewController {
    
    // MARK: - Private Enum
    private enum Constants {
        static let emptyText = ""
        static let chevronLeft = "chevron.left"
        static let chevronRight = "chevron.right"
        static let square = "square.and.arrow.up"
    }
    
    // MARK: - Private Visual Components
    private lazy var wkWebView: WKWebView = {
        var webView = WKWebView()
        webView.frame = view.bounds
        return webView
    }()
    
    private lazy var goBackItem = UIBarButtonItem(image: UIImage(systemName: Constants.chevronLeft),
                                                  style: .plain, target: nil, action: nil)
    private lazy var goForwardItem = UIBarButtonItem(image: UIImage(systemName: Constants.chevronRight),
                                                     style: .plain, target: nil, action: nil)
    private lazy var refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
    private lazy var shareItem = UIBarButtonItem(image: UIImage(systemName: Constants.square),
                                                 style: .plain, target: nil, action: nil)
    private lazy var space = UIBarButtonItem(systemItem: .fixedSpace)
    private lazy var spaceBig = UIBarButtonItem(systemItem: .flexibleSpace)
    private lazy var toolBar: UIToolbar = {
        var toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: view.bounds.height - 120, width: view.bounds.width, height: 50)
        return toolbar
    }()
    
    // MARK: - Private property
    private let application = UIApplication.shared
    private var activityIndicator: UIActivityIndicatorView!
    private var myProgressView = UIProgressView()
    private var activityViewController: UIActivityViewController?
    private var observation: NSKeyValueObservation?
    
    // MARK: - Public property
    var productInfo: Product?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        setupUI()
        setupURL()
        observeProgressView()
    }
    
    private func setupUI() {
        view.addSubview(wkWebView)
        view.addSubview(toolBar)
        view.backgroundColor = .clear
        space.width = 40
        goBackItem.action = #selector(goBackAction(_:))
        goForwardItem.action = #selector(goForwardAction(_:))
        refreshButtonItem.action = #selector(refreshAction(_:))
        shareItem.action = #selector(shareAction(_:))
        toolBar.items = [goBackItem, space, goForwardItem, spaceBig, refreshButtonItem, space, shareItem]
        myProgressView.frame = CGRect(x: 120, y: 25, width: 155, height: 5)
        toolBar.addSubview(myProgressView)
    }
    
    private func setupURL() {
        guard let link = productInfo?.link else { return }
        if let myUrl = URL(string: link) {
            let request = URLRequest(url: myUrl)
            wkWebView.load(request)
        }
    }
    
    private func observeProgressView() {
        observation = wkWebView.observe(\.estimatedProgress, options: [.new]) { [weak self] _, _ in
            guard let estimatProgres = self?.wkWebView.estimatedProgress else { return }
            self?.myProgressView.progress = Float(estimatProgres)
        }
    }
    
    private func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        application.isNetworkActivityIndicatorVisible = isAnimated
        if isAnimated {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
    private func webViewDidStartLoad(_ webView: WKWebView) {
        isWorkIndicator(isAnimated: true, indicator: activityIndicator)
        goBackItem.isEnabled = false
        goForwardItem.isEnabled = false
    }
    
    private func webViewDidFinishLoad(_ webView: WKWebView) {
        isWorkIndicator(isAnimated: false, indicator: activityIndicator)
        if webView.canGoBack {
            goBackItem.isEnabled = true
        } else if webView.canGoForward {
            goForwardItem.isEnabled = true
        }
    }
    
    // MARK: - Private Actions
    @objc private func goBackAction(_ sender: Any) {
        if wkWebView.canGoBack {
            wkWebView.goBack()
        }
    }
    
    @objc private func goForwardAction(_ sender: Any) {
        if wkWebView.canGoForward {
            wkWebView.goForward()
        }
    }
    
    @objc private func refreshAction(_ sender: Any) {
        wkWebView.reload()
    }
    
    @objc private func shareAction(_ sender: Any) {
        activityViewController = UIActivityViewController(activityItems:
            [productInfo?.link ?? Constants.emptyText], applicationActivities: nil)
        guard let activityVC = activityViewController else { return }
        present(activityVC, animated: true)
    }
}
