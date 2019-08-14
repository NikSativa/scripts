# Xcode Swift Code Snippets

I want to present some convenient code snippets I gathered for [Swift](https://developer.apple.com/swift/).

### All snippets are updated to **Swift 4** ❤️

## How to import all code snippets to Xcode
All Xcode code snippets exist as a `.plist` files in `~/Library/Developer/Xcode/UserData/CodeSnippets/`
You can simply copy all code snippets (`.codesnippet`) into this folder, restart Xcode and you should have all of them ready to use.

Note: Create the folder if it doesn't exist already. It is created by Xcode when user adds his first custom snippet.

## Usage
 Completion Shortcut is `sn_<...>` so each time you type `sn_` in code editor you should see all snippets you can use in that place.

## How to create your own snippets
To add code snippet to Xcode expand **Utilities** right panel and press `{}` button (*Show the Code Snippet library*) in lower panel.
Then select a code you would like to treat as a snippet, press and hold a left mouse button for a while and drag whole selection to the right panel (if you drag too early you'll probably only deselect text; you can also try dragging from a whitespace instead of the letter).

### Placeholder tokens
If you want to add this nice placeholder in rounded blue rect simply put it between `<#` and `#>` and it will be transformed in both editor and final snippet.

## Snippets
Currently existing snippets (I hope they will be updated on a regular basis with your help :) ):

```
sn_uicollectionviewdelegate          UICollectionViewDelegate snippet
sn_mark                              Divider label for separating code into sections
sn_ibaction                          Create IBAction method stub
sn_uitableviewdelegateext            UITableViewDelegate extension snippet
sn_closureoptionaltypealias          Optional closure typealiast with arguments and return value snippet
sn_UIAlertController                 UIAlertController constructor
sn_static let                        Static pattern
sn_uicollectionviewdatasource        UICollectionViewDataSource snippet
sn_closuretypealias                  Closure typealias with arguments and return value snippet
sn_iboutlet                          Stub out IBOutlet
sn_dispatchasync                     GCD dispatch_async snippet
sn_uicollectionviewdatasourceext     UICollectionViewDataSource extension snippet
sn_uitableviewdelegate               UITableViewDelegate snippet
sn_forin                             for-in loop that casts objects inline
sn_dispatchafter                     GCD dispatch_after snippet
sn_weak                              weakify self in closure
sn_proxy_property                    Auto-Create property stub
sn_uitableviewdatasourceext          UITableViewDataSource extension snippet
sn_dispatchmain                      GCD dispatch_async on main queue snippet
sn_ViewSpec                          ViewSpec placeholders for testing
sn_uicollectionviewdelegateext       UICollectionViewDelegate extension snippet
sn_uiviewcontrollerlifecycle         UIViewController lifecycle snippet
sn_workitem                          WORKITEM: IOS-*** placeholder
sn_uitableviewdatasource             UITableViewDataSource snippet
```


## More snippets?
This is a good start but I encourage you to create your own snippets or correct existing ones and create Pull Requests. Please provide plain snippets as `.plist` files so they can be easily imported.
You can use `plist/generate_list.py` script to generate snippets list by running: `python generate_list.py`.

## Do you like it?
Do you like this repo? Share it on Twitter, Facebook, Google+ or anywhere you like so that more of us can use it and help. Thanks!
