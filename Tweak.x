#import <UIKit/UIKit.h>
#import "../YouTubeHeader/YTCommonColorPalette.h"

@interface YTCollectionViewCell : UICollectionViewCell
@end

@interface YTSettingsCell : YTCollectionViewCell
@end

@interface YTSettingsSectionItem : NSObject
@property BOOL hasSwitch;
@property BOOL switchVisible;
@property BOOL on;
@property BOOL (^switchBlock)(YTSettingsCell *, BOOL);
@property int settingItemId;
- (instancetype)initWithTitle:(NSString *)title titleDescription:(NSString *)titleDescription;
@end

%hook YTSettingsViewController
- (void)setSectionItems:(NSMutableArray <YTSettingsSectionItem *>*)sectionItems forCategory:(NSInteger)category title:(NSString *)title titleDescription:(NSString *)titleDescription headerHidden:(BOOL)headerHidden {
        if (category == 1) {
	        NSInteger appropriateIdx = [sectionItems indexOfObjectPassingTest:^BOOL(YTSettingsSectionItem *item, NSUInteger idx, BOOL *stop) {
		        return item.settingItemId == 294;
	        }];
            	if (appropriateIdx != NSNotFound) {
		        YTSettingsSectionItem *ytDisableHighContrastIcons = [[%c(YTSettingsSectionItem) alloc] initWithTitle:@"Revert The High Contrast Icons (YTMusicDisableHighContrastIcons)" titleDescription:@"App restart is required."];
		        ytMusicDisableHighContrastIcons.hasSwitch = YES;
                        ytMusicDisableHighContrastIcons.switchVisible = YES;
		        ytMusicDisableHighContrastIcons.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"ytMusicDisableHighContrastIcons_enabled"];
		        ytMusicDisableHighContrastIcons.switchBlock = ^BOOL (YTSettingsCell *cell, BOOL enabled) {
			         [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:@"ytMusicDisableHighContrastIcons_enabled"];
		                 return YES;
	                };
	                [sectionItems insertObject:ytMusicDisableHighContrastIcons atIndex:appropriateIdx + 1];
	       }
      	}
      	%orig;
}
%end

%hook YTSystemIcons
- (void)setHidden:(BOOL)hidden {
       	if (![[NSUserDefaults standardUserDefaults] boolForKey:@"ytMusicDisableHighContrastIcons_enabled"])
	            	hidden = YES;
      	%orig;
}
%end
