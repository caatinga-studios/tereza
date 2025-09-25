
export type Predicate = (any) -> boolean
export type Function = (any) -> any

export type Stream = {
    originTable: {any},

    create: ({}) -> Stream,
    filter: (any, Predicate) -> Stream,
    map: (any, Function) -> Stream,

    collect: () -> {any},
    count: () -> number
}

export type Tereza = {
    Stream: Stream
}

return nil