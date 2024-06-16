//
//  GradientTextView.swift
//
//
//  Created by Kyle on 2024/5/14.
//

import UIKit

/// ``GradientView`` with gradient text label
///
/// - Note: Please do not config ``label``'s frame perperty. Instead config the view's frame directly
public final class GradientTextView: GradientView {
    public required init(gradient: Gradient) {
        label = UILabel(frame: .zero)
        super.init(gradient: gradient)
        mask = label
    }

    /// The underlying UILabel property.
    ///
    /// Please do not config `label`'s frame perperty. Instead config the view's frame directly
    private let label: UILabel

    override public var intrinsicContentSize: CGSize { label.intrinsicContentSize }

    @available(*, unavailable)
    required init?(coder _: NSCoder) { fatalError() }

    override public func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        label.sizeThatFits(size)
    }

    override public func sizeToFit() {
        label.sizeToFit()
        frame.size = label.frame.size
        super.sizeToFit()
    }
}

extension GradientTextView {
    /// A wrapper for `label.text` and will call setNeedsLayout() for you.
    public var text: String? {
        get { label.text }
        set {
            label.text = newValue
            label.sizeToFit()
            frame.size = label.frame.size
            invalidateIntrinsicContentSize()
        }
    }

    /// A wrapper for `label.attributedText` and will call setNeedsLayout() for you.
    public var attributedText: NSAttributedString? {
        get { label.attributedText }
        set {
            label.attributedText = newValue
            label.sizeToFit()
            frame.size = label.frame.size
            invalidateIntrinsicContentSize()
        }
    }
    
    public var font: UIFont! {
        get { label.font }
        set { label.font = newValue }
    }
    
    /// The technique for aligning the text.
    public var textAlignment: NSTextAlignment {
        get { label.textAlignment }
        set { label.textAlignment = newValue }
    }
    
    /// The technique for wrapping and truncating the label’s text.
    public var lineBreakMode: NSLineBreakMode {
        get { label.lineBreakMode }
        set { label.lineBreakMode = newValue }
    }
    
    /// The maximum number of lines for rendering text.
    public var numberOfLines: Int {
        get { label.numberOfLines }
        set { label.numberOfLines = newValue }
    }
}

#if DEBUG
import SwiftUI

// MARK: Preview

@available(iOS 17, *)
private struct GradientTextViewWrapper: UIViewRepresentable {
    typealias UIViewType = GradientTextView

    let text: String
    let gradient: Gradient
    
    func makeUIView(context _: Context) -> UIViewType {
        let view = GradientTextView(gradient: gradient)
        view.text = text
        view.textAlignment = .center
        return view
    }

    func updateUIView(_ uiView: UIViewType, context _: Context) {
        uiView.text = text
    }
}

@available(iOS 17, *)
#Preview {
    VStack {
        GradientTextViewWrapper(
            text: "Gradient Button Title",
            gradient: Gradient(
                colors: [.red, .blue],
                locations: [0, 1],
                startPoint: .init(x: 0, y: 0.5),
                endPoint: .init(x: 1, y: 0.5)
            )
        )
        Text("Gradient Button Title")
            .foregroundStyle(
                LinearGradient(
                    colors: [.red, .blue],
                    startPoint: .init(x: 0, y: 0.5),
                    endPoint: .init(x: 1, y: 0.5)
                )
            )
        
    }
    .frame(width: 200, height: 100)
}

#endif
