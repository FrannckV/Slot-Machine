//
//  InfoView.swift
//  Slot Machine
//
//  Created by Frannck Villanueva on 11/01/22.
//

import SwiftUI

struct InfoView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the app"), content: {
                    
                    FormRowView(firstItem: "Application", secondItem: "SlotMachine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone. iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "FrannckV")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Website", secondItem: "Swiftuimmasterclass.com")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2020 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                    
                })
            } //: FORM
            .font(.system(.body, design: .rounded))
        } //: VSTACK
        .padding(.top, 40)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }) //: BUTTON
                .padding(.top, 28)
                .padding(.trailing, 18)
                .accentColor(.secondary)
            
            , alignment: .topTrailing
        )
        .onAppear(perform: {
            playSound(sound: "background-music", type: "mp3")
        })
        .onDisappear(perform: {
            audioPlayer?.stop()
        })
    }
}

struct FormRowView: View {
    
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            
            Text(firstItem)
                .foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
