//
//  ViewController.swift
//  Weather
//
//  Created by 陈龙 on 2022/9/4.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController{

    let locationManager = CLLocationManager()
    let weather = Weather()
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "QueryViewControllerSegue" {
//            let vc = segue.destination as! QueryViewController
//            vc.currentCity = weather.city
//        }
        if let vc = segue.destination as? QueryViewController {
            vc.currentCity = weather.city
            vc.queryDelegate = self
        }
    }

}

