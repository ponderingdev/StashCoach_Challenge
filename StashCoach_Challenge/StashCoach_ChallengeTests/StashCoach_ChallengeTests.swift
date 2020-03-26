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
        
        ///TODO. instead of checking view check the presenter data
        
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
        
        let model1 = AchievementModel(id: 10, level: "10", progress: 3, total: 100, bg_image_url: "someurl.jpg", accessible: true)
        let model2 = AchievementModel(id: 33, level: "4", progress: 4, total: 4, bg_image_url: "another_url.jpg", accessible: false)
        var testingList = [AchievementModel]()
        testingList.append(model1)
        let dummyOverview = AchievementsResponse.Overview(title: "Dummy overview")
        let dummyresponse = AchievementsResponse(success: true, status: 200, overview: dummyOverview, achievements: testingList)
        
        presenter.achievementsFetched(dummyresponse)
        
//        var collectionVC = StashCoachCollectionViewController()
//        presenter.view = collectionVC
//        collectionVC.list = presenter.view?.data.
//        XCTAssertEqual(presenter.view?., <#T##expression2: FloatingPoint##FloatingPoint#>, accuracy: <#T##FloatingPoint#>)
        

    }
    
    
    func testDisplayCollectionView() {
        
        //assert vc nil
        //call displaycollectionview
        
        // test list is not nil
        // test list however many elt's i specify
    }
    
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
