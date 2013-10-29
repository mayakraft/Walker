//
//  Explorer.m
//  Walker
//
//  Created by Robby Kraft on 10/28/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "Explorer.h"
#import "noise.h"

@interface Explorer (){
    float tx, ty;
    float STEP;
    float velocity[2];
    
    NSMutableArray *tail;
    NSInteger iTail;
}

@end

@implementation Explorer

-(id)init{
    self = [super initWithTexture:nil color:[UIColor orangeColor] size:CGSizeMake(3, 3)];
    if(self){
        tx = arc4random()%100/100.0;
        ty = tx+arc4random()%100/100.0;
        STEP = .02;
    }
    return self;
}

-(void) increment{
    velocity[0] = .05*noise1(tx)*self.scene.size.width;
    velocity[1] = .05*noise1(ty)*self.scene.size.height;
    self.position = CGPointMake(self.position.x + velocity[0],
                                self.position.y + velocity[1]);
    tx+=STEP;
    ty-=STEP;
    [self incrementTail];
}
@end
