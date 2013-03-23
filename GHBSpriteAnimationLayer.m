/*
 Copyright (c) 2013, Gerhard Bos
 All rights reserved.
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * GHBSpriteAnimationLayer.m
 *
 * Created by Gerhard Bos on 23-03-13.
 * http://gerhard.nl
 * Copyright (c) 2013 Gerhard Bos. All rights reserved.
 */

#import "GHBSpriteAnimationLayer.h"

@implementation GHBSpriteAnimationLayer
@synthesize numberOfFrames, framesPerSecond, frames;

// add sprite for animation
- (void) addSprite:(CGImageRef)spriteRef
     withFrameSize:(CGSize)displaySize
          withZoom:(int)zoom
        withFrames:(int)numFrames
{
    self.numberOfFrames = numFrames;
    
    // set Frame to displaySize
    self.frame = CGRectMake(0, 0, displaySize.width, displaySize.height);
    
    // set content rect for first frame
    CGSize frameSize = CGSizeMake(displaySize.width*zoom/CGImageGetWidth(spriteRef),
                                  displaySize.height*zoom/CGImageGetHeight(spriteRef));
    self.contentsRect = CGRectMake(0, 0, frameSize.width, frameSize.height);
    
    // frames
    int frameNumber = 1;
    NSMutableArray *f = [NSMutableArray arrayWithCapacity:numberOfFrames];
    while (frameNumber <= numFrames) {
        CGRect rect = CGRectMake(
               ((frameNumber - 1) % (int)(1/self.contentsRect.size.width)) * self.contentsRect.size.width,
               ((frameNumber - 1) / (int)(1/self.contentsRect.size.width)) * self.contentsRect.size.height,
                                  self.contentsRect.size.width, self.contentsRect.size.height);
        
        [f addObject:[NSValue valueWithCGRect:rect]];
        frameNumber++;
    }
    self.frames = [f copy];
    
    // set contents to spriteRef
    self.contents = (__bridge id)(spriteRef);
}

// play animation
- (void) playAtFramerate:(int)fps looping:(BOOL)loop
{
    self.framesPerSecond = fps;
    
    // Setup CABasicAnimation
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"contentsRect"];

    // Set values of content rects
    anim.values = self.frames;
    
    // Set up duration
    anim.duration = (float)self.frames.count / self.framesPerSecond;
    
    // animation loop
    if (loop)
        anim.repeatCount = HUGE_VALF;
    
    // params
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.calculationMode = kCAAnimationDiscrete;

    
    // start
    anim.delegate = self;
    [self addAnimation:anim forKey:@"GHBSpriteAnimation"];

}

// Stop animation
- (void) stop
{
    if([self animationForKey:@"GHBSpriteAnimation"]) {
        [self removeAnimationForKey:@"GHBSpriteAnimation"];
    }
    NSLog(@"sdf");
}


@end