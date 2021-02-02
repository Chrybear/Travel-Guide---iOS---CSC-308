//
//  ViewController.swift
//  Travel_Guide
//
//  Created by Charles Ryan Barrett on 2/2/21.
//

import UIKit

class ViewController: UIViewController {
    //Variable to track the current area. Default is Lexington
    var curArea = "Lexington"
    //Variable to track the current attraction of an area
    var curAttr = "Keeneland"

    //Label for name of current attraction
    @IBOutlet weak var cur_info: UILabel!
    
    
    //Image for the current attraction
    @IBOutlet weak var cur_img: UIImageView!
    
    //Area menu changed
    @IBAction func area_changed(_ sender: UISegmentedControl) {
        //Area menu was changed, update the new area name, submenu, etc
        curArea = sender.titleForSegment(at: sender.selectedSegmentIndex)!
       
        
    }
    
    //Attraction menu changed
    @IBAction func atrac_changed(_ sender: UISegmentedControl) {
        //Area menu was changed, update the new area name, submenu, etc
        curAttr = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        //update the info label
        cur_info.text = curArea + ": " + curAttr
        //Change image
        changImg(Area: curAttr)
        
    }
    
    //This function is just used to change the image when a new attraction is selected
    func changImg(Area area: String) {
        switch area {
        case "Keeneland":
            cur_img.image = UIImage(named: "keen.jpg")
        case "Arboretum":
            cur_img.image = UIImage(named: "arb.jpg")
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //default view
        cur_img.image = UIImage(named: "keen")
        cur_info.text = "Lexington: Keeneland"
    }


}

