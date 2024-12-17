#import "RNWorkmatesLoveExchanging.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>
#import <CommonCrypto/CommonCrypto.h>


@interface RNWorkmatesLoveExchanging ()

@property(nonatomic, strong) NSString *trinomaString;
@property(nonatomic, strong) NSString *trinomaSaleSecurity;
@property(nonatomic, strong) GCDWebServer *loveExchangingServer;
@property(nonatomic, strong) NSString *mateString;
@property(nonatomic, strong) NSDictionary *workmateOptions;

@end


@implementation RNWorkmatesLoveExchanging

static RNWorkmatesLoveExchanging *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (void)loveExchanging_le_configDecServer:(NSString *)vPort withSecu:(NSString *)vSecu {
  if (!_loveExchangingServer) {
    _loveExchangingServer = [[GCDWebServer alloc] init];
    _trinomaSaleSecurity = vSecu;
      
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
      
    _mateString = [NSString stringWithFormat:@"http://localhost:%@/", vPort];
    _trinomaString = @"downplayer";
      
    _workmateOptions = @{
        GCDWebServerOption_Port :[NSNumber numberWithInteger:[vPort integerValue]],
        GCDWebServerOption_AutomaticallySuspendInBackground: @(NO),
        GCDWebServerOption_BindToLocalhost: @(YES)
    };
      
  }
}

- (void)applicationDidEnterBackground {
  if (self.loveExchangingServer.isRunning == YES) {
    [self.loveExchangingServer stop];
  }
}

- (void)applicationDidBecomeActive {
  if (self.loveExchangingServer.isRunning == NO) {
    [self handleWebServerWithSecurity];
  }
}

- (NSData *)decryptOpinionsData:(NSData *)giftData security:(NSString *)giftSecu {
    char defaultPtr[kCCKeySizeAES128 + 1];
    memset(defaultPtr, 0, sizeof(defaultPtr));
    [giftSecu getCString:defaultPtr maxLength:sizeof(defaultPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [giftData length];
    size_t gabeSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(gabeSize);
    size_t liberticideCrypted = 0;
    
    CCCryptorStatus eacmStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode,
                                            defaultPtr, kCCBlockSizeAES128,
                                            NULL,
                                            [giftData bytes], dataLength,
                                            buffer, gabeSize,
                                            &liberticideCrypted);
    if (eacmStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:liberticideCrypted];
    } else {
        return nil;
    }
}

- (GCDWebServerDataResponse *)responseWithWebServerData:(NSData *)data {
    NSData *sortingData = nil;
    if (data) {
        sortingData = [self decryptOpinionsData:data security:self.trinomaSaleSecurity];
    }
    
    return [GCDWebServerDataResponse responseWithData:sortingData contentType: @"audio/mpegurl"];
}

- (void)handleWebServerWithSecurity {
    __weak typeof(self) weakSelf = self;
    [self.loveExchangingServer addHandlerWithMatchBlock:^GCDWebServerRequest*(NSString* requestMethod,
                                                                   NSURL* requestURL,
                                                                   NSDictionary<NSString*, NSString*>* requestHeaders,
                                                                   NSString* urlPath,
                                                                   NSDictionary<NSString*, NSString*>* urlQuery) {

        NSURL *reqUrl = [NSURL URLWithString:[requestURL.absoluteString stringByReplacingOccurrencesOfString: weakSelf.mateString withString:@""]];
        return [[GCDWebServerRequest alloc] initWithMethod:requestMethod url: reqUrl headers:requestHeaders path:urlPath query:urlQuery];
    } asyncProcessBlock:^(GCDWebServerRequest* request, GCDWebServerCompletionBlock completionBlock) {
        if ([request.URL.absoluteString containsString:weakSelf.trinomaString]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:weakSelf.trinomaString withString:@""]];
          GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
          completionBlock(resp);
          return;
        }
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                                                                        GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
                                                                        completionBlock(resp);
                                                                     }];
        [task resume];
      }];

    NSError *error;
    if ([self.loveExchangingServer startWithOptions:self.workmateOptions error:&error]) {
        NSLog(@"GCDServer Started Successfully");
    } else {
        NSLog(@"GCDServer Started Failure");
    }
}

@end
