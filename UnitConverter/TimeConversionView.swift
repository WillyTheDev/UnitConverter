//
//  TimeConversionView.swift
//  UnitConverter
//
//  Created by William on 20.04.21.
//

import SwiftUI

struct TimeConversionView: View {
    @State private var originUnit: Int = 1
    @State private var time: String = "0"
    @State private var unit: Int = 2
    
    var units: [String] = ["sec","min","hours", "day", "weeks", "month", "year"]
    var result: Double {
        let timeToConvert = Double(time) ?? 0.0
        switch originUnit {
        case 0:
            switch unit {
            case 0:
                return timeToConvert
            case 1:
                return timeToConvert / 60
            case 2:
                return timeToConvert / 3600
            case 3:
                return (timeToConvert / 3600) / 24
            case 4:
                return (timeToConvert / 3600) / 168
            case 5:
                return (timeToConvert / 3600) / 720
            case 6:
                return (timeToConvert / 3600) / 8760
            default:
                return 0.0
            }
        case 1:
            switch unit {
            case 0:
                return timeToConvert * 60
            case 1:
                return timeToConvert
            case 2:
                return timeToConvert / 3600
            case 3:
                return (timeToConvert / 3600) / 24
            case 4:
                return (timeToConvert / 3600) / 168
            case 5:
                return (timeToConvert / 3600) / 720
            case 6:
                return (timeToConvert / 3600) / 8760
            default:
                return 0.0
            }
        case 2:
            switch unit {
            case 0:
                return timeToConvert * 3600
            case 1:
                return timeToConvert * 60
            case 2:
                return timeToConvert
            case 3:
                return timeToConvert / 24
            case 4:
                return timeToConvert / 168
            case 5:
                return timeToConvert / 720
            case 6:
                return timeToConvert / 8760
            default:
                return 0.0
            }
        case 3:
            switch unit {
            case 0:
                return (timeToConvert * 24) * 3600
            case 1:
                return (timeToConvert * 24) * 60
            case 2:
                return timeToConvert * 24
            case 3:
                return timeToConvert
            case 4:
                return timeToConvert / 7
            case 5:
                return timeToConvert / 30
            case 6:
                return timeToConvert / 365
            default:
                return 0.0
            }
        case 4:
            switch unit {
            case 0:
                return (timeToConvert * 7 * 24) * 3600
            case 1:
                return (timeToConvert * 7 * 24) * 60
            case 2:
                return timeToConvert * 7 * 24
            case 3:
                return timeToConvert * 7
            case 4:
                return timeToConvert
            case 5:
                return timeToConvert / 4
            case 6:
                return timeToConvert / 52
            default:
                return 0.0
            }
        case 5:
            switch unit {
            case 0:
                return (timeToConvert * 4 * 7 * 24) * 3600
            case 1:
                return (timeToConvert * 4 * 7 * 24) * 60
            case 2:
                return timeToConvert * 4 * 7 * 24
            case 3:
                return timeToConvert * 4 * 7
            case 4:
                return timeToConvert * 4
            case 5:
                return timeToConvert
            case 6:
                return timeToConvert / 12
            default:
                return 0.0
            }
        case 6:
            switch unit {
            case 0:
                return (timeToConvert * 12 * 4 * 7 * 24) * 3600
            case 1:
                return (timeToConvert * 12 * 4 * 7 * 24) * 60
            case 2:
                return timeToConvert * 12 * 4 * 7 * 24
            case 3:
                return timeToConvert * 12 * 4 * 7
            case 4:
                return timeToConvert * 12 * 4
            case 5:
                return timeToConvert * 12
            case 6:
                return timeToConvert
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
                        TextField("Temperature", text: $time).keyboardType(.decimalPad)
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
                        Text("Result:    \(result, specifier: "%.6f") \(units[unit])")
                    }
                }
            }.navigationTitle("Temperature Converter")
        }
    }
    
}

struct TimeConversionView_Previews: PreviewProvider {
    static var previews: some View {
        TimeConversionView()
    }
}
