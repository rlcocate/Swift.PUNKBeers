//
//  BeersTableViewController.swift
//  RM30902
//
//  Created by Rodrigo on 30/11/17.
//  Copyright © 2017 Rodrigo Cocate. All rights reserved.
//

import UIKit
import Kingfisher

class BeersTableViewController: UITableViewController {

    var dataSource : [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Lista de Cervejas"
        getAllBeers()        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? BeerViewController {
            if (tableView.indexPathForSelectedRow != nil) {
                vc.beer = dataSource[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
    func getAllBeers(){
        
        REST.getAllBeers { (beers: [Beer]?) in

            if let beers = beers {
                DispatchQueue.main.async {
                    self.dataSource = beers
                    self.tableView.separatorStyle = .singleLine;
                    self.tableView.reloadData()
                }
            }
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        let beer = dataSource[indexPath.row]
        let url = URL(string: beer._image_url!)!
        
        if url.absoluteString != "" {
            cell.ivBeer.kf.setImage(with: url)
            cell.ivBeer.contentMode = .scaleAspectFit
        }
    
        cell.lbName.text = beer._name
        cell.lbABV.text = "Teor Alcoólico: \(beer._abv!)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

}
