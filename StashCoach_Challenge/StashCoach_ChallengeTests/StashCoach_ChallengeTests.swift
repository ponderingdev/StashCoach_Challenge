//
//  StashCoach_ChallengeTests.swift
//  StashCoach_ChallengeTests
//
//  Created by Jesus Fabian on 3/25/20.
//  Copyright © 2020 Jesus Fabian. All rights reserved.
//

import XCTest

@testable import StashCoach_Challenge

class StashCoach_ChallengeTests: XCTestCase {
    
    var router : StashCoachRouter!
    var presenter : StashCoachPresenter!

    override func setUp() {
    
        router = StashCoachRouter()
        presenter = router.presenter
        router.setUp()
        
    }

    override func tearDown() {
        
    }
    
    func testRouterSetup(){
        XCTAssertNotNil(self.router)
        
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
    
    }
    
    func testAchievementsFethched(){
    //        presenter.achievementsFetched(<#T##response: AchievementsResponse##AchievementsResponse#>)
    }
    
    func testInteractorReadJSON(){
        let collectionVC = presenter.view as! StashCoachCollectionViewController
        XCTAssertNil(collectionVC.achievements)
//        presenter.interactor?.readJSON()
        
    }
    


//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
