//
//  PDFViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 12.10.2022.
//

import UIKit
import WebKit

/// Контроллер вызова ПДФ файла
class PDFViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    // MARK: - Private Visual Components
    private lazy var wkWebView: WKWebView = {
        var webView = WKWebView()
        webView.frame = view.bounds
        return webView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        wkWebView.uiDelegate = self
        wkWebView.sizeToFit()
        
        view.addSubview(wkWebView)
        if let urlPdf = Bundle.main.url(forResource: "prices", withExtension: "pdf") {
            let request = URLRequest(url: urlPdf)
            wkWebView.load(request)
        }
    }
}
