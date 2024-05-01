//
//  CardView.swift
//  HikeApp
//
//  Created by Amr Magdy on 29/04/2024.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
   
      repeat {
        randomNumber = Int.random(in: 1...5)
      } while randomNumber == imageNumber
      
      imageNumber = randomNumber
   
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack{
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button(action: {
                            print("Button was tapped")
                            isShowingSheet.toggle()
                        }) {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                        })
                    }
                    
                    Text("Get out and stretch your legs")
                        .italic()
                        .foregroundStyle(Color.customGrayMedium)
                }
                
                   
                ZStack {
                   CustomCircleView()
                    Image("image-\(imageNumber)")
                         .resizable()
                     .scaledToFit()
                     .animation(.default, value: imageNumber)
                }
               
                VStack(alignment: .center) {
                    Button(action: {
                        randomImage()
                    }) {
                        Text("Explore More")
                          .font(.title2)
                          .fontWeight(.heavy)
                          .foregroundStyle(
                            LinearGradient(
                              colors: [
                                .customGreenLight,
                                .customGreenMedium
                              ],
                              startPoint: .top,
                              endPoint: .bottom
                            )
                          )
                          .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                      }
                    .buttonStyle(GradientButton())
                }
               
                
                
            }
            
            
            .padding(.horizontal, 20)
            
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
