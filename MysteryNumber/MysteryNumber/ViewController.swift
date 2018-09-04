//
//  ViewController.swift
//  MysteryNumber
//
//  Created by Marc Schneider on 04/09/2018.
//  Copyright © 2018 Hippo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _gameRangeToScreenRatio: CGFloat = 1
    let _gameController = GameController()
    
    @IBOutlet weak var ui_guessedValueField: UITextField!
    @IBOutlet weak var ui_gameStatusLabel: UILabel!
    @IBOutlet weak var ui_lowBoundaryLabel: UILabel!
    @IBOutlet weak var ui_highBoundaryLabel: UILabel!
    @IBOutlet weak var cs_boundaryZoneTrailing: NSLayoutConstraint!
    @IBOutlet weak var cs_boundaryZoneLeading: NSLayoutConstraint!
    @IBOutlet weak var ui_checkValueButton: UIButton!
    @IBOutlet weak var ui_boundaryZone: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkValueButtonTouched() {
        if let guessText = ui_guessedValueField.text,
            let guessInt = Int(guessText) {
            _gameController.checkGuessedValue(guessInt)
            ui_guessedValueField.text = nil
            updateDisplay()
        }
    }
    
    @IBAction func newGameButtonTouched() {
        _gameController.startNewGame()
        updateDisplay()
    }
    
    override func viewDidLayoutSubviews() {
        let barWidth: CGFloat = self.ui_boundaryZone.bounds.width
        _gameRangeToScreenRatio = barWidth / CGFloat(GameController.MAX_VALUE - GameController.MIN_VALUE)
        updateDisplay()
        super.viewWillLayoutSubviews()
    }
    
    func updateDisplay() {
        if _gameController.isGameInProgress {
            if ui_boundaryZone.isHidden != false {
                UIView.transition(with: ui_boundaryZone, duration: 0.5, options: [.transitionCurlDown], animations: {
                    self.ui_boundaryZone.isHidden = false
                }, completion: nil)
                
                ui_gameStatusLabel.text = "Essayez de trouver le nombre mystère"
                ui_guessedValueField.isHidden = false
                ui_checkValueButton.isHidden = false
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
            }
            
            ui_lowBoundaryLabel.text = String(_gameController.lowBoundary)
            ui_highBoundaryLabel.text = String(_gameController.highBoundary)
            
            cs_boundaryZoneLeading.constant = CGFloat(_gameController.lowBoundary) * _gameRangeToScreenRatio
            cs_boundaryZoneTrailing.constant = CGFloat(GameController.MAX_VALUE - _gameController.highBoundary) * _gameRangeToScreenRatio
            
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        } else {
            ui_gameStatusLabel.text = nil
            ui_guessedValueField.isHidden = true
            ui_checkValueButton.isHidden = true
            if ui_boundaryZone.isHidden != true {
                UIView.transition(with: ui_boundaryZone, duration: 0.5, options: [.transitionCurlUp], animations: {
                    self.ui_boundaryZone.isHidden = true
                }, completion: nil)
            }
        }
    }
}

