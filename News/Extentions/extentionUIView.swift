//
//  extentionUIView.swift
//  News
//
//  Created by apple on 23/07/2022.
//

import Foundation
import UIKit
extension UIView {
    @IBInspectable var cornerReduies : CGFloat {
        get{
            return self.cornerReduies
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }

        @IBInspectable var borderColor: UIColor? {
            get {
                return UIColor(cgColor: layer.borderColor!)
            }
            set {
                layer.borderColor = newValue?.cgColor
            }
        }

        @IBInspectable
        var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.masksToBounds = false
                layer.shadowRadius = newValue
            }
        }

        @IBInspectable
        var shadowOpacity: Float {
            get {
                return layer.shadowOpacity
            }
            set {
                layer.masksToBounds = false
                layer.shadowOpacity = newValue
            }
        }

        @IBInspectable
        var shadowOffset: CGSize {
            get {
                return layer.shadowOffset
            }
            set {
                layer.masksToBounds = false
                layer.shadowOffset = newValue
            }
        }

        @IBInspectable
        var shadowColor: UIColor? {
            get {
                if let color = layer.shadowColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.shadowColor = color.cgColor
                } else {
                    layer.shadowColor = nil
                }
            }
        }
}
