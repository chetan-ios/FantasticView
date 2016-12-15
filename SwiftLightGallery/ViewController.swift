//
//  ViewController.swift
//  SwiftLightGallery
//
//  Created by Chetan Kumar on 13/11/16.
//  Copyright © 2016 NNNOW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let imageURLArray = ["https://cdn08.nnnow.com/web-images/large/styles/RCVOKEHIL1/1469020568797/1.jpg","https://cdn08.nnnow.com/web-images/large/styles/RCVOKEHIL1/1469020568797/1.jpg","https://cdn06.nnnow.com/web-images/large/styles/RCVOKEHIL1/1469020568798/2.jp"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showGalleryView(sender: AnyObject) {
        
                let storyboard = UIStoryboard(name: "Gallery", bundle: nil)
                if let galleryVC = storyboard.instantiateViewControllerWithIdentifier("ImageGalleryViewController") as? ImageGalleryViewController{
        
                    galleryVC.galleryDataSource = self
                    self.presentViewController(galleryVC, animated: true, completion: nil)
                    
                }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ViewController : ImageGalleryDatasource{

    func galleryCount() -> Int {
        return imageURLArray.count
    }
    
    func imageUrlForIndex(index: Int) -> NSURL {
        return NSURL(string: imageURLArray[index])!
    }
    
    

}
