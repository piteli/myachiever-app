//
//  UIButtonExt.swift
//  myachiever-app
//
//  Created by Fitri San on 14/11/2019.
//  Copyright © 2019 Fitri San. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.2776963596, green: 0.6281527602, blue: 0.1845578145, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
    }
}
