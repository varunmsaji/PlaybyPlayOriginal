//
//  searchViewController.swift
//  PlaybyPlayOriginal
//
//  Created by Varun M S on 29/10/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import UIKit

class searchViewController: UIViewController,UISearchBarDelegate {
    var searcharray:[MovieModel] = []
    var delegate:favaroteViewController!
    var myindex:Int?
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func favbuttonclicked(_ sender: UIButton) {
        self.delegate.favarotearray.append(searcharray[sender.tag])
        alert(title: "favadded", message: "favadded")
    }
    
    
    
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searcharray.count != 0
        {
            searcharray.removeAll()
        }
        tableview.reloadData()
        activityindicator.startAnimating()
        
        activityindicator.isHidden = false
        
        let searchterm = searchbar.text
        
        getdatabyurl(term: searchterm!)
    }
    
    
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
//        activityindicator.startAnimating()
        activityindicator.isHidden = true

        // Do any additional setup after loading the view.
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
extension searchViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searcharray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcellid", for: indexPath) as! searchTableViewCell
        cell.favbutton.tag = indexPath.row
        cell.namelabel.text = searcharray[indexPath.row].name
        cell.yearlabel.text = searcharray[indexPath.row].year
        desplaymovieimage(row: indexPath.row, cell: cell)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.5
    }
    
 
    func desplaymovieimage(row:Int,cell:searchTableViewCell)
    {
        let url:String = (URL(string:searcharray[row].imageurl)?.absoluteString)!
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





extension searchViewController
{
    func getdatabyurl(term:String)
    {
        let url = "https://itunes.apple.com/search?term=\(term)&entity=movie"
        HttpHandler.getdatafromurl(url: url) { (data) -> (Void) in
            
          let jdata = JsonParser.getjson(data: data)
            print(jdata)
        
            let result = jdata!["results"] as! [[String:Any]]
            for res in result
            {
                let nametosave = res["artistName"] as! String
                let yeartosave = res["country"]as! String
                let imageurltosave = res["artworkUrl60"] as! String
               
                self.searcharray.append(MovieModel(name: nametosave, year: yeartosave, imagurl: imageurltosave))
            }
            DispatchQueue.main.async {
                self.activityindicator.stopAnimating()
                self.activityindicator.isHidden = true
                self.tableview.reloadData()
            }
          
        }
        
    }
}




extension searchViewController
{
    func alert(title:String,message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertaction = UIAlertAction(title:"ok", style: .default, handler: nil)
        alert.addAction(alertaction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
}
