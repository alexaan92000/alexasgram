//
//  PostingViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/10/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "PostingViewController.h"
#import "Post.h"
#import "Parse/Parse.h"

@interface PostingViewController ()

//setting properties for what I need to use
    @property (weak, nonatomic) IBOutlet UITextField *caption;
    @property (weak, nonatomic) IBOutlet UIImageView *postImageView;
    
@end

@implementation PostingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//Action when you tap on the tap here to post a picture
- (IBAction)DidTap:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    //if it works or doesn't it'll tell us
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}
    
    //button that does the act of actually posting the picture to the home feed
- (IBAction)post:(id)sender {

//calling the postUserImage
[Post postUserImage:_postImageView.image withCaption:_caption.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (error != nil){
            NSLog(@"%@", error);
        }
        else{
            NSLog(@"success");
            [self.tabBarController setSelectedIndex:0];
        }
    }];
}
    

//The method to chose the picture you want from the camera roll
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    //edited image is the resizing of the image
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    [self.postImageView setImage:editedImage];


    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}
    //what we are using to resize the picture
- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//

@end
