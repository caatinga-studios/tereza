
export type Predicate = (any) -> boolean
export type Function = (any) -> any
export type Consumer = (any) -> never
export type Comparator = (first: any, second: any) -> boolean

export type Stream = {
    originTable: {any},

    of: ({}) -> Stream,
    empty: () -> Stream,
    filter: (any, Predicate) -> Stream,
    map: (any, Function) -> Stream,
    sorted: (any, Comparator) -> Stream,

    collect: () -> {any},
    count: () -> number,
    findFirst: () -> any,

    forEach: (any, Consumer) -> never
}

export type DeepClone = {
    clone: ({}) -> {}
}

export type Tereza = {
    Stream: Stream,
    DeepClone: DeepClone
}

return nil