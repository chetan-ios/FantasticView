//
//  LightImageViewController.swift
//  SwiftLightGallery
//
//  Created by Chetan Kumar on 13/11/16.
//  Copyright © 2016 NNNOW. All rights reserved.
//

import UIKit

class LightImageViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
    var pageIndex : Int? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.imageView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

