//
//  Extension+GetImageBG.swift
//  Weather App
//
//  Created by mac on 9/4/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

extension UIImageView
{
    func SetImageImage(Link_Image : String) -> String
    {
        if Link_Image == "//cdn.apixu.com/weather/64x64/day/296.png" ?? "//cdn.apixu.com/weather/64x64/day/356.png" ?? "//cdn.apixu.com/weather/64x64/day/353.png" ?? "//cdn.apixu.com/weather/64x64/day/299.png" ?? "//cdn.apixu.com/weather/64x64/day/305.png" ?? "//cdn.apixu.com/weather/64x64/day/176.png"
        {
            return "https://vannghetiengiang.vn/uploads/news/2008_11/1225850310.jpg"
        }
        
        
        if Link_Image == "//cdn.apixu.com/weather/64x64/day/143.png" ?? "//cdn.apixu.com/weather/64x64/day/200.png"
        {
            return "https://anh.24h.com.vn/upload/1-2017/images/2017-02-02/1486033773-148603362888372-mua-lon-4.jpg"
        }

    
        if Link_Image == "//cdn.apixu.com/weather/64x64/day/116.png" ?? "//cdn.apixu.com/weather/64x64/day/113.png"
        {
            return "http://vuanhiepanh.com/uploads/news/ky-thuat-nhiep-anh/doi-tuong-chup-anh/thu-thuat-troi-nang/chup-anh-troi-nang.jpg"
        }
    
        return "http://genknews.genkcdn.vn/k:thumb_w/640/2015/night-06-1449488852221/vi-sao-bau-troi-ban-dem-lai-co-mau-den.jpg"
    }
}
