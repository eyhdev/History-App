//
//  ContentView.swift
//  History_App
//
//  Created by eyh.mac on 15.08.2023.
//

import SwiftUI

struct HistoricalArtifact: Identifiable {
var id = UUID()
var name: String
var era: String
var description: String
var imageName: String
}

let sampleArtifacts = [
HistoricalArtifact(name: "The Conquest of Istanbul",
                   era: "Muhammad the Conqueror, also known as Mehmed II, was an Ottoman Sultan who entered history with the conquest of Istanbul on May 29, 1453. Following the death of his father, Murad II, Muhammad the Conqueror ascended to the throne.",
                   description: "The conquest of Istanbul by Fatih Sultan Mehmed, also known as Mehmed the Conqueror, took place in 1453 and marked a significant turning point in history. Here's a brief overview of how it happened: Preparations and Siege:After ascending to the Ottoman throne, Mehmed Sultan Mehmed was determined to capture Constantinople (modern-day Istanbul), which had been the capital of the Byzantine Empire for centuries. He began preparations by building a massive fleet and assembling a well-trained army. In April 1453, the Ottoman forces surrounded Constantinople, cutting off its land and sea connections.The Walls of Constantinople:Constantinople was well-defended by formidable walls and fortifications. The city had withstood numerous sieges throughout history, but Mehmed was determined to breach its defenses. The walls were manned by a mix of Byzantine soldiers and foreign mercenaries.Ottoman Tactics:Mehmed employed various tactics during the siege, including constructing massive cannons to bombard the walls. One of these cannons, known as the Basilica Cannon, was particularly noteworthy for its size and power. The Ottomans also used sappers to dig tunnels underneath the walls, weakening their foundations.The Final Assault:As the siege continued, Mehmed ordered a massive assault on the city's defenses on May 29, 1453. The Ottomans launched an all-out attack from multiple directions, overwhelming the defenders. Despite their efforts, the Byzantine defenses began to crumble under the relentless assault.Breach of the Walls:After several days of intense fighting, the Ottoman forces managed to breach a section of the city's walls on May 29, 1453. This breach allowed them to enter the city, and a fierce battle ensued within the streets of Constantinople.",
                       imageName: "img2"),
]

struct ContentView: View {
    var artifacts: [HistoricalArtifact]
    var body: some View {
        NavigationView {
            ScrollView {
             VStack(spacing: 10) {
                            ZStack{
                            Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 350, height: 350)
                                  .background(
                                    Image("img4")
                                      .resizable()
                                      .aspectRatio(contentMode: .fill)
                                      .frame(width: 350, height: 350)
                                      .clipped())
                                
                                Text("Fatih Sultan\nMehmed")
                                  .font(Font.custom("Iowan Old Style", size: 50))
                                  .foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57))
                                  .multilineTextAlignment(.leading)
                                  .frame(width: 350, alignment: .topLeading)
                                  .padding(.top, 300)
                            }
                            
                            Text("Fatih Sultan Mehmed was born on March 30, 1432. He is the seventh sultan of the Ottoman Empire. at the age of 21, he conquered Istanbul in 1453, ending the Byzantine Empire and making the city the capital of the Ottoman Empire. With this great victory, he earned the title of \"Conqueror\".")
                              .font(Font.custom("Iowan Old Style", size: 17))
                              .multilineTextAlignment(.leading)
                              .foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57))
                              .padding()
                            
                            Rectangle()
                              .foregroundColor(.clear)
                              .frame(width: 374, height: 1)
                              .background(Color(red: 0.75, green: 0.7, blue: 0.57))
                            
                         
                            
                            ForEach(artifacts) { artifact in
                                NavigationLink(destination: ArtifactDetail(artifact: artifact)) {
                                    VStack{
                                        Text(artifact.name)
                                          .font(Font.custom("Iowan Old Style", size: 20))
                                         .foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57))
                                        HStack{
                                           Rectangle()
                                              .foregroundColor(.clear)
                                              .frame(width: 174, height: 174)
                                              .background(
                                                Image(artifact.imageName)
                                                  .resizable()
                                                  .aspectRatio(contentMode: .fill)
                                                  .frame(width: 174, height: 174)
                                                  .clipped()
                                              )
                                              .cornerRadius(22)
                                              .frame(maxWidth: .infinity, alignment: .leading)
                                              .padding()
                                            Text(artifact.era)
                                              .font(Font.custom("Iowan Old Style", size: 14))
                                              .multilineTextAlignment(.leading)
                                              .foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57))
                                        
                                        }
                                    }
                       }
                     
                    }
                }
            }
            .navigationBarItems(leading: Image(systemName: "arrow.left").foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57)).font(.title2))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(artifacts: sampleArtifacts)
            .preferredColorScheme(.dark)
    }
}


struct ArtifactDetail: View {
var artifact: HistoricalArtifact
@Environment(\.presentationMode) var presentationMode

var body: some View {
ScrollView {
    VStack {
        Image(artifact.imageName)
        // Replace "artifactImage" with your actual image name
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: .top)
            .offset(y: -10)
        ZStack {
            // Use a ZStack to layer views on top of each other
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 612, height: 712)
                .background(Color(red: 0.09, green: 0.07, blue: 0.05))
                .blur(radius: 113)
                .offset(y: -660)
            
            Text(artifact.name)
                .font(Font.custom("Iowan Old Style", size: 50))
                .foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57))
                .multilineTextAlignment(.leading)
                .frame(width: 350, alignment: .topLeading)
                .padding(.top, -800)
               
            
            Text(artifact.description)
                .font(Font.custom("Iowan Old Style", size: 20))
                .foregroundColor(Color(red: 0.75, green: 0.7, blue: 0.57))
                .frame(width: 368, alignment: .topLeading)
                .padding(.top, 50)
             
            
        }
    }
}
.navigationBarBackButtonHidden(true)
       .navigationBarItems(leading:
           Button(action: {
               presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
                   Image(systemName: "chevron.left.circle.fill")
                       .font(.title)
                
               }
               .foregroundColor(.white.opacity(0.5))
           }
       )
.frame(maxHeight: .infinity, alignment: .top)
          .ignoresSafeArea(.container, edges: .top) // Ignore safe area at the top for the entire view
}
}
