sprite-animation-layer for Objective-C
======================================

Animate a sprite in CALayer

Configuration
-------------

Make sure you include the 'QuartzCore.framework'. Go to your target, and add it by pressing the '+' icon in the 'Linked Frameworks and Libraries' section.


```objc
// setup sprite source image
CGImageRef imgRef = [UIImage imageNamed:@"sprite-large.png"].CGImage;

// setup display size
CGSize displaySize = CGSizeMake( 120, 124 ); // size of one frame

// setup GHBSpriteAnimationLayer
GHBSpriteAnimationLayer *spriteAnimation = [[GHBSpriteAnimationLayer alloc] initWithSprite:imgRef
                                                                                  withSize:displaySize
                                                                                  withZoom:2];
                                                                                  
// add to self.view.layer
spriteAnimation.position = CGPointMake(self.view.frame.size.width/2,
                                       self.view.frame.size.height/2);
[self.view.layer addSublayer:spriteAnimation];

// add animation
[spriteAnimation addSpriteAnimationWithName:@"default" withFrames:1,2,3,4,5,6,0];

// add another animation
[spriteAnimation addSpriteAnimationWithName:@"test" withFrames:1,3,0];

// play animation 'default'
[spriteAnimation playSpriteAnimationWithName:@"default" atFramerate:12 looping:YES];

// stop animation
// [spriteAnimation stopSpriteAnimation];
```

