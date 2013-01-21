#import "AboutBooleansTests.h"

@implementation AboutBooleansTests

- (void)testBooleanCanHaveTrueValue
{
    BOOL foo = TRUE;
    STAssertTrue(foo, @"");
}

- (void)testBooleanCanHaveFalseValue
{
    BOOL foo = FALSE;
    STAssertFalse(foo, @"");
}

- (void)testBooleanCanHaveYesValue
{
    BOOL foo = YES;
    STAssertTrue(foo, @"");
}

- (void)testBooleanCanHaveNoValue
{
    BOOL foo = NO;
    STAssertFalse(foo, @"");
}

- (void)testBooleanCanHaveOtherValue
{
    BOOL foo = 92;
    STAssertTrue(foo, @"");
}

- (void)testBooleanWithZeroValueIsAlwaysFalse
{
    BOOL foo = 0;
    STAssertFalse(foo, @"");
}

- (void)testBooleanWithNilValueIsAlwaysFalse
{
    BOOL foo = nil;
    STAssertFalse(foo, @"");
}

@end
