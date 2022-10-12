//
//  PDFViewController.swift
//  AppleShopDZ
//
//  Created by angelina on 12.10.2022.
//

import UIKit
import WebKit

/// Контроллер вызова ПДФ файла
final class PDFViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Private enum
    private enum Constants {
        static let pricesText = "prices"
        static let pdfText = "pdf"
    }
    
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
    
    // MARK: - Private methods
    private func setupView() {
        wkWebView.sizeToFit()
        
        view.addSubview(wkWebView)
        if let urlPdf = Bundle.main.url(forResource: Constants.pricesText, withExtension: Constants.pdfText) {
            let request = URLRequest(url: urlPdf)
            wkWebView.load(request)
        }
    }
}
