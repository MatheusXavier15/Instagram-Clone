//
//  Extensions.swift
//  Instagram-Clone
//
//  Created by Matheus Xavier on 15/07/22.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
