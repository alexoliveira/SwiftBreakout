//
//  GameScene.swift
//  SwiftBreakout
//
//  Created by Steven Veshkini on 9/27/14.
//  Copyright (c) 2014 swiftbreakout. All rights reserved.
//

import SpriteKit

let paddleCategory : UInt32 = 1 << 0
let ballCategory : UInt32 = 1 << 1
let brickCategory : UInt32 = 1 << 2
let explosionCategory : UInt32 = 1 << 3

class GameScene: SKScene, SKPhysicsContactDelegate {
    var bricksToExplode : [SKNode] = []
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.physicsWorld.gravity = CGVector(0.0, 0.0)
        self.physicsWorld.contactDelegate = self;
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
        if bricksToExplode.count > 0 {
            explodeBricks()
        }
    }
    
    func generateBricks() {
        let generator = BricksGenerator(scene: self)
        generator.createDefaultBricksPattern()
    }

    func didBeginContact(contact: SKPhysicsContact) {
        var contactBodies = [contact.bodyA.node, contact.bodyB.node]
        for node in contactBodies {
            if node?.name == "Brick" {
                bricksToExplode.append(node!)
                node?.removeFromParent()
            }
        }
        var paddle = self.childNodeWithName("Paddle")!
        if contactBodies[0] == paddle || contactBodies[1] == paddle {
            var xImpulse = contact.contactPoint.x - paddle.position.x
            var ball = self.childNodeWithName("Ball")
            ball?.physicsBody?.applyImpulse(CGVector(xImpulse,0))
            if let velocity = ball?.physicsBody?.velocity {
                ball?.physicsBody?.velocity = CGVector(min(velocity.dx, 300), min(velocity.dy, 300))
            }
        }
        if contact.contactPoint.y < 10 {
            let myLabel = SKLabelNode(fontNamed:"Chalkduster")
            myLabel.text = "You Lost!";
            myLabel.fontSize = 65;
            myLabel.fontColor = UIColor.blackColor()
            myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
            self.addChild(myLabel)
        }
    }

    func explodeBricks() {
        println("exploding brick")
        let brickToExplode = bricksToExplode.removeLast()
        let explosionIconNames = ["no_semicolons", "swift icon", "poo"]
        let explosionIconIndex = Int(rand()) % (explosionIconNames.count)
        let explosionParticle = SKSpriteNode(imageNamed: explosionIconNames[explosionIconIndex])
        if let size = explosionParticle.texture?.size() {
            explosionParticle.physicsBody = SKPhysicsBody(texture: explosionParticle.texture, size: size)
            explosionParticle.position = brickToExplode.position
            println(brickToExplode.position)
//            explosionParticle.physicsBody?.mass = 1
            explosionParticle.physicsBody?.restitution = 1.0
            explosionParticle.physicsBody?.friction = 0.0
            explosionParticle.physicsBody?.linearDamping = 0.0
            explosionParticle.physicsBody?.allowsRotation = false
//            explosionParticle.physicsBody?.dynamic = false
            explosionParticle.physicsBody?.applyAngularImpulse(0.01)
            explosionParticle.name = "Explosion Particle"
            
            explosionParticle.physicsBody?.categoryBitMask = explosionCategory
            explosionParticle.physicsBody?.collisionBitMask = 0
            explosionParticle.physicsBody?.contactTestBitMask = 0
        }
        self.addChild(explosionParticle)
        explosionParticle.physicsBody?.applyImpulse(CGVector(0.0, -10.0))
    }
}
