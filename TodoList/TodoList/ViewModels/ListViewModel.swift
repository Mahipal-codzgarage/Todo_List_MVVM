//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mahipal on 30/01/23.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }

    let itemKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {

        //        guard let data = UserDefaults.standard.data(forKey: itemKey) else { return }
        //        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }

        // guard with multiple condition
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = savedItems
    }

    func addItem(getTitle: String) {
        let newItem = ItemModel(title: getTitle, isCompleted: false)
        items.append(newItem)
    }

    func deleteItem(getIndexSet: IndexSet) {
        items.remove(atOffsets: getIndexSet)
    }

    func moveItem(getIndexSet: IndexSet, to: Int) {
        items.move(fromOffsets: getIndexSet, toOffset: to)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }

    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
