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
    
    let areas = ["Lexington", "Chengdu", "Chicago", "Hongkong"]
    
    //Attraction arrays (may change to dictionary objects)
    let lAttr = ["Keeneland", "Arboretum"]
    let cheAttr = ["Panda", "Pedestrian Street"]
    let chiAttr = ["Millenium Park", "Skydeck", "Cruise", "Planetarium"]
    let hAttr = ["Disneyland", "Ocean Park", "The Peak"]

    //Label for name of current attraction
    @IBOutlet weak var cur_info: UILabel!
    
    
    //Image for the current attraction
    @IBOutlet weak var cur_img: UIImageView!
    
    //Outlet for the attractions segment
    @IBOutlet var attrac_menu: UISegmentedControl!
    
    //Area menu changed
    @IBAction func area_changed(_ sender: UISegmentedControl) {
        //Area menu was changed, update the new area name, submenu, etc
        curArea = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        //update the attraction menu
        changAttr(Area: curArea)
        //update attraction info and image
        curAttr = attrac_menu.titleForSegment(at: 0)!
        cur_info.text = curArea + ": " + curAttr
        //Change image
        changImg(Area: curAttr)
       
        
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
            cur_img.image = UIImage(named: "keen")
        case "Arboretum":
            cur_img.image = UIImage(named: "arb")
        case "Panda":
            cur_img.image = UIImage(named: "panda")
        case "Pedestrian Street":
            cur_img.image = UIImage(named: "ped")
        default:
            return
        }
    }
    
    //Function to change the attraction mention to the attractions for the current area
    func changAttr(Area area: String){
        attrac_menu.removeAllSegments()
        var chosen = ["tmp"]
        switch area {
        case "Lexington":
            chosen = lAttr
        case "Chengdu":
            chosen = cheAttr
        case "Chicago":
            chosen = chiAttr
        case "Hongkong":
            chosen = hAttr
        default:
            chosen = lAttr
        }
        
        for i in 0..<chosen.count{
            attrac_menu.insertSegment(withTitle: chosen[i], at: i, animated: true)
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

