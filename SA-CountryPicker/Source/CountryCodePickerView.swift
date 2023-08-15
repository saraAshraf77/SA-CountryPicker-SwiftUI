//
//  CountryCodeView.swift
//  MsgToWhatsApp
//
//  Created by Sara Mady on 23/05/2023.
//

import SwiftUI



struct CountryCodePickerView: View {
    
    @Binding var selectedCountry : Country
    
    // Picker Title
    @State var PickerTitle : String?
    
    // Tint Color
    @State var tintButtonColor:Color = .blue
    
    // Default Selected item
    @State var selectedData:Country?
    
    @Environment (\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            HStack{
                Button("Done") {
                    print($selectedCountry)
                    presentationMode.wrappedValue.dismiss()
                    if let selectedData {
                        self.selectedCountry = selectedData
                    }
                }
                Spacer()
                Text(PickerTitle ?? "")
                Spacer()
                
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                
            }.padding([.leading,.trailing], 20)
            .foregroundColor(tintButtonColor)
            .frame(height: 65)
            .background(.thinMaterial)
        
        Picker("Country Picker", selection: $selectedData, content: {
            
            ForEach(CountryPicker.shared.getFilteredCountryPickerData(countriesName: ["sa","eg","kw","UA"])) { country in
                    Text("\(country.flag)  "
                         + country.name +
                         "  \(country.phoneCode)").tag(country as Country?)
                        .font(.system(size: 25 ,weight: .regular))
                        .foregroundColor(Color.gray)
                }
               
            }).pickerStyle(.wheel)
            
                  
        }
        
        .background(.ultraThinMaterial)
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .opacity(0.95)
        .ignoresSafeArea()
    }
}

struct CountryCodePickerView_Preview: PreviewProvider {
    static var previews: some View {
        CountryCodePickerView(selectedCountry:.constant(Country(name: "", code: "", phoneCode: "", flag: "")))
        
    }
}

