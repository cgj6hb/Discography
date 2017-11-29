//
//  SingleAlbumViewController.swift
//  Discography
//
//  Created by Chris Jansson on 11/29/17.
//  Copyright © 2017 Chris Jansson. All rights reserved.
//

import UIKit

class SingleAlbumViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    var existingAlbum: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        yearTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        yearTextField.resignFirstResponder()
    }
    
    @IBAction func saveAlbum(_ sender: Any) {
        let name = nameTextField.text
        let year = yearTextField.text
        
        if let album = Album(name: name, year: year) {
            do {
                let managedContext = album.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true) 
            } catch {
                print("Context could not be saved")
            }
        }
    }
}

extension SingleAlbumViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
