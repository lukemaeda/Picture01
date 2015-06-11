//
//  ViewController.m
//  Picture
//
//  Created by kunren10 on 2014/03/13.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 画像種類選択セグメントの値変更
- (IBAction)changeImage:(UISegmentedControl *)sender
{
    UIImage  *img = Nil;
    
    switch (sender.selectedSegmentIndex) {
        case 0:           // ハンドル１
            img = [self getImage01];
            break;
        case 1:           // ハンドル２
            img = [self getImage02];
            break;
        case 2:           // ネット
            img = [self getImage03];
            break;
            
        default:
            break;
    }
    self.imageView.image = img;
    
}

// 画像取得（ハンドル１）
- (UIImage *)getImage01
{
    
    //NSLog(@"画像１");
    // 画像取得（バンドル内画像、画像キャッシュあり）[getImage01] の中だけ[img]
    UIImage *img = [UIImage imageNamed:@"img03.png"];
    
    return img;
}

// 画像取得（ハンドル２）
- (UIImage *)getImage02
{
    //NSLog(@"画像２");
    // 画像取得（バンドル内画像、画像キャッシュなし）getImage01 の中だけ[img]
    NSBundle *bnd =[NSBundle mainBundle];
    
    NSString *pth = [bnd pathForResource:@"img04"
                                  ofType:@"png"];

    UIImage *img = [UIImage imageWithContentsOfFile:pth];
    
    return img;
}

// 画像取得（ネット）
- (UIImage *)getImage03
{
    //NSLog(@"画像３");
    NSString *str = @"http://www.mercedes-benz.co.jp/content/japan/mpc/mpc_japan_website/ja/home_mpc/passengercars.d2VsY29tZXNjcmVlbi5TaW5nbGU~-3142306515-FallbackImage.jpeg";
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSData *dat = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:dat];
    
    return img;
}

// [フォトアルバム]に保存ボタン //ivImage
- (IBAction)saveImage:(id)sender
{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image,
                                   self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   nil);
}

// フォトアルバム保存完了時
- (void)                    image:(UIImage *)image
         didFinishSavingWithError:(NSError *)error
                      contextInfo:(void *)contextInfo
{
    NSLog(@"保存完了");
}
@end
