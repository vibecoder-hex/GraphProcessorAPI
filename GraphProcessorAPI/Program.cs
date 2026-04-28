using GraphProcessorAPI.Services;
using GraphProcessorAPI.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
var databaseConnectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddControllers();

builder.Services.AddHttpLogging(logging => { });

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddProblemDetails();
builder.Services.AddScoped<IDistanceGraphProcessorService, DistanceGraphProcessingService>();
builder.Services.AddDbContextPool<GraphProcessorContext>(options =>
{
    options.UseNpgsql(databaseConnectionString);
});

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

app.MapControllers();

app.MapGet("/api/health", () => Results.Ok(new { status = "Welcome to Graph Processor API" }));

app.Run();