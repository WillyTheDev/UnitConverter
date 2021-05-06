//
//  LengthView.swift
//  UnitConverter
//
//  Created by William on 20.04.21.
//

import SwiftUI

struct LengthView: View {
    @State private var originUnit: Int = 1
    @State private var length: String = "0"
    @State private var unit: Int = 2
    
    var units: [String] = ["mm","cm","m","km"]
    
    var result: Double {
        print(originUnit, unit)
        let len = Double(length) ?? 0.0
        switch originUnit {
        case 0: // MM
            switch unit {
            case 0:
                return len
            case 1:
                return len / pow(10, 1)
            case 2:
                return len / pow(10, 3)
            case 3:
                return len / pow(10, 6)
            default:
                return 0
            }
        case 1: // CM
            switch unit {
            case 0:
                return len * pow(10, 1)
            case 1:
                return len
            case 2:
                return len / pow(10, 2)
            case 3:
                return len / pow(10, 5)
            default:
                return 0
            }
        case 2: // M
            switch unit {
            case 0:
                return len * pow(10, 3)
            case 1:
                return len * pow(10, 2)
            case 2:
                return len
            case 3:
                return len / pow(10, 3)
            default:
                return 0
            }
        case 3: // KM
            switch unit {
            case 0:
                return len * pow(10, 6)
            case 1:
                return len * pow(10, 5)
            case 2:
                return len * pow(10, 3)
            case 3:
                return len
            default:
                return 0
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
                        TextField("Temperature", text: $length).keyboardType(.decimalPad)
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
                        Text("Result:    \(result, specifier: "%.4f") \(units[unit])")
                    }
                }
            }.navigationTitle("Length Converter")
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
