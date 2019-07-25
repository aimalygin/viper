//
//  CoreDataManager.swift
//  Viper
//
//  Created by Антон Малыгин on 25/07/2019.
//  Copyright © 2019 Allorn. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    
    let entityName = String(describing: StorageItem.self)
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func add(translation: TranslationItem) {
        let context = persistentContainer.viewContext
        if let item = NSEntityDescription.insertNewObject(forEntityName: entityName,
                                                              into: context) as? StorageItem
        {
            item.word = translation.word
            item.fromLanguage = translation.fromLanguage.toCode()
            item.toLanguage = translation.toLanguage.toCode()
            item.translation = translation.translationValue
        }
        saveContext()
    }
    
    func clear() {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try context.execute(deleteRequest)
        }
        catch {
            print(error)
        }
        saveContext()
    }
    
    func fetch() -> [StorageItem] {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            if let result = try context.fetch(request) as? [StorageItem] {
                return result
            }
        } catch {
            print(error)
        }
        return [StorageItem]()
    }
}
