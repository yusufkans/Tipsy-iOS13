//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Yusufkan Sürmelioğlu on 3.04.2023.
//  Copyright © 2023 vestel. All rights reserved.
//

import Foundation

struct TipsyBrain {
    var tips: Tips?
    
    func getTotalBill() -> Double{
        return tips?.totalBill ?? 0
    }
    
    func getTip() -> Double{
        return tips?.tip ?? 0
    }
    
    func getSplit() -> Double{
        return tips?.split ?? 2
    }
    
    func getResult() -> Double{
        return tips?.result ?? 0
    }
    
    mutating func calculate(_ totalBill: Double, _ tip: Double, _ split: Double) {
        var result = (totalBill * tip) + totalBill
        result = (result / split)
        
        tips = Tips(totalBill: totalBill, tip: tip, split: split, result: result)
        
    }
}
