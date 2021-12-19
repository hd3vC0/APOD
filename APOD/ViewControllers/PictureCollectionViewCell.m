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
@end

@implementation PictureCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setData:(AstronomyPicture *)astronomyPicture{
    [self setAstronomyPicture:astronomyPicture];
    UIImage * placeholder = [UIImage imageNamed:@"placeholder"];
    [self.image setImageWithURL:[NSURL URLWithString:astronomyPicture.thumbnail] placeholderImage:placeholder];
    [self.date setText:astronomyPicture.date];
}

@end
