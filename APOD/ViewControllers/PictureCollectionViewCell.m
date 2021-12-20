//
//  PictureCollectionViewCell.m
//  APOD
//
//  Created by Humberto Monterrosa on 18/12/21.
//

#import "PictureCollectionViewCell.h"
#import "UIKit+AFNetworking.h"

@interface PictureCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;
-(void) animate;
@end

@implementation PictureCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setData:(AstronomyPicture *)astronomyPicture{
    [self setAstronomyPicture:astronomyPicture];
    UIImage * placeholder = [UIImage imageNamed:@"placeholder"];
    //[self.image setImageWithURL:[NSURL URLWithString:astronomyPicture.thumbnail] placeholderImage:placeholder];
    
    [self.image setImageWithURLRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:astronomyPicture.thumbnail]] placeholderImage:placeholder success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.image.image = image;
        [self animate];
        
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
    [self.date setText:astronomyPicture.date];
}

- (void)animate{
    CABasicAnimation *anim = [[CABasicAnimation alloc] init];
    anim.keyPath = @"opacity";
    anim.fromValue = @0.0;
    anim.toValue = @1.0;
    anim.duration = 0.5;
    anim.removedOnCompletion = NO;
    
    [self.image.layer addAnimation:anim forKey:@"opacity"];
}

@end
