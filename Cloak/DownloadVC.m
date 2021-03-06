//
//  DownloadVC.m
//  Cloak
//
//  Created by Mack on 11/14/15.
//  Copyright © 2015 Victor Zhou. All rights reserved.
//

#import "DownloadVC.h"
@import AssetsLibrary;
#import "Constants.h"

@interface DownloadVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DownloadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.downloadImage;
}

- (void)viewDidAppear:(BOOL)animated {
    [self saveImage];
}

-(void)saveImage {
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    UIImage *image = self.downloadImage;
    [library writeImageDataToSavedPhotosAlbum: UIImagePNGRepresentation(image) metadata:nil completionBlock:nil];
    
    UIAlertController* saveAlert = [UIAlertController alertControllerWithTitle:@"Success!" message:@"The Cloaked image has been saved to your Camera Roll. Delete the original version of the image now.\n\nOpen this app, select the Cloaked image, and decloak it to recover your protected information at any time." preferredStyle:UIAlertControllerStyleAlert];
    ;
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [[NSNotificationCenter defaultCenter] postNotificationName:CLK_NOTIF_RESET_CLOAK object:nil];
        [saveAlert dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [saveAlert addAction:(ok)];
    
    [self presentViewController:saveAlert animated:YES completion:nil];
}


@end
