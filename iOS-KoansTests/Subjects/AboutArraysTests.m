#import "AboutArraysTests.h"

@implementation AboutArraysTests

- (void)testArrayCanBeCreatedWithSingleObject
{
    NSArray *array = [NSArray arrayWithObject:@"foo"];
    STAssertEqualObjects([array objectAtIndex:0], @"foo", @"");
}

- (void)testArrayCanBeCreatedWithMultipleObjects
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    STAssertEqualObjects([array objectAtIndex:0], @"foo", @"");
    STAssertEqualObjects([array objectAtIndex:1], @"bar", @"");
}

- (void)testArrayHasCountProperty
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    STAssertEquals([array count], 2U, @"");
}

- (void)testArrayHasLastObjectProperty
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    STAssertEqualObjects([array lastObject], @"bar", @"");
}

- (void)testArrayContainsObject
{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
	STAssertTrue([array containsObject:@"foo"], @"");
}

@end
