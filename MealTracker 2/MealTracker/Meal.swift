//
//  Meal.swift
//  MealTracker
//
//  Created by Sukhman on 18/08/25.
//

import Foundation

struct Meal{
    var name: String
    var food: [Food]
}

var meals: [Meal] {
    let breakfast = Meal(name: "breakfast", food: [
        Food(name: "Sandwich", description: "protein-fat rich"),
        Food(name: "Oatmeal", description: "high fiber and carbs"),
        Food(name: "Orange Juice", description: "rich in vitamin C")
    ])

    let lunch = Meal(name: "lunch", food: [
        Food(name: "Grilled Chicken", description: "lean protein"),
        Food(name: "Quinoa Salad", description: "high in protein and fiber"),
        Food(name: "Steamed Vegetables", description: "vitamins and minerals")
    ])

    let dinner = Meal(name: "dinner", food: [
        Food(name: "Salmon", description: "rich in omega-3"),
        Food(name: "Brown Rice", description: "complex carbs"),
        Food(name: "Green Beans", description: "fiber and vitamins")
    ])
    
    return [breakfast, lunch, dinner]
}
