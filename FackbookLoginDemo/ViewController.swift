//
//  ViewController.swift
//  FackbookLoginDemo
//
//  Created by Poppy on 22/3/2561 BE.
//  Copyright © 2561 Poppy. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController {
    
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        //adding it to view
        view.addSubview(loginButton)
        
        //if the user is already logged in
        if (FBSDKAccessToken.current()) != nil{
            getFBUserData()
        }
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(publishPermissions: [.publishPages], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
                
            }
        }
    }
    
    //function is fetching the user data
    func getFBUserData(){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    let name = self.dict["name"] ?? "" as AnyObject
                    let picture = (self.dict["picture"]!["data"]) ?? "" as AnyObject
                    
                    
                    let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
                    profileViewController.name = name as! String
                    //profileViewController.picture = picture as AnyObject
                    self.present(profileViewController, animated: true, completion: nil)
                }
            })
    }

}

