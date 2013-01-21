#import "AboutNumbersTests.h"

@implementation AboutNumbersTests

- (void)testSignedIntegerCanHavePositiveValue
{
    int foo = 24;
    STAssertEquals(foo, 24, @"");
}

- (void)testSignedIntegerCanAlsoHaveNegativeValue
{
    int foo = -24;
    STAssertEquals(foo, -24, @"");
}

- (void)testSignedIntegerIsTheDefault
{
    int foo = 24;
    signed int bar = 24;
    STAssertEquals(foo, bar, @"");
}

- (void)testNSIntegerCanHavePositiveValue
{
    NSInteger foo = 24;
    STAssertEquals(foo, 24, @"");
}

- (void)testNSIntegerIsSignedIntegerWithPositiveValue
{
    int foo = 24;
    NSInteger bar = 24;
    STAssertEquals(foo, bar, @"");
}

- (void)testNSUIntegerIsUnsignedIntegerWithPositiveValue
{
    unsigned int foo = 24;
    NSUInteger bar = 24;
    STAssertEquals(foo, bar, @"");
}

- (void)testFloatContainsMoreInformationThanInteger
{
    float foo = 24.44444;
    STAssertEquals(foo, 24.44444f, @"");
}

- (void)testDoubleContainsMoreInformationThanFloat
{
    double foo = 24.444444444444444444444448;
    STAssertEquals(foo, 24.444444444444444444444448, @"");
}

@end
