//
//  SecondVCViewController.swift
//  BC
//
//  Created by Abdulaziz Alhomaidhi on 3/26/18.
//  Copyright © 2018 Abdulaziz Alhomaidhi. All rights reserved.
//

import UIKit

final class MasterViewController: UIViewController {
    
    @IBOutlet weak var modeSwitcher: UISegmentedControl!
    
    private func setupView(){
        setupSegmentedControl()
        
        updateView()
    }
    
    private func setupSegmentedControl() {
        modeSwitcher.removeAllSegments()
        modeSwitcher.insertSegment(withTitle: "Home Base Mode", at: 0, animated: false)
        modeSwitcher.insertSegment(withTitle: "Contact Sharing Mode", at: 1, animated: false)
        modeSwitcher.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        modeSwitcher.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private lazy var HBMViewController: HBMViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "HBMViewController")
        self.add(asChildViewController: viewController)
        
        return viewController as! HBMViewController
    }()
    
    private lazy var CSMViewController: CSMViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "CSMViewController")
        
        self.add(asChildViewController: viewController)
        
        return viewController as! CSMViewController
    }()

    private func add(asChildViewController viewController: UIViewController){
        addChildViewController(viewController)
        
        view.addSubview(viewController.view)
        
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        
        viewController.view.removeFromSuperview()

        viewController.removeFromParentViewController()
    }
    
    private func updateView() {
        if modeSwitcher.selectedSegmentIndex == 0{
            remove(asChildViewController: CSMViewController)
            add(asChildViewController: HBMViewController)
        }else{
            remove(asChildViewController: HBMViewController)
            add(asChildViewController: CSMViewController)
        }
    }
    
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

}
