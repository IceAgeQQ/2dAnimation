//
//  HelloWorldLayer.h
//  2dAnimation
//
//  Created by Chao Xu on 13-8-4.
//  Copyright Chao Xu 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCSprite *ball;
    CCDirector * director;
    CGSize window ;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
