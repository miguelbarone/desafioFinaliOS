//
//  MoviesTableViewCell.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 07/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    static let IDENTIFIER = "MoviesTableViewCell"
    static let NIB = UINib(nibName: "MoviesTableViewCell", bundle: nil)
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    private var downloadTask: DownloadTask?
    
   override func awakeFromNib() {
            super.awakeFromNib()
            
            let selectedBackgroundView = UIView()
            selectedBackgroundView.backgroundColor = UIColor(named: "LARANJASSO")
            self.selectedBackgroundView = selectedBackgroundView
            // Initialization code
        }
        
        override func prepareForReuse() {
            downloadTask?.cancel()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        func configure(movie: Movie) {
            self.movieLabel.text = movie.titulo
            if let url = URL(string: movie.imagem) {
                self.movieImageView.kf.indicatorType = .activity
                self.downloadTask = self.movieImageView.kf.setImage(with: url) { (result) in
                    self.downloadTask = nil
                }
            } else {
                downloadTask = nil
                movieImageView.image = nil
            }
            
        }
        
    }
