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
    var movies = [[String:Any]]()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView

        // Do any additional setup after loading the view.

        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies = dataDictionary["results"] as![[String : Any]]
            
//            self.collectionView.reloadData()
            print(self.movies)
            
//        let key = movie["key"] as! String
//        let trailerUrl = URL(string:"https://www.youtube.com/watch?v=\(key)")
        let trailerUrl = URL(string:"https://www.youtube.com/watch?v=SUXWAEX2jlg")
        let myRequest = URLRequest(url: trailerUrl!)
        self.webView.load(myRequest)
        

    }
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
    }
}
