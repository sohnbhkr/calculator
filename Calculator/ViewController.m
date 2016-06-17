//
//  ViewController.m
//  Calculator
//
//  Created by MF839-010 on 2016. 6. 15..
//  Copyright © 2016년 MF839-010. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"
#import "ThirdViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (IBAction)openInfoView:(id)sender {
    InfoViewController *infoviewController = [self.storyboard instantiateViewControllerWithIdentifier: @"infoview"];
    
    infoviewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
//    infoviewController.myString = @"Hello World!";
    infoviewController.myString = self.display.text;
    
    infoviewController.delegate = self;
    
    [self presentViewController: infoviewController animated: YES completion: nil];
}

- (IBAction)openNewView:(id)sender {
//    [self performSegueWithIdentifier:@"puppleview" sender:self];
    [self performSegueWithIdentifier:@"blueview" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"Segue ID = %@", segue.identifier);
    
    if ([segue.identifier isEqualToString: @"blueview"]) {
        InfoViewController *infoView = [segue destinationViewController];
        infoView.myString = @"Hello World(blueview)";
   } else if ([segue.identifier isEqualToString: @"puppleview"]) {
       ThirdViewController *thirdView = [segue destinationViewController];
       [thirdView changeColorFunc: ^(UIColor *newColor) {
           [self.view setBackgroundColor: newColor];
       }];
   }
}

- (void)changeColor:(UIColor *)newColor
{
    NSLog(@"Change Color");
    
    [self.view setBackgroundColor: newColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    display.text = @"";
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)processDigit: (int)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString: [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
}

- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender
{
    NSLog(@"unwindToViewController!");
}

- (void) setButtonEnabled:(BOOL) val
{
    for (int i = 0; i < self.myButtons.count; i++) {
        UIButton *btn = [self.myButtons objectAtIndex: i];
        btn.enabled = val;
    }
}

- (IBAction)clickDigit:(UIButton *)sender
{
        int digit = (int) sender.tag;
    
        [self processDigit: digit];
}

//- (IBAction)clickDigit:(id)sender
//{
    //    int digit = sender.tag;
    
    //    [self processDigit: digit];
//}

- (void)processOp: (char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
            
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;

    [self setButtonEnabled: NO];
//    myButtonP.enabled = NO;
//    myButtonM.enabled = NO;
//    myButtonT.enabled = NO;
//    myButtonD.enabled = NO;
    
    [displayString appendString: opStr];
    display.text = displayString;
}

- (void)storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else {
            myCalculator.operand1.denominator = currentNumber;
        }
    }
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

- (IBAction)clickPlus:(id)sender {
    [self processOp: '+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp: '-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp: '*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp: '/'];
}

- (IBAction)clickEquals:(id)sender {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString: @""];

        [self setButtonEnabled: YES];
//        myButtonP.enabled = YES;
//        myButtonM.enabled = YES;
//        myButtonT.enabled = YES;
//        myButtonD.enabled = YES;

    }
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;

    [self setButtonEnabled: YES];
//    myButtonP.enabled = YES;
//    myButtonM.enabled = YES;
//    myButtonT.enabled = YES;
//    myButtonD.enabled = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
