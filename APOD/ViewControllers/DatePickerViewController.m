//
//  DatePickerViewController.m
//  APOD
//
//  Created by Humberto Monterrosa on 19/12/21.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (IBAction)onDone:(id)sender {
    [self.delegate onDone:self.datePicker.date];
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
- (IBAction)onCancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.maximunDate!=nil){
        [self.datePicker setMaximumDate:self.maximunDate];
    }
    
    if(self.minimunDate!=nil){
        [self.datePicker setMinimumDate:self.minimunDate];
    }
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
