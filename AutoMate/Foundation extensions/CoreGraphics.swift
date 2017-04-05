//
//  CoreGraphics.swift
//  AutoMate
//
//  Created by Bartosz Janda on 05.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

extension CGRect {

    /// Returns center point of the rectangle.
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

extension CGPoint {
    func vector(to point: CGPoint) -> CGVector {
        return CGVector(dx: point.x - x, dy: point.y - y)
    }

    var vector: CGVector {
        return CGVector(dx: x, dy: y)
    }
}
