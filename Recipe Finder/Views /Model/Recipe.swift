//
//  Book.swift
//  Recipe Finder
//
//  Created by Emanuel Gross von Trockau on 2023-06-04.
//
import Blackbird
import Foundation

struct Recipe: BlackbirdModel {
    
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var ingredients: String
    @BlackbirdColumn var steps: String
    @BlackbirdColumn var title: String
    
}
