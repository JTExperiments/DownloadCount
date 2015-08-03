//
//  AddViewController.swift
//  DownloadCount
//
//  Created by James Tang on 3/8/15.
//  Copyright © 2015 James Tang. All rights reserved.
//

import UIKit
import DownloadCountShared

class AddViewController: UIViewController, AddViewInterface {
	// MARK: - Property

    var presenter: AddPresenter? = nil
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var repositoryNameTextField: UITextField!

	// MARK: - Life cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonDidPress(sender: AnyObject) {
        self.presenter?.cancelAddSource()
    }

    @IBAction func doneButtonDidPress(sender: AnyObject) {
        let owner = self.ownerTextField.text ?? ""
        let name = self.repositoryNameTextField.text ?? ""
        self.presenter?.add(owner, repository: name)
    }
}
