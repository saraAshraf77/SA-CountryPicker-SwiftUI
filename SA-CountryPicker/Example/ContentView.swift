//
//  ContentView.swift
//  SA-CountryPicker
//
//  Created by Sara Mady on 03/06/2023.
//

import SwiftUI


struct ContentView: View {
    @State var showModal = false
    @State var showPickerModal = false
    
    // NOTE: you can set a default selected Country here ...
    
    @State var selectedCountry = Country(name: "Egypt", code: "Eg", phoneCode: "+20", flag: "🇪🇬")
    
    @State var selectedListCountry = Country(name: "Egypt", code: "Eg", phoneCode: "+20", flag: "🇪🇬")
    

    var body: some View {
    NavigationView {
            Form{
                Section(header: Text("Action Sheet")) {
                    HStack{
                        Text("Select Country Code")
                            .foregroundColor(Color.appColor(.TitleColor))
                        Spacer()
                        Button{
                            self.showPickerModal.toggle()
                            
                        } label:{
                            Text("\(selectedCountry.phoneCode + " " + selectedCountry.flag)")
                                .foregroundColor(Color.appColor(.FontColor))
                        }
                        .sheet(isPresented: $showPickerModal) {
                            print("Sheet dismissed!")
                        } content: {
                            CountryCodePickerView(selectedCountry: $selectedCountry,
                                                  PickerTitle: "Select Country Code"
                                                  ,tintButtonColor: Color.green)
                            .presentationDetents([.height(250)])
                        }
                    }
                    
                }
                
                Section(header: Text("List")) {
                    HStack{
                        Text("Select Country Code")
                            .foregroundColor(Color.appColor(.TitleColor))
                        Spacer()
                        Button{
                            self.showModal.toggle()
                            
                        } label:{
                            Text("\(selectedListCountry.phoneCode + " " + selectedListCountry.flag)")
                                .foregroundColor(Color.appColor(.FontColor))
                        }
                        .sheet(isPresented: $showModal) {
                            print("Sheet dismissed!")
                        } content: {
                            CountryPickerListView(selectedListCountry: $selectedListCountry,tintButtonColor: .red)
                            
                        }
                        
                    }
                }
                
            }
        
            .navigationTitle("SA-Country Picker")
    }
   
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
