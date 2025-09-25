--!strict

local Types = require(script.Types)

export type Predicate = Types.Predicate
export type Function = Types.Function

export type Stream = Types.Stream

export type Tereza = Types.Tereza

local Tereza : Tereza = {
    Stream = require(script.Stream)
}


return Tereza