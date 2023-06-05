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
    var body: some View {
        NavigationView{
            VStack{
                        
                        HStack{
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
                                Spacer()
                                Text("ADD")
                                    .font(.caption)
                            })
                            Button(action: {
                                searchText = ""
                            })
                            {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            
                            
                            
                        }
                    
                    
                
                List{
                    Section(header: Text("Text")) {
                        
                        
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
