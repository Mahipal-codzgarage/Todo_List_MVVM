//
//  NoItemsView.swift
//  TodoList
//
//  Created by Mahipal on 30/01/23.
//

import SwiftUI

struct NoItemsView: View {

    @State var animate: Bool = false

    let SecondaryAccentColor = Color("SecondaryAccentColor")

    var body: some View {
        ScrollView {
            VStack {
                Text("There is no items!")
                    .font(.title)
                    .fontWeight(.semibold)

                NavigationLink(destination: AddView()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? SecondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? SecondaryAccentColor.opacity(0.7) :
                            Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func addAnimation() {

        guard !animate else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoItemsView()
                .navigationTitle("demo")
        }
    }
}
