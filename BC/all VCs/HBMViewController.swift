//
//  HBMViewController.swift
//  BC
//
//  Created by user134380 on 4/3/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HBMViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref: DatabaseReference!
    var entries = [String]()
   
    
    @IBOutlet weak var myTableView: UITableView!
//        {
//        didSet{
//            myTableView.dataSource = (self as! UITableViewDataSource)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        self.myTableView.addSubview(self.refreshControl)
        self.hideKeyboardWhenTappedAround()
         ref = Database.database().reference()
        let uid = UserDefaults.standard.object(forKey: "uid")
        
        // load entries from firebase into table view
        ref.child((uid as! String?)!).observe(.value, with: { (snapshot) in
            let result = snapshot.value as! [String:AnyObject]?
            self.entries = Array(result!.values) as! [String]
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HBMViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        self.myTableView.reloadData()
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.myTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if entries.count == 0 {
            return 0
        }
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        let contact = entries[indexPath.row]
        cell.configureProductCell(contact: contact)
        
        
        return cell
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func add_Action(_ sender: UIBarButtonItem) {
          self.performSegue(withIdentifier: "goToScanningView", sender: self)
//        self.dismiss(animated: true, completion: nil)
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
