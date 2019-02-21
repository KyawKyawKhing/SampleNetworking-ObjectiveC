//
//  NoticeResponse.m
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/20/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoticeResponse.h"

//@implementation NTNoticeResponse
//@dynamic isSuccess;
//@end

@implementation NTNoticeList
@synthesize identifier = _identifier;
@synthesize title = _title ;
@synthesize brief = _brief;
@synthesize filesource = _filesource;

//Setter method
- (void)setIdentifier:(NSString *)identifier{
    _identifier = identifier;
}
- (void)setTitle:(NSString *)title{
    _title = title;
}
- (void)setBrief:(NSString *)brief{
    _brief = brief;
}
- (void)setFilesource:(NSString *)filesource{
    _filesource = filesource;
}

//Getter Method
- (NSString *)identifier{
    return _identifier;
}
- (NSString *)title{
    return _title;
}
- (NSString *)brief{
    return _brief;
}
- (NSString *)filesource{
    return _filesource;
}
@end
