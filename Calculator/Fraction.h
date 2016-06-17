//
//  Fraction.h
//  ObjC
//
//  Created by MF839-010 on 2016. 6. 13..
//  Copyright © 2016년 MF839-010. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
- (void) setTo: (int) n over: (int) d;

- (Fraction *)add: (Fraction *)f;
- (Fraction *)mul: (Fraction *)f;
- (Fraction *)sub: (Fraction *)f;
- (Fraction *)div: (Fraction *)f;

- (void) reduce;
- (double) convertToNum;
- (NSString *) convertToString;

@end
