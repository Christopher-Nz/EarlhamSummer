import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "start"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            switch currentStep {
            case "start":
                Text("You are in a blank, white room. You face three doors, each labeled with a number. Asign sits above the doors that reads; 'Choose Your Blind Date!'")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Door 1") {
                        currentStep = "Adam"
                    }
                    gameButton("Door 2") {
                        currentStep = "FreakyG"
                    }
                    gameButton("Door 3") {
                        currentStep = "Marshman"
                    }
                }
            case "Adam":
                Text("Adam Sandler sits before you at a folding table with a red and white plastic tablecloth.")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("'Nice Jorts'") {
                        currentStep = "AdamHappy"
                    }
                    gameButton("'Who are you?'") {
                        currentStep = "AdamBad"
                    }
                }
            case "Marshman":
                Text("You enter another blank, white room. In the center, the Michelin Man stands before you, the sun shining down on him. A single tear rolls down your cheek. His arms are outstreched, he yearns for your embrace.")
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 190, height: 109)
                gameButton("Accept") {
                    currentStep = "Fate"
                }
            case "FreakyG":
                Text("You find a gorilla sitting at a beautifully carved wooden table. A single rose sits in an ornate vase in front of him.")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Sit Down") {
                        currentStep = "sit gorilla"
                    }
                    gameButton("Fight") {
                        currentStep = "fight gorilla"
                    }
                    gameButton("Cry") {
                        currentStep = "cry gorilla"
                    }
                }
            case "sit gorilla":
                Text("The gorilla stares at you. You are filled with an immense discomfort")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Go Back") {
                        currentStep = "FreakyG"
                    }
                }
            case "fight gorilla":
                Text("Seriously? The gorilla snaps your neck.")
                gameButton("Start Over") {
                    currentStep = "start"
                }
            case "cry gorilla":
                Text("The gorilla gently pats you on the back. Is this love?")
                gameButton("Start Over") {
                    currentStep = "start"
                }
            case "AdamHappy":
                Text("Adam is pleased with your compliment. A waiter presents you with uncooked spam and mayonnaise sandwiches. 'Enjoy your meal!' ")
                    gameButton("Restart Date") {
                    currentStep = "start"
                }
            case "Fate":
                Text("In his attempt to hug you, the Michelin Man crushes your bones.")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Better luck next time!") {
                        currentStep = "start"
                    }
                }
            case "AdamBad":
                Text("A scowl crosses Adam's face. He snaps his fingers and a man in black emerges, dragging you from the room and locking it behind you. ")
                gameButton("You'll get there someday old sport.") {
                    currentStep = "start"
                }
                
            default:
                Text("Game Over.")
            }
            Spacer()
        }
        .padding()
        .font(.title3)
    }
    // Reusable styled button
    func gameButton(_ label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
#Preview {
    ContentView()
}

