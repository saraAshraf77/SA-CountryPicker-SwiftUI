//
//  CountryCodeModel.swift
//  MsgToWhatsApp
//
//  Created by Sara Mady on 24/05/2023.
//


import Foundation
import SwiftUI


final class CountryPicker{
    
    //MARK: Virables:  -
   
    static let shared = CountryPicker()
    
    var filteredArray = [Country]()
    

    //MARK: Country Data Source :  -
   
     static let countries: [Country] = {
         var countries = [Country]()
         let path = Bundle.main.path(forResource: "CountryCodes", ofType: "json")
         guard let jsonPath = path, let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
             return countries
         }
         if let jsonObjects = (try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)) as? Array<Any> {
             for jsonObject in jsonObjects {
                 guard let countryObj = jsonObject as? Dictionary<String, Any> else {
                     continue
                 }
                 guard let name = countryObj["name"] as? String,
                       let code = countryObj["code"] as? String,
                       let phoneCode = countryObj["dial_code"] as? String else {
                     continue
                 }
                 
                 let country = Country(name: name, code: code, phoneCode: phoneCode,flag:countryFlag(code))
                 countries.append(country)
             }
         }
         return countries
     }()
     
    //MARK:  Get Country Flag by country code:  -
    
    final class func countryFlag(_ countryCode: String) -> String {
      String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
        UnicodeScalar(127397 + $0.value)
      }))
    }
    
    //MARK:  Function Return All Countries Array:  -
    final func getAllCountryPickerData() -> [Country]{
        return CountryPicker.countries
    }
    
    
    //MARK:  Function Return Filtered Countries Array With Name:  -

    final func getFilteredCountryPickerData(countriesName:[String]) -> [Country]{
        filteredArray = CountryPicker.countries.filter({countriesName.map{$0.uppercased()}.contains($0.code) })
        return filteredArray
    }
    
}
