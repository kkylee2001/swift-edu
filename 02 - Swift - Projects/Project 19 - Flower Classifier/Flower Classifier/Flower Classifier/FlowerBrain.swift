//
//  FlowerBrain.swift
//  Flower Classifier
//
//  Created by Kyle L. on 8/14/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import UIKit
import CoreML
import Vision
//import Alamofire
//import SwiftyJSON


//MARK: - Machine Learning Function
extension Coordinator{
    func detection(image: UIImage){
        var queryResults = ""
        
        
        decodeJSON(imageName: queryResults)
    }
}





//MARK: - API and JSON Decoding Functions

extension Coordinator{
    func decodeJSON(imageName: String){

        if isFlower{
            self.parent.isFlower = true
        }else{
            self.parent.isFlower = false
        }
    }
    
}





