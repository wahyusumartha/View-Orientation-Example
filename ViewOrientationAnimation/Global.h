//
//  Global.h
//  ViewOrientationAnimation
//
//  Created by Wahyu Sumartha  on 8/21/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#ifndef ViewOrientationAnimation_Global_h
#define ViewOrientationAnimation_Global_h


#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define DEVICE_SIZE [[[[UIApplication sharedApplication] keyWindow] rootViewController].view convertRect:[[UIScreen mainScreen] bounds] fromView:nil].size

#endif
