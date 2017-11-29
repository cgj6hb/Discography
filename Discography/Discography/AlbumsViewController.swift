//
//  AlbumsViewController.swift
//  Discography
//
//  Created by Chris Jansson on 11/29/17.
//  Copyright © 2017 Chris Jansson. All rights reserved.
//

import UIKit
import CoreData

class AlbumsViewController: UIViewController {

    @IBOutlet weak var albumsTableView: UITableView!
    
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()
        
        do {
            albums = try managedContext.fetch(fetchRequest)
            
            albumsTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }
    
    @IBAction func addNewAlbum(_ sender: Any) {
        performSegue(withIdentifier: "showAlbum", sender: self)
    }
}

extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumsTableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = album.name
        cell.detailTextLabel?.text = album.year
        
        return cell
    }
}

extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAlbum", sender: self)
    }
}
