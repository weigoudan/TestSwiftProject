//
//  RegisterVC.swift
//  WYCloudReadingApp
//
//  Created by  iOS-韦云枭 on 2018/11/8.
//  Copyright © 2018年  iOS-韦云枭. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func backBtnClickFunc(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegisterVC {
    
    
    
}

