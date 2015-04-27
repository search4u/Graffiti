//
//  ViewController.m
//  Graffiti
//
//  Created by bottle on 15-4-27.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "ViewController.h"
#import "HellenView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet HellenView *imageView;
- (IBAction)back;
- (IBAction)clear;
- (IBAction)save;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)back {
    [self.imageView back];
}

- (IBAction)clear {
    [self.imageView clear];
}

- (IBAction)save {
    [self.imageView save];
}
@end
