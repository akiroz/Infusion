# Infusion

[![Travis CI](https://travis-ci.org/akiroz/Infusion.svg?branch=master)](https://travis-ci.org/akiroz/Infusion)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![Swift: 4](https://img.shields.io/badge/Swift-4-orange.svg)]()
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgray.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A simple dependency injection micro-framework for Swift 4 with emphasis on minimal boilerplate code.

Infusion currently only supports constructor-based exact-type dependency injection.

## Install

Carthage:

```
github "akiroz/Infusion"
```

## Usage

```swift
import protocol Infusion.Infusible  // Apply to classes managed by Infusion
import class Infusion.Flask         // Dependency container

// Example: MyFoo depends on MyBar
// =====================================================

class MyBar: Infusible {
    required init(_: Flask) {}
}

class MyFoo: Infusible {
    let myBar: MyBar?
    required init(_ f: Flask) {
        myBar = f.extract()
    }
}

let f = Flask()

// Extracts type information using Swift's Generics
f.dissove({(_:MyBar) -> MyFoo? in nil})

// Do something with myFoo
let myFoo: MyFoo = f.extract()!



// Example: MyView depends on MyLogic
// =====================================================

class MyLogic: Infusible {
    required init(_: Flask) {}
}

class MyView: UIViewController, Infusible {
    let logic: MyLogic?
    required convenience init(_ f: Flask) {
        self.init() // Call inherited designated init (i.e. UIViewController())
        self.logic = f.extract()
    }
}

let f = Flask()
f.dissove({(_:MyBar) -> MyFoo? in nil})
let v: MyView = f.extract()!
window!.rootViewController = v
window!.makeKeyAndVisible()

```

## Gotcha: Dependency Sorting

Infusion does not perform topological sorting of your dependencies due to implementation
difficulty, therefore dependencies are not guaranteed to exist in the `Flask` passed to
your constructor.

It is the user's responsibility to call `flask.dissove` in the correct order. For example:
if you have the dependency structure `A -> B -> C`, you must call `A -> B` before `B -> C`
otherwise `A` will not be provided to `B`.

## Gotcha: Max number of Dependencies

Infusion currently only supports a max number of dependencies of `12`. This is because
Infusion's implementation relies on arity overloading on the `dissove` method.


