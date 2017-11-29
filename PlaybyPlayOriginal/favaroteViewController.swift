//
//  favaroteViewController.swift
//  PlaybyPlayOriginal
//
//  Created by Varun M S on 28/10/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import UIKit

class favaroteViewController: UIViewController {
    var favarotearray:[MovieModel] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! searchViewController
        controller.delegate = self
    }
    
    
    
    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "maintosearch", sender: nil)
        
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
        super .viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension favaroteViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favarotearray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favarotecellid", for: indexPath) as! TableViewCell
        cell.namelabel.text = favarotearray[indexPath.row].name
        cell.yearlabel.text = favarotearray[indexPath.row].year
        desplaymovieimage(row: indexPath.row, cell: cell)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.4
    }
    
    func desplaymovieimage(row:Int,cell:TableViewCell)
    {
        let url:String = (URL(string:favarotearray[row].imageurl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string:url)!) { (data, responce, error) in
            if error != nil
            {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: {
                let image = UIImage(data:data!)
                cell.imageview?.image = image
            })
            }.resume()
        
    
    
}
}
