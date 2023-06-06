//
//  RecipeFinder.swift
//  Recipe Finder
//
//  Created by Emanuel Gross von Trockau on 2023-06-01.
//
import Blackbird
import SwiftUI



struct RecipeFinder: View {
    
    @Environment(\.blackbirdDatabase) var db:
    Blackbird.Database?
    
    @BlackbirdLiveModels({ db in
        try await Recipe.read(from: db)
    }) var recipes
    
    
    @State var searchText: String = ""
    @State var step: String = ""
    @State var Title: String = ""
    var body: some View {
        
            VStack{
               
                List{
                    Section(header: Text("Title")) {
                        TextField("title", text: $Title)
                    }
                }
               
                List{
                    Section(header: Text("Steps")) {
                        TextEditor(text: $step)
                    }
                }
                
                
                HStack {
                        TextField("Ingredient", text:
                                    $searchText)
                    
                    Button(action: {
                        
                        Task{
                            try await db!.transaction { core in try
                                core.query("INSERT INTO Recipe (ingredients) VALUES (?)",
                                           searchText)
                            }
                            searchText = ""
                        }
                        
                        
                    }, label: {
                        Text("ADD")
                        .font(.caption)
                    })
                }
                
                
                .padding(20)
                
                
                List{
                    Section(header: Text("Ingredients")) {
                        
                        
                        ForEach(recipes.results) { currentItem in
                            Label(title: {
                                Text(currentItem.title)
                            }, icon: {
                                Image(systemName: "circle.fill")
                            })
                            
                            
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
                .environment(\.blackbirdDatabase, AppDatabase.instance )
        }
    }
}
