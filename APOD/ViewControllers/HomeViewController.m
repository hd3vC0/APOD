//
//  HomeViewController.m
//  APOD
//
//  Created by Humberto Monterrosa on 16/12/21.
//

#import "HomeViewController.h"
#import "../Domain/UseCases/RetrievePicturesWeek.h"
#import "UIKit+AFNetworking.h"
#import "../ViewControllers/PictureCollectionViewCell.h"
#import "PreviewViewController.h"
#import "../Domain/UseCases/RetrievePictureDay.h"
#import "DatePickerViewController.h"


@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewController;
@property (nonatomic, strong) NSArray<AstronomyPicture *> * data;
@property (nonatomic, strong) NSDate *today;
@property (nonatomic, strong) NSString * startDate;
@property (nonatomic, strong) NSString * endDate;
@property (nonatomic, strong) NSDateFormatter * formatter;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

- (void) initialize;
- (void) showPreview:(AstronomyPicture *)astronomyPicture;
- (void) getPictureOfDay:(NSString *)day;
@end

@implementation HomeViewController

- (void)initialize{    
    [self setTitle:@"APOD"];
    self.formatter = [[NSDateFormatter alloc]init];
    [self.formatter setDateFormat:@"yyyy-MM-dd"];
    self.today = [NSDate date];
    [self setEndDate:[self.formatter stringFromDate:self.today]];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDate * lastweek = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:self.today options:0];
    
    [self setStartDate:[self.formatter stringFromDate:lastweek]];

}

- (void)getPictureOfDay:(NSString *)date {
    RetrievePictureDay *retrievePictureDay = [RetrievePictureDay sharedIntance];
    [retrievePictureDay getPictureOfDay:date onSuccess:^(AstronomyPicture * _Nonnull response) {
        
        [self showPreview:response];
        
        } onFailure:^(NSError * _Nonnull error) {
            NSLog(@" Error:\n %@", error);
        }];
}

- (IBAction)showImageDay:(id)sender {
    
    DatePickerViewController *datePicker = [[DatePickerViewController    alloc] initWithNibName:@"DatePickerViewController" bundle:nil];
    datePicker.delegate = self;
    datePicker.maximunDate = self.today;
    [self.navigationController presentViewController:datePicker animated:TRUE completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    
    [[self collectionViewController] setDelegate: self];
    [[self collectionViewController] setDataSource: self];
    
    
    RetrievePicturesWeek * retrievePictureWeek = [RetrievePicturesWeek sharedIntance];
    [retrievePictureWeek getPicturesFrom:self.startDate until:self.endDate onSuccess:^(NSArray<AstronomyPicture *> * _Nonnull response) {
        [self.indicator setHidden:TRUE];
        [self setData:response];
        [[self collectionViewController] reloadData];
    } onFailure:^(NSError * _Nonnull error) {
        [self.indicator setHidden:TRUE];
        NSLog(@"%@", error);

    }];
    
    [self.collectionViewController registerNib:[UINib nibWithNibName:@"PictureCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CustomCell"];
    
    [self setTitle:@"APOD"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureCollectionViewCell * item = (PictureCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    [item setData:[self.data objectAtIndex:indexPath.row]];
    return item;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float itemXLine = 3.0;
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
   if(UIInterfaceOrientationIsLandscape(orientation)){
        screenWidth = screenRect.size.height;
    }
    
    if(screenWidth >= 768){
        itemXLine = 5.0;
    }
    float cellWidth = floorf(screenWidth / itemXLine);
    return CGSizeMake(cellWidth, cellWidth);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self showPreview:[self.data objectAtIndex:indexPath.row]];
    
}

- (void)showPreview:(AstronomyPicture *)astronomyPicture{
    PreviewViewController *preview = [[PreviewViewController alloc] initWithNibName:@"PreviewViewController" bundle:nil];
    [preview setAstronomyPicture:astronomyPicture];
    [self.navigationController presentViewController:preview animated:TRUE completion:nil];
}

- (void)onDone:(NSDate *)date {
    [self getPictureOfDay:[self.formatter stringFromDate:date]];
}
@end
