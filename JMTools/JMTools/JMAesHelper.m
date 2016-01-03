//
//  JMAesHelper.m
//  JMCategory
//
//  Created by jim on 15/8/28.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMAesHelper.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation JMAesHelper

+ (NSData *)encryptData:(NSData *)data aes128WithKey:(NSString *)key vector:(NSString *)iv {

    char keyPtr[kCCKeySizeAES128 + 1] = {0, };  //    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1] = {0, };
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    
    NSUInteger dataLength = [data length];
    NSUInteger diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);   //  ?
    NSUInteger dataInSize = dataLength + diff;
    
    char dataIn[dataInSize];
    memcpy(dataIn, [data bytes], [data length]);
    
    for(int i = 0; i < diff; i++) {
        dataIn[i + dataLength] = 0x00;
    }
    
    size_t dataOutSize = dataInSize + kCCBlockSizeAES128;
    void *dataOut = malloc(dataOutSize);
    memset(dataOut, 0, dataOutSize);
    
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          0x0000,
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          ivPtr,
                                          dataIn,
                                          sizeof(dataIn), /* input */
                                          dataOut,
                                          dataOutSize, /* output */
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:dataOut length:numBytesEncrypted freeWhenDone:YES];
        return resultData;
    }
    
    free(dataOut);
    return nil;
}

//  data
+ (NSData *)decryptData:(NSData *)data aes128WithKey:(NSString *)key vector:(NSString *)iv {

    char keyPtr[kCCKeySizeAES128 + 1] = {0, };
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1] = {0, };
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    

    NSUInteger dataLength = [data length];
    size_t dataOutSize = dataLength + kCCBlockSizeAES128;
    void *dataOut = malloc(dataOutSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          0x0000,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          dataOut,
                                          dataOutSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:dataOut length:numBytesEncrypted freeWhenDone:YES];
        return resultData;
    }
    
    free(dataOut);
    return nil;
}


- (void)xx:(NSString *)originStr {
    
    //  string -> data
    //  data -> + base64 => string
//    NSData* originData = [originStr dataUsingEncoding:NSASCIIStringEncoding];
//    
//    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
//    
//    NSLog(@"encodeResult:%@",encodeResult);
//    
//    
//    //  string
//    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:encodeResult options:0];
//    
//    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
}
@end
