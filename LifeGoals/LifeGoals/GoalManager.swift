//
//  GoalManager.swift
//  LifeGoals
//
//  Created by Marc Schneider on 13/08/2018.
//  Copyright © 2018 Hippo. All rights reserved.
//

import Foundation

class GoalManager {
    private var _goalList: [String]
    private let GOAL_LIST_KEY: String = "GoalList"
    private let userPref = UserDefaults.standard
    
    init() {
        if let loadedGoalList = userPref.array(forKey: GOAL_LIST_KEY) as? [String] {
            _goalList = loadedGoalList
        } else {
            _goalList = []
        }
    }
    
    func getGoalCount() -> Int {
        return _goalList.count
    }
    
    func getGoal(atIndex index: Int) -> String {
        return _goalList[index]
    }
    
    func addGoal(withText text: String) -> Int? {
        let newIndex: Int?
        
        if text.count > 0 {
            _goalList.append(text)
            newIndex = _goalList.count - 1
            userPref.set(_goalList, forKey: GOAL_LIST_KEY)
        } else {
            newIndex = nil
        }
        
        return newIndex
    }
    
    func removeGoal(atIndex index: Int) {
        _goalList.remove(at: index)
        userPref.set(_goalList, forKey: GOAL_LIST_KEY)
    }
}
