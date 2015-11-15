//
//  CloakingManager.h
//  Cloak
//
//  Created by Victor Zhou on 11/14/15.
//  Copyright © 2015 Victor Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CloakingManager : NSObject

+ (nonnull instancetype)sharedManager;

- (void)cloakText:(nonnull NSString *)text inImage:(nonnull UIImage *)image completion:(nullable void (^)(UIImage * _Nonnull cloakedImage))completion;

- (void)decloakTextFromImage:(nonnull UIImage *)image completion:(nullable void (^)(NSString * _Nonnull text))completion;

@end
