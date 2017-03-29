//
//  StickerMediaItem.m
//  JChat
//
//  Created by Jelena Ristic on 3/29/17.
//  Copyright © 2017 mmstudio. All rights reserved.
//

#import "StickerMediaItem.h"

#import "JSQMessagesMediaPlaceholderView.h"
#import "JSQMessagesMediaViewBubbleImageMasker.h"

@interface StickerMediaItem ()

@property (strong, nonatomic) UIView *cachedImageView;

@end

@implementation StickerMediaItem


#pragma mark - Initialization

- (nullable instancetype)initWithImage:(nullable UIImage *)image {
	self = [super init];
	if (self) {
		_image = [image copy];
		_cachedImageView = nil;

	}
	return self;
}

- (void)dealloc
{
	_image = nil;
	_cachedImageView = nil;

}

#pragma mark - Setters

- (void)setImage:(UIImage *)image
{
	_image = [image copy];
	_cachedImageView = nil;
}

- (void)setAppliesMediaViewMaskAsOutgoing:(BOOL)appliesMediaViewMaskAsOutgoing
{
	[super setAppliesMediaViewMaskAsOutgoing:appliesMediaViewMaskAsOutgoing];
	_cachedImageView = nil;
}

#pragma mark - JSQMessageMediaData protocol

- (UIView *)mediaView
{
	if (self.cachedImageView == nil) {
		CGSize size = CGSizeMake(self.image.size.width + 20, self.image.size.height + 20);
		UIView *temp=[[UIView alloc]init];
		temp.frame=CGRectMake(0, 0, size.width, size.height);
		temp.backgroundColor=[UIColor clearColor];

		UIImageView *imageViewBg = [[UIImageView alloc] init];

		imageViewBg.backgroundColor = [UIColor clearColor];
		imageViewBg.frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
		imageViewBg.contentMode = UIViewContentModeScaleAspectFill;
		imageViewBg.clipsToBounds = YES;
		[temp addSubview:imageViewBg];
		UIImageView *imageView = [[UIImageView alloc] init];
		imageView.backgroundColor = [UIColor clearColor];
		//		if (_ObjMediaData.grpMsgObject != nil) {
		imageView.frame = self.appliesMediaViewMaskAsOutgoing? CGRectMake(7.0f, 10.0f, size.width-20, size.height-20): CGRectMake(13.0f, 17.0f, size.width-20, size.height-25);
		UILabel *_lblSender = [[UILabel alloc] initWithFrame:CGRectMake(17.0f, 3.0f, size.width-24, 14)];
		_lblSender.textColor = [UIColor blackColor];
		//_lblSender.font = kFont_Lato_12;
		_lblSender.text = _strSender;
		[temp addSubview:_lblSender];
		//		} else {
		//			imageView.frame = self.appliesMediaViewMaskAsOutgoing? CGRectMake(7.0f, 10.0f, size.width-20, size.height-20): CGRectMake(13.0f, 10.0f, size.width-21, size.height-20);
		//		}
		//		//        imageView.frame = self.appliesMediaViewMaskAsOutgoing? CGRectMake(7.0f, 10.0f, size.width-20, size.height-20): CGRectMake(13.0f, 10.0f, size.width-21, size.height-20);
		imageView.contentMode = UIViewContentModeScaleAspectFill;
		imageView.layer.cornerRadius=10.0;
		imageView.layer.masksToBounds = YES;
		imageView.clipsToBounds = YES;

		if (self.image) {
			imageView.image = self.image;
		}

		[temp addSubview:imageView];

		[JSQMessagesMediaViewBubbleImageMasker applyBubbleImageMaskToMediaView:imageViewBg isOutgoing:self.appliesMediaViewMaskAsOutgoing];
		self.cachedImageView = temp;
	}

	return self.cachedImageView;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
	UIGraphicsBeginImageContext(newSize);
	[image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}
- (NSUInteger)mediaHash
{
	return self.hash;
}

#pragma mark - NSObject

- (NSUInteger)hash
{
	return super.hash ^ self.image.hash;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: image=%@, appliesMediaViewMaskAsOutgoing=%@>",
			[self class], self.image, @(self.appliesMediaViewMaskAsOutgoing)];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_image = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(image))];

	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.image forKey:NSStringFromSelector(@selector(image))];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
	StickerMediaItem *copy = [[[self class] allocWithZone:zone] initWithImage:_image];
	copy.appliesMediaViewMaskAsOutgoing = self.appliesMediaViewMaskAsOutgoing;
	return copy;
}

@end
