//
//  NoticeTableViewCell.m
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/21/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import "NoticeTableViewCell.h"
#import "NoticeResponse.h"
#import "NoticeTableViewDelegate.h"

@implementation NoticeTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
//    title.layer.borderWidth = 2
//    title.layer.masksToBounds = false
//    title.layer.borderColor = UIColor.white.cgColor
//    title.layer.cornerRadius = (title.frame.width+title.frame.height)/4
//    title.clipsToBounds = true

    self.lblNotice.layer.cornerRadius = (self.lblNotice.frame.size.width+self.lblNotice.frame.size.height)/4;
    self.lblNotice.clipsToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setData:(NTNoticeList *)data{
//    NSString *firstLetter = [data.title substringToIndex:data.title.length];
    NSString *lastLetter = [data.title substringWithRange:NSMakeRange(data.title.length-1, 1)];
    self.lblNotice.text = lastLetter;
    self.lblTitle.text = data.title;
    self.lblBrief.text = data.brief;
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:data.filesource];
    [attributeString addAttribute:NSUnderlineStyleAttributeName
                            value:[NSNumber numberWithInt:1]
                            range:(NSRange){0,[attributeString length]}];
    
    self.lblFileSource.attributedText = attributeString;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickFileSource)];
    [self.lblFileSource addGestureRecognizer:tapGesture];
}

-(void)onClickFileSource{
    [self.delgate clickOnFileSource:self.lblFileSource.text];
}
@end
