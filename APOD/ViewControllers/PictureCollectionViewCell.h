//
//  PictureCollectionViewCell.h
//  APOD
//
//  Created by Humberto Monterrosa on 18/12/21.
//

#import <UIKit/UIKit.h>
#import "../Domain/Models/AstronomyPicture.h"

NS_ASSUME_NONNULL_BEGIN

@interface PictureCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) AstronomyPicture * astronomyPicture;

- (void)setData:(AstronomyPicture *)astronomyPicture;

@end

NS_ASSUME_NONNULL_END
