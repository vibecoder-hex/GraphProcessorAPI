using Src.Views;

namespace Src.ApiEndpointsProcessor
{
    public static class EndpointsProcessor
    {
        public static void GraphProcessorEndpoints(RouteGroupBuilder GraphProcessorGroup)
        {
            GraphProcessorGroup.MapPost("/bfs/{start}/{target}", AlgorithmViews.BfsView);
            GraphProcessorGroup.MapPost("/dfs/{start}", AlgorithmViews.DfsView);
            GraphProcessorGroup.MapPost("/dijkstra/{start}/{target}", AlgorithmViews.DijkstraView);
        }
    }
}
