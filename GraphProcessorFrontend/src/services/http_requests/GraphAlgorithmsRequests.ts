import axios from 'axios'
import type { IDistanceRootObject, IResponseOperationResult } from "@/models/interfacesAndTypes.ts";

export async function getPathFromRequest(selectedUrl: string, distanceJSONObject: IDistanceRootObject): Promise<IResponseOperationResult> {
    try {
        const response = await axios.post(selectedUrl, distanceJSONObject)
        return {
            operation: {
                isValid: true,
                errorMessage: ""
            },
            responseData: response.data
        }
    } catch(error) {
        if (axios.isAxiosError(error)) {
            return {
                operation: {
                    isValid: false,
                    errorMessage: `Error: ${error} ${error.response?.data.error}`,
                },
                responseData: null
            }
        }
        else {
            return {
                operation: {
                    isValid: false,
                    errorMessage: `Error: ${error}`,
                },
                responseData: null
            }
        }
    }
}