
export type Predicate = (any) -> boolean

export type Stream = {
    originTable: {any},
    create: ({}) -> Stream,
    filter: (any, Predicate) -> Stream,
    collect: () -> {any}
}

export type Tereza = {
    Stream: Stream
}

return nil