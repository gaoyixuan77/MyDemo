//
//  StartImageViewController.m
//  3GShare
//
//  Created by Eleven on 2023/7/20.
//

#import "StartImageViewController.h"

@interface StartImageViewController ()

@end

@implementation StartImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"start.jpg"]];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
