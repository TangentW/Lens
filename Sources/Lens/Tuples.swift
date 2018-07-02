//
//  Tuples.swift
//  Lens
//
//  Created by Tangent on 2018/7/2.
//

func _1 <A, B>(_ f: @escaping (A) -> A) -> ((A, B)) -> ((A, B)) {
    return { (f($0.0), $0.1) }
}
func _1 <A, B, C>(_ f: @escaping (A) -> A) -> ((A, B, C)) -> ((A, B, C)) {
    return { (f($0.0), $0.1, $0.2) }
}
func _1 <A, B, C, D>(_ f: @escaping (A) -> A) -> ((A, B, C, D)) -> ((A, B, C, D)) {
    return { (f($0.0), $0.1, $0.2, $0.3) }
}
func _1 <A, B, C, D, E>(_ f: @escaping (A) -> A) -> ((A, B, C, D, E)) -> ((A, B, C, D, E)) {
    return { (f($0.0), $0.1, $0.2, $0.3, $0.4) }
}
func _1 <A, B, C, D, E, F>(_ f: @escaping (A) -> A) -> ((A, B, C, D, E, F)) -> ((A, B, C, D, E, F)) {
    return { (f($0.0), $0.1, $0.2, $0.3, $0.4, $0.5) }
}

func _2 <A, B>(_ f: @escaping (B) -> B) -> ((A, B)) -> ((A, B)) {
    return { ($0.0, f($0.1)) }
}
func _2 <A, B, C>(_ f: @escaping (B) -> B) -> ((A, B, C)) -> ((A, B, C)) {
    return { ($0.0, f($0.1), $0.2) }
}
func _2 <A, B, C, D>(_ f: @escaping (B) -> B) -> ((A, B, C, D)) -> ((A, B, C, D)) {
    return { ($0.0, f($0.1), $0.2, $0.3) }
}
func _2 <A, B, C, D, E>(_ f: @escaping (B) -> B) -> ((A, B, C, D, E)) -> ((A, B, C, D, E)) {
    return { ($0.0, f($0.1), $0.2, $0.3, $0.4) }
}
func _2 <A, B, C, D, E, F>(_ f: @escaping (B) -> B) -> ((A, B, C, D, E, F)) -> ((A, B, C, D, E, F)) {
    return { ($0.0, f($0.1), $0.2, $0.3, $0.4, $0.5) }
}

func _3 <A, B, C>(_ f: @escaping (C) -> C) -> ((A, B, C)) -> ((A, B, C)) {
    return { ($0.0, $0.1, f($0.2)) }
}
func _3 <A, B, C, D>(_ f: @escaping (C) -> C) -> ((A, B, C, D)) -> ((A, B, C, D)) {
    return { ($0.0, $0.1, f($0.2), $0.3) }
}
func _3 <A, B, C, D, E>(_ f: @escaping (C) -> C) -> ((A, B, C, D, E)) -> ((A, B, C, D, E)) {
    return { ($0.0, $0.1, f($0.2), $0.3, $0.4) }
}
func _2 <A, B, C, D, E, F>(_ f: @escaping (C) -> C) -> ((A, B, C, D, E, F)) -> ((A, B, C, D, E, F)) {
    return { ($0.0, $0.1, f($0.2), $0.3, $0.4, $0.5) }
}

func _4 <A, B, C, D>(_ f: @escaping (D) -> D) -> ((A, B, C, D)) -> ((A, B, C, D)) {
    return { ($0.0, $0.1, $0.2, f($0.3)) }
}
func _4 <A, B, C, D, E>(_ f: @escaping (D) -> D) -> ((A, B, C, D, E)) -> ((A, B, C, D, E)) {
    return { ($0.0, $0.1, $0.2, f($0.3), $0.4) }
}
func _4 <A, B, C, D, E, F>(_ f: @escaping (D) -> D) -> ((A, B, C, D, E, F)) -> ((A, B, C, D, E, F)) {
    return { ($0.0, $0.1, $0.2, f($0.3), $0.4, $0.5) }
}


func _5 <A, B, C, D, E>(_ f: @escaping (E) -> E) -> ((A, B, C, D, E)) -> ((A, B, C, D, E)) {
    return { ($0.0, $0.1, $0.2, $0.3, f($0.4)) }
}
func _5 <A, B, C, D, E, F>(_ f: @escaping (E) -> E) -> ((A, B, C, D, E, F)) -> ((A, B, C, D, E, F)) {
    return { ($0.0, $0.1, $0.2, $0.3, f($0.4), $0.5) }
}

func _6 <A, B, C, D, E, F>(_ f: @escaping (F) -> F) -> ((A, B, C, D, E, F)) -> ((A, B, C, D, E, F)) {
    return { ($0.0, $0.1, $0.2, $0.3, $0.4, f($0.5)) }
}
