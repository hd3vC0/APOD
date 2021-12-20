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
@property (weak, nonatomic) IBOutlet UIStackView *downloadIndicator;

- (void)imageDownloadCompleted;
@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *placeholder = [UIImage imageNamed:@"placeholder"];
    //[self.imagePreview setImageWithURL:[NSURL URLWithString:self.astronomyPicture.picture] placeholderImage:placeholder];
    
    [self.imagePreview setImageWithURLRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.astronomyPicture.thumbnail]] placeholderImage:placeholder success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [self imageDownloadCompleted];
        self.imagePreview.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {        
        [self imageDownloadCompleted];
    }];
    [self.date setText:self.astronomyPicture.date];
    [self.textDescription setText:self.astronomyPicture.textDescription];
    [self.textTitle setText:self.astronomyPicture.title];
}

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(void)imageDownloadCompleted{
    [self.downloadIndicator setHidden:TRUE];
}
@end
