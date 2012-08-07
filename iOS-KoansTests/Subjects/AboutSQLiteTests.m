#import "AboutSQLiteTests.h"
#import "UserRepository.h"

@implementation AboutSQLiteTests

@synthesize repository = _repository;

- (void)setUp
{
    self.repository = [[UserRepository alloc] init];
}

- (void)tearDown
{
    //clears the field after each test runs because we are using a real SQLite db file
    [self.repository deleteUsernames];
    NSString *deleted = [self.repository getUsername];
    STAssertEqualObjects(deleted, nil, @"");
}

- (void)testCreateReadUpdateDeleteUsername
{
    [self.repository deleteUsernames];
    NSString *deleted = [self.repository getUsername];
    STAssertEqualObjects(deleted, nil, @"");

    [self.repository insertUsername:@"foo"];
    NSString *inserted = [self.repository getUsername];
    STAssertEqualObjects(inserted, @"foo", @"");

    [self.repository updateUsername:@"bar"];
    NSString *updated = [self.repository getUsername];
    STAssertEqualObjects(updated, @"bar", @"");
}

@end