//
//  GameVM.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//


import SwiftUI

class GameVM : ObservableObject{

    //MARK: - playersVM
    @Published var players : [PlayerModel] = []
//    var playerContainers = players

    //MARK: functions
    // add player
    func addPlayer(Name:String , Icon: String){
        let newPlayer = PlayerModel(name: Name, icon: Icon)
          players.append(newPlayer)
    }
    // delete player
    func deletePlayer(indexSet: IndexSet)
    {
    players.remove(atOffsets: indexSet)
        
    }
    
    func updatePlayer(player : PlayerModel){
        if let index = players.firstIndex(where: {$0.id == player.id }){
            players[index] = player.updateCompletion()
            
        }
    }

    func resetPoints(Players : [PlayerModel]){
        for player in Players{
            if let index = players.firstIndex(where: {$0.id == player.id }){
                players[index] =  player.ResetPoints()
            }
        }
    }
    
    //MARK: - CardVM
    

    @AppStorage("Points") var PointToWin : Int = 3
    @Published var currentCard : cardModel?
    private var Cards = cards.shuffled()
    @Published var currentPosition = initialPosition
    @Published var highlightedPlayer: String?
    @Published var CardOpacity: CGFloat = 1.0
    @Published var winerName: String?
    @Published var winerIcon: String?
    @Published var winerPoints: Int?
    @Published var isGameOver = false
    
    //MARK: Card position
    private static let initialPosition = CGPoint(
        x: UIScreen.main.bounds.midX ,
        y: UIScreen.main.bounds.midY
    )
   
    // MARK: - Updates in the screen
    
    private var frames: [String: CGRect] = [:]
    
    func update(frame: CGRect, for id: String) {
        frames[id] = frame
    }

    func update(dragPosition: CGPoint) {
        currentPosition = dragPosition
        for (id, frame) in frames where frame.contains(dragPosition) {
            highlightedPlayer = id
            return
        }
        highlightedPlayer = nil
    }
    
    func isHighlighted(id: String) -> Bool {
        highlightedPlayer == id
    }
    
    // MARK: - reset
    
    func resetPosition() {
        currentPosition = GameVM.initialPosition
    }

    //MARK: - card func
    func NextCard() {
        currentCard = Cards.popLast()
    }
 
    func CardPositionToHighlightedPlayer(WithId id: String) {
        guard let frame = frames[id] else {
            return
        }
        currentPosition = CGPoint(x: frame.midX, y: frame.midY)
        makeCardInvisible()
    }
    
    func makeCardInvisible() {
        CardOpacity = 0
    }

    func generateNextRound() {
        for player in players {
            if(player.point  == PointToWin ){
                gameOver(player: player)
            }
            else if (currentCard == nil){
                gameEnd()
                } else {
                    prepareObjects()
                    NextCard()
                }
        }
            
    }
    func gameEnd(){
        var TempPlayer = PlayerModel(name: "", icon: "", point: 0)
        for player in players {
            if (TempPlayer.point < player.point) {
                TempPlayer.point = player.point
                TempPlayer.name = player.name
                TempPlayer.icon = player.icon
            }
        }
            winerIcon = TempPlayer.icon
            winerName = TempPlayer.name
            winerPoints = TempPlayer.point
        
        isGameOver = true
    }

    
    func gameOver(player : PlayerModel?){
            winerIcon = player?.icon
            winerName = player?.name
        
        isGameOver = true
    }
    
    func prepareObjects() {
        resetCurrentCardWithoutAnimation()
    }
    
    func resetCurrentCardWithoutAnimation() {
        withAnimation(.none) {
            resetPosition()
            restoreOpacityWithAnimation()
        }
    }
    func restoreOpacityWithAnimation() {
        withAnimation {
            CardOpacity = 1.0
        }
    }
 
    
    func generateNewGame() {
        resetPoints(Players: players)
        Cards = GameVM.cards.shuffled()
        generateNextRound()
    }
    

    func confirmWhereCardWasDropped() {
        defer { highlightedPlayer = nil }
        
        guard let highlightedId = highlightedPlayer else {
            resetPosition()
            return
        }
        CardPositionToHighlightedPlayer(WithId: highlightedId)
       
     
        for player in players{
           
            if highlightedId == player.id {
                withAnimation(.linear){
                    updatePlayer(player: player)
                    soundManger.SoundManager.instance.playSound(sound: .point)
                }
            }
        }
        generateNextRound()
    }
    
    // cards list
    static var cards : [cardModel] = [
         cardModel(word: "Face mask", forbiddenWords: ["Corona","Hospital","Doctor","Nose" ]),
         cardModel(word: "Soul", forbiddenWords: ["Die","Ghost", "Evil","Dream"]),
         cardModel(word: "Twins", forbiddenWords: ["Siblings","Two", "Birth","Similarity"]),
         cardModel(word: "Banana", forbiddenWords: ["Monkey","Fruit", "Yellow","Tall"]),
         cardModel(word: "Ghost", forbiddenWords: ["Darkness","Fear", "White","Demon"]),
         cardModel(word: "Triangle", forbiddenWords: ["Shape","Pyramid", "Points","Three"]),
         cardModel(word: "Pencil", forbiddenWords: ["Draw","Write", "Eraser", "Sharpen"]),
         cardModel(word: "Lake", forbiddenWords: ["Water","Ocean", "Pond", "Sea"]),
         cardModel(word: "Bakery", forbiddenWords: ["Bread","Cake", "Pastry", "Fresh"]),
         cardModel(word: "Couch", forbiddenWords: ["Sofa","Sit", "Furniture", "Leather"]),
         cardModel(word: "Helicopter", forbiddenWords: ["blade","Ride", "Chopper", "Fly"]),
         cardModel(word: "Duvet", forbiddenWords: ["Bed","Blanket", "Cover", "Feathers"]),
         cardModel(word: "Costume", forbiddenWords: ["Halloween","Scary", "Party", "Dress"]),
         cardModel(word: "Billionaire", forbiddenWords: ["Rich","Money", "lottery", "Wealthy"]),
         cardModel(word: "Bench", forbiddenWords: ["Sit","Play", "Seat", "Park"]),
         cardModel(word: "Rug", forbiddenWords: ["Floor","Carpet", "Mat", "Tapestry"]),
         cardModel(word: "Marshmallow", forbiddenWords: ["White","Toasted", "Fluffy", "Candy"]),
         cardModel(word: "Stop", forbiddenWords: ["Light","Sign", "Pause", "Red"]),
         cardModel(word: "Pizza", forbiddenWords: ["Slice","Cheese", "Italy", "Domino's"]),
         cardModel(word: "Giant", forbiddenWords: ["Big","Huge", "Large", "Ogre"]),
         cardModel(word: "Asia", forbiddenWords: ["Continent","China", "Europe", "Land"]),
         cardModel(word: "University", forbiddenWords: ["Degree","Campus", "College", "School"]),
         cardModel(word: "Popcorn", forbiddenWords: ["Movies","Cinema", "Butter", "Microwave"]),
         cardModel(word: "Chimney", forbiddenWords: ["Fireplace","Smoke", "House", "Stove"]),
         cardModel(word: "Slap", forbiddenWords: ["Hit","Face", "Hand", "Smack"]),
         cardModel(word: "Chef", forbiddenWords: ["Kitchen","Restaurant", "Cook", "Food"]),
         cardModel(word: "Slice", forbiddenWords: ["Cut","Pizza", "Knife", "Cake"]),
         cardModel(word: "Drive", forbiddenWords: ["Car","Highway", "License", "Way"]),
         cardModel(word: "Teacher", forbiddenWords: ["School","Learn", "Grade", "Student"]),
         cardModel(word: "Out", forbiddenWords: ["In","Doors", "Exit", "Leave"]),
                 
    ]
   
    
}
