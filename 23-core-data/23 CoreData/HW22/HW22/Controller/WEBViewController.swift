//
//  WEBViewController.swift
//  HW22
//
//  Created by Petro Golishevskiy on 09.06.2021.
//

import UIKit
import WebKit

class WEBViewController: UIViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    var urlString = "https://github.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        let urlOptional = URL(string: urlString)
        guard let url = urlOptional else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
