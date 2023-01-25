//
//  ViewController.m
//  iOS
//
//  Created by James Billingham on 23/06/2016.
//  Copyright © 2012-2016, JSONModel contributors. MIT licensed.
//

#import "ViewController.h"
#import <JSONModel/JSONModel.h>
#define TestLog( s, ... ) NSLog( @"[%@:%d] %@", [[NSString stringWithUTF8String:__FILE__] \
lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

@class TestModelData;
@class TestModelDataSubtitleTips;
@class TestModelDataHint;
@class TestModelDataPopUp;

@protocol TestModelDataSubtitleTips;

@interface TestModel: JSONModel
@property (nonatomic, strong) TestModelData *data;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSInteger status;
@end

@interface TestModelData: JSONModel
@property (nonatomic, copy) NSString *commentList;
@property (nonatomic, copy) NSString *draftComment;
@property (nonatomic, assign) BOOL forceClock;
@property (nonatomic, assign) NSInteger forceImgCnt;
@property (nonatomic, strong) TestModelDataHint *hint;
@property (nonatomic, strong) TestModelDataPopUp *popUp;
@property (nonatomic, assign) NSInteger popUpType;
@property (nonatomic, strong) NSArray<NSString *> *subtitleContent;
@property (nonatomic, strong) NSArray<TestModelDataSubtitleTips> *subtitleTips;
@end

@interface TestModelDataSubtitleTips: JSONModel
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *tips;
@end

@interface TestModelDataHint: JSONModel
@property (nonatomic, assign) BOOL canComment;
@property (nonatomic, assign) BOOL dailySubmitLimit;
@property (nonatomic, copy) NSString *message;
@end

@interface TestModelDataPopUp: JSONModel
@property (nonatomic, copy) NSString *buttonContent;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *linkContent;
@property (nonatomic, copy) NSString *linkUrl;
@property (nonatomic, copy) NSString *title;
@end

@implementation TestModel
+ (JSONKeyMapper*)keyMapper {
		 NSDictionary *dict = @{@"data": @"data",
													 @"message": @"message",
													 @"status": @"status"};

		 return [[JSONKeyMapper alloc]initWithModelToJSONBlock:^NSString *(NSString *keyName) {
				return dict[keyName]?:keyName;
		}];
 }

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
		return YES;
}
@end

@implementation TestModelData
+ (JSONKeyMapper*)keyMapper {
		 NSDictionary *dict = @{@"commentList": @"comment_list",
													 @"draftComment": @"draft_comment",
													 @"forceClock": @"force_clock",
													 @"forceImgCnt": @"force_img_cnt",
													 @"hint": @"hint",
													 @"popUp": @"pop_up",
													 @"popUpType": @"pop_up_type",
													 @"subtitleContent": @"subtitle_content",
													 @"subtitleTips": @"subtitle_tips"};

		 return [[JSONKeyMapper alloc]initWithModelToJSONBlock:^NSString *(NSString *keyName) {
				return dict[keyName]?:keyName;
		}];
 }

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
		return YES;
}
@end

@implementation TestModelDataSubtitleTips
+ (JSONKeyMapper*)keyMapper {
		 NSDictionary *dict = @{@"code": @"code",
													 @"subtitle": @"subtitle",
													 @"tips": @"tips"};

		 return [[JSONKeyMapper alloc]initWithModelToJSONBlock:^NSString *(NSString *keyName) {
				return dict[keyName]?:keyName;
		}];
 }

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
		return YES;
}
@end

@implementation TestModelDataHint
+ (JSONKeyMapper*)keyMapper {
		 NSDictionary *dict = @{@"canComment": @"can_comment",
													 @"dailySubmitLimit": @"daily_submit_limit",
													 @"message": @"message"};

		 return [[JSONKeyMapper alloc]initWithModelToJSONBlock:^NSString *(NSString *keyName) {
				return dict[keyName]?:keyName;
		}];
 }

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
		return YES;
}
@end

@implementation TestModelDataPopUp
+ (JSONKeyMapper*)keyMapper {
		 NSDictionary *dict = @{@"buttonContent": @"button_content",
													 @"content": @"content",
													 @"linkContent": @"link_content",
													 @"linkUrl": @"link_url",
													 @"title": @"title"};

		 return [[JSONKeyMapper alloc]initWithModelToJSONBlock:^NSString *(NSString *keyName) {
				return dict[keyName]?:keyName;
		}];
 }

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
		return YES;
}
@end

@interface ViewController()
@property (nonatomic, strong) TestModel *model;
@end

@implementation ViewController
- (void)viewDidLoad {
	self.view.backgroundColor = [UIColor whiteColor];
	[self textJSONModel];
	
}

- (void)textJSONModel {
	NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
	NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
	self.model = [[TestModel alloc] initWithDictionary:jsonDict error:nil];
	TestLog(@"%@",((TestModelDataSubtitleTips *)self.model.data.subtitleTips[0]).subtitle);
}

@end
