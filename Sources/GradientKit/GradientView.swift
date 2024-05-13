//
//  Gradient.swift
//
//
//  Created by Kyle on 2024/5/14.
//

import UIKit

open class GradientView: UIView {
    public var gradient: Gradient

    public init(gradient: Gradient) {
        self.gradient = gradient
        super.init(frame: .zero)
        gradient.update(layer: gradientLayer)
    }
        
    @available(*, unavailable)
    public override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override class var layerClass: AnyClass {
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
    GradientView(gradient: .init(colors: [.red, .blue]))
}

#endif
