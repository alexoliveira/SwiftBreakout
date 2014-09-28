//
//  Ball.swift
//  SwiftBreakout
//
//  Created by Mauricio Bell'Albero on 9/27/14.
//  Copyright (c) 2014 swiftbreakout. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {
    override init() {
        let texture = SKTexture(imageNamed: "ball")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.name = "Ball"
        let size = self.texture?.size()
        self.physicsBody = SKPhysicsBody(circleOfRadius:self.size.width / 2)
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.friction = 0.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.allowsRotation = false
        self.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.physicsBody?.categoryBitMask = ballCategory
        self.physicsBody?.collisionBitMask = ballCategory | brickCategory | paddleCategory
        self.physicsBody?.contactTestBitMask = ballCategory | brickCategory | paddleCategory
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
