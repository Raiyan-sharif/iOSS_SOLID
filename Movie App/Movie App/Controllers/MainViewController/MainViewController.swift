//
//  MainViewController.swift
//  Movie App
//
//  Created by BJIT on 8/12/23.
//

import UIKit

class MainViewController: UIViewController {

    //IBoutlets
    @IBOutlet weak var tableView: UITableView!

    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func configView(){
        self.title = "Main View"
        setupTableView()
    }


}


