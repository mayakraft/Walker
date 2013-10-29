//
//  Dragonfly.m
//  Walker
//
//  Created by Robby Kraft on 10/28/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "Dragonfly.h"
#import "noise.h"

@interface Dragonfly (){
    float STEP;
    CGPoint target;
    CGPoint path;
    CGPoint velocity;
    float distance;
    int pause;
    float maxSpeed;
    NSInteger maxDistance;
    NSInteger maxPause;
}

@end

@implementation Dragonfly

-(id)init{
    self = [super initWithTexture:nil color:[UIColor greenColor] size:CGSizeMake(3, 3)];
    if(self){
        STEP = .02f;
        pause = 50;
        maxSpeed = 10.0f;
        maxDistance = 150;
        maxPause = 100;
    }
    return self;
}

-(void) increment{
    if(!pause){
        self.position = CGPointMake(self.position.x+velocity.x, self.position.y+velocity.y);
        if(fabsf(target.x-self.position.x) < maxSpeed && fabsf(target.y-self.position.y) < maxSpeed){
            pause = arc4random()%maxPause + maxPause/2.0;
        }
    }
    else{
        pause--;
        if(!pause){
            do {
                float a = arc4random()%1000/1000.0*M_PI*2.0;
                NSInteger d = arc4random()%maxDistance+ maxDistance/2.0;
                target = CGPointMake(self.position.x+d*cosf(a), self.position.y+d*sinf(a));
            } while (!(target.x > 0 && target.x < self.scene.size.width && target.y > 0 && target.y < self.scene.size.height));
            
            path = CGPointMake(target.x-self.position.x, target.y-self.position.y);
            distance = sqrtf(path.x*path.x + path.y*path.y);
            float angle = atan2f(path.y, path.x);
            velocity = CGPointMake(maxSpeed*cosf(angle), maxSpeed*sinf(angle));
        }
    }
}

@end
