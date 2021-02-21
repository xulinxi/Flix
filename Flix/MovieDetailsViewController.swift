//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Linxi Xu on 2/21/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("loading details screen")
        
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        // Pass the selected movie to the details view controller
    }
}
