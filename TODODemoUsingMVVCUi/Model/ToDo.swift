//
//  File.swift
//  TODODemoUsingMVVCUi
//
//  Created by Knoxpo MacBook Pro on 21/12/20.
//

import Foundation



struct TODo: Codable,Identifiable
{
    var id = UUID()
    let title : String
    var iscompleted = false
    
    
    
}
