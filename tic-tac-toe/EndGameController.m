//
//  ViewController.m
//  tic-tac-toe
//
//  Created by Peter IJlst on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EndGameController.h"

@interface EndGameController ()
@end

@implementation EndGameController
@synthesize winLabel;
@synthesize titleText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.hidesBackButton = TRUE;
	winLabel.text = titleText;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setWinLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)Quit:(id)sender {
	exit(0);
}

- (void) setWinScreen:(NSString *)winText
{	
	self.titleText = winText;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}


@end
