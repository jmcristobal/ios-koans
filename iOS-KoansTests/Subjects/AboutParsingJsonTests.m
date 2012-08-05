#import "AboutParsingJsonTests.h"
#import "JsonResult.h"

@implementation AboutParsingJsonTests

@synthesize data = _data;

- (void)setUp
{
    NSString *json = @"{\"example\":[\"x\"],\"results\":[{\"data\":{\"location\":null},\"foo\":\"abc\",\"bar\":\"1.23\"}]}";
    self.data = [json dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)testWillParseJsonAndReturnBar
{
    NSArray *places = [self parseJsonAndReturnResult:self.data];
    JsonResult *result = [places objectAtIndex:0];
    STAssertEqualObjects(@"abc", result.foo, @"");
    STAssertEqualObjects(@"1.23", result.bar, @"");
}

- (NSArray *)parseJsonAndReturnResult:(NSData *)data
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *items = [json objectForKey:@"results"];

    NSMutableArray *places = [NSMutableArray array];
    for (NSDictionary *item in items)
    {
        JsonResult *result = [[JsonResult alloc] init];
        result.foo = [item objectForKey:@"foo"];
        result.bar = nil;

        [places addObject:result];
    }

    return places;
}

@end