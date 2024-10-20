using Microsoft.EntityFrameworkCore;
using ApiEmpresa.Models;
var builder = WebApplication.CreateBuilder(args);

// Ambas pueden funcionar solo se debe de cambiar la igualdad de la variable cadena y el metodo opt.
//"MySqlConnection" para conectar con MySQL
//"SqlServerConnection" para conectar con SQLServer

String cadena = builder.Configuration.GetConnectionString("MySqlConnection") ?? "otracadena";
builder.Services.AddControllers();
builder.Services.AddDbContext<Conexiones>(opt =>
    opt.UseMySQL(cadena));
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
