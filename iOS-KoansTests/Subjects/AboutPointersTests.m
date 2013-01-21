#import "AboutPointersTests.h"

@implementation AboutPointersTests

- (void)testPointerIsNothingMoreThanAVariableThatHoldsTheLocationOfAnother
{
    int x = 45;
    int *y = &x;
    NSLog(@"the address of x was %d", y);
}

@end
