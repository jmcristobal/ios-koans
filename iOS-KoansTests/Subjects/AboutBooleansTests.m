#import "AboutBooleansTests.h"

@implementation AboutBooleansTests

- (void)testBooleanCanHaveTrueValue
{
    BOOL foo = TRUE;
    STAssertFalse(foo, @"");
}

- (void)testBooleanCanHaveFalseValue
{
    BOOL foo = FALSE;
    STAssertTrue(foo, @"");
}

- (void)testBooleanCanHaveYesValue
{
    BOOL foo = YES;
    STAssertFalse(foo, @"");
}

- (void)testBooleanCanHaveNoValue
{
    BOOL foo = NO;
    STAssertTrue(foo, @"");
}

- (void)testBooleanCanHaveOtherValue
{
    BOOL foo = 92;
    STAssertFalse(foo, @"");
}

- (void)testBooleanWithZeroValueIsAlwaysFalse
{
    BOOL foo = 0;
    STAssertTrue(foo, @"");
}

- (void)testBooleanWithNilValueIsAlwaysFalse
{
    BOOL foo = nil;
    STAssertTrue(foo, @"");
}

@end
