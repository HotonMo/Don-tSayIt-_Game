//
//  Rules.swift
//  Don'tSayIt!_Game
//
//  Created by hoton on 28/11/1444 AH.
//

import SwiftUI


struct HowToPlayView: View {
    @Environment(\.dismiss) private var dismiss
    @State var currentIndex: Int = 0
    
    @State var posts = HowToPlay.allCases
    
    @State var currentTab = "Slide Show"
    @Namespace var animation
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15){
            
                             Button {
                      dismiss()
                  } label: {
                          Image(systemName: "x.circle")
                          .font(.title)
                      .foregroundColor(.black)
                
        
                  }
            
         
            
            
            
            VStack(alignment: .center, spacing: 12) {
                Text("How to play ?")
                    .font(.title)
                    .foregroundColor(.darkPurple)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                
                
                
                SnapCarousel(index: $currentIndex, items: posts) {card in
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        ZStack{
                            Rectangle()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.lightBeige)
                            
                            if card.Text_L != HowToPlay.Third.Text_L {
                                HStack{
                                    VStack(spacing : 60){
                                        Image(card.image_R).resizable().scaledToFit()
                                            .frame(height: 278)
                                        
                                        card.Text_R
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: 28))
                                    }.padding(.horizontal)
                                    Divider()
                                    VStack(spacing : 60){
                                        Image(card.image_L).resizable().scaledToFit()
                                            .frame(height: 278)
                                        card.Text_L.multilineTextAlignment(.center)
                                            .font(.system(size: 28))
                                    }.padding(.horizontal)
                                    
                                }
                            } else{
                                VStack(spacing : 60){
                                    Image(card.image_R).resizable().scaledToFit()
                                        .frame(height: 278)
                                    card.Text_R
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 28))
                                    
                                    
                                }.padding(.horizontal)
                                
                            }
                            
                        }.frame(width: size.width - 50 , height: size.height)
                            .cornerRadius(70)
                        
                    }
                }
                .padding(.vertical,10)
                
                // Indicator...
                HStack(spacing: 10){
                    
                    ForEach(posts.indices,id: \.self){index in
                        
                        Circle()
                            .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                            .frame(width: 10, height: 10)
                            .scaleEffect(currentIndex == index ? 1.4 : 1)
                            .animation(.spring(), value: currentIndex == index)
                    }
                }
                .padding(.bottom,40)
            }

        }.frame(maxHeight: .infinity,alignment: .top)
            .padding(.horizontal)
            .background(Color.darkBeige)
            .foregroundColor(.black)
    }
}

struct  HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}

// TabButton...
struct TabButton: View{
    
    var title: String
    var animation: Namespace.ID
    @Binding var currentTab: String
    
    var body: some View{
        
        Button {
            withAnimation(.spring()){
                currentTab = title
            }
        } label: {
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical,8)
                .background(
                
                    ZStack{
                        if currentTab == title{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                )
        }

    }
}

