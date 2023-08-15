//
//  CountryPickerListView.swift
//  SA-CountryPicker
//
//  Created by Sara Mady on 03/06/2023.
//

import SwiftUI

struct CountryPickerListView: View {
    
    @Binding var selectedListCountry : Country
    @State var selectedData:Country?
    
    @State var searchText:String = ""
    @State var tintButtonColor:Color = .blue
    
    @ObservedObject var viewModel = CountryListViewModel()
    
    @Environment (\.presentationMode) var presentationMode

    
    var body: some View {
    NavigationStack{
        
        List(viewModel.filteredAllCountries, selection: $selectedData) { country in
            
            HStack {
                Text(country.flag)
                Text(country.name)
                Spacer()
                Text("\(country.phoneCode)")
                    
            }
            .ignoresSafeArea()
            .onTapGesture {
                    selectedData = country
                    presentationMode.wrappedValue.dismiss()
                    if let selectedData {
                        self.selectedListCountry = selectedData
                }
            }
        }
    }.searchable(text: $viewModel.searchText)
        .tint(tintButtonColor)
    
    }
    
}

struct CountryPickerListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryPickerListView(selectedListCountry:.constant(Country(name: "", code: "", phoneCode: "", flag: "")))
    }
}
