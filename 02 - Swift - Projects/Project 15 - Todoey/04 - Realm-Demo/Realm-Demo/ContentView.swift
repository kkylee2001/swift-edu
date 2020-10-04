//
//  ContentView.swift
//  Realm-Demo
//
//  Created by Kyle L. on 10/3/20.
//

import SwiftUI
import RealmSwift

//MARK: - UI Elements
struct ContentView: View{
    @State var addNew = false
    @ObservedObject var crud = CRUD()
    @State var items: Results<ToDo>?
    @State var realm = try! Realm()
    var body: some View{
        
        
        NavigationView {
            VStack{
                if self.crud.items != nil {
                    List
                    {
                        ForEach(items!, id: \.self){item in
                            HStack {
                                Text(item.title).font(.title2).fontWeight(.light)
                                Spacer()
                                Image(systemName: item.completed ? "checkmark.circle" : "circle").padding().font(.title2)
                            }.cornerRadius(30).onTapGesture(perform: {
                                let i = items?.index(of: item)
                                self.crud.updateCell(index: i!)
                                self.items = self.crud.items
                            }
                            )
                        }.onDelete(perform: { indexSet in
                            self.crud.delete(indexPath: indexSet)
                            self.items = self.crud.items
                        })
                        
                    }
                } else {
                    Text("You Need to add new Items!")
                }
            }.navigationBarTitle(Text("Todoey")).navigationBarItems(trailing: Text("Add New").onTapGesture(count: 1, perform: {
                self.addNew.toggle()
            })).onAppear(perform: {
                print("Printing items")
                print(items!)
                })
        }.sheet(isPresented: $addNew, content: {
            NewItemSheet(itemList: self.$items, showSheet: $addNew)
        }).onAppear(perform: {
            self.crud.getItems()
            self.items = self.crud.items
        })
    }
    
}



struct NewItemSheet: View{
    @Binding var itemList: Results<ToDo>?
    @Binding var showSheet: Bool
    @ObservedObject var crud = CRUD()
    @State var newTitle = ""
    let realm = try! Realm()
    var body: some View{
        NavigationView {
            VStack {
                LazyHStack {
                    Text("New Item Name: ")
                    TextField("Item Title", text: $newTitle)
                }.navigationBarTitle(Text("Add New Item")).navigationBarItems(trailing: Text("Finish").onTapGesture(count: 1, perform: {
                    self.crud.makeNewItem(title: newTitle)
                    self.crud.getItems()
                    self.itemList = self.crud.items
                    self.showSheet.toggle()
                }))
                Spacer()
            }
        }
    }
}


//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}


//MARK: - Persistence Functions




class ToDo: Object{
    @objc dynamic var title = ""
    @objc dynamic var completed = false
}

class CRUD: ObservableObject{
    @Published var items: Results<ToDo>?
    let realm = try! Realm()
    
    
    func makeNewItem(title: String){
        let newItemToAdd = ToDo()
        newItemToAdd.title = title
        newItemToAdd.completed = false
        do{
            
            try self.realm.write{
                self.realm.add(newItemToAdd)
            }
            
        }
        catch{
            fatalError("Cannot commit")
            
        }
        
    }
    
    func updateCell(index: Int){
        do {
            try self.realm.write{
                items![index].completed.toggle()
                print(items![index].completed)
            }
        } catch  {
            fatalError("Cannot do this rn")
        }
        getItems()
    }
    
    
    func getItems(){
        self.items = realm.objects(ToDo.self)
    }
    
    func delete(indexPath: IndexSet){
        indexPath.forEach { (int) in
            do {
                try realm.write{
                    realm.delete(self.items![int])
                }
            } catch  {
                print("Invalid")
            }
        }
        getItems()
    }
    
}
