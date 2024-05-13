//
//  GradientElement.swift
//
//
//  Created by Kyle on 2024/5/14.
//

import UIKit

public protocol GradientElement: UIView {
    init(gradient: Gradient)
    var gradient: Gradient { get set }
    var gradientLayer: CAGradientLayer { get }
}
