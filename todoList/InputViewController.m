//
//  InputViewController.m
//  todoList
//
//  Created by 张岳涛 on 19/2/16.
//  Copyright © 2019年 张岳涛. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController

{
    
    __weak IBOutlet UITextField *inputTitle;
    
    __weak IBOutlet UITextView *inputText;
    
    NSUserDefaults *ud;
    
    NSMutableArray *titleArray;
    
    NSMutableArray *sentenceArray;
    
    NSMutableArray *dateArray;
    
    NSMutableArray *timeArray;
    
    NSString *timeResult;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)save:(id)sender {
    
    titleArray = [[NSMutableArray alloc] init];
    
    sentenceArray = [[NSMutableArray alloc] init];
    
    timeArray = [[NSMutableArray alloc] init];
    
    ud = [NSUserDefaults standardUserDefaults];
    
    
    if ([inputTitle.text isEqualToString:@""]||[inputText.text isEqualToString:@""]) {
        
        //空の場合は何もしない
        
        
    }else
        
    {
        //取り出し
        
        NSArray* array1 = [ud arrayForKey:@"title"];
        for ( NSString* object in array1)
            [titleArray addObject:object];
        
        NSArray* array2 = [ud arrayForKey:@"sentence"];
        for ( NSString* object in array2 ) {
            [sentenceArray addObject:object];
        }
        
        NSArray* array3 = [ud arrayForKey:@"time"];
        for ( NSString* object in array3) {
            [timeArray addObject:object];
        }
        
        [self getData];
        
        //保存
        [titleArray addObject:inputTitle.text];
        [sentenceArray addObject:inputText.text];
        [timeArray addObject:timeResult];
        
        //保存
        [ud setObject:titleArray forKey:@"title"];
        [ud setObject:sentenceArray forKey:@"sentence"];
        [ud setObject:timeArray forKey:@"time"];
        
        NSLog(@"タイトル　%@",[ud arrayForKey:@"title"]);
        NSLog(@"本文　　%@",[ud arrayForKey:@"sentence"]);
        NSLog(@"时间　　%@",[ud arrayForKey:@"time"]);
        
        
    }
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
}



-(void)getData {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [ calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:date];
    
    NSString *year_string = [NSString stringWithFormat:@"%ld年",(long)[ dateComps year]];
    NSString *month_string = [NSString stringWithFormat:@"%ld月",(long)[dateComps month]];
    NSString *day_string = [NSString stringWithFormat:@"%ld日",(long)[dateComps day]];
    NSString *hour_string = [NSString stringWithFormat:@"%ld：",(long)[dateComps hour]];
    NSString *minute_string = [NSString stringWithFormat:@"%ld",(long)[dateComps minute]];
    
    NSString *val1 = [year_string stringByAppendingString:month_string];
    NSString *val2 = [val1 stringByAppendingString:day_string];
    NSString *val3 = [val2 stringByAppendingString:hour_string];
    NSString *val4 = [val3 stringByAppendingString:minute_string];
    
    timeResult = val4;
    
    
    
    
    
}

    
// タッチイベントを取る
-  (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
        
        [inputTitle resignFirstResponder];
        [inputText resignFirstResponder];
        
    }    
    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
