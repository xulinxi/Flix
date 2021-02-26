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

    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {

        _ = sender.location(in: view)
//        print("poster tapped!!!")
        performSegue(withIdentifier: "trailerSegue", sender: nil)
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Find the selected movie
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        // Pass the selected movie to the details view controller
        
        let MovieDetailsTrailerViewController = segue.destination as! MovieDetailsTrailerViewController
        MovieDetailsTrailerViewController.movie = movie
    }

}
