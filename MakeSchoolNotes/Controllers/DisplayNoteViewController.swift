//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    // There is a question mark after the note because ther won't always be a note
    var note: Note?
    //The IBOutlet connects the text field and text view from the main storyboard to the display note view controller.
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!

    //the view did load function just makes sure that the view loads properly
  override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // If the variable note is indeed a  note(if it exists), then the text field will be the title of the note and text view will be the contentof the note. If not, then the text field will be blank text, and so will the text view.
        if let note = note {
            // 2
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            // 3
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    //This function controls the different segues to make sure that the transition from different views are displayed and how to handle them.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //this let lets the listNotesTableViewController as a segue destination as the list notes table view controller, if it works or runs properly
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        if segue.identifier == "Save" {
            // if note exists, update title and content
            if let note = note {
                // 1
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                RealmHelper.updateNote(note, newNote: newNote)
            } else {
                // if note does not exist, create new note
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = NSDate()
                // This adds a note to the realm helper, in this case the note is the constant note.
                RealmHelper.addNote(note)
            }
            // this says that the notes in the list notes table view controller equals the retrieve function in the RealmHelper.swift, so the notes can transfer to Realm and display as well.
            listNotesTableViewController.notes = RealmHelper.retrieveNotes()
        }
    }

}
