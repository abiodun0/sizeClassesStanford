//
//  ViewController.swift
//  AutoLayoutSizeClasses
//
//  Created by Abiodun Shuaib on 19/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    var loggedInUser: User? {
        didSet{
            updateUi()
        }
    }
    @IBOutlet weak var nameOfUser: UILabel!

    @IBOutlet weak var companyName: UILabel!
    
    
    var secure: Bool = false {
        didSet{
            updateUi()
        }
    }
    private func updateUi(){
        passwordField.secureTextEntry = false
        passwordLabel.text = secure ? "Secure Password": "Password"
        nameOfUser.text = loggedInUser?.name
        companyName.text = loggedInUser?.company
        image = loggedInUser?.image
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func userLogin() {
        loggedInUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
    }
    @IBAction func changeSecurity() {
        secure = !secure
    }
    
    var aspectRatioConstraint: NSLayoutConstraint? {
        willSet{
            if let existingConstraint = aspectRatioConstraint{
                view.removeConstraint(existingConstraint)
            }
        }
        didSet{
            if let newConstraint = aspectRatioConstraint{
                view.addConstraint(newConstraint)
            }
        }
    }
    
    var image: UIImage? {
        get {
            return profileImage.image
        }
        set{
            profileImage.image = newValue
            if let constrainedView = profileImage{
                if let newImage = newValue {
                    aspectRatioConstraint = NSLayoutConstraint(item: constrainedView, attribute: .Width, relatedBy: .Equal, toItem: constrainedView, attribute: .Height, multiplier: newImage.aspectRatio, constant: 0)
                
            }
            
        }
    }
    }
    
}
extension UIImage{
    var aspectRatio: CGFloat{
        return size.height != 0 ? size.width / size.height : 0
    }
}

extension User{
    var image: UIImage?{
        if let image = UIImage(named: login){
            return image
        }
        return UIImage(named: "default")
    }
}
