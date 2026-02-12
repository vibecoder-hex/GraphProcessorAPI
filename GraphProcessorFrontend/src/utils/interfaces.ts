import type { DataSet, Edge, Node } from "vis-network/standalone"

export type jsonResponseDataTypes = string | number | boolean | string[] | number[] | boolean[] | undefined | null

export interface IDistanceProcessingResultObject {
    algorithm: string,
    startVertex: string,
    shortestPath: string[],
    timeNs: number
    [anotherProperties: string]: jsonResponseDataTypes 
}

export interface IDistanceProcessingRootObject {
    result: IDistanceProcessingResultObject
}

export interface IDistanceRootObject {
    Distances: IDistanceGraphStructureObject
}

export interface IDistanceGraphStructureObject {
        [vertex: string]: {
            [neighbor: string]: number
    }
}