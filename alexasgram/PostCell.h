//
//  PostCell.h
//  alexasgram
//
//  Created by alexamorales on 7/11/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *theCaption;
@property (weak, nonatomic) IBOutlet UIButton *theLikes;
@property (weak, nonatomic) IBOutlet UIImageView *thePicture;

@end

NS_ASSUME_NONNULL_END
