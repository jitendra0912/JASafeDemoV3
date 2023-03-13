//
//  JACustomButton.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 09/11/22.
//

import UIKit
@IBDesignable

class JACustomButton: UIButton {
    public override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    private var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
    
    // button corner radius
    @IBInspectable var graphButtonCornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = graphButtonCornerRadius
        }
    }
    
    // button border color
    @IBInspectable var graphButtonBorderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = graphButtonBorderColor.cgColor
        }
    }
    
    // button border width
    @IBInspectable var graphButtonBorderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = graphButtonBorderWidth
        }
    }
    
    // button shadow color
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.masksToBounds = false
        }
    }
    
    // button shadow radius
    @IBInspectable var graphButtonShadowRadius: CGFloat = CGFloat(0.5) {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowRadius = graphButtonShadowRadius
        }
    }
    
    // button shadow opacity
    @IBInspectable var shadowOpacity: Float = 0.4 {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    // button shadow offset
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1, height: 4) {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowOffset = shadowOffset
        }
    }

    // button start color gradient
    @IBInspectable public var startColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }
    
    // button end color gradient
    @IBInspectable public var endColor: UIColor = .red {
        didSet {
            updateColors()
        }
    }
    
    // button start point gradient
    @IBInspectable public var startPoint: CGPoint {
        get {
            gradientLayer.startPoint
        }
        
        set {
            gradientLayer.startPoint = newValue
        }
    }
    
    // button end point gradient
    @IBInspectable public var endPoint: CGPoint {
        get {
            gradientLayer.endPoint
        }
        set {
            gradientLayer.endPoint = newValue
        }
    }
    
    // update colores gradient
    private func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
