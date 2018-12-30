# Infusion

[![Travis CI](https://travis-ci.org/akiroz/Infusion.svg?branch=master)](https://travis-ci.org/akiroz/Infusion)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![Swift: 4](https://img.shields.io/badge/Swift-4-orange.svg)]()
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgray.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A simple dependency injection micro-framework for Swift 4 with emphasis on minimal boilerplate code.

Infusion currently only supports exact-type dependency injection on classes with a nullary init.
Cyclic dependency is also unsupported.

## Infusion 2.0 Changes

- [Breaking] The `Infusible` protocol now expects a nullary init instead of taking a single `Flask` instance
- [Breaking] The dependencies no longer needs to be declared using `dissove()` before calling `extract()`
- [Breaking] `extract()` no longer returns optional instances, cyclic dependencies will result in `fatalError`
- Added a static shared `Flask` instance `Flask.shared`

## Install

Carthage:

```
github "akiroz/Infusion" ~> 2.0
```

## Usage

```swift
import protocol Infusion.Infusible  // Apply to classes managed by Infusion
import class Infusion.Flask         // Dependency container

// Example: Foo depends on Bar
// =====================================================

class Bar: Infusible {
    required init() {}
}

class Foo {
    let bar: Bar = Flask.shared.extract()
}

// Do something with foo
let foo = Foo()

```

