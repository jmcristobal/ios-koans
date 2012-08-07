#import "UserRepository.h"

@implementation UserRepository

- (NSString *)getUsername
{
    return [self selectOneValueSQL:@"SELECT username FROM tbl_username"];
}

- (void)updateUsername:(NSString *)username
{
    NSString *wrong = @"invalid";
    NSString* sql = [NSString stringWithFormat:@"UPDATE tbl_username SET username = '%@'", wrong];
    [self executeStatement:sql];
}

- (void)insertUsername:(NSString *)username
{
    NSString* sql = [NSString stringWithFormat:@"INSERT INTO tbl_username (username) VALUES ('%@')", username];
    [self executeStatement:sql];
}

- (void)deleteUsernames
{
    [self executeStatement:[NSString stringWithFormat:@"DELETE FROM tbl_username"]];
}

@end