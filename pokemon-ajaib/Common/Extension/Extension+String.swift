//
//  Extension+String.swift
//  pokemon-ajaib
//
//  Created by Hansel Matthew on 20/03/23.
//

import UIKit
import SwifterSwift

extension String {
    
    func convertToHex() -> UIColor {
        guard let color = UIColor.init(hexString: self) else { return UIColor.clear }
        return color
    }
}
