//
//  ViewController.swift
//  EmptyStateDemo
//
//  Created by Dhiraj Das on 5/20/17.
//  Copyright © 2017 Dhiraj Das. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ViewController: UIViewController {

    @IBOutlet weak var noInternetImageView: UIImageView!
    
    let rechability = Reachability()
    var isRechable: Bool {
        if let _rechability = rechability {
            return _rechability.isReachable
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try? rechability?.startNotifier()
        NotificationCenter.default.addObserver(self, selector: #selector(networkChanged), name: ReachabilityChangedNotification, object: nil)
    }

    func networkChanged() {
        noInternetImageView.isHidden = isRechable
    }
}

