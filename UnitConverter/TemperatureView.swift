//
//  TemperatureView.swift
//  UnitConverter
//
//  Created by William on 20.04.21.
//

import Foundation
import SwiftUI

struct TemperatureView: View {
    @State private var originUnit: Int = 1
    @State private var temp: String = "0"
    @State private var unit: Int = 2
    
    var units: [String] = ["K","°F","°C"]
    
    var result: Double {
        print(originUnit, unit)
        let temperature = Double(temp) ?? 0.0
        switch originUnit {
        case 0: // Kelvin
            switch unit {
            case 0: // convert To Kelvin
                return temperature
            case 1: // Convert to farhenheit
               return (temperature - 273.15) * (9/5) + 32
            case 2: // Convert to Celsius
                return temperature - 273.15
            default:
                return 0.0
            }
        case 1: // Farhenheit
            switch unit {
            case 0: // convert To Kelvin
                return (temperature - 32) * (5/9) + 273.15
            case 1: // Convert to farhenheit
                return temperature
            case 2: // Convert to Celsius
                return (temperature - 32) * (5/9)
            default:
                return 0.0
            }
        case 2: // Celsius
            switch unit {
            case 0: // convert To Kelvin
                return (temperature + 273.15)
            case 1: // Convert to farhenheit
                return (temperature * (9/5)) + 32
            case 2: // Convert to Celsius
                return temperature
            default:
                return 0.0
            }
        default:
            return 0.0
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        TextField("Temperature", text: $temp).keyboardType(.decimalPad)
                        Picker("Units", selection: $originUnit){
                            ForEach(0 ..< units.count){
                                Text("\(units[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    Section{
                        Text("Convert in")
                        Picker("Units", selection: $unit){
                            ForEach(0 ..< units.count){
                                Text("\(units[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    Section{
                        Text("Result:    \(result, specifier: "%.2f") \(units[unit])")
                    }
                }
            }.navigationTitle("Temperature Converter")
        }
    }
}

struct TemperatureView_Previews: PreviewProvider{
    static var previews: some View {
        TemperatureView()
    }
}
