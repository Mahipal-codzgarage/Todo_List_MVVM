//
//  AddView.swift
//  TodoList
//
//  Created by Mahipal on 30/01/23.
//

import SwiftUI

struct AddView: View {

    @State var isAlertShow = false
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss

    @State var textfieldText: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                TextField("Text", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)

                Button {
                    saveButtonPressed()
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
        .alert("Error message", isPresented: $isAlertShow) {
            Button("Ok", role: .cancel, action: {
            })
        } message: {
            Text("Please enter valid text ")
        }
     }

    func saveButtonPressed() {

        if textIsAppropriate() {

            listViewModel.addItem(getTitle: textfieldText)
            dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textfieldText.count >= 5 {
            return true
        }
        isAlertShow.toggle()
        return false
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
