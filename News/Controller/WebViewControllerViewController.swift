//
//  WebViewControllerViewController.swift
//  News
//
//  Created by apple on 24/07/2022.
//

import UIKit
import WebKit

class WebViewControllerViewController: UIViewController {
    
    var url : String = ""

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlForArticle = URL(string: url)
        let urlRequest = URLRequest(url: urlForArticle!)
        webView.load(urlRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
