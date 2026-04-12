export type allPossibleDataType = string | number | boolean | string[] | number[] | boolean[] | null

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

export interface IOperationResult {
    isValid: boolean,
    errorMessage: string,
}

export interface IResponseOperationResult {
    operation: IOperationResult,
    responseData: IDistanceProcessingRootObject | null
}
