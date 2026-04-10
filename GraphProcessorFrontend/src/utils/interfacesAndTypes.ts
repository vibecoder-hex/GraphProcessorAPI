export type allPossibleDataType = string | number | boolean | string[] | number[] | boolean[] | undefined | null

export interface IDistanceProcessingResultObject {
    algorithm: string,
    startVertex: string,
    shortestPath: string[],
    timeNs: number,
    [anotherProperties: string]: allPossibleDataType
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

export interface IGraphOperationResult {
    isValid: boolean,
    errorMessage: string
}