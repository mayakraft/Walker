//
//  MyScene.m
//  Walker
//
//  Created by Robby Kraft on 10/24/13.
//  Copyright (c) 2013 Robby Kraft. All rights reserved.
//

#import "MyScene.h"
#import "Bug.h"
#import "Dragonfly.h"

@interface MyScene (){
    NSMutableArray *walkers;
    CGFloat height, width;
}
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        walkers = [NSMutableArray array];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        Bug *walker;
        if(arc4random()%2)
            walker = [[Dragonfly alloc] init];
        else
            walker = [[Bug alloc] init];
        [walker setPosition:location];
        [walkers addObject:walker];
        [self addChild:walker];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    for(Dragonfly *walker in walkers){
        [walker increment];
    }
}

@end
