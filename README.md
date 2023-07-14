# This is the iOSCaseStudy app.

This app supports:

* User Signup
* Showing most popular feeds from: https://developer.ny:mes.com/docs/most-popular-product/1/overview


# Development setup
----

## Xcode

1. Get the latest version on the [Apple Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
   * If you need to also install an earlier version you can download it here: https://developer.apple.com/Xcode/resources/
   * Use `sudo xcode-select -s /path/to/whatever/Xcode.app` to switch versions as needed
2. Open Xcode
3. It may prompt you to agree to some licenses, do so
4. Sign in with your developer account in Xcode > Preferences > Accounts (if you have one)
5. Install the Xcode command line tools: `xcode-select --install`


## git

Clone this repository and open `iOSCaseStudy.xcworkspace` in Xcode. The app will not build until you complete the rest of this guide.


## Cocoapods

### Installation

```sh
sudo gem install cocoapods
```

Open terminal app, goto your project directory and run following command. It will install the dependencies into your project.
```
pod install
``` 


# Building/testing

In Xcode, select the desired simulator and click the play button(on top left) or press ⌘+R to run the app. To test, click and hold on the play button to select the Test option or press ⌘+U.

To run tests from terminal, run `bundle exec fastlane tests`. Go through Fastlane documentation section if you face any issues.


# Fastlane documentation

## Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

## Available Actions

## iOS

### ios archive

This lane builds the app and creates the archive for uploading.

```sh
bundle exec fastlane archive
```

### ios build

This lane builds the app for testing.

```sh
bundle exec fastlane build
```

### ios test

This lane builds and run the tests and also save the reports in html format in current project directory(TestReports).

```sh
bundle exec fastlane test
```

# SwiftLint documentation

## Installation

```sh
brew install swiftLint
```

## Available Actions

## Generate linter report

```sh
swiftlint lint --reporter html > swiftlint.html
```

Run this command in your project directory. This will save the reports to your working directory (as swiftlint.html).
