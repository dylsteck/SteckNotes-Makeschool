//
//  RealmHelper.swift
//  Steck Notes
//
//  Created by Dylan Steck on 6/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
//    static let myRealm = try! Realm()
    
    //static methods will go here
    static func addNote(note: Note){
        let realm = try! Realm() // create an instance of the class Realm
        // now I call the method 'write' from the object realm of the class Realm
        // we use the trailing closure syntax to pass to the method 'write()' a code that is just one line that in turn calls the 'add()' function of the Realm instance 'realm',  passing to it the realm-object 'note' as an argument
        try! realm.write() { realm.add(note) }
    }
    
    static func deleteNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() { realm.delete(note) }
    }
    
    static func updateNote(noteToBeUpdated: Note, newNote: Note) {
        let realm = try! Realm()
        try! realm.write() {
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    
    static func retrieveNotes() -> Results<Note> {
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
    }
}
