//
//  NoticeTableViewCell.h
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/21/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeResponse.h"
#import "NoticeTableViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoticeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblNotice;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblBrief;
@property (weak, nonatomic) IBOutlet UILabel *lblFileSource;

-(void)setData:(NTNoticeList *)data;

@property (weak) id<NoticeTableViewDelegate> delgate;

@end


NS_ASSUME_NONNULL_END
