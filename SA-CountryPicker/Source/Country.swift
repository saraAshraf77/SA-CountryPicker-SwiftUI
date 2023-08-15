//
//  Country.swift
//  SA-CountryPicker
//
//  Created by Sara Mady on 11/06/2023.
//

import Foundation

struct Country:Hashable ,Identifiable{
    var id = UUID()
    var name:String
    var code:String
    var phoneCode:String
    var flag:String
}
