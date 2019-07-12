//
//  DetailsViewController.h
//  alexasgram
//
//  Created by alexamorales on 7/11/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UIImageView *detailPhoto;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

NS_ASSUME_NONNULL_END
