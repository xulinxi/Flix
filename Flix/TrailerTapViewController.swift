//
//  TrailerTapViewController.swift
//  Flix
//
//  Created by Linxi Xu on 2/25/21.
//

import UIKit
import WebKit

class TrailerTapViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
   
       let myURL = URL(string:"https://www.apple.com")
       let myRequest = URLRequest(url: myURL!)
       webView.load(myRequest)

        // Do any additional setup after loading the view.
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
