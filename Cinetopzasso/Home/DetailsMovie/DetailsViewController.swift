//
//  DetailsViewController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 07/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieCast: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    
    private var downloadTask: DownloadTask?
    
    var controller: DetailsController?
    
    init(controller: DetailsController?, nibName: String? = nil) {
        super.init(nibName: nibName, bundle: nil)
        self.controller = controller
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        downloadTask?.cancel()

    }
    @IBAction func `return`(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    func setup() {
        movieTitle.text = controller?.movies.titulo
        movieYear.text = controller?.movies.ano
        
        if let url = URL(string: (controller?.movies.imagem)!) {
            self.movieImage.kf.indicatorType = .activity
            self.downloadTask = self.movieImage.kf.setImage(with: url) { (result) in
                self.downloadTask = nil
            }
        } else {
            downloadTask = nil
            movieImage.image = nil
        }
        
        movieDuration.text = controller?.movies.duracao
        movieCast.text = controller?.movies.elenco
        moviePlot.text = controller?.movies.sinopse
        movieDirector.text = controller?.movies.diretor
    }

}
