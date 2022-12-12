//
//  DetailViewController.swift
//  TabelView
//
//  Created by Nayeong Kim on 2022/12/12.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movieData: Movie?
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    private func setupUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }

}
