//
//  CategoryEventsListViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 16/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class CategoryEventsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headingLbl: UILabel!
    
    var category : Categories!
    var events : [Events] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if category == nil {
            headingLbl.text = "Today"
            events = DataAccessor.shared.fetchAllEvents()
        } else {
            headingLbl.text = category.name!
            events = DataAccessor.shared.fetchEventsForCategory(category.identifier)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension CategoryEventsListViewController: UITableViewDataSource, UITableViewDelegate {
    
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
