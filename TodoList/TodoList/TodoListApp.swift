//
//  TodoListApp.swift
//  TodoList
//
//  Created by Mahipal on 30/01/23.
//

import SwiftUI

/*
 MVVM Architecture

 Model      - data point
 View       - UI
 ViewModel  - manages models for view

 */

@main
struct TodoListApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
