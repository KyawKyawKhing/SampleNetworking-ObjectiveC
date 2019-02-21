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

@interface HomeViewController ()

@end

@implementation HomeViewController
NSMutableArray *noticeList = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    noticeList = [[NSMutableArray alloc]init];
    
    self.tvNotice.dataSource = self;
    self.tvNotice.delegate = self;
    
    self.tvNotice.estimatedRowHeight = 100;
    self.tvNotice.rowHeight = UITableViewAutomaticDimension;
    [self.tvNotice registerNib:[UINib nibWithNibName:@"NoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NoticeTableViewCell"];
    
    Utils *util = [[Utils alloc]init];
    self.title = [NSString stringWithFormat:@"Welcome %@",self.name];
    
    NSString *urlString = @"https://api.myjson.com/bins/1bsqcn/";
    NSDictionary *dictData = [NetworkManager parseJsonResponse:urlString];
    if (dictData) {
        [util showAlert:self title:@"success" andMessage:@"successfully loaded"];
        
        NSLog(@"Notice Count : %lu", (unsigned long)dictData.count);
        
        
        for (NSDictionary* data in dictData) {
            NTNoticeList *notice = [[NTNoticeList alloc]init];
            notice.identifier = data[@"id"];
            notice.title = data[@"title"];
            notice.brief = data[@"brief"];
            notice.filesource = data[@"filesource"];
            [noticeList addObject:notice];
        }
        [self.tvNotice reloadData];
//        for (int i=0; i<noticeList.count; i++) {
//            NTNoticeList *notice = [[NTNoticeList alloc]init];
//            notice = [noticeList objectAtIndex:i];
//            NSLog(@"Title : %@",notice.title);
//        }
    }
    else
    {
        [util showAlert:self title:@"failure" andMessage:@"cann't get data"];
    }
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
