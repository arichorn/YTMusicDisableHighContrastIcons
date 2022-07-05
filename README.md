# YTMusicDisableHighContrastIcons
FORKED for YT MUSIC: Tries to put the icons white/black icon colors back to the colors gray and this only works on the YouTube Music App when on iOS 13 or Later with either non-jailbroken &amp; jailbroken iOS/iPadOS devices


Code for .xm

%group gYTDisableHighContrastIcons
%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor colorWithWhite:0.565 alpha:1];
     }
         return [UIColor colorWithWhite:0.5 alpha:1];
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor colorWithWhite:0.565 alpha:1];
     }
        return [UIColor colorWithWhite:0.5 alpha:1];
 }
%end
%end
