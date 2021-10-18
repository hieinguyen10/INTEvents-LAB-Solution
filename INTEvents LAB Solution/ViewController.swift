//
//  ViewController.swift
//  INTEvents LAB Solution
//
//  Created by Tyler Nguyen on 2021-10-17.
//

import UIKit

class ViewController: UIViewController {

    private let credentials : (username : String, password : String) = ("admin@int4fc.com", "LaSalle2000")
    
    @IBOutlet weak var txtLogin: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var switchRememberUsername: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getLastAccessCredentials () {
        let username = USerInfo.getUsername()
        
        if username.count > 0 {
            txtLogin.text = username
            switchRememberUsername.isOn = true
        }
        else {
            switchRememberUsername.isOn = false
        }
    }
    
    func setLastAccessCredentials() {
        if switchRememberUsername.isOn == true {
            USerInfo.setUsername(username: txtLogin.text!)
        }
        else {
            USerInfo.clearUsername()
        }
    }
    
    func customizeView() {
        btnLogin.layer.cornerRadius = 10
        
        self.navigationController!.navigationBar.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        getLastAccessCredentials()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segues.toEventsView {
            guard let login : String = txtLogin.text, let password : String = txtPassword.text else{
                return false
            }
            if (login != credentials.username) {
                ShowDialog.ok(view: self, title: "Wrong credentials", message: "Incorrect username", dialogType: .actionSheet)
                txtLogin.becomeFirstResponder()
                return false
                
            }
            if (password != credentials.password) {
                ShowDialog.ok(view: self, title: "Wrong credentials", message: "Incorrect password", dialogType: .actionSheet)
                txtPassword.becomeFirstResponder()
                return false
            }
            
            setLastAccessCredentials()
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toEventsView {
            (segue.destination as! EventsViewController).loggedUser = txtLogin.text!
            txtPassword.text = ""
        }
    }

}

