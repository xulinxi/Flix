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
    var movie: [String:Any]!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView

        // Do any additional setup after loading the view.

  
//        let key = movie["key"] as! String
        print(movie)
        let trailerUrl = URL(string:"https://www.youtube.com/watch?v=SUXWAEX2jlg")
        let myRequest = URLRequest(url: trailerUrl!)
        webView.load(myRequest)
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        // Find the selected movie
//        let cell = sender as! UICollectionViewCell
//        let indexPath = collectionView.indexPath(for: cell)!
//        let movie = movies[indexPath.row]
//
//        // Pass the selected movie to the details view controller
//
//        let TrailerTapViewController = segue.destination as! TrailerTapViewController
//        TrailerTapViewController.movie = movie
//    }
}
