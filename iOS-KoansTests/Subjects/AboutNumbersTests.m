#import "AboutNumbersTests.h"

@implementation AboutNumbersTests

- (void)testSignedIntegerCanHavePositiveValue
{
    int foo = 24;
    STAssertEquals(foo, nil, @"");
}

- (void)testSignedIntegerCanAlsoHaveNegativeValue
{
    int foo = -24;
    STAssertEquals(foo, nil, @"");
}

- (void)testSignedIntegerIsTheDefault
{
    int foo = 24;
    signed int bar = 24;
    STAssertEquals(foo, nil, @"");
}

- (void)testNSIntegerCanHavePositiveValue
{
    NSInteger foo = 24;
    STAssertEquals(foo, nil, @"");
}

- (void)testNSIntegerIsSignedIntegerWithPositiveValue
{
    int foo = 24;
    NSInteger bar = 24;
    STAssertEquals(foo, nil, @"");
}

- (void)testNSUIntegerIsUnsignedIntegerWithPositiveValue
{
    unsigned int foo = 24;
    NSUInteger bar = 24;
    STAssertEquals(foo, nil, @"");
}

- (void)testFloatContainsMoreInformationThanInteger
{
    float foo = 24.44444;
    STAssertEquals(foo, nil, @"");
}

- (void)testDoubleContainsMoreInformationThanFloat
{
    double foo = 24.444444444444444444444448;
    STAssertEquals(foo, nil, @"");
}

@end
