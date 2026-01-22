using Src.ApiEndpointsProcessor;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHttpLogging(logging => { });

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

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

EndpointsProcessor.GraphProcessorEndpoints(app.MapGroup("/api/graph_processor"));

app.Run();