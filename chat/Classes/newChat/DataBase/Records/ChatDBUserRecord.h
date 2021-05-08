//
//  ChatDBUserRecord.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Mantle/Mantle.h>
#import "ChatDBRecordBase.h"
#import "UserBase.h"

static NSString *const UserColumnUserId  = @"userid";
static NSString *const UserColumnuserName  = @"username";
static NSString *const UserColumncollege  = @"college";
static NSString *const UserColumncollegeNum  = @"collegenum";
static NSString *const UserColumnownClass  = @"ownclass";
static NSString *const UserColumnidentityCard  = @"identitycard";
static NSString *const UserColumnatCampus  = @"atcampus";
static NSString *const UserColumngrade  = @"grade";
static NSString *const UserColumnmajorName  = @"majorname";
static NSString *const UserColumnisRealChat  = @"isrealchat";




@interface ChatDBUserRecord : ChatDBRecordBase

@property (nonatomic,assign) NSString *userId; //学号
@property (nonatomic,copy) NSString *userName; //用户姓名
@property (nonatomic,copy) NSString *college; //学院
@property (nonatomic,assign) NSNumber *collegeNum; //学院编号
@property (nonatomic,copy) NSString *ownClass; //班级
@property (nonatomic,assign) NSNumber *identityCard; //身份证号
@property (nonatomic,copy) NSString *atCampus; //是在校园
@property (nonatomic,assign) NSNumber *grade; //年级
@property (nonatomic,assign) NSString *majorName; //专业名称
@property (nonatomic,assign) NSNumber *isRealChat;  //是否为正在聊天用户 默认为0->没有在聊天。1->

- (instancetype)initWithUser:(UserBase *)user;
@end


