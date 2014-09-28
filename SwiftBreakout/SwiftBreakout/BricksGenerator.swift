//
//  BricksGenerator.swift
//  SwiftBreakout
//
//  Created by Guilherme Moura on 9/27/14.
//  Copyright (c) 2014 swiftbreakout. All rights reserved.
//

import UIKit
import SpriteKit

class BricksGenerator {
    let scene: GameScene
   
    init(scene: GameScene) {
        self.scene = scene
    }
    
    func createDefaultBricksPattern() {
        for i in 1...8 {
            for j in 1...3 {
                let brick = createBrick()
                var screenHeight = Int(self.scene.frame.size.height)
                brick.position = CGPoint(x:Int(brick.size.width) * i, y:screenHeight - Int(brick.size.height) * j)
                self.scene.addChild(brick)
            }
        }
    }
    
    func createBrick() -> SKSpriteNode {
        let brick = SKSpriteNode(imageNamed: "brick")
        if let size = brick.texture?.size() {
            brick.physicsBody = SKPhysicsBody(texture: brick.texture, size: size)
            brick.physicsBody?.mass = 40
            brick.physicsBody?.restitution = 1.0
            brick.physicsBody?.friction = 0.0
            brick.physicsBody?.linearDamping = 0.0
            brick.physicsBody?.allowsRotation = false
            brick.physicsBody?.dynamic = false
            brick.name = "Brick"
            
            brick.physicsBody?.categoryBitMask = brickCategory
            brick.physicsBody?.collisionBitMask = ballCategory | paddleCategory
            brick.physicsBody?.contactTestBitMask = ballCategory | paddleCategory
        }
        return brick
    }
}
