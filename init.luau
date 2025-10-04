--!strict

local Types = require(script.Types)

export type Predicate = Types.Predicate
export type Function = Types.Function
export type Consumer = Types.Consumer
export type Comparator = Types.Comparator

export type Stream = Types.Stream
export type DeepClone = Types.DeepClone

export type Tereza = Types.Tereza

local Tereza : Tereza = {
    Stream = require(script.Stream),
    DeepClone = require(script.DeepClone)
}


return Tereza