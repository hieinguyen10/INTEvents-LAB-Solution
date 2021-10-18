//
//  EventsViewController.swift
//  INTEvents LAB Solution
//
//  Created by Tyler Nguyen on 2021-10-17.
//

import UIKit

class EventsViewController: UIViewController {
    
    public var loggedUser : String = ""
    
    private var eventListBanner : [String] = ["github.png","tdd.png","bringinton.png"]
    private var eventListDescription : [String] = ["GitHub: lalalalala.", "TDD: mjjdjdjdjdjd", "BringIntOn: dofofofofidfirf"]
    
    var selectdBannerTag : Int = 0
    
    @IBOutlet weak var lblLogin: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        
        lblLogin.text = loggedUser

        // Do any additional setup after loading the view.
    }
    
    func customizeView() {
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func btnBannerTouchUp(_ sender: UIButton) {
        selectdBannerTag = sender.tag
        performSegue(withIdentifier: Segues.toEventsInfoView, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toEventsInfoView {
            (segue.destination as! EventsViewController).bannerImageName = eventListBanner[selectdBannerTag]
            
            (segue.destination as! EventsViewController).eventInformation = eventListDescription[selectdBannerTag]
            
            (segue.destination as! EventsViewController).loggedUser = loggedUser
        }
    }
    
    
    @IBAction func btnLogoff(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
}
