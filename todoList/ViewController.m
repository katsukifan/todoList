//
//  ViewController.m
//  todoList
//
//  Created by 张岳涛 on 19/2/16.
//  Copyright © 2019年 张岳涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    
    __weak IBOutlet UILabel *dateLabel;
    
    __weak IBOutlet UILabel *titleLabel;
    
    __weak IBOutlet UITextView *toDoTextView;
    
    NSUserDefaults *ud;
    
    NSMutableArray *title_array;
    
    NSMutableArray *sentence_array;
    
    NSMutableArray *timeArray;
    
    int pageCount;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ud = [NSUserDefaults standardUserDefaults];
    
    
    
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    title_array = [[NSMutableArray alloc] init];
    sentence_array = [[NSMutableArray alloc] init];
    timeArray = [[NSMutableArray alloc] init];
    
    
    NSArray* array1 = [ud arrayForKey:@"title"];
    for ( NSString* object in array1) {
        [title_array addObject:object];
    }
    
    NSArray* array2 = [ud arrayForKey:@"sentence"];
    for ( NSString* object in array2) {
        [sentence_array addObject:object];
    }
    
    NSArray* array3 = [ud arrayForKey:@"time"];
    for ( NSString* object in array3) {
        [timeArray addObject:object];
    }
    
    
}


- (IBAction)next:(id)sender {
    
    if (title_array.count == 0) {
        
        // コントローラを生成
        UIAlertController *ac =
        [UIAlertController alertControllerWithTitle:@"ToDoが登録されていません"
                                            message:@"ToDoを登録してください"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        //キャンセル用のボタンとアクションを生成
        UIAlertAction *cancel =
        [UIAlertAction actionWithTitle:@"キャンセル"
                                 style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {
                                   // ボタンタップ時の処理
                                   
                                   
                               }];
        
        [ac addAction:cancel];
        
        // アラートを呼び出す
        [self presentViewController:ac animated:YES completion:nil];
        
    }
    
    
    
    
    else if (title_array.count>=pageCount) {
        
        pageCount = pageCount + 1;
        
        if (title_array.count<pageCount) {
            
            pageCount = 1;
            titleLabel.text = [title_array objectAtIndex:0];
            dateLabel.text = [timeArray objectAtIndex:0];
            toDoTextView.text = [sentence_array objectAtIndex:0];
            
            
        }else{
            
            titleLabel.text = [title_array objectAtIndex:pageCount-1];
            dateLabel.text = [timeArray objectAtIndex:pageCount-1];
            toDoTextView.text = [sentence_array objectAtIndex:pageCount-1];
        }
        
    }
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
