#import <Foundation/Foundation.h>

@interface WebService : NSObject

@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSMutableData *responseData;
@property (copy, nonatomic) void (^callback)(NSData *);

- (void)makeGetRequestWithURL:(NSURL *)url AndCallback:(void (^)(NSData *))callback;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

@end