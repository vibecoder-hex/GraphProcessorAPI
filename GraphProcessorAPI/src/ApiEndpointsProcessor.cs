using Src.Views;

namespace Src.ApiEndpointsProcessor
{
    public static class EndpointsProcessor
    {
        public static void GraphProcessorEndpoints(RouteGroupBuilder graphProcessorGroup)
        {
            graphProcessorGroup.MapPost("/bfs/{start}/{target}", AlgorithmViews.BfsView)
                .WithName("BfsAlgorithm");
            graphProcessorGroup.MapPost("/dfs/{start}", AlgorithmViews.DfsView)
                .WithName("DfsAlgorithm");
            graphProcessorGroup.MapPost("/dijkstra/{start}/{target}", AlgorithmViews.DijkstraView)
                .WithName("DijkstaAlgorithm");
        }

        public static void ServiceEndpoits(RouteGroupBuilder serviceGroup)
        {
            serviceGroup.MapGet("/health", () => Results.Ok(new { Message = "Welcome to Graph processor" }));
        }
    }
}
