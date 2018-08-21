//
//  CredentialViewController.swift
//  Safety First
//
//  Created by Marc Schneider on 20/08/2018.
//  Copyright © 2018 Hippo. All rights reserved.
//

import UIKit
import RealmSwift

class CredentialViewController: UIViewController {
    private var _credentials: Credentials?
    
    @IBOutlet weak var ui_loginLabel: UILabel!
    @IBOutlet weak var ui_passwordLabel: UILabel!
    @IBOutlet weak var ui_urlLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        displayBasicData()
    }
    
    func setCredentials(_ credentials: Credentials) {
        _credentials = credentials
    }
    
    private func displayBasicData() {
        if let cred = _credentials {
            self.title = cred.title
            ui_loginLabel.text = "Identifiant : \(cred.login)"
            ui_urlLabel.text = "Site Web : \(cred.url)"
        }
    }
    
    @IBAction func displayPassword(_ sender: Any) {
        if let cred = _credentials {
            ui_passwordLabel.text = "Mot de passe : \(cred.password)"
        }
    }
    
    @IBAction func copyPasswordToClipboard(_ sender: Any) {
        if let cred = _credentials {
            UIPasteboard.general.string = cred.password
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
