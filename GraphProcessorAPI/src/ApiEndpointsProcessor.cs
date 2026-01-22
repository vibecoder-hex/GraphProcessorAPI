using Src.Views;

namespace Src.ApiEndpointsProcessor
{
    public static class EndpointsProcessor
    {
        public static void GraphProcessorEndpoints(RouteGroupBuilder GraphProcessorGroup)
        {
            GraphProcessorGroup.MapPost("/bfs/{start}/{target}", AlgorithmViews.BfsView)
                .WithName("BfsAlgorithm");
            GraphProcessorGroup.MapPost("/dfs/{start}", AlgorithmViews.DfsView)
                .WithName("DfsAlgorithm");
            GraphProcessorGroup.MapPost("/dijkstra/{start}/{target}", AlgorithmViews.DijkstraView)
                .WithName("DijkstaAlgorithm");
        }
    }
}
