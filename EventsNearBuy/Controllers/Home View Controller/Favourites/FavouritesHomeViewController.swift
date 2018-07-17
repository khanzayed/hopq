//
//  FavouritesHomeViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class FavouritesHomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var noFavView: UIView!
    
    var events : [Events] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.isHidden = false
        
        events = DataAccessor.shared.fetchFavouriteEvents()
        
        if events.count > 0 {
            noFavView.isHidden = true
            
            tableView.dataSource = self
            tableView.delegate = self
        } else {
            noFavView.isHidden = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FavouritesHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell") as! EventListTableViewCell
        cell.event = events[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listVC = storyBoard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        listVC.event = events[indexPath.row]
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(listVC, animated: true)
        }
    }
    
}
