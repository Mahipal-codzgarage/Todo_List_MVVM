//
//  AddView.swift
//  TodoList
//
//  Created by Mahipal on 30/01/23.
//

import SwiftUI

struct AddView: View {

    @State var textfieldText: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                TextField("Text", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.brightness(0.3))
                    .cornerRadius(10)

                Button {

                } label: {
                    Text("SAVE")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(16)
        }
        .navigationTitle("Add an item 🖊️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
