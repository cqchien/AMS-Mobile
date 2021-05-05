//





import Foundation
import UIKit

class styleCurve {
        
    func Curved (amplitude:CGFloat, view:UIView)
        {
            // circlecurve
            let universalSize = view.bounds
            let baseLine = view.bounds.height/1.2
            let path = UIBezierPath();
            // line curve go to point x, y
            path.move(to: CGPoint(x: 0, y: baseLine))
            // scale to curved (tỷ lệ float)
            path.addCurve(to: CGPoint(x: 1 * universalSize.width, y: baseLine ), controlPoint1: CGPoint(x: universalSize.width * (0.3) , y: amplitude + baseLine), controlPoint2: CGPoint(x: universalSize.width * (0.7), y:-amplitude + baseLine))
            // Line go to subview
            path.addLine(to: CGPoint(x: universalSize.width, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            // Add properties to the curve block
            let layer = CAShapeLayer()
            layer.fillColor = UIColor.init(red: 0.09, green: 0.86, blue: 0.74, alpha: 1.00).cgColor
            layer.opacity = 0.4
            layer.path = path.cgPath
            view.layer.addSublayer(layer)
        }
    
    // Set up components
    func setUpComponets(user: UITextField,pass: UITextField, button: UIButton, title:UILabel,slogan:UILabel ) {
        styleLogin.styleTextField(user)
        styleLogin.styleTextField(pass)
        // Login
        styleLogin.styleFilledButton(button)
        // text color
        styleLogin.styleColorText(title)
        styleLogin.styleColorText(slogan)
    }
    
}
