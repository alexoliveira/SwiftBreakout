//
//  Paddle.swift
//  SwiftBreakout
//
//  Created by Mauricio Bell'Albero on 9/27/14.
//  Copyright (c) 2014 swiftbreakout. All rights reserved.
//

import SpriteKit

class Paddle: SKSpriteNode {
    override init() {
        let texture = SKTexture(imageNamed: "paddle")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.name = "Paddle"
        let size = self.texture?.size()
        self.physicsBody = SKPhysicsBody(rectangleOfSize:self.frame.size)
        self.physicsBody?.dynamic = false
        self.physicsBody?.allowsRotation = false
        self.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) + 30)
        
        self.physicsBody?.categoryBitMask = paddleCategory
        self.physicsBody?.collisionBitMask = ballCategory | brickCategory | paddleCategory
        self.physicsBody?.contactTestBitMask = ballCategory | brickCategory | paddleCategory
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
