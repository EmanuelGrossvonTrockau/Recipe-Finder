//
//  RecipeFinder.swift
//  Recipe Finder
//
//  Created by Emanuel Gross von Trockau on 2023-06-01.
//

import SwiftUI

struct RecipeFinder: View {
    @State private var searchText = ""
    @State private var add = ""
    var body: some View {
       
            Form{
              
                
                Section(header: Text("Ingredients")) {
                    
                    HStack{
                        
                        
                        TextField("Search", text: $searchText)
                        
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    
                    }
                }
            }
        
        .navigationTitle("Recipe Finder")
       
    }
}

struct RecipeFinder_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeFinder()
        }
    }
}
