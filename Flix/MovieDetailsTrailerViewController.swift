//
//  MovieDetailsTrailerViewController.swift
//  Flix
//
//  Created by Linxi Xu on 2/21/21.
//

import UIKit
import WebKit
import AlamofireImage

class MovieDetailsTrailerViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    
   /* override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }*/



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        print(movie["title"])
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        // load posters
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl +
            posterPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" +
                                backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        
        
//        // trailers
//        let myURL = URL(string:"https://www.apple.com")
//                let myRequest = URLRequest(url: myURL!)
//                webView.load(myRequest)
    }
    
    

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {

        let location = sender.location(in: view)
        print("poster tapped!!!")
        
        performSegue(withIdentifier: "trailerSegue", sender: nil)
        
    }


    /*@objc func didTap(sender: UITapGestureRecognizer) {

       // User tapped at the point above. Do something with that if you want.

       // tap gestures
       // The didTap: method will be defined in Step 3 below.
       let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))

       // Optionally set the number of required taps, e.g., 2 for a double click
       tapGestureRecognizer.numberOfTapsRequired = 2

       // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
       posterView.isUserInteractionEnabled = true
       posterView.addGestureRecognizer(tapGestureRecognizer)

    }*/
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
