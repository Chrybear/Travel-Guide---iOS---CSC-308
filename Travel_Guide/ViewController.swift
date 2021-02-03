//
//  ViewController.swift
//  Travel_Guide
//
//  Author: Charles Ryan Barrett
//  Date: 2/3/2021
//  Description: A simple iOS app to test out basics such as segments, images, etc.
//  Made for homework 2 in CSC 308 at EKU

import UIKit

class ViewController: UIViewController {
    //Variable to track the current area. Default is Lexington
    var curArea = "Lexington"
    //Variable to track the current attraction of an area. Default is Keeneland
    var curAttr = "Keeneland"
    
    let areas = ["Lexington", "Chengdu", "Chicago", "Hongkong"]
    
    //Attraction arrays (May be a good idea to change to dictionaries, but since small size, arrays should be fine)
    let lAttr = ["Keeneland", "Arboretum"]
    let cheAttr = ["Panda Sanctuary", "Pedestrian Street"]
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
        
        //Make the first item selected. This is just for aesthetics
        attrac_menu.selectedSegmentIndex = 0
       
        
    }
    
    //Attraction menu changed
    @IBAction func atrac_changed(_ sender: UISegmentedControl) {
        //Attraction menu was changed, update the new attraction name, submenu, etc
        curAttr = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        //update the info label
        cur_info.text = curArea + ": " + curAttr
        //Change image
        changImg(Area: curAttr)
        
    }
    
    //This function is changes the image when a new attraction is selected
    func changImg(Area area: String) {
        switch area {
        case "Keeneland":
            cur_img.image = UIImage(named: "keen")
        case "Arboretum":
            cur_img.image = UIImage(named: "arb")
        case "Panda Sanctuary":
            cur_img.image = UIImage(named: "panda")
        case "Pedestrian Street":
            cur_img.image = UIImage(named: "ped")
        case "Millenium Park":
            cur_img.image = UIImage(named:"mil")
        case "Skydeck":
            cur_img.image = UIImage(named:"sky")
        case "Cruise":
            cur_img.image = UIImage(named:"cruise")
        case "Planetarium":
            cur_img.image = UIImage(named:"planet")
        case "Disneyland":
            cur_img.image = UIImage(named:"disney")
        case "Ocean Park":
            cur_img.image = UIImage(named:"oceanp")
        case "The Peak":
            cur_img.image = UIImage(named:"peak")
        default:
            return
        }
    }
    
    //Function to change the attraction menu to the attractions for the current area
    func changAttr(Area area: String){
        //Probably a simpler way to do this, but this is the best I came up with
        
        //Remove all items from the current menu
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
            chosen = lAttr //Default area is Lexington
        }
        //After area is chosen, go through each item in that area's attractions array and add it into the attractions menu
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

