//
//  BeerViewController.swift
//  RM30902
//
//  Created by Rodrigo on 30/11/17.
//  Copyright © 2017 Rodrigo Cocate. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTagline: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbABV: UILabel!
    @IBOutlet weak var lbIBU: UILabel!
    @IBOutlet weak var ivBeer: UIImageView!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if beer != nil {
            
            lbName.text = beer?._name
            lbTagline.text = beer?._tagline
            lbDescription.text = beer?._description
            lbDescription.sizeToFit()
            
            lbABV.text = "Teor Alcoólico: \(beer._abv!)"
            lbIBU.text = "Escala de Amargor: \(beer._ibu!)"
            
            if beer?._image_url != nil {
                let url = URL(string: beer._image_url!)!
                ivBeer.kf.setImage(with: url)
                ivBeer.contentMode = .scaleAspectFit
            }            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
}
