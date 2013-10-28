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
    self = [super initWithTexture:nil color:[UIColor greenColor] size:CGSizeMake(3, 3)];
    if(self){
        tx = arc4random()%100;
        ty = arc4random()%100+100;
        STEP = .02;
    }
    return self;
}

-(void) increment{
    self.position = CGPointMake(noise1(tx)*.02*self.scene.size.width + self.position.x, noise1(ty)*.02*self.scene.size.height + self.position.y);
    tx+=STEP;
    ty+=STEP;
}
@end
