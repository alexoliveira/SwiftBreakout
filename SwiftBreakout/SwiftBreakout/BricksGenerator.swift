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
        // Row 1
        for i in 1...8 {
            let brick = SKSpriteNode(imageNamed: "brick")
            if let size = brick.texture?.size() {
                brick.physicsBody = SKPhysicsBody(texture: brick.texture, size: size)
                brick.physicsBody?.mass = 40
            }
            let w = Int(brick.size.width)
            brick.position = CGPoint(x:10+w*i, y:600)
            self.scene.addChild(brick)
        }
        
        // Row 2
        for i in 1...8 {
            let brick = SKSpriteNode(imageNamed: "brick")
            if let size = brick.texture?.size() {
                brick.physicsBody = SKPhysicsBody(texture: brick.texture, size: size)
                brick.physicsBody?.mass = 40
            }
            let w = Int(brick.size.width)
            brick.position = CGPoint(x:10+w*i, y:580)
            self.scene.addChild(brick)
        }
        
        // Row 3
        for i in 1...8 {
            let brick = SKSpriteNode(imageNamed: "brick")
            if let size = brick.texture?.size() {
                brick.physicsBody = SKPhysicsBody(texture: brick.texture, size: size)
                brick.physicsBody?.mass = 40
            }
            let w = Int(brick.size.width)
            brick.position = CGPoint(x:10+w*i, y:560)
            self.scene.addChild(brick)
        }
    }
}
