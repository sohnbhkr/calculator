//
//  ViewController.h
//  Calculator
//
//  Created by MF839-010 on 2016. 6. 15..
//  Copyright © 2016년 MF839-010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

@interface ViewController : UIViewController <InfoViewProtocol>

@property (weak, nonatomic) IBOutlet UILabel *display;

- (void)processDigit: (int)digit;
- (void)processOp: (char)theOp;
- (void)storeFracPart;
//@property (weak, nonatomic) IBOutlet UIButton *myButtonP;
//@property (weak, nonatomic) IBOutlet UIButton *myButtonM;
//@property (weak, nonatomic) IBOutlet UIButton *myButtonT;
//@property (weak, nonatomic) IBOutlet UIButton *myButtonD;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtons;

- (IBAction)openInfoView:(id)sender;
- (IBAction)openNewView:(id)sender;
- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender;

// 숫자 키
- (IBAction)clickDigit:(id)sender;

// 산술연산
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

// 기타 키
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

// Background Color Change
- (void)changeColor:(UIColor *)newColor;
@end

