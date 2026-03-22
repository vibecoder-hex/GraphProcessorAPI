using Src.Views;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHttpLogging(logging => { });

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddProblemDetails();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseSwaggerUI(options =>
{
    options.SwaggerEndpoint("/swagger/v1/swagger.json", "Graph Processor API V1");
    options.RoutePrefix = string.Empty;
});

app.UseHttpLogging();

if (!app.Environment.IsDevelopment())
    app.UseExceptionHandler();

var graphProcessorGroup = app.MapGroup("/api/graph_processor");
graphProcessorGroup.MapPost("/bfs/{start}/{target}", AlgorithmViews.BfsView)
    .WithName("BfsAlgorithm");
graphProcessorGroup.MapPost("/dfs/{start}", AlgorithmViews.DfsView)
    .WithName("DfsAlgorithm");
graphProcessorGroup.MapPost("/dijkstra/{start}/{target}", AlgorithmViews.DijkstraView)
    .WithName("DijkstaAlgorithm");


var serviceGroup = app.MapGroup("/api/service");
serviceGroup.MapGet("/health", () => Results.Ok(new { Message = "Welcome to Graph processor" }));

app.Run();