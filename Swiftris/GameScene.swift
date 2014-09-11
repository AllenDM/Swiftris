//
//  GameScene.swift
//  Swiftris
//
//  Created by Allen Moody on 8/31/14.
//  Copyright (c) 2014 bloc. All rights reserved.
//

import SpriteKit

// #1
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {

    
// #2
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    
    
    required init(coder aDecoder: NSCoder!) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    
   
    anchorPoint = CGPoint(x: 0, y: 1.0)
    
    let background = SKSpriteNode(imageNamed: "background")
    background.position = CGPoint(x: 0, y: 0)
    background.anchorPoint = CGPoint(x: 0, y: 1.0)
    addChild(background)
}

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
// #3
        if lastTick == nil {
            return
            
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?()
    }
}


    func startTicking() {
        lastTick = NSDate.date()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
