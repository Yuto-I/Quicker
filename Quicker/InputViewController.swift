//
//  ViewController.swift
//  Quicker
//
//  Created by 飯田悠斗 on 16/12/2017.
//  Copyright © 2017 Meeeesi. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var contentView: UITextView!
    @IBOutlet weak var keyboardMediaList: UINavigationBar!
    
    let screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NotificationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
        contentView.becomeFirstResponder()
        contentView.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Segue Actions

    
    
    //MARK: Actions
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        contentView.text = ""
    }
    
    @IBAction func toStackPage(_ sender: UIBarButtonItem) {
        contentView.resignFirstResponder()
    }
    
    
    
    // Add photos as image memories.
    @IBAction func openPhoto(_ sender: UIBarButtonItem) {
        contentView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func openLibrary(_ sender: UIBarButtonItem) {
        contentView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        contentView.becomeFirstResponder()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // This is for picking photos.
        dismiss(animated: true, completion: nil)
        contentView.becomeFirstResponder()
    }
    

    // Notification Actions
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let keyboardHeight = ((notification.userInfo![UIKeyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
        keyboardMediaList.frame.origin.y = screenSize.height - keyboardHeight - keyboardMediaList.frame.height
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        keyboardMediaList.frame.origin.y = screenSize.height - keyboardMediaList.frame.height
    }
}


