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

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewController;
@property (nonatomic, strong) NSArray<AstronomyPicture *> * data;
@property (nonatomic, strong) NSString * startDate;
@property (nonatomic, strong) NSString * endDate;

- (void) initialize;
@end

@implementation HomeViewController

- (void)initialize{
    [self setTitle:@"APOD"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *today = [NSDate date];
    [self setEndDate:[formatter stringFromDate:today]];
    NSLog(@"%@", self.endDate);
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDate * lastweek = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:today options:0];
    
    [self setStartDate:[formatter stringFromDate:lastweek]];  

}
- (IBAction)showImageDay:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    
    [[self collectionViewController] setDelegate: self];
    [[self collectionViewController] setDataSource: self];
    
    
    RetrievePicturesWeek * retrievePictureWeek = [RetrievePicturesWeek sharedIntance];
    [retrievePictureWeek getPicturesFrom:self.startDate until:self.endDate onSuccess:^(NSArray<AstronomyPicture *> * _Nonnull response) {
        [self setData:response];
        [[self collectionViewController] reloadData];
    } onFailure:^(NSError * _Nonnull error) {
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
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    if(screenWidth >= 768){
        itemXLine = 4.0;
    }
    float cellWidth = screenWidth / itemXLine;
    return CGSizeMake(cellWidth, cellWidth);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Seleccionaste item index %@",indexPath);
    PreviewViewController *preview = [[PreviewViewController alloc] initWithNibName:@"PreviewViewController" bundle:nil];
    [preview setAstronomyPicture:[self.data objectAtIndex:indexPath.row]];
    [self.navigationController presentViewController:preview animated:TRUE completion:nil];
}

@end
