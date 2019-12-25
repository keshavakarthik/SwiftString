# SwiftString

[![Version](https://img.shields.io/cocoapods/v/String+Extensions.svg?style=flat)](http://cocoapods.org/pods/String+Extensions)
[![License](https://img.shields.io/cocoapods/l/String+Extensions.svg?style=flat)](http://cocoapods.org/pods/String+Extensions) ![Language](https://img.shields.io/badge/language-Swift%205.0-green.svg)


SwiftString is a lightweight string extension for Swift 3 and 4.
This library was motivated by having to search StackOverflow for common string operations,
and wanting them to be in one place with test coverage.

Note the original client side Swift 2 repo can be found here:
[https://github.com/amayne/SwiftString](https://github.com/amayne/SwiftString)

## This Fork

This fork is intended as a server side utility.
* It is Swift 5.0 and Swift Package Manager (SPM) ready.
* Removed the warnings.
* Removed the deprecated String methods.

## Swift 3.0.2, 3.1 only

If you are targeting Swift 3.0.2 or 3.1 only, please use the majorVersion:1 in your Package.swift file:

``` swift
.Package(url: "https://github.com/iamjono/SwiftString.git", majorVersion: 1),
```

This release works for both Swift 3.0.2 and 3.1, on macOS and Linux.


## Swift 3.0.2, 3.1, 3.2 and Swift 4.0

If you have updated to Swift 4, or plan to in the near future, use the majorVersion:2 in your Package.swift file. This version brings compatibility with Swift 4, and is backwards compatible with the 3.x codebases.

``` swift
.Package(url: "https://github.com/iamjono/SwiftString.git", majorVersion: 2),
```

The latest release works for Swift 3.x and Swift 4 on macOS and Linux.

## Swift 5.x

Update for Swift 5 and above, major verion is 3
``` swift
    dependencies: [
        .package(url: "https://github.com/iamjono/SwiftString.git", , from: "3.0.0")
    ]
```


## Usage

```swift
import SwiftString
```

## Methods

**between(left, right)**

``` swift
"<a>foo</a>".between("<a>", "</a>") // "foo"
"<a><a>foo</a></a>".between("<a>", "</a>") // "<a>foo</a>"
"<a>foo".between("<a>", "</a>") // nil
"Some strings } are very {weird}, dont you think?".between("{", "}") // "weird"
"<a></a>".between("<a>", "</a>") // nil
 "<a>foo</a>".between("<a>", "<a>") // nil
```

**camelize()**

```swift
"os version".camelize() // "osVersion"
"HelloWorld".camelize() // "helloWorld"
"someword With Characters".camelize() // "somewordWithCharacters"
"data_rate".camelize() // "dataRate"
"background-color".camelize() // "backgroundColor"
```


**capitalize()**

```swift
"hello world".capitalize() // "Hello World"
```

**chompLeft(string)**

```swift
"foobar".chompLeft("foo") // "bar"
"foobar".chompLeft("bar") // "foo"
```

**chompRight(string)**

```swift
"foobar".chompRight("bar") // "foo"
"foobar".chompRight("foo") // "bar"
```

**cleanPath()**

```swift
var foo = "hello//world/..///stuff.txt"
foo.cleanPath() // foo == "hello/stuff.txt"
```

**cleanedPath()**

```swift
"hello//world/..///stuff.txt".cleanedPath() // "hello/stuff.txt"
```

**collapseWhitespace()**

```swift
"  String   \t libraries are   \n\n\t fun\n!  ".collapseWhitespace() // "String libraries are fun !")
```

**count(string)**

```swift
"hi hi ho hey hihey".count("hi") // 3
```

**decodeHTML()**

```swift
"The Weekend &#8216;King Of The Fall&#8217;".decodeHTML() // "The Weekend ‘King Of The Fall’"
"<strong> 4 &lt; 5 &amp; 3 &gt; 2 .</strong> Price: 12 &#x20ac;.  &#64; ".decodeHTML() // "<strong> 4 < 5 & 3 > 2 .</strong> Price: 12 €.  @ "
"this is so &quot;good&quot;".decodeHTML() // "this is so \"good\""
```

**endsWith(suffix)**

```swift
"hello world".endsWith("world") // true
"hello world".endsWith("foo") // false
```

**ensureLeft(prefix)**

```swift
"/subdir".ensureLeft("/") // "/subdir"
"subdir".ensureLeft("/") // "/subdir"
```

**ensureRight(suffix)**

```swift
"subdir/".ensureRight("/") // "subdir/"
"subdir".ensureRight("/") // "subdir/"
```

**extension**

```swift
"/hello/world.txt".extension // "txt"
"/hello/world.tmp.txt".extension // "txt"
```

**file**

```swift
"/hello/world.txt".file // "world.txt"
"/hello/there/".file // "there"
```

**fileName**

```swift
"/hello/world.txt".fileName // "world"
"/hello/there/".fileName // "there"
```

**index(of: substring)**

```swift
"hello".index(of: "hell"), // 0
"hello".index(of: "lo"), // 3
"hello".index(of: "world") // -1
"hellohello".index(of: "hel", after: 2) // 5
```

**indexOf(substring)** - deprecated in favor of `index(of:)` above

```swift
"hello".indexOf("hell"), // 0
"hello".indexOf("lo"), // 3
"hello".indexOf("world") // nil
```

**initials()**

```swift
"First".initials(), // "F"
"First Last".initials(), // "FL"
"First Middle1 Middle2 Middle3 Last".initials() // "FMMML"
```

**initialsFirstAndLast()**

```swift
"First Last".initialsFirstAndLast(), // "FL"
"First Middle1 Middle2 Middle3 Last".initialsFirstAndLast() // "FL"
```

**isAlpha()**

```swift
"fdafaf3".isAlpha() // false
"afaf".isAlpha() // true
"dfdf--dfd".isAlpha() // false
```

**isAlphaNumeric()**

```swift
"afaf35353afaf".isAlphaNumeric() // true
"FFFF99fff".isAlphaNumeric() // true
"99".isAlphaNumeric() // true
"afff".isAlphaNumeric() // true
"-33".isAlphaNumeric() // false
"aaff..".isAlphaNumeric() // false
```

**isEmpty()**

```swift
" ".isEmpty() // true
"\t\t\t ".isEmpty() // true
"\n\n".isEmpty() // true
"helo".isEmpty() // false
```

**isNumeric()**

```swift
"abc".isNumeric() // false
"123a".isNumeric() // false
"1".isNumeric() // true
"22".isNumeric() // true
"33.0".isNumeric() // true
"-63.0".isNumeric() // true
```

**join(paths...)**

```swift
var root = "/foo"
root.join("bar", "/baz", "..", "//somedata.txt") // root == "/foo/bar/somedata.txt"

var root = "/foo"
root.join(paths: ["bar", "/baz", "..", "//somedata.txt"]) // root == "/foo/bar/somedata.txt"
```

**joining(paths...)**

```swift
"/foo".joining("bar", "/baz", "..", "//somedata.txt") // "/foo/bar/somedata.txt"
"/foo".joining(paths: ["bar", "/baz", "..", "//somedata.txt"]) // "/foo/bar/somedata.txt"
```

**lastIndex(of: substring)**

```swift
"hellohellohello".lastIndex(of: "hell"), // 10
"hellohellohello".lastIndex(of: "lo"), // 13
"hellohellohello".lastIndex(of: "world") // -1
"hellohellohello".lastIndex(of: "hel", before: 10) // 5
```

**latinize()**

```swift
"šÜįéïöç".latinize() // "sUieioc"
"crème brûlée".latinize() // "creme brulee"
```

**lines()**

```swift
"test".lines() // ["test"]
"test\nsentence".lines() // ["test", "sentence"]
"test \nsentence".lines() // ["test ", "sentence"]
```

**pad(n, string)**

```swift
"hello".pad(2) // "  hello  "
"hello".pad(1, "\t") // "\thello\t"
```

**padLeft(n, string)**

```swift
"hello".padLeft(10) // "          hello"
"what?".padLeft(2, "!") // "!!what?"
```

**padRight(n, string)**

```swift
"hello".padRight(10) // "hello          "
"hello".padRight(2, "!") // "hello!!"
```

**parent**

```swift
"/hello/there/world.txt".parent // "/hello/there"
"/hello/there".parent // "/hello"
```

**startsWith(prefix)**

```swift
"hello world".startsWith("hello") // true
"hello world".startsWith("foo") // false
```

**split(separator)**

```swift
"hello world".split(" ")[0] // "hello"
"hello world".split(" ")[1] // "world"
"helloworld".split(" ")[0] // "helloworld"
```

**times(n)**

```swift
"hi".times(3) // "hihihi"
" ".times(10) // "          "
```

**toBool()**

```swift
"asdwads".toBool() // nil
"true".toBool() // true
"false".toBool() // false
```

**toFloat()**

```swift
"asdwads".toFloat() // nil
"2.00".toFloat() // 2.0
"2".toFloat() // 2.0
```

**toInt()**

```swift
"asdwads".toInt() // nil
"2.00".toInt() // 2
"2".toInt() // 2
```

**toDate()**

```swift
"asdwads".toDate() // nil
"2014-06-03".toDate() // NSDate
```

**toDateTime()**

```swift
"asdwads".toDateTime() // nil
"2014-06-03 13:15:01".toDateTime() // NSDate
```

**toDouble()**

```swift
"asdwads".toDouble() // nil
"2.00".toDouble() // 2.0
"2".toDouble() // 2.0
```

**trimmedLeft()**

```swift
"        How are you? ".trimmedLeft() // "How are you? "
```

**trimmedRight()**

```swift
" How are you?   ".trimmedRight() // " How are you?"
```

**trimmed()**

```swift
"    How are you?   ".trimmed() // "How are you?"
```

**slugify()**

```swift
"Global Thermonuclear Warfare".slugify() // "global-thermonuclear-warfare"
"Crème brûlée".slugify() // "creme-brulee"
```

**stripPunctuation()**

```swift
"My, st[ring] *full* of %punct)".stripPunctuation() // "My string full of punct"
```

**substring(startIndex, length)**

```swift
"hello world".substring(0, length: 1) // "h"
"hello world".substring(0, length: 11) // "hello world"
```

**[subscript]**

```swift
"hello world"[0...1] // "he"
"hello world"[0..<1] // "h"
"hello world"[0] // "h"
"hello world"[0...10] // "hello world"
"hello world"[safe: -1...1] // "he"
"hello world"[safe: 9...20] // "ld"
```

## Requirements

- Swift version 3.x or Swift 4. Please see notes above.

## Installation

### Install via Swift Package Manager

* Add the following to your `Package.swift` file:

``` swift
.Package(
    url: "https://github.com/iamjono/SwiftString.git",
    majorVersion: 2
    ),
```

Then, regenerate your Xcode project:

```
swift package generate-xcodeproj
```

### Install via Cocoapods

```ruby
pod "String+Extensions"
```

## Author

Andrew Mayne, andrew@redbricklab.com

Swift 3 & 4 SPM module, Jonathan Guthrie, jono@guthrie.net.nz

Swift 5 & 5 SPM module, Keshavakarthik S, kesh1988@gmail.com

Cocoapods, Koji Murata, malt.koji@gmail.com

## License

SwiftString is available under the MIT license. See the LICENSE file for more info.
