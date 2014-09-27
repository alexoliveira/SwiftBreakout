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
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
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
        
        if let pad = paddle {
            if let pos = positionInScene {
                let action = SKAction.moveTo(CGPoint(x: pos.x, y: pad.position.y), duration: 0)
                paddle?.runAction(action)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
