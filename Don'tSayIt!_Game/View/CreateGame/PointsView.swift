//
//  PointsView.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI

struct PointsView: View {
    @AppStorage("Points")  var PointToWin = 3.0
    @State private var isEditing = false
    var body: some View {
        
        HStack{
            ForEach(3..<11) { point in
                Button{
                    PointToWin = Double(point)
                    
                }label: {
                   
                    ZStack{
                        RoundedRectangle(cornerRadius:5)
                            .stroke(Color.darkPurple)
                            .frame(height: 30)
                        RoundedRectangle(cornerRadius:5)
                            .frame(height: 30)
                            .foregroundColor(point == Int(PointToWin) ? Color.lightPurple : Color.darkBeige)
                          
                        
                        Text("\(point)")

                    }
                }
            }
        }.padding(.vertical ,5)
    
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
    }
}
