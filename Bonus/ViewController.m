//
//  ViewController.m
//  Bonus
//
//  Created by stevie nguyen on 3/30/13.
//  Copyright (c) 2013 tung nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

CharacterView* characterView;

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    characterView = [[CharacterView alloc]init];
    [self.view addSubview: characterView];
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:0.04
                                                      target:characterView
                                                    selector:@selector(updateMove)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slash:(id)sender {
    [characterView slash];
}
- (IBAction)jump:(id)sender {
    [characterView jump];
}

@end
