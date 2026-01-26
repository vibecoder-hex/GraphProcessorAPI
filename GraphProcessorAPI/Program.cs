using Src.ApiEndpointsProcessor;

var builder = WebApplication.CreateBuilder(args);

var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                        policy =>
                        {
                            policy.WithOrigins("http://localhost:5173")
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                        });
});

builder.Services.AddHttpLogging(logging => { });

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseCors(MyAllowSpecificOrigins);

app.UseSwaggerUI(options =>
{
    options.SwaggerEndpoint("/swagger/v1/swagger.json", "Graph Processor API V1");
    options.RoutePrefix = string.Empty;
});

app.UseHttpLogging();

if (!app.Environment.IsDevelopment())
    app.UseExceptionHandler();

EndpointsProcessor.GraphProcessorEndpoints(app.MapGroup("/api/graph_processor"));
EndpointsProcessor.ServiceEndpoits(app.MapGroup("/api/service"));

app.Run();