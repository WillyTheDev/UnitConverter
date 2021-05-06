//
//  ContentView.swift
//  UnitConverter
//
//  Created by William on 20.04.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 20){
                    NavigationLink(destination: TemperatureView()){
                        Text("Temperature Converter")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.red), Color(.orange)]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: LengthView()){
                        Text("Length Converter")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.purple)]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: TimeConversionView()){
                    Text("Time Converter")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.purple), Color(.magenta)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(20)
                    }

                
            }.navigationTitle(Text("Unit Converter"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
