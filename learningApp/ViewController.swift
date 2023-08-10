//
//  ViewController.swift
//  learningApp
//
//  Created by Jorge Alejndro Marcial Galvan on 28/07/23.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    @IBAction func loginButtonAction() {
        //1. Obtener o valores de los textfield.
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jorge@gmail.com" && password == "123"{
            if emailSwitch.isOn{
                //De esta manera guardamos valores con llave y valor en los UserDefaults
                storage.setValue(email, forKey: emailKey)
            }else{
                storage.removeObject(forKey: emailKey)
            }
            performSegue(withIdentifier: "home_segue", sender: nil)
        }else{
            showErrorDialog()
        }
    }
    @IBOutlet weak var emailSwitch: UISwitch!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //De esta manera buscamos un string en userDefaults y lo asignamos
        if let storedEmail = storage.string(forKey: emailKey){
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else{
            emailSwitch.isOn = false
        }
    }
    
    private func showErrorDialog(){
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales inválidas."
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }


}

