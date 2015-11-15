//
//  DownloadVC.m
//  Cloak
//
//  Created by Mack on 11/14/15.
//  Copyright © 2015 Victor Zhou. All rights reserved.
//

#import "DownloadVC.h"
@import AssetsLibrary;

@interface DownloadVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DownloadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.downloadImage;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    [self.imageView setUserInteractionEnabled:YES];
    [self.imageView addGestureRecognizer:singleTap];
}

-(void)tapDetected{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    UIImage *image = self.downloadImage;
    [library writeImageDataToSavedPhotosAlbum: UIImagePNGRepresentation(image) metadata:nil completionBlock:nil];
    
    UIAlertController* saveAlert = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Cloaked image has been saved to Camera Roll" preferredStyle:UIAlertControllerStyleAlert];
    ;
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [saveAlert dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [saveAlert addAction:(ok)];
    
    [self presentViewController:saveAlert animated:YES completion:nil];
}


@end
