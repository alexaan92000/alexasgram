//
//  HomeFeedViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/9/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "HomeFeedViewController.h"
#import "Parse/Parse.h"
#import "PostTableViewCell.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"

@interface HomeFeedViewController ()
    
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (weak, nonatomic) NSMutableArray *posts;
    @property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //start spining
    // Initialize a UIRefreshControl
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    // [self beginRefresh:nil];
}

    
    // Makes a network request to get updated data
    // Updates the tableView with the new data
    // Hides the RefreshControl
- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            //            // do something with the array of object returned by the call assign posts to array we made so can keep it
            //            //            [self.tableView reloadData];
            //
            //            [self.tableView reloadData];
            //            // Tell the refreshControl to stop spinning
            //            [refreshControl endRefreshing];
            self.posts = [NSMutableArray arrayWithArray:posts];
            
            
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}
        


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.posts[indexPath.row];
    // cell.theCaption.text = post[@"caption"];
    
//    NSString* URL = post.image.url;
//    NSURL* NURL = [NSURL URLWithString:URL];
//    [cell.thePicture setImageWithURL:NURL];
//
    
    
    return cell;
}
    
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.posts.count;
    return self.posts.count;
}
    
    
    @end
