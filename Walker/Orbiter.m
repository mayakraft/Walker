//
//  Orbiter.m
//  Walker
//
//  Created by Robby Kraft on 11/20/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "Orbiter.h"
#import "noise.h"

@interface Orbiter (){
    float ta, td;
    float STEP;
    float coords[2];  // [0]angle [1]distance
    float velocity;
    float acceleration;
    float radius;  // radius of orbit
    CGPoint center;
}

@end

@implementation Orbiter

-(id)init{
    self = [super initWithTexture:nil color:[UIColor purpleColor] size:CGSizeMake(3, 3)];
    if(self){
        ta = arc4random()%100/100.0;
        td = ta+arc4random()%1000/100.0;
        STEP = .02;
        if([[UIScreen mainScreen] bounds].size.width < [[UIScreen mainScreen] bounds].size.height)
            radius = [[UIScreen mainScreen] bounds].size.width*.4;
        else
            radius = [[UIScreen mainScreen] bounds].size.height*.4;
        center = CGPointMake([[UIScreen mainScreen] bounds].size.width*.5, [[UIScreen mainScreen] bounds].size.height*.5);
    }
    return self;
}

-(void) increment{
    acceleration = .01*noise1(ta);
    velocity += acceleration;
    coords[0] += velocity;
    coords[1] = radius+radius*.25*noise1(td);
    self.position = CGPointMake(center.x + coords[1]*sinf(coords[0]),
                                center.y + coords[1]*cosf(coords[0]));
    ta+=STEP;
    td-=STEP;
    [self incrementTail];
}
@end
