#import "AboutArraysTests.h"

@implementation AboutArraysTests

- (void)testArrayCanBeCreatedWithSingleObject
{
    NSArray *array = [NSArray arrayWithObject:@"foo"];
    STAssertEqualObjects([array objectAtIndex:0], @"x", @"");
}

- (void)testArrayCanBeCreatedWithMultipleObjects
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    STAssertEqualObjects([array objectAtIndex:0], @"x", @"");
    STAssertEqualObjects([array objectAtIndex:1], @"x", @"");
}

- (void)testArrayHasCountProperty
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    STAssertEquals([array count], 3U, @"");
}

- (void)testArrayHasLastObjectProperty
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    STAssertEqualObjects([array lastObject], @"x", @"");
}

- (void)testArrayContainsObject
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
	STAssertTrue([array containsObject:@"x"], @"");
}

@end
