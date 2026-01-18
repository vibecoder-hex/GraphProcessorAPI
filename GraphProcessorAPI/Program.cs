using Src.ApiEndpointsProcessor;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddHttpLogging(o => { });

var app = builder.Build();

app.UseHttpLogging();

if (!app.Environment.IsDevelopment())
    app.UseExceptionHandler();

EndpointsProcessor.GraphProcessorEndpoints(app.MapGroup("/api/graph_processor"));

app.Run();