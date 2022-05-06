//
//  Goal+CoreDataProperties.swift
//  goalApp
//
//  Created by Danylo Kushlianskyi on 04.05.2022.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var goalCompletionValue: Int32
    @NSManaged public var goalDescription: String?
    @NSManaged public var goalProgress: Int32
    @NSManaged public var goalType: String?

}

extension Goal : Identifiable {

}
