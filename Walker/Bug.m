//
//  Bug.m
//  Walker
//
//  Created by Robby Kraft on 10/28/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "Bug.h"
#import "noise.h"

@interface Bug (){
    float tx, ty;
    float STEP;
}
@end

@implementation Bug

-(id)init{
    self = [super initWithTexture:nil color:[UIColor yellowColor] size:CGSizeMake(3, 3)];
    if(self){
        tx = arc4random()%100/100.0;
        ty = tx+arc4random()%100/100.0;
        STEP = .02;
    }
    return self;
}

-(void) increment{
    self.position = CGPointMake(noise1(tx)*self.scene.size.width + self.scene.size.width/2.0,
                                noise1(ty)*self.scene.size.height + self.scene.size.height/2.0);
    tx+=STEP;
    ty-=STEP;
}
@end
