//
//  ContentView.swift
//  ExerciseFinder
//
//  Created by James Penny on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var exercises = [Exercise]()
    @State var name: String = ""
    @State var type: String = ""
    @State var muscle: String = ""
    @State var equipment: String = ""
    @State var difficulty: String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    func getExercise() {
        Api().loadData(name: self.name, type: self.type, muscle: self.muscle, equipment: self.equipment, difficulty: self.difficulty) { (exercises) in
            self.exercises = exercises
        }
    }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack(alignment: .leading) {
                    VStack {
                        TextField(
                            "Search name",
                            text: $name
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()
                        TextField(
                            "Search type",
                            text: $type
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()
                        TextField(
                            "Search muscle",
                            text: $muscle
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()
                        TextField(
                            "Search equipment",
                            text: $equipment
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()
                        TextField(
                            "Search difficulty level",
                            text: $difficulty
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()
                        HStack {
                            Spacer()
                            Button(action: getExercise) {
                                Text("Find Exercise")
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .font(.title2)
                            .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .padding(30.0)
                    List {
                        ForEach(exercises) { exercise in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Name = \(exercise.name)")
                                        .font(.title)
                                        .padding(.bottom)
                                    Text("Type = \(exercise.type) ")
                                        .font(.title2)
                                }
                                .minimumScaleFactor(0.01)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("\(exercise.muscle)")
                                    Text("\(exercise.equipment)")
                                    Text("\(exercise.difficulty)")
                                }
                                .minimumScaleFactor(0.01)
                                .font(.system(size: 18.0))
                            }
                            .listRowBackground(Color.clear)
                            .foregroundColor(.black)
                            .padding()
                        }
                    }
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
