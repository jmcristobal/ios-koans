#import "AboutSwitchTests.h"

@implementation AboutSwitchTests

- (void)testReturnsTrueWhenValueMatchesSecondCondition
{
    BOOL result;
    int foo = 1;
    switch (foo)
    {
        case 0:
            result = NO;
            break;
        case 1:
            result = YES;
            break;
    }
    STAssertTrue(result, @"");
}

- (void)testReturnsFalseWhenValueMatchesFirstCondition
{
    BOOL result;
    int foo = 0;
    switch (foo)
    {
        case 0:
            result = NO;
            break;
        case 1:
            result = YES;
            break;
    }
    STAssertFalse(result, @"");
}

- (void)testReturnsTrueWhenValueMatchesNoneAndDefaultIsUsed
{
    BOOL result;
    int foo = 9;
    switch (foo)
    {
        case 0:
            result = NO;
            break;
        case 1:
            result = NO;
            break;
        default:
            result = YES;
            break;
    }
    STAssertTrue(result, @"");
}

@end