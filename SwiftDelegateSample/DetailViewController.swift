//
//  DetailViewController.swift
//  SwiftDelegateSample
//
//  Created by 川村真史 on 2014/11/17.
//  Copyright (c) 2014年 Masafumi Kawamura. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func changeText(text: String)
}

class DetailViewController: UIViewController, DetailViewControllerDelegate {

    // MARK: - Properties
    
    var label = UILabel(frame: CGRectMake(10, 80, 300, 20))
    
    // MARK: - Init
    
    override convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "openModalView")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    // with argument
    convenience init(title: String?) {
        self.init()
        
        if (title != "") {
            self.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        label.text = "This is Normal text."
        
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Event Method
    
    func openModalView() {
        var rootViewController = ModalViewController()
        rootViewController.delegate = self
        var controller = UINavigationController(rootViewController: rootViewController)
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    // MARK: - DetailViewControllerDelegate
    
    func changeText(text: String) {
        label.text = text
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
