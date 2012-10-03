//
//  ViewController.h
//  tic-tac-toe
//
//  Created by Peter IJlst on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndGameController : UIViewController{
	NSString *_winText;
}

@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (assign, atomic) NSString *titleText;
- (IBAction)Quit:(id)sender;
-(void)setWinScreen:(NSString *)winText;
@end
