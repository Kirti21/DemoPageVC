//
//  PageContentViewController.swift
//  DemoPageVC
//
//  Created by Apple on 30/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var pageIndex: Int = 0
    var strTitle: String!
    var strPhotoName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = UIImage(named:  strPhotoName)
        myLbl.text = strTitle
    }
    
}
