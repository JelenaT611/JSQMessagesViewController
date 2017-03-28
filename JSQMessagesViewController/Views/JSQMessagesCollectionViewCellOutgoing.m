//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesCollectionViewCellOutgoing.h"
#import <QuartzCore/QuartzCore.h>

@implementation JSQMessagesCollectionViewCellOutgoing

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;

	self.messageBubbleContainerView.layer.masksToBounds = NO;
	self.messageBubbleContainerView.layer.shadowOffset = CGSizeMake(0, 10);
	self.messageBubbleContainerView.layer.shadowRadius = 5;
	self.messageBubbleContainerView.layer.shadowOpacity = 0.25;
}

@end
