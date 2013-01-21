#import "AboutStringsTests.h"

@implementation AboutStringsTests

- (void)testSingleCharValueIsBasicString
{
    char foo = 'a';
    STAssertEquals(foo, (char)'a', @"");
}

- (void)testSingleCharValueCanAlsoBeNumericRepresentationOfString
{
    char foo = 97;
    STAssertEquals(foo, (char)'a', @""); //hint maybe 'a' is 97...
}

- (void)testCharCanAlsoBeRepresentedWithPointer
{
    char *foo = "abc";
    STAssertEquals(foo, (char *)"abc", @"");
}

- (void)testNSStringCanAlsoHaveCharValue
{
    NSString *foo = @"abc";
    STAssertEquals(foo, @"abc", @"");
}

- (void)testNSStringCanBeCreatedWithSpecificFormat
{
    NSString *foo = [NSString stringWithFormat:@"this is %d", 24];
    STAssertEqualObjects(foo, @"this is 24", @"");
}

- (void)testNSStringIsImmutable
{
    //[foo appendString:@" 123"]; this will cause a compiler error ... so instead
    NSString *foo = @"abc";
    NSString *bar = [NSString stringWithFormat:@"foo was %@", foo];
    STAssertEqualObjects(foo, @"abc", @"");
    STAssertEqualObjects(bar, @"foo was abc", @"");
}

- (void)testNSMutableStringIsMutable
{
    NSMutableString *foo = [[NSMutableString alloc] initWithString:@"abc"];
    [foo appendString:@" 123"];
    STAssertEqualObjects(foo, @"abc 123", @"");
}

- (void)testNSStringAndNSRangeCanBeUsedToCreateSubstring
{
    NSString *foo = @"abc 123 def 456";
    NSRange range = [foo rangeOfString:@" def"];
    NSString *bar = [foo substringWithRange:NSMakeRange(0, range.location)];
    STAssertEqualObjects(bar, @"abc 123", @"");
}

- (void)testNSStringAndNSRangeCanBeUsedToCreateSubstringWithCharsAfterElement
{
    NSString *foo = @"abc 123 def 456";
    NSRange range = [foo rangeOfString:@" def"];
    NSString *bar = [foo substringWithRange:NSMakeRange(range.location, foo.length - range.location)];
    STAssertEqualObjects(bar, @" def 456", @"");
}

@end
