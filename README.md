# Lens
Lens for Swift.

Only implements `Setter` of Lens, it is no necessary to implements `Getter` in
Swift, just use `dot syntax` to access properties. 

# Let's fly
## Immutable Data
### Struct
```Swift
struct Rect: Equatable {
    let origin: Point
    let size: Size
}

struct Size: Equatable {
    let width: CGFloat
    let height: CGFloat
}

struct Point: Equatable {
    let x: CGFloat
    let y: CGFloat
}

/// Extensions for Lens
extension Point {
    static let xLens = lens(view: { $0.x }, set: { Point(x: $0, y: $1.y) })
    static let yLens = lens(view: { $0.y }, set: { Point(x: $1.x, y: $0) })
}
extension Size {
    static let widthLens = lens(view: { $0.width }, set: { Size(width: $0, height: $1.height) })
    static let heightLens = lens(view: { $0.height }, set: { Size(width: $1.width, height: $0) })
}
extension Rect {
    static let originLens = lens(view: { $0.origin }, set: { Rect(origin: $0, size: $1.size) })
    static let sizeLens = lens(view: { $0.size }, set: { Rect(origin: $1.origin, size: $0) })
}

/// Just fly
func fly() {
    let original = Rect(
        origin: Point(x: 2, y: 2),
        size: Size(width: 2, height: 3)
    )
    let result = Rect(
        origin: Point(x: 2, y: 3),
        size: Size(width: 20, height: 30)
    )
    
    let haha = original
        |> Rect.originLens <<< Point.yLens .~ 3
        |> Rect.sizeLens <<< Size.widthLens %~ { 10 * $0 }
        |> Rect.sizeLens <<< Size.heightLens %~ { 10 * $0 }
    
    // Sure ~
//    result == haha
}
```

### Tuple
```Swift
let tuple = (1, (2, 3, (4, 5, 6, (7, 8))))
let resultTuple = tuple |> _2 <<<  _3 <<< _4 <<< _2 .~ 9
// Sure ~
// resultTuple.1.2.3.1 == 9
```

## Using `KeyPath` for mutable Data 
```Swift
    let formatter = DateFormatter()
        |> \.dateFormat .~ "yyyy-MM-dd"
        |> \.timeZone .~ TimeZone(secondsFromGMT: 0)
```

