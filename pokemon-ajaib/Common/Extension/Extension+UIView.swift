//
//  Extension+UIView.swift
//  pokemon-ajaib
//
//  Created by Hansel Matthew on 20/03/23.
//

import UIKit
import SwifterSwift
import SkeletonView

extension UIView {
    
    func startSkeleton() {
        isSkeletonable = true
        showAnimatedGradientSkeleton()
        startSkeletonAnimation()
    }
    
    func stopSkeleton() {
        guard isSkeletonable, isSkeletonActive else { return }
        DispatchQueue.main.async { [weak self] in
            self?.stopSkeletonAnimation()
            self?.hideSkeleton()
        }
    }
    
}

