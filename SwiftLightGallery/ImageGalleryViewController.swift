//
//  ImageGalleryViewController.swift
//  SwiftLightGallery
//
//  Created by Chetan Kumar on 13/11/16.
//  Copyright © 2016 NNNOW. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController {

    weak var galleryDataSource : ImageGalleryDatasource? = nil
    
    var currentIndex = 0
    var imagesCount:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDataSource()



        // Do any additional setup after loading the view.
    }
    func checkDataSource() {
        
        if let count = galleryDataSource?.galleryCount(){
            
            if  count > 0 {
            
                self.imagesCount = count
                

                for vc in self.childViewControllers{
                
                    if let pageVC = vc as? UIPageViewController{
                    
                        pageVC.dataSource = self
                        pageVC.delegate = self
                        pageVC.setViewControllers([getViewControllerForIndex(currentIndex)!], direction: .Forward, animated: false, completion: nil)

                    }
                }
                


            }else{
                
                NSException(name: NSExceptionName( string: "Gallery Error") as String, reason: "Gallery DataSource Zero Count", userInfo: nil).raise()

            }
        }else{
            
            NSException(name: NSExceptionName( string: "Gallery Error") as String, reason: "Gallery DataSource Not Set", userInfo: nil).raise()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func isValidIndex(index:Int) -> Bool{
    
        if index < 0 || index >= imagesCount!{
        
            return false
        }else{
        return true
        }
    }
    
    func getViewControllerForIndex(index : Int) -> UIViewController?{
    
        
        let storyboard = UIStoryboard(name: "Gallery", bundle: nil)
        if let lightImageViewController = storyboard.instantiateViewControllerWithIdentifier( "LightImageViewController") as? LightImageViewController{
            lightImageViewController.pageIndex = index
            return lightImageViewController
        }
        else{
        
            return nil
        }

    }

    @IBAction func dismissVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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


extension ImageGalleryViewController : UIPageViewControllerDataSource,UIPageViewControllerDelegate{

    
func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let currentVC =   viewController as? LightImageViewController{
            
            if let currentIndex = currentVC.pageIndex{
                let returnIndex = currentIndex + 1
                if isValidIndex(returnIndex){
                      return getViewControllerForIndex(returnIndex)
                }
            }
        
        }
        
        return nil
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        if let currentVC =   viewController as? LightImageViewController{
            
            if let currentIndex = currentVC.pageIndex{
                let returnIndex = currentIndex - 1
                if isValidIndex( returnIndex){
                    return getViewControllerForIndex( returnIndex)
                }
            }
            
        }
        

        return nil
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.imagesCount ?? 0
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


}

public protocol ImageGalleryDatasource: class {
    
    func galleryCount() -> Int
    func imageUrlForIndex(index:Int) -> NSURL
}

