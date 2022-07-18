namespace MyBiz;

internal class WeatherForecastService
{
  private static readonly string[] Summaries = new[]
  {
      "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
  };

  //public Task<WeatherForecast[]> GetForecastAsync(DateTime startDate)
  //{
  //  return Task.FromResult(Enumerable.Range(1, 5).Select(index => new WeatherForecast
  //  {
  //    Date = startDate.AddDays(index),
  //    TemperatureC = Random.Shared.Next(-20, 55),
  //    Summary = Summaries[Random.Shared.Next(Summaries.Length)]
  //  }).ToArray());
  //}

  public List<WeatherForecast> GetForecast(DateTime startDate)
  {
    SpinWait.SpinUntil(() => false, 2 * 1000); // µ¥¤G¬í
    return Enumerable.Range(1, 5).Select(index => new WeatherForecast
    {
      Date = startDate.AddDays(index),
      TemperatureC = Random.Shared.Next(-20, 55),
      Summary = Summaries[Random.Shared.Next(Summaries.Length)]
    }).ToList();
  }

}