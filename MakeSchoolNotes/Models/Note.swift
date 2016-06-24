//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Dylan Steck on 6/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

// This is saying that the class note is an object, or that in other sense that a note is an object, so that it can have these attributes like title or content through Realm. The dynamic var is a way of setting the attributes of the object using Realm.
class Note: Object {
    //the dynamic var is the var set for Realm.
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate()
}
