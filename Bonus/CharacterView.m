//
//  CharacterView.m
//  Bonus
//
//  Created by stevie nguyen on 3/31/13.
//  Copyright (c) 2013 tung nguyen. All rights reserved.
//

#import "CharacterView.h"

@implementation CharacterView

NSMutableArray* slash1;
NSMutableArray* slash2;
NSMutableArray* slash3;
NSMutableArray* jumpSlash1;
NSMutableArray* jumpSlash2;
UIImage* normalState;
UIImage* jump11;
UIImage* jump12;
int indexCount;
BOOL isJumpSlash1;
BOOL isJumpSlash2;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)init{
    if (self = [super init]) {
        slash1 = [NSMutableArray new];
        slash2 = [NSMutableArray new];
        slash3 = [NSMutableArray new];
        jumpSlash1 = [NSMutableArray new];
        jumpSlash2 = [NSMutableArray new];
        normalState = [UIImage imageNamed:@"normal"];
        jump11 = [UIImage imageNamed:@"jump11"];
        jump12 = [UIImage imageNamed:@"jump12"];
        for (int i = 0; i < 7; i++) {
            [slash1 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"groundSlash1000%d",i+1]]];
            [slash2 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"groundSlash2000%d",i+1]]];
        }
        for (int i = 0; i < 6; i++) {
            [slash3 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"groundSlash3000%d",i+1]]];
            [jumpSlash2 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"jumpSlash2000%d",i+1]]];
        }
        for (int i = 0; i < 5; i++) {
            [jumpSlash1 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"jumpSlash1000%d",i+1]]];
        }
        isJumpSlash1 = NO;
        isJumpSlash2 = NO;
        self.status = NORMAL;
    }
    [self setFrame: CGRectMake(0, 0, 300, 300)];
    self.image = normalState;
    self.center = CGPointMake(160, 250);
    indexCount = 0;
    return self;
}
- (void) updateMove{
    if (self.status == SLASH1) {
        self.image = slash1[indexCount++];
        if (indexCount > 6) {
            indexCount = 0;
            self.status = NORMAL;
        }
    }
    else if (self.status == SLASH2){
        self.image = slash2[indexCount++];
        if (indexCount >6) {
            indexCount = 0;
            self.status = NORMAL;
        }
    }
    else if (self.status == SLASH3){
        self.image = slash3[indexCount++];
        if (indexCount >5) {
            indexCount = 0;
            self.status = NORMAL;
        }
    }
    else if (self.status == NORMAL) {
        self.image = normalState;
    }
    else if (self.status == JUMP11){
        if (isJumpSlash2) {
            isJumpSlash1 = NO;
            self.image = jumpSlash2[indexCount++];
            if (indexCount > 5){
                indexCount = 0;
                isJumpSlash2 = NO;
            }
        }

        else if (isJumpSlash1){
            self.image = jumpSlash1[indexCount++];
            if (indexCount > 4){
                indexCount = 0;
                isJumpSlash1 = NO;
            }
        }
        else{
            self.image = jump11;
        }
        self.center = CGPointMake(self.center.x, self.center.y - 20);
        if (self.center.y < 100){
            self.status = JUMP12;
        }
    }
    else if (self.status == JUMP12){
        if (isJumpSlash2) {
            isJumpSlash1 = NO;
            self.image = jumpSlash2[indexCount++];
            if (indexCount > 5){
                indexCount = 0;
                isJumpSlash2 = NO;
            }
        }
        else if (isJumpSlash1){
            self.image = jumpSlash1[indexCount++];
            if (indexCount > 4){
                indexCount = 0;
                isJumpSlash1 = NO;
            }
        }
        else{
            self.image = jump12;
        }
        if (isJumpSlash2) {
            self.center = CGPointMake(self.center.x, self.center.y +1);
        }
        else{
            self.center = CGPointMake(self.center.x, self.center.y +20);
        }
        if (self.center.y > 250){
            self.status = NORMAL;
            indexCount= 0;
            isJumpSlash1 = NO;
            isJumpSlash2 = NO;
            self.center = CGPointMake(self.center.x, 250);
        }
    }
}
- (void) jump{
    if (self.status == NORMAL) {
        self.status = JUMP11;
    }
}
- (void) slash{
    if (self.status == NORMAL) {
        self.status = SLASH1;
    }
    else if (self.status == SLASH1){
        self.status = SLASH2;
        indexCount = 0;
    }
    else if (self.status == SLASH2){
        self.status = SLASH3;
        indexCount = 0;
    }
    else if (self.status == JUMP11 || self.status == JUMP12){
        if (isJumpSlash1) {
            isJumpSlash2 = YES;
            indexCount = 0;
            isJumpSlash1 = NO;
        }
        else{
            isJumpSlash1 = YES;
        }
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
