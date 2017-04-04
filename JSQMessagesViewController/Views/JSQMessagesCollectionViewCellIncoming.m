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

#import "JSQMessagesCollectionViewCellIncoming.h"
#import <QuartzCore/QuartzCore.h>

@implementation JSQMessagesCollectionViewCellIncoming

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentLeft;
    self.cellBottomLabel.textAlignment = NSTextAlignmentLeft;

	self.messageBubbleContainerView.layer.masksToBounds = NO;
	self.messageBubbleContainerView.layer.shadowOffset = CGSizeMake(0, 3);
	self.messageBubbleContainerView.layer.shadowRadius = 5;
	self.messageBubbleContainerView.layer.shadowOpacity = 0.25;
	self.clipsToBounds = NO;
	self.contentView.clipsToBounds = NO;
}

@end
