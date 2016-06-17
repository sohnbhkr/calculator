//
//  Fraction.m
//  ObjC
//
//  Created by MF839-010 on 2016. 6. 13..
//  Copyright © 2016년 MF839-010. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
//@synthesize numerator, denominator;

-(void) print
{
    NSLog(@"%i/%i", _numerator, _denominator);
}

-(void) setTo: (int) n over: (int) d
{
    _numerator = n;
    _denominator = d;
}

-(void) reduce
{
    int u = _numerator;
    int v = _denominator;
    int temp;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    _numerator /= u;
    _denominator /= u;

}

-(double) convertToNum
{
    if (_denominator != 0) {
        return (double) _numerator / _denominator;
    }
    else {
        return NAN;
    }
}

- (NSString *) convertToString
{
    if (_numerator == _denominator) {
        if (_numerator == 0) {
            return @"0";
        }
        else {
            return @"1";
        }
    }
    else if (_denominator == 1) {
        return [NSString stringWithFormat: @"%i", _numerator];
    }
    else {
        return [NSString stringWithFormat:@"%i/%i", _numerator, _denominator];
    }
}

- (Fraction *)add: (Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = (_numerator * f.denominator) + (_denominator * f.numerator);
    result.denominator = _denominator * f.denominator;
    [result reduce];
    
    return result;
}

- (Fraction *)mul: (Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = _numerator * f.numerator;
    result.denominator = _denominator * f.denominator;
    [result reduce];
    
    return result;
    
}

- (Fraction *)sub: (Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = (_numerator * f.denominator) - (_denominator * f.numerator);
    result.denominator = _denominator * f.denominator;
    [result reduce];
    
    return result;
    
}
- (Fraction *)div: (Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = _numerator * f.denominator;
    result.denominator = _denominator * f.numerator;
    [result reduce];
    
    return result;
    
}

@end
