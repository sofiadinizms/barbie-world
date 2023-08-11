//
//  DataController.swift
//  Barbie-world
//
//  Created by Jpsmor on 31/05/23.
//

import SwiftUI
import CoreData

class DataController : ObservableObject {
    static let shared = DataController()
    
    @AppStorage("showCongratulations") var showCongratulations: Bool = false
    
    var container = NSPersistentContainer(name: "OAsDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
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
    
    func addOA(title: String, subtitle: String, icon: String , context: NSManagedObjectContext, subOAs: [SubOAItem], ceprs : [[String]], evidences: [successParameter] ) {
        let oa = OA(context: context)
        oa.id = UUID()
        oa.title = title
        oa.icon = icon
        oa.date = Date()
        if (subOAs.count) == (subOAs.filter{$0.done}.count) {
            oa.isCompleted = true
        } else {
            oa.isCompleted = false
        }
        oa.completedNumber = Int16(subOAs.filter{$0.done}.count)
        
        for subOA in subOAs {
            DataController.shared.addSubOA(oa: oa, name: subOA.descript, isCompleted: subOA.done, context: context)
        }
        
        for cepr in ceprs[0] {
            DataController.shared.addCEPR(oa: oa, name: cepr, category: "Conteúdos", context: context)
        }
        
        for cepr in ceprs[1] {
            DataController.shared.addCEPR(oa: oa, name: cepr, category: "Experiências", context: context)
        }
        
        for cepr in ceprs[2] {
            DataController.shared.addCEPR(oa: oa, name: cepr, category: "Pessoas", context: context)
        }
        
        for cepr in ceprs[3] {
            DataController.shared.addCEPR(oa: oa, name: cepr, category: "Redes", context: context)
        }
        
        for evidence in evidences {
            DataController.shared.addEvidence(oa: oa, name: evidence.name, context: context)
        }
        
        save(context: context)
        
        print(ceprs[0])
        print(ceprs[1])
        print(ceprs[2])
        print(ceprs[3])
    
    }
    
    func editOA(oa: OA, title: String, subtitle: String, icon: String , context: NSManagedObjectContext, subOAs: [SubOAItem], ceprs : [[String]] , evidences: [successParameter]) {
        oa.title = title
        oa.subtitle = subtitle
        oa.icon = icon
        if let suboaitems = oa.subOAs?.allObjects as? [SubOA] {
            for subOA in suboaitems {
                context.delete(subOA)
            }
        }
        if let cepritems = oa.ceprs?.allObjects as? [CEPR] {
            for cepr in cepritems {
                context.delete(cepr)
            }
        }
        if let evidenceitems = oa.evidencies?.allObjects as? [Evidence] {
            for evidence in evidenceitems {
                context.delete(evidence)
            }
        }
        if (subOAs.count) == (subOAs.filter{$0.done}.count) {
            if oa.isCompleted == false {
                oa.isCompleted = true
                showCongratulations = true
            } else {
                oa.isCompleted = true
            }
        } else {
            oa.isCompleted = false
        }
        oa.completedNumber = Int16(subOAs.filter{$0.done}.count)
        
        for subOA in subOAs {
            addSubOA(oa: oa, name: subOA.descript, isCompleted: subOA.done, context: context)
        }
        
//        for view in ceprs {
//            let category = view.card
//            
//            for cepr in view.textFields {
//                addCEPR(oa: oa, name: cepr, category: category, context: context)
//            }
//        }
        
        for evidence in evidences {
            addEvidence(oa: oa, name: evidence.name, context: context)
        }
        
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
    }
    
    func editSubOA(subOA: SubOA, name: String, isCompleted: Bool, context: NSManagedObjectContext) {
        subOA.name = name
        subOA.isCompleted = isCompleted
    }
    
    func deleteSubOA(subOA: SubOA, context: NSManagedObjectContext) {
        context.delete(subOA)
    }
    
    //MARK: - Adicionar, editar e remover CEP+R
    
    func addCEPR(oa: OA, name: String, category: String, context: NSManagedObjectContext) {
        let cepr = CEPR(context: context)
        cepr.mainOA = oa
        cepr.id = UUID()
        cepr.name = name
        cepr.category = category
        cepr.date = Date()
    }
    
    func editCEPR(cepr: CEPR, name: String, context: NSManagedObjectContext) {
        cepr.name = name
    }
    
    
    func deleteCEPR(cepr: CEPR, context: NSManagedObjectContext) {
        context.delete(cepr)
    }
    
    //MARK: - Adicionar, editar e remover indicador de sucesso
    
    func addEvidence(oa: OA, name: String, context: NSManagedObjectContext) {
        let evidence = Evidence(context: context)
        evidence.id = UUID()
        evidence.name = name
        evidence.date = Date()
        evidence.mainOA = oa
    }
    
    func editEvidence(evidence: Evidence, name: String, context: NSManagedObjectContext) {
        evidence.name = name
    }
    
    
    func deleteEvidence(evidence: Evidence, context: NSManagedObjectContext) {
        context.delete(evidence)
    }
    
}
