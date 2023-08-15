//
//  CountryListViewModel.swift
//  SA-CountryPicker
//
//  Created by Sara Mady on 08/06/2023.
//

import Foundation

class CountryListViewModel: ObservableObject {
    
    @Published var countries : [Country]?

    @Published var searchText: String = ""
    
    var filteredAllCountries: [Country] {
        guard !searchText.isEmpty else { return countries ?? []}
        return countries!.filter { country in
            country.name.lowercased().contains(searchText.lowercased())
        }
    }
    init() {
        countries = CountryPicker.shared.getAllCountryPickerData()
    }
}
