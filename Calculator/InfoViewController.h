//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-010 on 2016. 6. 16..
//  Copyright © 2016년 MF839-010. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>
- (void)changeColor:(UIColor *)newColor;
@end

@interface InfoViewController : UIViewController
@property (nonatomic, weak) NSString *myString;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (strong, nonatomic) id<InfoViewProtocol> delegate;

- (IBAction)changeColor:(id)sender;
- (IBAction)close:(id)sender;

@end
