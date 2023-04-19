//
//  ViewController-QueryViewControllerDelegate.swift
//  Weather
//
//  Created by 陈龙 on 2022/9/5.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ViewController: QueryViewControllerDelegate{
    func didChangeCity(city: String) {
        //para 以字典的形式存储请求参数，可以在request请求中自动encoding，解决中文编码问题
        let para = ["location" : city, "key" : kQweatherWebKey,]
        AF.request("https://geoapi.qweather.com/v2/city/lookup",parameters: para).responseJSON { response in
            if let data = response.value{
                let geoDataJSON = JSON(data)
                self.showCity(geoDataJSON)
                
                let para = ["location" : geoDataJSON["location",0,"id"].stringValue, "key" : kQweatherWebKey]
                AF.request("https://devapi.qweather.com/v7/weather/now",parameters: para).responseJSON { response in
                    if let data = response.value {
                        let dataJSON = JSON(data)
                        print(dataJSON)
                        self.showWeather(dataJSON)

                    }
                }
            }
        }
       
    }
}
