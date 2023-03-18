//
//  ViewController.swift
//  MechanicPro
//
//  Created by Wali Faisal on 05/01/2023.
//

import MapKit
import UIKit
import CoreLocation



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehicleImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell1
        
        //cell.myVehicleImage.image=UIImage(named: vehicleImages[indexPath.row])
        
        cell.myVehicleImage.image=UIImage(named: vehicleImages[indexPath.row])
        
        //cell.myVehicleImage.layer.cornerRadius = 30.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryBoard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        
        desVC.imgRecieved = UIImage(named: vehicleImages[indexPath.row])!
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    
    var vehicleImages:[String] = ["icons8-sedan-100","icons8-jeep-100","icons8-motorcycle-100","icons8-truck-100"]
    
    
    
    let map = MKMapView()
    
    
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(31.45173483042442,74.29366703091077)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        //map.frame
        
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 120
        let mapWidth:CGFloat = 390
        let mapHeight:CGFloat = 435
        
        map.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: false)
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Customer Location"
        annotation.subtitle = "wali"
        
        self.map.addAnnotation(annotation)
        //map.center = view.center
        
        
    }


}

