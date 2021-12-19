//
//  PreviewViewController.m
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import "PreviewViewController.h"
#import "UIKit+AFNetworking.h"

@interface PreviewViewController ()
- (IBAction)closeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *textDescription;
@property (weak, nonatomic) IBOutlet UILabel *textTitle;

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *placeholder = [UIImage imageNamed:@"placeholder"];
    [self.imagePreview setImageWithURL:[NSURL URLWithString:self.astronomyPicture.picture] placeholderImage:placeholder];
    [self.date setText:self.astronomyPicture.date];
    [self.textDescription setText:self.astronomyPicture.textDescription];
    [self.textTitle setText:self.astronomyPicture.title];
}

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
@end
