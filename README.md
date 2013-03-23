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
GHBSpriteAnimationLayer *spriteAnimation = [[GHBSpriteAnimationLayer alloc] init];
[spriteAnimation addSprite:imgRef withFrameSize:displaySize withZoom:2 withFrames:6];
spriteAnimation.position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
[self.view.layer addSublayer:spriteAnimation];

// play animation
[spriteAnimation playAtFramerate:12 looping:YES];

// stop animation
// [spriteAnimation stop];
```

