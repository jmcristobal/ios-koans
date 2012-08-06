#import <Foundation/Foundation.h>
#import "LegacyWebService.h"

@interface GoogleWebService : LegacyWebService

@property (strong, nonatomic) id delegate;

- (id)initWithDelegate:(id)delegate;

@end