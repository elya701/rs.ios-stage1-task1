#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *)highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    if (s == nil || n == nil || k == nil) {
        return nil;
    }

    NSMutableString *string = [s mutableCopy];
    
    
    int left = 0;
    int right = s.length - 1;

    int avaibleChanges = k.intValue;
    int requiredChanges = 0;

    for (int i = 0, g = s.length - 1; i < s.length / 2; i++, g--) {
        if ([s characterAtIndex:i] != [s characterAtIndex:g]) {
            requiredChanges++;
        }
    }
    
   
    

    if (requiredChanges > avaibleChanges) {
        return @"-1";
    }

    while (avaibleChanges > 0 && left <= right) {
        
        char ourRightChar = [string characterAtIndex:right];
        char ourLeftChar = [string characterAtIndex:left];

        if (ourLeftChar == ourRightChar) {
            if (avaibleChanges - 2 >= requiredChanges && ourLeftChar != '9') {
                [string replaceCharactersInRange:NSMakeRange(right, 1) withString:@"9"];
                [string replaceCharactersInRange:NSMakeRange(left, 1) withString:@"9"];
                avaibleChanges -= 2;
            }
        } else {
            if (avaibleChanges - 1 >= requiredChanges) {
                if (ourLeftChar != '9') {
                    [string replaceCharactersInRange:NSMakeRange(left, 1) withString:@"9"];
                    avaibleChanges--;
                }
                if (ourRightChar != '9') {
                    [string replaceCharactersInRange:NSMakeRange(right, 1) withString:@"9"];
                    avaibleChanges--;
                }
            } else {
                avaibleChanges--;
                if (ourLeftChar > ourRightChar) {
                    NSString *newRight = [NSString stringWithFormat:@"%c", ourLeftChar];
                    [string replaceCharactersInRange:NSMakeRange(right, 1) withString: newRight];
                } else {
                    NSString *newLeft = [NSString stringWithFormat:@"%c", ourRightChar];
                    [string replaceCharactersInRange:NSMakeRange(left, 1) withString: newLeft];
                }
            }
            requiredChanges--;
        }

        left++;
        right--;
    }


    if ([self isPalindrome:string] == 1) {
        return string;
    } else {
        return @"-1";
    }
}


//Check on palindrom from internet
- (BOOL)isPalindrome:(NSString *)s {
    int l = 0;
    int r = s.length - 1;

    while (l < r) {
        if ([s characterAtIndex:l] == [s characterAtIndex:r]) {
            l++;
            r--;
        } else {
            return FALSE;
        }
    }

    return TRUE;
}



@end
