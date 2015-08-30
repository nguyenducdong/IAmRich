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
    
    [self zigzagwithCol:21 Row:5];

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGRect frameRuby = self.ruby.frame;
    float pointY = frameRuby.origin.y + frameRuby.size.height + 8;
//    NSLog(@"ruby's alpha = %1.0f", self.ruby.alpha);
    [UIView animateWithDuration:4 animations:^{
        self.ruby.alpha = 1;
//        NSLog(@"ruby's alpha = %1.0f", self.ruby.alpha);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            [self.verticalLabel_Constrant setConstant:pointY];
            self.iamrich.alpha = 1;
            [self.view layoutIfNeeded];
        } completion:nil];
    }];
}

- (void)zigzagwithCol:(int)nCol Row:(int)nRow{
    nRow--;
    NSMutableArray *ayy = [NSMutableArray array];
    int length = 2 * nRow;
    for (int col = 0; col < nCol; col++) {
        int index = col % length;
        [ayy addObject:@(index)];
    }
//    for (int row = 0; row <= nRow; row++) {
//        for (int col = 0; col < nCol; col++) {
//            if ([ayy[col] intValue] == row || [ayy[col] intValue] == length - row) printf("*");
//            else printf("-");
//        }
//        printf("\n");
//    }
    
    for (int row = 0; row <= nRow; row++) {
        for (int col = nCol - 1; col >= 0; col--) {
            if ([ayy[col] intValue] == row || [ayy[col] intValue] == length - row) printf("*");
            else printf(" ");
        }
        printf("\n");
    }
    
    
}


@end
