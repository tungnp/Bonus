//
//  CharacterView.h
//  Bonus
//
//  Created by stevie nguyen on 3/31/13.
//  Copyright (c) 2013 tung nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#define NORMAL 0
#define SLASH1 1
#define SLASH2 2
#define SLASH3 3
#define JUMP11 4
#define JUMP12 5

@interface CharacterView : UIImageView
@property (nonatomic) int status;
- (void) updateMove;
- (void) slash;
- (void) jump;
@end
