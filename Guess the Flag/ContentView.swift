//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Dylan Silva on 11/26/23.
//
// introduting stacks, images, buttons, alerts, assets catalogs and more
// guess the flag
//entails: many flages, guessing which flag goes to which country, show correct and incorrect


import SwiftUI

//Actual Project work now
// we import the images to assets


struct ContentView: View {
    // notice this matches our assets
    // randomize array with shuffled
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Ireland", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in:0...2)
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var maxScoreStreak = 0
    
    var body: some View {
        // lets put something behind the v stack
        // this is where the z stack comes together
        ZStack {
            //color all the background
            LinearGradient(colors: [.indigo, .cyan], startPoint: .top, endPoint: .bottom)
            //Color.indigo
            // fill all space
                .ignoresSafeArea()
            // wrap v stack with new one to get space between flags
            VStack (spacing: 30) {
                VStack {
                    Text("Max Score Streak: \(maxScoreStreak)")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.bold))
                    
                    Spacer()
                    Text("Tap the Flag of")
                    // make the text pop
                        .foregroundStyle(.white)
                        .textCase(.uppercase)
                    // font change
                    // note: when the app is running, we can use the environment toggle switch tpo change it around
                        .font(.subheadline.weight(.heavy))
                    
                    // display name 0f the correct flag
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                    // lets make the title pop
                    // ;large title, with weight of semibold
                        .font(.largeTitle.weight(.semibold))
                }
                // display three flags
                //
                ForEach(0..<3) { number in
                    // button creates an inmage button for each flag
                    Button {
                        // flag was tapped
                        // send the number to the flag tapped function to compare
                        flagTapped(number)
                    }label: {
                        //picks the flag to display based ont he current iteration
                        // shadows: rectangle, rand rectangle, circle and capsule
                        Image(countries[number])
                            .clipShape(Capsule())
                            .shadow(color: .cyan, radius: 5)
                        
                    }
                }
                Spacer(minLength: 150)
            }
        }
        // .alert(title, is presented to show alert when trur, then set back to false
        .alert(scoreTitle, isPresented: $showScore) {
            // continue triggers another question
            // askquestion shuffles countries and picks the correct answer randomly
            Button("Continue", action: askQuestion)
        } message: {
            if score > 0 {
                Text("Your Score Streak: \(score)")
            } else {
                Text("Score Streak Broke!")
            }
        }
    }
    // accepts the
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            if score > maxScoreStreak {
                maxScoreStreak = score
            }
        } else {
            scoreTitle = "Incorrect"
            score = 0
        }
        
        showScore = true
    }
    func askQuestion() {
        // each time countries is shuffleed and it will display the first three flags in the array
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
