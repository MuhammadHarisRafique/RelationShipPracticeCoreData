//
//  ViewController.swift
//  Market
//
//  Created by Higher Visibility on 10/05/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var id:[Int64] = [1,2,3,4]
    var productName = ["Fan","Sugar","Burger","Mobile"]
    var category = ["Electronic","Grocery","Food","Electronic"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.numberOfProduct() == 0{
            
           
            for i in 0...self.id.count - 1{
                
                self.insertintoData(id: self.id[i], name: self.productName[i], categoryName: self.category[i])
                
            }
            
            
        }else{
            
            self.getProduct()
            self.getCategory()
        }
        
    }

    func numberOfProduct() -> Int {
        
        
        var count = 0
       let databaseConnection = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
       let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
    
        do{
            let records = try databaseConnection?.count(for: fetchRequest)
            count = records!
            
            
        }catch let error{
            
            print(error.localizedDescription)
        }
        
        
        return count
    }
    
    
    func getProduct(){
        

        let databaseConnection = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
        
        do{
            let records = try databaseConnection?.fetch(fetchRequest)
            
            for item in records!{
                
//                print(item.product_id)
//                print(item.product_name!)
//                print(item.product_category!.category_id)
//                print(item.product_category!.category_name!)
                
                
            }
            
            
        }catch let error{
            
            print(error.localizedDescription)
        }
        
        
        
    }
    func getCategory(){
        
        
        let databaseConnection = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        
        let pridicate = NSPredicate(format: "category_name == %@", "Electronic")
        fetchRequest.predicate = pridicate
        
        do{
            let records = try databaseConnection?.fetch(fetchRequest)
            
            for item in records!{
                
                print(item.product!.count)
                print(item.category_id)
                print(item.category_name!)
                
                
            }
            
            
        }catch let error{
            
            print(error.localizedDescription)
        }
        
        
    }
    
    func insertintoData(id:Int64,name:String,categoryName:String){
        
       let databaseConnection = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
       let entity =  NSEntityDescription.entity(forEntityName: "Product", in: databaseConnection!)
       let product = Product(entity: entity!, insertInto: databaseConnection)
        
        product.product_id = id
        product.product_name = name
        
        
        let cat_entity =  NSEntityDescription.entity(forEntityName: "Category", in: databaseConnection!)
        let category = Category(entity: cat_entity!, insertInto: databaseConnection)
        category.category_name = categoryName
        category.category_id = 1
        product.product_category = category
        
        category.product = NSSet(object: product)
    
        do{
            
            try databaseConnection?.save()
            
        }catch let error
        
        
        {
            print(error.localizedDescription)
            
            
        }
        
    }

}

