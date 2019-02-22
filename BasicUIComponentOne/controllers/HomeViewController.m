//
//  HomeViewController.m
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/20/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import "HomeViewController.h"
#import "NetworkManager.h"
#import "Utils.h"
#import "NoticeResponse.h"
#import "NoticeTableViewCell.h"
#import "AMTumblrHud.h"
#import "UIScrollView+EmptyDataSet.h"


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface HomeViewController ()

@end

@implementation HomeViewController
NSMutableArray *noticeList = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"Welcome %@",self.name];
    
    //initialize empty view
    self.tvNotice.emptyDataSetSource = self;
    self.tvNotice.emptyDataSetDelegate = self;
    
    // A little trick for removing the cell separators
    self.tvNotice.tableFooterView = [UIView new];
    
    //initialize loading view
//    self.view.backgroundColor = UIColorFromRGB(0x34465C);
//
//    AMTumblrHud *tumblrHUD = [[AMTumblrHud alloc] initWithFrame:CGRectMake((CGFloat) ((self.view.frame.size.width - 55) * 0.5),(CGFloat) ((self.view.frame.size.height - 20) * 0.5), 55, 20)];
//    tumblrHUD.hudColor = UIColorFromRGB(0xF1F2F3);
//    [self.view addSubview:tumblrHUD];
//    [tumblrHUD showAnimated:YES];
    
    noticeList = [[NSMutableArray alloc]init];
    
    self.tvNotice.dataSource = self;
    self.tvNotice.delegate = self;
    
    self.tvNotice.estimatedRowHeight = 100;
    self.tvNotice.rowHeight = UITableViewAutomaticDimension;
    [self.tvNotice registerNib:[UINib nibWithNibName:@"NoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NoticeTableViewCell"];
    
    
    Utils *util = [[Utils alloc]init];
    
    NSString *urlString = @"https://api.myjson.com/bins/1bsqcn/";
//    NSDictionary *dictData = [NetworkManager parseJsonResponse:urlString];
    [NetworkManager parseJsonResponse:urlString completion:^(NSDictionary *dictData) {
        if (dictData) {
            NSLog(@"Notice Count : %lu", (unsigned long)dictData.count);
            for (NSDictionary* data in dictData) {
                NTNoticeList *notice = [[NTNoticeList alloc]init];
                notice.identifier = data[@"id"];
                notice.title = data[@"title"];
                notice.brief = data[@"brief"];
                notice.filesource = data[@"filesource"];
                [noticeList addObject:notice];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                 [tumblrHUD setHidden:true];
                [util showAlert:self title:@"success" andMessage:@"successfully loaded"];
                [self.tvNotice reloadData];
            });
        }
        else
        {
//            [tumblrHUD setHidden:false];
            [util showAlert:self title:@"failure" andMessage:@"cann't get data"];
        }
    }];
    
}
- (IBAction)onClickBackButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return noticeList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoticeTableViewCell" forIndexPath:indexPath];
    [cell setData:noticeList[indexPath.row]];
    cell.delgate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return UIColorFromRGB(0x34465C);
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityView startAnimating];
    return activityView;
}

//implement delegate
- (void)clickOnFileSource:(NSString *)filesource{
    NSLog(@"Filesource => %@ ",filesource);
    NSURL* url = [[NSURL alloc] initWithString: filesource];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}
@end
