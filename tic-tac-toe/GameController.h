//
//  ViewController.h
//  tic-tac-toe
//
//  Created by Peter IJlst on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameController : UIViewController{
	UIButton *_a1, *_a2, *_a3, *_b1, *_b2, *_b3, *_c1, *_c2, *_c3;
	BOOL *_isTurn;
	NSString *_winMessage;
}
@property (weak, nonatomic) IBOutlet UIButton *a1, *a2, *a3, *b1, *b2, *b3, *c1, *c2, *c3;
@property BOOL isTurn;
@property (assign, atomic) NSString *winMessage;
@property (weak, nonatomic) IBOutlet UILabel *turnMessage;

- (IBAction)btnPressed:(id)sender;
- (void)checkWin;
- (IBAction)Quit:(id)sender;


@end
