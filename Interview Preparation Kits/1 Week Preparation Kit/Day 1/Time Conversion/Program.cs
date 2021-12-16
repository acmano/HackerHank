using System;
using System.IO;

using static System.Environment;

namespace Time_Conversion
{
  internal class Program
  {
    private static string TimeConversion
    (
      string s
    )
    {
      int hour = Convert.ToInt32
      (
        s.Substring
        (
          0
        , 2
        )
      );
      if (s.Substring
           (
             8
           , 2
           )
           == "PM")
      {
        if (hour >= 1
             && hour <= 11)
        {
          hour += 12;
        }
      }
      else
      {
        if (hour == 12)
        {
          hour = 0;
        }
      }

      s = hour.ToString
          (
            "00"
          )
          + s.Substring
          (
            2
          , 6
          );

      return s;
    }

    private static void Main
    (
      string[] args
    )
    {
      TextWriter textWriter = new StreamWriter
      (
        GetEnvironmentVariable
        (
          "OUTPUT_PATH"
        )
        ?? string.Empty
      , true
      );

      string s = Console.ReadLine();

      string result = TimeConversion
      (
        s
      );

      textWriter.WriteLine
      (
        result
      );

      textWriter.Flush();
      textWriter.Close();
    }
  }
}