//
//  Adventurer.m
//  Walker
//
//  Created by Robby Kraft on 10/28/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "Adventurer.h"
#import "noise.h"

@interface Adventurer (){
    float BORDER;
    float tx, ty;
    float STEP;
    float velocity[2];
    float acceleration[2];

    NSMutableArray *tail;
    NSInteger iTail;
}
@end

@implementation Adventurer
-(id)init{
    self = [super initWithTexture:nil color:[UIColor redColor] size:CGSizeMake(3, 3)];
    if(self){
        tx = arc4random()%100/100.0;
        ty = tx+arc4random()%100/100.0;
        STEP = .02;
        BORDER = 100;
        [self initTail];
    }
    return self;
}

-(void) increment{
    acceleration[0] = noise1(tx);
    acceleration[1] = noise1(ty);

    if(self.position.x < BORDER){
        velocity[0]*=.95;
        if(acceleration[0] < 0)
            acceleration[0] = -acceleration[0];
    }
    if(self.position.x > self.scene.size.width-BORDER){
        velocity[0]*=.95;
        if(acceleration[0] > 0)
            acceleration[0] = -acceleration[0];
    }
    if(self.position.y < BORDER){
        velocity[1]*=.95;
        if(acceleration[1] < 0)
            acceleration[1] = -acceleration[1];
    }
    if(self.position.y > self.scene.size.height-BORDER){
        velocity[1]*=.95;
        if(acceleration[1] > 0)
            acceleration[1] = -acceleration[1];
    }
    velocity[0] += acceleration[0];
    velocity[1] += acceleration[1];
    self.position = CGPointMake(self.position.x + velocity[0],
                                self.position.y + velocity[1]);
    tx+=STEP;
    ty-=STEP;
    [self incrementTail];
}
@end
