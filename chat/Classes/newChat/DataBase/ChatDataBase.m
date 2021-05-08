//
//  ChatDataBase.m
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import "ChatDataBase.h"
#import "chat-Swift.h"
#import "FMResultSet.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabaseQueue.h"
#import "ChatDBTableProtocol.h"

@interface ChatDataBase()

@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@property (nonatomic, strong) ChatDBUserTable *userTable;

@property (nonatomic,strong) ChatDBOneChatTable *oneChatTable;

@end

@implementation ChatDataBase

static ChatDataBase *sharedInstance = nil;

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

+(ChatDataBase *) getInstance{
    if (sharedInstance == nil) {
        sharedInstance = [[ChatDataBase alloc] init];//调用自己改写的”私有构造函数“
    }
    
    return sharedInstance;
}

- (void)loadDB {
    [self.dbQueue close];
    
//    if (![UserSessionManager getInstance].isLoggedIn) {
//        return;
//    }
//    
    self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:[self chatDBFilePath]];
    
    self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:[self chatDBFilePath]];
    self.userTable = [[ChatDBUserTable alloc] initWithDBQueue:self.dbQueue ];
    self.oneChatTable = [[ChatDBOneChatTable alloc] initWithDBQueue:self.dbQueue];

    
    NSArray<id<ChatDBTableProtocol>> *tables = @[self.userTable,
                                                 self.oneChatTable];
    [tables makeObjectsPerformSelector:@selector(createOrUpdateTableIfNeeded)];
    
//    [KTVSettingsUtil addSkipBackupAttributeToItemAtURL:[[NSURL alloc] initFileURLWithPath:[self chatDBFilePath]]];
}

- (void)unloadDB {

    self.userTable = nil;
    self.oneChatTable = nil;
    [self.dbQueue close];
    self.dbQueue = nil;
}

- (NSString *)chatDBFilePath {
    NSString *encodedUseridString = [[UserSessionManager getInstance] currentUserID ];
    NSLog(@"%@",[[self currentUserChatFolderPath] stringByAppendingPathComponent:encodedUseridString]);
    return [[self currentUserChatFolderPath] stringByAppendingPathComponent:encodedUseridString];
}

- (NSString *)currentUserChatFolderPath {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *chatFolderPath = [documentsDirectory stringByAppendingPathComponent:@"chat"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:chatFolderPath isDirectory:NULL]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:chatFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *currentUserChatFolderPath = [chatFolderPath stringByAppendingPathComponent:[[UserSessionManager getInstance] currentUserID ]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:currentUserChatFolderPath isDirectory:NULL]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:currentUserChatFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return currentUserChatFolderPath;
  
}
@end
