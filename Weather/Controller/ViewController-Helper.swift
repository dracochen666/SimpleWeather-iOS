//
//  ViewController-Helper.swift
//  Weather
//
//  Created by 陈龙 on 2022/9/5.
//

import Foundation
import SwiftyJSON

extension ViewController{
    func showWeather(_ dataJSON: JSON){
        //数据
        weather.temp = "\(dataJSON["now","temp"].stringValue) °"
        weather.icon = dataJSON["now","icon"].stringValue
        //UI
        tempLabel.text = self.weather.temp
         weatherImage.image = UIImage(named: self.weather.icon)
    }
    func showCity(_ geoDataJSON: JSON){
        weather.city = geoDataJSON["location",0,"adm1"].stringValue
        print(weather.city)
        cityLabel.text = weather.city
    }
        
}

