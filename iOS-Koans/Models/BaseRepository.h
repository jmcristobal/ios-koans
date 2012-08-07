#import <Foundation/Foundation.h>

@interface BaseRepository : NSObject

- (NSNumber *)executeStatement:(NSString *)sql;
- (NSString *)selectOneValueSQL:(NSString *)sql;

@end