//
//  Book.swift
//  Recipe Finder
//
//  Created by Emanuel Gross von Trockau on 2023-06-04.
//
import Blackbird
import Foundation

struct Ingredient: BlackbirdModel {
    
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var ingredient: String
    @BlackbirdColumn var Description: String
    @BlackbirdColumn var Save: Bool 
    
}
