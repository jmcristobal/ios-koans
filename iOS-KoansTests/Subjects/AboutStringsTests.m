#import "AboutStringsTests.h"

@implementation AboutStringsTests

- (void)testSingleCharValueIsBasicString
{
    char foo = 'a';
    STAssertEquals(foo, (char)'x', @"");
}

- (void)testSingleCharValueCanAlsoBeNumericRepresentationOfString
{
    char foo = 97;
    STAssertEquals(foo, (char)'x', @""); //hint maybe 'a' is 97...
}

- (void)testCharCanAlsoBeRepresentedWithPointer
{
    char *foo = "abc";
    STAssertEquals(foo, (char *)"x", @"");
}

- (void)testNSStringCanAlsoHaveCharValue
{
    NSString *foo = @"abc";
    STAssertEquals(foo, @"x", @"");
}

- (void)testNSStringCanBeCreatedWithSpecificFormat
{
    NSString *foo = [NSString stringWithFormat:@"this is %d", 24];
    STAssertEqualObjects(foo, @"x", @"");
}

- (void)testNSStringIsImmutable
{
    //[foo appendString:@" 123"]; this will cause a compiler error ... so instead
    NSString *foo = @"abc";
    NSString *bar = [NSString stringWithFormat:@"foo was %@", foo];
    STAssertEqualObjects(foo, @"x", @"");
    STAssertEqualObjects(bar, @"x", @"");
}

- (void)testNSMutableStringIsMutable
{
    NSMutableString *foo = [[NSMutableString alloc] initWithString:@"abc"];
    [foo appendString:@" 123"];
    STAssertEqualObjects(foo, @"x", @"");
}

- (void)testNSStringAndNSRangeCanBeUsedToCreateSubstring
{
    NSString *foo = @"abc 123 def 456";
    NSRange range = [foo rangeOfString:@" def"];
    NSString *bar = [foo substringWithRange:NSMakeRange(0, range.location)];
    STAssertEqualObjects(bar, @"x", @"");
}

- (void)testNSStringAndNSRangeCanBeUsedToCreateSubstringWithCharsAfterElement
{
    NSString *foo = @"abc 123 def 456";
    NSRange range = [foo rangeOfString:@" def"];
    NSString *bar = [foo substringWithRange:NSMakeRange(range.location, foo.length - range.location)];
    STAssertEqualObjects(bar, @"x", @"");
}

@end
