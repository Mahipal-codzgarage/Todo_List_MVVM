//
//  ListRowView.swift
//  TodoList
//
//  Created by Mahipal on 30/01/23.
//

import SwiftUI

struct ListRowView: View {

    let itemObj: ItemModel

    var body: some View {
        HStack {
            Image(systemName: itemObj.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(itemObj.isCompleted ? .green : .red)
            Text(itemObj.title)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var item1 = ItemModel(title: "first", isCompleted: true)
    static var item2 = ItemModel(title: "second", isCompleted: false)

    static var previews: some View {
        Group {
            ListRowView(itemObj: item1)
            ListRowView(itemObj: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
