//
//  ViewController.m
//  IAmRich
//
//  Created by Dong Nguyen Duc on 8/30/15.
//  Copyright (c) 2015 Dong Nguyen Duc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalLabel_Constrant;
@property (weak, nonatomic) IBOutlet UIImageView *ruby;
@property (weak, nonatomic) IBOutlet UILabel *iamrich;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ruby.alpha = 0;
    self.iamrich.alpha = 0;
            [self.verticalLabel_Constrant setConstant:-21.0f];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGRect frameRuby = self.ruby.frame;
    float pointY = frameRuby.origin.y + frameRuby.size.height + 8;
    NSLog(@"ruby's alpha = %1.0f", self.ruby.alpha);
    [UIView animateWithDuration:4 animations:^{
        self.ruby.alpha = 1;
        NSLog(@"ruby's alpha = %1.0f", self.ruby.alpha);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            [self.verticalLabel_Constrant setConstant:pointY];
            self.iamrich.alpha = 1;
            [self.view layoutIfNeeded];
        } completion:nil];
    }];
}

@end
