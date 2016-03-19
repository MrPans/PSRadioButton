# PSRadioButton
a radio button implement with Swift,you can use it with both of Objective-C and Swift.

_______

### Preview 


### Getting Start

    
#####Import manually
Download zip and unarchiver.Drag 'PSRadioButton' folder into your project.

### Usage with Storyboard 
1. Drag several `UIButton` into your Storyboard and mark with tag or sth.
2. Set `PSRadioButton` as a custom class for this button in Storyboard Inspector,don't forget set selected and deselected image.
3. Creat a `IBOutletCollection` for those radioButtons in Your ViewController,and connect to Storyboard.
4. Initialize a `PSRadioGroup`,and set delegate,do anything you want in delegate method.

```swift

    override func viewDidLoad() {
        super.viewDidLoad()
        radioGroup = PSRadioGroup(radioButtons: radioButtons)
        radioGroup.delegate = self;
    }

```


```swift

    // MARK: - PSRadioGroupDelegate
    func radioGroup(radioGroup: PSRadioGroup, didSeletedRadioButotn radioButton: PSRadioButton) {
        if radioButton.tag == MaleTag {
            self.tipsLabel.text = "选择了:男"
        } else if radioButton.tag == FemaleTag {
            self.tipsLabel.text = "选择了:女"
        }
    }

```

### Usage without Storyboard
Personaly,it's not recommendable using code for layout those buttons.But it's necessary to provide API for code-base UI.

Here is cool initialzation API like `UIAlertAction`.

```
    PSRadioButton *radioButton = [[PSRadioButton alloc] initWithAction:^(PSRadioButton * _Nonnull button) {
        NSLog(@"I selected Button1");
    }];

```

creat some radio buttons,layout,and initialze a `PSRadioGroup` to manage those radio buttons.

```objective-c

    // Cause we use Action Block to handle selection each radioButton,
    // any delegate is noneed,
    // just initialize raiodGroup,it will handle this group of PSRadioButton
    self.radioGroup = [[PSRadioGroup alloc] initWithRadioButtons:self.buttonsWithAction];


```


if you prefer using delegate,Here is a convenience creator for creat several `PSradioButton`

```objective-c

    NSArray *radioButons = [PSRadioButton radioButtonsWithRepeatCount:10
                                                        selectedImage:[UIImage imageNamed:@"seleted"]
                                                      deselectedImage:[UIImage imageNamed:@"deseleted"]];

``` 

initialze a `PSRadioGroup` and set delegate.Don't forget layout those buttons :)》
###Tips：
1. if you are using Objective-C,you should use `#import "YourProjectName-Swift.h"` to import `PSRadioButton`.
1. make sure your buttonType is .Custom,otherwise,PSRadioButton will trigger a assert.

For more，download and see the demo。