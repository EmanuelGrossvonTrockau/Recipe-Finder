//
//  RecipeFinder.swift
//  Recipe Finder
//
//  Created by Emanuel Gross von Trockau on 2023-06-01.
//

import SwiftUI
import Blackbird

struct RecipeFinder: View {
    @State private var searchText = ""
    @State private var add = ""
    @State private var ingredient = ""
    
    var body: some View {
        VStack{
            
            Button(action: {
                
                add = ""
                
            }, label: {
                Spacer()
                Text("ADD")
                    .font(.caption)
            })

            Form{
                                
                Section(header: Text("Ingredients")) {
                   
                    HStack{

                        TextField("Ingredient", text: $searchText)
                        
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                                                
                    }
                    List{
                        
                        
                        
                        
                        
                        
                    }
                }
                
            }
        }
            
            .navigationTitle("Recipe Book ")
        
    }
}

struct RecipeFinder_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeFinder()
        }
    }
}
