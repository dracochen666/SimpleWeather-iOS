//
//  ViewController-CLLocationManagerDelegate.swift
//  Weather
//
//  Created by 陈龙 on 2022/9/5.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
 
//        print("经度:\(lon),纬度:\(lat)")
        AF.request("https://devapi.qweather.com/v7/weather/now?location=\(lon),\(lat)&key=\(kQweatherWebKey)").responseJSON { response in
            if let data = response.value {
                print(data)
                let dataJSON = JSON(data)
                print(dataJSON)
                self.showWeather(dataJSON)

            }
        }
      AF.request("https://geoapi.qweather.com/v2/city/lookup?location=\(lon),\(lat)&key=aa3253333ddc411a8bf730faf8d8f865").response { response in
           if let data = response.value{
              let dataJSON = JSON(data)
               self.showCity(dataJSON)
               
           }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "获取失败"
        tempLabel.text = "获取失败"
        
    }
}
