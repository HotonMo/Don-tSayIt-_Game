//
//  CardView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


struct CardView<Draggable: Gesture>: View {
    let position: CGPoint
    let gesture: Draggable
    let card : cardModel
    
    var body: some View {
        
        VStack(spacing : 10){
            Text(card.word)
                .foregroundColor(Color(red: 0.404, green: 0.255, blue: 0.533))
                .font(.title2)
            Text("- forbidden -")
                .foregroundColor(.red)
            ForEach(card.forbiddenWords , id: \.self) { Identifiable in
                Text(Identifiable)
                    .foregroundColor(.black)
            }
            
            
        }
        .frame(maxWidth: 150, maxHeight: 290)
        .background(Color(red: 1.000, green: 0.984, blue: 0.961))
        .cornerRadius(21.6)
        .shadow(radius: 10)
        .position(position)
        .gesture(gesture)
        
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView( position:.init(x: 200, y: 200) ,
                  gesture: DragGesture(), card: cardModel(word: "Teacher", forbiddenWords: ["School","Learn", "Grade", "Student"]))
    }
}


