//
//  NoticeResponse.h
//  BasicUIComponentOne
//
//  Created by AcePlus101 on 2/20/19.
//  Copyright © 2019 AcePlus. All rights reserved.
//

#ifndef NoticeResponse_h
#define NoticeResponse_h
@class NTNoticeResponse;
@class NTNoticeList;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface NTNoticeResponse : NSObject
@property (nonatomic, assign) BOOL isSuccess;
@property (nonatomic, copy)   NSArray<NTNoticeList *> *noticeList;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface NTNoticeList : NSObject
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *brief;
@property (strong, nonatomic) NSString *filesource;
@end

NS_ASSUME_NONNULL_END


#endif /* NoticeResponse_h */
