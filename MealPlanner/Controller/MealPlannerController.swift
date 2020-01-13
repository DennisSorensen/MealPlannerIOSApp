//
//  MealPlannerController.swift
//  MealPlanner
//
//  Created by Dennis Sørensen on 13/01/2020.
//  Copyright © 2020 Dennis Sørensen. All rights reserved.
//

import Foundation

class MealPlannerController {
    //Static
    static let shared = MealPlannerController()
    
    //Base url til api
    let basisUrl = URL(string: "http://mealplanner.slund.info/api/Recipe")!
    
    //Får alle opskrifter
    public func getAllRecipe(completion: @escaping ([String]) -> Void) {
        let allRecipeUrl = basisUrl.appendingPathComponent("Recipe")
        
        //Kalder api
        let task = URLSession.shared.dataTask(with: allRecipeUrl) { (data, response, error) in
            
            if let apiAnswer = data {
                print(apiAnswer)
                
                //completion(apiAnswer)
            }
            else {
                print("Ingen svar fra server")
                if let serverResponse = response as? HTTPURLResponse {
                    print("Server kode: \(serverResponse.statusCode)")
                }
            }
        }
        task.resume()
    }
}
