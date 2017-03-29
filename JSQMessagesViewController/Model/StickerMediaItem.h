//
//  StickerMediaItem.h
//  JChat
//
//  Created by Jelena Ristic on 3/29/17.
//  Copyright © 2017 mmstudio. All rights reserved.
//

#import <JSQMessagesViewController/JSQMessagesViewController.h>
#import <JSQMessagesViewController/JSQMediaItem.h>

@interface StickerMediaItem : JSQMediaItem <JSQMessageMediaData, NSCoding, NSCopying>

/**
 *  The image for the photo media item. The default value is `nil`.
 */
@property (copy, nonatomic, nullable) UIImage *image;
@property (nonatomic, strong, nullable) NSString *strSender;

- (nullable instancetype)initWithImage:(nullable UIImage *)image;


@end
