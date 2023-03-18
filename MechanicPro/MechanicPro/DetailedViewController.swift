//
//  DetailedViewController.swift
//  MechanicPro
//
//  Created by Wali Faisal on 06/01/2023.
//

import UIKit

class DetailedViewController: UIViewController {
    
    

    
    @IBOutlet weak var myTableview: UITableView!
    

    @IBOutlet weak var passedImg: UIImageView!
    
    let data = [ "Tyre Change", "Battery Repair" , "Oil Change", "Brake work" , "Electrical System", " Ignition System"]
    let details = [ "1000 RS"," 2300 RS","800 RS" , "5000 RS" , "4343 RS", "1231 RS"]
    
    
    
    var imgRecieved = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passedImg.image = imgRecieved
        myTableview.dataSource = self
        
        
       

        // Do any additional setup after loading the view.
    }
    

}

extension DetailedViewController:  UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = data[indexPath.row]
        cell.detailTextLabel?.text = details[indexPath.row]
        return cell
    }
    
    
    
}
