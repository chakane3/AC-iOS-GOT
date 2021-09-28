//
//  ViewController.swift
//  GOT-StudentVersion
//
//  Created by C4Q  on 11/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class episodesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var episodes = [GOTEpisode](){
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        loadData()
    }
    
    func loadData(){
        episodes = GOTEpisode.allEpisodes
    }
    
    func filterEpisodes(for searchText: String) {
        guard !searchText.isEmpty else {return}
        episodes = GOTEpisode.allEpisodes.filter {$0.name.lowercased().contains(searchText.lowercased())}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeDC = segue.destination as? episodesDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("check identity inspector")
        }
        let episode = episodes[indexPath.row]
        episodeDC.episode = episode
    }
}

extension episodesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    
    // load up our cell variable with out custom cell class to configure the UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as?
                customCellVC else {
                    fatalError("mj")
                }
        
        let episode = episodes[indexPath.row]
        cell.configureCell(for: episode)
        return cell
    }
}

extension episodesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension episodesVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // if our search bar is empty reload our data
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        filterEpisodes(for: searchText)
        
    }
}

