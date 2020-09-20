

import UIKit

class ToDoListViewController: UITableViewController {
    var itemArray = [Item]()
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        
    }
    
    
}


//MARK: - Datasource Methods
extension ToDoListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.completed ? .checkmark: .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].completed.toggle()
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - Add New Items
extension ToDoListViewController{
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.saveItems()
        }
        alert.addTextField { (altTextField) in
            altTextField.placeholder = "Create a New Item"
            textField = altTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
//MARK: - Saving and Loading Items
extension ToDoListViewController{
    func saveItems(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to: filePath!)
            tableView.reloadData()
        }catch{
            print("Error \(error.localizedDescription)")
        }
    }
    
    func loadItems(){
        let decoder = PropertyListDecoder()
        do{
            let recoveredData = try Data(contentsOf: filePath!)
            itemArray = try decoder.decode([Item].self, from: recoveredData)
        }catch{
            print("Error \(error.localizedDescription)")
        }
        
    }
}
