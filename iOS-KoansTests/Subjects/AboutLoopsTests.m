#import "AboutLoopsTests.h"

@implementation AboutLoopsTests

- (void)testBasicForLoopOverAnArray
{
    NSString *firstMessage = nil;
    NSArray *array = [NSArray arrayWithObjects:@"first", nil];
    for (int i = 0; i < [array count]; i++)
    {
        firstMessage = [NSString stringWithFormat:@"item %d had object %@", i, [array objectAtIndex:i]];
    }
    STAssertEqualObjects(firstMessage, @"item 0 had object WRONG!", @"");
}

- (void)testBasicForLoopsAllowBreak
{
    NSString *firstMessage = nil;
    NSString *lastMessage = nil;
    NSArray *array = [NSArray arrayWithObjects:@"first", @"last", nil];
    for (int i = 0; i < [array count]; i++)
    {
        firstMessage = @"got here?";
        break;
        lastMessage = @"got here?";
    }
    STAssertEqualObjects(firstMessage, @"got here?", @"");
    STAssertEqualObjects(lastMessage, @"got here?", @"");
}

- (void)testEnumerateThroughArray
{
    NSArray *array = [NSArray arrayWithObjects:@"first", nil];
    NSEnumerator *enumerator = [array objectEnumerator];
    NSString *firstMessage;
    while((firstMessage = [enumerator nextObject])) {
        STAssertEqualObjects(firstMessage, @"x", @"");
    }
}

- (void)testQuickWayToLoopOverArray
{
    NSArray *array = [NSArray arrayWithObjects:@"first", nil];
    for (NSString *str in array) {
        STAssertEqualObjects(str, @"x", @"");
    }
}

- (void)testLoopThroughDictionary
{
    NSArray *objects = [NSArray arrayWithObjects:@"foo", nil];
    NSArray *keys = [NSArray arrayWithObjects:@"bar", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    for(id key in dictionary)
    {
        id value = [dictionary objectForKey:key];
        STAssertEqualObjects(value, @"x", @"");
    }
}

@end