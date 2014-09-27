//
//  GameScene.swift
//  SwiftBreakout
//
//  Created by Steven Veshkini on 9/27/14.
//  Copyright (c) 2014 swiftbreakout. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.physicsWorld.gravity = CGVector(0.0, 0.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.friction = 0.0
        let ball = Ball()
        self.addChild(ball)
        
        let paddle = Paddle()
        self.addChild(paddle)
        
        ball.physicsBody?.applyImpulse(CGVector(3, 3))
        paddle.position = CGPoint(x: CGRectGetMidX(self.frame), y: paddle.position.y)
        
        self.generateBricks()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let paddle = self.childNodeWithName("Paddle")
        let touch: AnyObject? = touches.anyObject()
        let positionInScene = touch?.locationInNode(self)
        
        if let paddle = paddle {
            if let positionInScene = positionInScene {
                let action = SKAction.moveTo(CGPoint(x: positionInScene.x, y: paddle.position.y), duration: 0)
                paddle.runAction(action)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func generateBricks() {
        let generator = BricksGenerator(scene: self)
        generator.createDefaultBricksPattern()
    }
}
