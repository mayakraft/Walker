//
//  Bug.m
//  Walker
//
//  Created by Robby Kraft on 10/28/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "Bug.h"
#import "noise.h"

#define TAILLENGTH 40

@interface Bug (){
    float tx, ty;
    float STEP;
    NSMutableArray *tail;
    NSInteger iTail;
}
@end

@implementation Bug

-(id)init{
    self = [super initWithTexture:nil color:[UIColor yellowColor] size:CGSizeMake(3, 3)];
    if(self){
        tx = arc4random()%100/100.0;
        ty = tx+arc4random()%100/100.0;
        STEP = .01;
    }
    return self;
}

-(void) initTail{
    tail = [NSMutableArray array];
    for(int i = 0; i < TAILLENGTH; i++){
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:self.color size:CGSizeMake(3, 3)];
        [sprite setAlpha:0];
        [self.scene addChild:sprite];
        [sprite setPosition:self.position];
        [tail addObject:sprite];
    }
}

-(void) increment{
    self.position = CGPointMake(noise1(tx)*self.scene.size.width + self.scene.size.width/2.0,
                                noise1(ty)*self.scene.size.height + self.scene.size.height/2.0);
    tx+=STEP;
    ty-=STEP;
    [self incrementTail];
}

-(void) incrementTail{
    [tail[iTail] setPosition:self.position];
    [tail[iTail] setAlpha:1.0];
    for(SKSpriteNode *sprite in tail)
        [sprite setAlpha:sprite.alpha-1.0/TAILLENGTH];
    iTail++;
    if (iTail ==TAILLENGTH)
        iTail = 0;
}
@end
