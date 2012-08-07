#import <Foundation/Foundation.h>
#import "BaseRepository.h"

@interface UserRepository : BaseRepository

- (void)deleteUsernames;
- (NSString *)getUsername;
- (void)updateUsername:(NSString *)username;
- (void)insertUsername:(NSString *)username;

@end