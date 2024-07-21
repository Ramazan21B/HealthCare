//
//  TableViewController.swift
//  Books
//
//  Created by Aitzhan Ramazan on 17.07.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD
class TableViewController: UITableViewController, UISearchBarDelegate{
   
    
    var arrayBooks: [Books] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        searchBook(term: "glossary")
        //searchBook(term: "t")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayBooks.count
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BooksTableViewCell
        
        cell.setData(book: arrayBooks[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 276.0
    }
    
    func searchBook(term: String){
        //let parameters = ["term": term, "limit": 5] as [String: Any]
        
        SVProgressHUD.show()
        AF.request("https://www.healthcare.gov/api/index.json", method: .get).responseData { response in
            SVProgressHUD.dismiss()
//            if let data = response.data {
//                do {
//                    let json = try JSON(data: data)
//                    self.arrayBooks = json.arrayValue.map { Books(json: $0) }
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                } catch {
//                    print("Error parsing JSON: \(error)")
//                }
//            } else {
//                print("Error fetching data: \(response.error?.localizedDescription ?? "Unknown error")")
//            }
            var resultString = ""
            if let data = response.data{
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            if response.response?.statusCode == 200{
                let json = JSON(response.data!)
                if let array = json.array {
                    for item in array{
                        let book = Books(json: item)
                        self.arrayBooks.append(book)
                    }
                
                self.tableView.reloadData()
             }
            }
        }
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
