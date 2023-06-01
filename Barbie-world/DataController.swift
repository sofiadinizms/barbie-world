//
//  DataController.swift
//  Barbie-world
//
//  Created by Jpsmor on 31/05/23.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    
    let container = NSPersistentContainer(name: "OADataModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Failed to save the data")
        }
    }
    
    //MARK: - Adicionar, editar e remover OAs
    
    func addOA(title: String, subtitle: String, icon: String , context: NSManagedObjectContext) {
        let oa = OA(context: context)
        oa.id = UUID()
        oa.title = title
        oa.icon = icon
        oa.date = Date()
        
        save(context: context)
    }
    
    func editOA(oa: OA, title: String, subtitle: String, icon: String, context: NSManagedObjectContext) {
        oa.title = title
        oa.subtitle = subtitle
        oa.icon = icon
        
        save(context: context)
    }
    
    func deleteOA(oa: OA, context: NSManagedObjectContext) {
        context.delete(oa)
        
        save(context: context)
    }
    
    //MARK: - Adicionar, editar e remover subOAs
    
    func addSubOA(oa: OA, name: String, isCompleted: Bool, context: NSManagedObjectContext) {
        let subOA = SubOA(context: context)
        subOA.mainOA = oa
        subOA.id = UUID()
        subOA.name = name
        subOA.isCompleted = isCompleted
        subOA.date = Date()
        
        save(context: context)
    }
    
    func editSubOA(subOA: SubOA, name: String, isCompleted: Bool, context: NSManagedObjectContext) {
        subOA.name = name
        subOA.isCompleted = isCompleted
        
        save(context: context)
    }
    
    func deleteSubOA(subOA: SubOA, context: NSManagedObjectContext) {
        context.delete(subOA)
        
        save(context: context)
    }
    
    //MARK: - Adicionar, editar e remover CEP+R
    
    func addCEPR(oa: OA, name: String, category: String, context: NSManagedObjectContext) {
        let cepr = CEPR(context: context)
        cepr.mainOA = oa
        cepr.id = UUID()
        cepr.name = name
        cepr.category = category
        cepr.date = Date()
        
        save(context: context)
    }
    
    func editCEPR(cepr: CEPR, name: String, context: NSManagedObjectContext) {
        cepr.name = name
        
        save(context: context)
    }
    
    
    func deleteCEPR(cepr: CEPR, context: NSManagedObjectContext) {
        context.delete(cepr)
        
        save(context: context)
    }
    
    //MARK: - Adicionar, editar e remover indicador de sucesso
    
    func addEvidence(name: String, context: NSManagedObjectContext) {
        let evidence = Evidence(context: context)
        evidence.id = UUID()
        evidence.name = name
        evidence.date = Date()
        
        save(context: context)
    }
    
    func editEvidence(evidence: Evidence, name: String, context: NSManagedObjectContext) {
        evidence.name = name
        
        save(context: context)
    }
    
    
    func deleteEvidence(evidence: Evidence, context: NSManagedObjectContext) {
        context.delete(evidence)
        
        save(context: context)
    }
    
}
