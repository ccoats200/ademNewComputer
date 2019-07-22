//
//  FirebaseFiles.swift
//  ademNewComputer
//
//  Created by Coleman Coats on 7/22/19.
//  Copyright © 2019 Coleman Coats. All rights reserved.
//

import Firebase
import FirebaseFirestore

var docRef: DocumentReference!
var colRef: CollectionReference!
var handle: AuthStateDidChangeListenerHandle?
let user = Auth.auth().currentUser


let usersInfo = "Users/user/info/fluid"
let userNames = "Users/user"
let productsInPantry = "Pantry"
let productsInList = "List"
let productsAvailable = "Products"

let usersCollection = "Users/\(user!.email!)"

