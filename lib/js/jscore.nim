#
#
#            Nim's Runtime Library
#        (c) Copyright 2018 Nim contributors
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#

## This module wraps core JavaScript functions.
##
## Unless your application has very
## specific requirements and solely targets JavaScript, you should be using
## the relevant functions in the ``math``, ``json``, and ``times`` stdlib
## modules instead.

when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works on the JavaScript platform".}

type
  MathLib* = ref object
  JsonLib* = ref object
  DateLib* = ref object
  DateTime* = ref object

var
  Math* {.importc, nodecl.}: MathLib
  Date* {.importc, nodecl.}: DateLib
  JSON* {.importc, nodecl.}: JsonLib

# Math library
proc abs*(m: MathLib, a: SomeNumber): SomeNumber {.importcpp.}
proc acos*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc acosh*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc asin*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc asinh*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc atan*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc atan2*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc atanh*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc cbrt*(m: MathLib, f: SomeFloat): SomeFloat {.importcpp.}
proc ceil*(m: MathLib, f: SomeFloat): SomeFloat {.importcpp.}
proc clz32*(m: MathLib, f: SomeInteger): int {.importcpp.}
proc cos*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc cosh*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc exp*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc expm1*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc floor*(m: MathLib, f: SomeFloat): int {.importcpp.}
proc fround*(m: MathLib, f: SomeFloat): float32 {.importcpp.}
proc hypot*(m: MathLib, args: varargs[distinct SomeNumber]): float {.importcpp.}
proc imul*(m: MathLib, a, b: int32): int32 {.importcpp.}
proc log*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc log10*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc log1p*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc log2*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc max*(m: MathLib, a, b: SomeNumber): SomeNumber {.importcpp.}
proc min*[T: SomeNumber | JsRoot](m: MathLib, a, b: T): T {.importcpp.}
proc pow*(m: MathLib, a, b: distinct SomeNumber): float {.importcpp.}
proc random*(m: MathLib): float {.importcpp.}
proc round*(m: MathLib, f: SomeFloat): int {.importcpp.}
proc sign*(m: MathLib, f: SomeNumber): int {.importcpp.}
proc sin*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc sinh*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc sqrt*(m: MathLib, f: SomeFloat): SomeFloat {.importcpp.}
proc tan*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc tanh*(m: MathLib, a: SomeNumber): float {.importcpp.}
proc trunc*(m: MathLib, f: SomeFloat): int {.importcpp.}

# Date library
proc now*(d: DateLib): int {.importcpp.}
proc UTC*(d: DateLib): int {.importcpp.}
proc parse*(d: DateLib, s: cstring): int {.importcpp.}

proc newDate*(): DateTime {.
  importcpp: "new Date()".}

proc newDate*(date: int|string): DateTime {.
  importcpp: "new Date(#)".}

proc newDate*(year, month, day, hours, minutes,
             seconds, milliseconds: int): DateTime {.
  importcpp: "new Date(#,#,#,#,#,#,#)".}

proc getDay*(d: DateTime): int {.importcpp.}
proc getFullYear*(d: DateTime): int {.importcpp.}
proc getHours*(d: DateTime): int {.importcpp.}
proc getMilliseconds*(d: DateTime): int {.importcpp.}
proc getMinutes*(d: DateTime): int {.importcpp.}
proc getMonth*(d: DateTime): int {.importcpp.}
proc getSeconds*(d: DateTime): int {.importcpp.}
proc getYear*(d: DateTime): int {.importcpp.}
proc getTime*(d: DateTime): int {.importcpp.}
proc toString*(d: DateTime): cstring {.importcpp.}

#JSON library
proc stringify*(l: JsonLib, s: JsRoot): cstring {.importcpp.}
proc parse*(l: JsonLib, s: cstring): JsRoot {.importcpp.}
