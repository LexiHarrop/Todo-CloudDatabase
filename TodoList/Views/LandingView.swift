//
//  LandingView.swift
//  TodoList
//
//  Created by Russell Gordon on 2024-04-08.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Stored properties
    
    // The search text
    @State var searchText = ""
    
    // The list of to-do items
    @State var viewModel = TodoListViewModel() 
    
    @State var presentingNewItemSheet = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            
            VStack {
                
                if viewModel.todos.isEmpty {
                    
                    if viewModel.fetchingTodos {
                        
                        Spacer()
                        
                        ProgressView()
                        
                        Spacer()
                        
                    } else {
                        
                        ContentUnavailableView(
                            "No to-do items",
                            systemImage: "pencil.tip.crop.circle.badge.plus",
                            description: Text("Add a reminder to get started")
                        )
                        
                    }
                }else {
                    List($viewModel.todos) { $todo in
                        
                        ItemView(currentItem: $todo, viewModel: viewModel)
                        // Delete item
                            .swipeActions {
                                Button(
                                    "Delete",
                                    role: .destructive,
                                    action: {
                                        viewModel.delete(todo)
                                    }
                                )
                            }
                        
                    }
                    
                }
                
            
                
            }
            .navigationTitle("To do")
            .sheet(isPresented: $presentingNewItemSheet) {
                NewItemView(showSheet: $presentingNewItemSheet)
                    .presentationDetents([.fraction(0.25)])
            }
            .toolbar {
                // Add a button to trigger showing the sheet
                ToolbarItem(placement: .automatic) {
                    Button {
                        presentingNewItemSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                Task {
                    try await viewModel.filterTodos(on: searchText)
                }
            }
            
        }
        .environment(viewModel)
    }
}

#Preview {
    LandingView()
}
