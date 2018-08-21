//
//  ViewController.swift
//  ShareMe
//
//  Created by Marc Schneider on 09/08/2018.
//  Copyright © 2018 Hippo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ui_shareTextView: UITextView!
    @IBOutlet weak var ui_errorLabel: UILabel!
    
    @IBAction func shareTypedText() {
        let typedText: String = ui_shareTextView.text
        if typedText.count > 0 {
            let shareViewController = UIActivityViewController(activityItems: [typedText], applicationActivities: nil)
            present(shareViewController, animated: true, completion: nil)
            ui_errorLabel.text = ""
        } else {
            ui_errorLabel.text = "Aucun message n'a été entré..."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui_shareTextView.layer.borderWidth = 1
        ui_shareTextView.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

