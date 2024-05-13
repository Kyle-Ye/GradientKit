//
//  GradientButton.swift
//
//
//  Created by Kyle on 2024/5/14.
//

import UIKit

open class GradientButton: UIButton, GradientElement {
    public var gradient: Gradient {
        didSet {
            gradient.update(layer: gradientLayer)
        }
    }

    public required init(gradient: Gradient) {
        self.gradient = gradient
        super.init(frame: .zero)
        gradient.update(layer: gradientLayer)
    }
        
    @available(*, unavailable)
    override public init(frame _: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    public final var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
}


#if DEBUG
import SwiftUI

@available(iOS 17, *)
#Preview {
    let button = GradientButton(gradient: .init(colors: [.red, .blue]))
    button.setTitle("Test Button", for: [])
    button.setTitleColor(.white, for: [])
    return button
}

#endif
