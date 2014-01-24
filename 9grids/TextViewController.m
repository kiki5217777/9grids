//
//  TextViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/27.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    scrollView.contentSize = CGSizeMake(320, 960);
    [self.view addSubview:scrollView];
    
    NSString *text = @"胖達人的麵包熱銷、門市不時有顧客大排長龍的景象卻在一夕之間變調！一名香港部落客日前在網路上貼文，踢爆胖達人使用人工香精，台北市衛生局於8月23日公布稽查結果，證實業者使用9種人工香料，顯然與「採用天然素材、不含化學合成添加改良劑」的訴求相違背，依《食品衛生管理法》開罰18萬元。而新北市政府也發現，業者號稱使用天然酵母，但其中有兩款酵母其實也含有化學添加物質。";
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    //UILabel *textView = [[UILabel alloc]init];
    [textView setFont:[UIFont fontWithName:@"ArialMT" size:30]];
    [textView setTextAlignment:NSTextAlignmentJustified];
    [textView setText:text];
    [textView setEditable:NO];
    
    [scrollView addSubview:textView];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
