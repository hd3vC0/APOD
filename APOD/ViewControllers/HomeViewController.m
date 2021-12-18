//
//  HomeViewController.m
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import "HomeViewController.h"
#import "../Domain/UseCases/RetrievePicturesWeek.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RetrievePicturesWeek * retrievePictureWeek = [RetrievePicturesWeek sharedIntance];
    [retrievePictureWeek getPicturesFrom:@"2021-12-10" until:@"2021-12-18"];
    // Do any additional setup after loading the view from its nib.
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
