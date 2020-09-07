# FastNewsSwiftUI

This repository contains the iOS test source code.

### Stack
* Using SwiftUI 
* MVVM
* Localization

### Features
* Integration with reddit api
* News viewing
* Comments listing
* Url Sharing

###
* Localizable strings for En-US and Pt-BR
* Strings in constant enum to avoid typo's:

```
enum Constants {
    enum String {
        static let loading = NSLocalizedString("Loading", comment: "Message displayed when loading view is presented")
    }
}
```

### Git strategy
* Using gitflow to organize code commits
* Check the flow in network: https://github.com/rafaeladolfo/fastnewsswiftui/network

* Feature branches:
![FeatureBranch](https://wac-cdn.atlassian.com/dam/jcr:b5259cce-6245-49f2-b89b-9871f9ee3fa4/03%20(2).svg?cdnVersion=1224)

* Release branches:
![ReleaseBranch](https://wac-cdn.atlassian.com/dam/jcr:a9cea7b7-23c3-41a7-a4e0-affa053d9ea7/04%20(1).svg?cdnVersion=1224)

* Result:  
![NetworkGraph](ng.png)

### Using CICD with github actions
* yml file: https://github.com/rafaeladolfo/fastnewsswiftui/blob/master/.github/workflows/swift.yml
* result:  

![NetworkGraph](cicd.png)
