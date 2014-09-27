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
        let brick = SKSpriteNode(imageNamed: "brick")
        if let size = brick.texture?.size() {
            brick.physicsBody = SKPhysicsBody(texture: brick.texture, size: size)
        }
        brick.position = CGPoint(x:300, y:300)
        self.scene.addChild(brick)
    }
}
