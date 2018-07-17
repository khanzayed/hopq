//
//  EventsHomeViewController.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class EventsHomeViewController: UIViewController {

    @IBOutlet weak var serachBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var categories:[Categories] = []
    fileprivate var todaysEvents:[Events] = []
    fileprivate var filteredEvents:[Events] = []
    fileprivate var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if DataAccessor.shared.checkIfDataExist() == false {
            DataAccessor.shared.saveSampleData()
        }
        
        categories = DataAccessor.shared.fetchAllCategories()
        todaysEvents = DataAccessor.shared.fetchAllEvents()
        serachBar.enablesReturnKeyAutomatically = true
        
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

}

extension EventsHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isSearching) ? filteredEvents.count : (todaysEvents.count + 2)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSearching {
            return 150
        } else {
            switch indexPath.row {
            case 0:
                return 165
            case 1:
                return 60
            default:
                return 150
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell") as! EventListTableViewCell
            cell.event = filteredEvents[indexPath.row]
            return cell
        } else {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell") as! CollectionTableViewCell
                cell.list = categories
                
                cell.pushViewControllerBlock = { [weak self] (category) in
                    guard let strongSelf = self else {
                        return
                    }
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let listVC = storyBoard.instantiateViewController(withIdentifier: "CategoryEventsListViewController") as! CategoryEventsListViewController
                    listVC.category = category
                    DispatchQueue.main.async {
                        strongSelf.navigationController?.pushViewController(listVC, animated: true)
                    }
                }
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EventHeadingTableViewCell") as! EventHeadingTableViewCell
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell") as! EventListTableViewCell
                cell.event = todaysEvents[indexPath.row - 2]
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if isSearching {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let listVC = storyBoard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
            listVC.event = filteredEvents[indexPath.row]
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(listVC, animated: true)
            }
        } else {
            if indexPath.row > 1 {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let listVC = storyBoard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
                listVC.event = todaysEvents[indexPath.row - 2]
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(listVC, animated: true)
                }
            }
        }
    }
    
}

extension EventsHomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if isSearching == true {
            isSearching = false
            tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            if isSearching == false {
                isSearching = true
            }
            let list = todaysEvents.filter{ $0.name!.lowercased().contains(searchText.lowercased()) }
            filteredEvents = Array(list)
            tableView.reloadData()
        } else {
            if isSearching == true {
                isSearching = false
                tableView.reloadData()
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            searchBar.resignFirstResponder()
            return false
        }
        return true
    }
    
}
