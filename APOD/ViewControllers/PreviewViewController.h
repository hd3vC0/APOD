//
//  PreviewViewController.h
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import <UIKit/UIKit.h>
#import "../Domain/Models/AstronomyPicture.h"

NS_ASSUME_NONNULL_BEGIN

@interface PreviewViewController : UIViewController
@property (nonatomic, strong) AstronomyPicture *astronomyPicture;
@end

NS_ASSUME_NONNULL_END
