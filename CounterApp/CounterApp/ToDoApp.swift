//
//  ToDoApp.swift
//  CounterApp
//
//  Created by Prashant Pandey on 28/03/26.
//

import SwiftUI

@main
struct TODoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView2()
        }
    }
}


import SwiftUI

struct ContentView2: View {
    
    @State var todos: [TodoItem] = [
        TodoItem(title: "Buy groceries"),
        TodoItem(title: "Learn SwiftUI"),
        TodoItem(title: "Complete Counter"),
        TodoItem(title: "Build To-Do App"),
        TodoItem(title: "Build Weather App")
    ]
    
    @State var showAddSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("My List")
                    Spacer()
                    Button("Add Item") {
                        showAddSheet = true
                    }
                }.padding()
            }
            
            List {	
                ForEach($todos) { $todo in
                    NavigationLink(destination: ToDoDetailView(todo: $todo)) {
                        HStack {
                            Image(systemName: todo.isComplete ? "checkmark.circle.fill" : "circle")
                                .onTapGesture { todo.isComplete.toggle()
                                }
                            
                            Text(todo.title)
                                .strikethrough(todo.isComplete)
                        }
                    }
                }.onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }
            }
        }.sheet(isPresented: $showAddSheet) {
            AddTodoSheet(todos: $todos, showSheet: $showAddSheet)
        }
    }
}

struct AddTodoSheet : View {
    
    @Binding var todos: [TodoItem]
    @Binding var showSheet: Bool
    
    @State var title: String = ""
    
    var body: some View {
        VStack {
            Text("New To Do")
                .font(.headline)
                .padding()
            
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer().frame(height: 20)
            
            HStack {
                Button("cancel") {
                    self.showSheet.toggle()
                }
                Spacer()
                Button("Add") {
                    let newTodo = TodoItem(title: self.title)
                    self.todos.append(newTodo)
                    
                    self.showSheet.toggle()
                }.disabled(title.isEmpty)
            }.padding()
        }
    }
}

struct ToDoDetailView: View {
    
    @Binding var todo: TodoItem
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.title)
                .font(.title2)
                .padding()
            
            HStack {
                Text("Status:")
                Text(todo.isComplete ? "✓ Complete" : "Pending")
                    .foregroundColor(todo.isComplete ? .green : .orange)
            }.padding()
            
            Spacer()
            
            Button(action: {
                todo.isComplete.toggle()
                dismiss()
            }) {
                
                Text(todo.isComplete ? "Mark Incomplete" : "Mark Complete")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.padding()
        }
    }
    
}

#Preview {
    ContentView2()
}
