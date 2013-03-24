sprite-animation-layer
======================

Animate a sprite in CALayer

Configuration
-------------

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

