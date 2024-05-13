//
//  Gradient.swift
//
//
//  Created by Kyle on 2024/5/14.
//

import UIKit

public struct Gradient {
    public var colors: [UIColor]
    public var locations: [CGFloat]?
    public var startPoint: CGPoint?
    public var endPoint: CGPoint?
    
    public init(
        colors: [UIColor],
        locations: [CGFloat]? = nil,
        startPoint: CGPoint? = nil,
        endPoint: CGPoint? = nil
    ) {
        self.colors = colors
        self.locations = locations
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    public var layer: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = colors.map(\.cgColor)
        layer.locations = locations?.map { NSNumber(floatLiteral: $0) }
        if let startPoint { layer.startPoint = startPoint }
        if let endPoint { layer.endPoint = endPoint }
        return layer
    }
    
    public func update(layer: CAGradientLayer) {
        layer.colors = colors.map(\.cgColor)
        layer.locations = locations?.map { NSNumber(floatLiteral: $0) }
        if let startPoint { layer.startPoint = startPoint }
        if let endPoint { layer.endPoint = endPoint }
    }
}
