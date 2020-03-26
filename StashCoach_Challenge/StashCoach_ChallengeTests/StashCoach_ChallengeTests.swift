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
        XCTAssertNotNil(router)
        
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
    
    }
    
    func testAchievementsFethched(){
    //        presenter.achievementsFetched(<#T##response: AchievementsResponse##AchievementsResponse#>)
    }
    
    func testInteractorReadJSON(){
        
        // Interactor reads from invalid path
        presenter.interactor?.readJSON("invalid file path", "json")
        XCTAssertNil(presenter.view?.data)
        
        // Interactor decodes invalid structure
        presenter.interactor?.readJSON("Achievements_InvalidCodable", "json")
        XCTAssertNil(presenter.view?.data)

        // Goes through normal flow
        presenter.updateView()
        XCTAssertNotNil(presenter.view?.data)

    }
    
    func testAchievementsFetched(){
        presenter.achievementsFetched(nil)
         XCTAssertNil(presenter.view?.data)

    }
    
    


//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
