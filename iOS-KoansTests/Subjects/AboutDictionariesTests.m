#import "AboutDictionariesTests.h"

@implementation AboutDictionariesTests

- (void)testNSDictionaryCanBeCreatedWithKeyValue
{
    NSArray *objects = [NSArray arrayWithObjects:@"foo", nil];
    NSArray *keys = [NSArray arrayWithObjects:@"bar", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    STAssertEqualObjects([dictionary objectForKey:@"bar"], @"foo", @"");
}

- (void)testNSDictionaryReturnsNilWhenYouLookForObjectThatDoesNotExist
{
    NSArray *objects = [NSArray arrayWithObjects:@"foo", nil];
    NSArray *keys = [NSArray arrayWithObjects:@"bar", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    STAssertEqualObjects([dictionary objectForKey:@"boo"], nil, @"");
}

- (void)testNSMutableDictionaryLetsYouModifyObjectsByKey
{
    NSArray *objects = [NSArray arrayWithObjects:@"foo", nil];
    NSArray *keys = [NSArray arrayWithObjects:@"bar", nil];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys];
    [dictionary setObject:@"ouch" forKey:@"bar"];
    STAssertEqualObjects([dictionary objectForKey:@"bar"], @"ouch", @"");
}

- (void)testNSMutableDictionaryWillLetYouCombineOtherDictionaries
{
    NSArray *objects1 = [NSArray arrayWithObjects:@"foo", nil];
    NSArray *keys1 = [NSArray arrayWithObjects:@"bar", nil];
    NSDictionary *dictionary1 = [NSDictionary dictionaryWithObjects:objects1 forKeys:keys1];

    NSArray *objects2 = [NSArray arrayWithObjects:@"more", nil];
    NSArray *keys2 = [NSArray arrayWithObjects:@"stuff", nil];
    NSDictionary *dictionary2 = [NSDictionary dictionaryWithObjects:objects2 forKeys:keys2];

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary addEntriesFromDictionary:dictionary1];
    [dictionary addEntriesFromDictionary:dictionary2];

    STAssertEqualObjects([dictionary objectForKey:@"bar"], @"foo", @"");
    STAssertEqualObjects([dictionary objectForKey:@"stuff"], @"more", @"");
}

@end
