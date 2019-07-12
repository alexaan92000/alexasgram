//
//  DetailsViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/11/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "DetailsViewController.h"
#import "HomeFeedViewController.h"
#import "Parse/Parse.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailLabel.text = self.post.caption;
    
    NSString* URL = self.post.image.url;
    NSURL* NURL = [NSURL URLWithString:URL];
    [self.detailPhoto setImageWithURL:NURL];;
}

@end
