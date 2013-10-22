//
//  HelloWorldLayer.m
//  2dAnimation
//
//  Created by Chao Xu on 13-8-4.
//  Copyright Chao Xu 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		ball = [CCSprite spriteWithFile:@"soccer-ball.png"];
         director = [CCDirector sharedDirector];
         window = [director winSize];
        [ball setPosition:ccp(window.width/2, window.height/2)];
        [ball setScale:0.2];
        [self addChild:ball];
        self.isTouchEnabled = YES;
  //      id scale = [CCScaleBy actionWithDuration:2 scale:0.5];
  //      id move = [CCMoveBy actionWithDuration:2 position:ccp(20, 40)];
   //     id rotate = [CCRotateBy actionWithDuration:2 angle:360];
   //     [ball runAction:[CCRepeatForever actionWithAction:[CCSequence actions:scale,move,rotate,[rotate reverse],[move reverse],[scale reverse],nil]]];
		
	}
	return self;
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(touch){
        CGPoint location = [touch locationInView:[touch view]];
        CGPoint convertedpoint = [[CCDirector sharedDirector]convertToGL:location];
        id animation = [CCMoveTo actionWithDuration:1 position:ccp(convertedpoint.x,convertedpoint.y)];
        id rotate = [CCRotateBy actionWithDuration:2 angle:360];
        id scale = [CCScaleBy actionWithDuration:2 scale:0.5];
        id move = [CCMoveTo actionWithDuration:1 position:ccp(window.width/2, window.height/2)];
        [ball runAction:[CCSequence actions:animation,rotate,scale,[animation reverse],[rotate reverse],[scale reverse],move, nil]];
    }
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
