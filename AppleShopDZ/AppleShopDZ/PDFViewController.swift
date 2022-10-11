//
//  PDFViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 12.10.2022.
//

import UIKit
import WebKit

/// Контроллер вызова ПДФ файла
class PDFViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate {

    // MARK: - Private Visual Components
    private lazy var wkWebView: UIWebView = {
        var webView = UIWebView()
        webView.frame = view.bounds
        return webView
    }()
    
    // MARK: - Private property
    private let  application = UIApplication.shared
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        wkWebView.delegate = self
        wkWebView.scalesPageToFit = true
        
        view.addSubview(wkWebView)
        if let urlPdf = Bundle.main.url(forResource: "prices", withExtension: "pdf") {
            let request = URLRequest(url: urlPdf)
            wkWebView.loadRequest(request)
        }
    }
}
