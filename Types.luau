
export type Predicate = (any) -> boolean
export type Function = (any) -> any
export type Consumer = (any) -> never
export type Comparator = (first: any, second: any) -> boolean


export type Stream = {
    originTable: {any},

    of: ({}) -> Stream,
    filter: (any, Predicate) -> Stream,
    map: (any, Function) -> Stream,
    sorted: (any, Comparator) -> Stream,

    collect: () -> {any},
    count: () -> number,
    findFirst: () -> any,

    forEach: (any, Consumer) -> never
}

export type Tereza = {
    Stream: Stream
}

return nil