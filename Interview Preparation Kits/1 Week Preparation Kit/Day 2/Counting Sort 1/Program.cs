using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using static System.String;

namespace Counting_Sort_1
{
  internal class Program
  {
    public static List<int> CountingSort
    (
      List<int> arr
    )
    {
      List<int> result = new List<int>();
      for (int i = 0
            ; i < 100
            ; i++)
      {
        result.Add
        (
          0
        );
      }

      for (int i = 0
            ; i < arr.Count
            ; i++)
      {
        result[i]++;
      }

      return result;
    }

    public static void Main
    (
      string[] args
    )
    {
      TextWriter textWriter = new StreamWriter
      (
        Environment.GetEnvironmentVariable
        (
          "OUTPUT_PATH"
        )
        ?? Empty
      , true
      );

      int n = Convert.ToInt32
      (
        Console.ReadLine()
              ?.Trim()
      );

      List<int> arr = Console.ReadLine()
                               ?.TrimEnd()
                                .Split
                                 (
                                   ' '
                                 )
                                .ToList()
                                .Select
                                 (
                                   arrTemp => Convert.ToInt32
                                   (
                                     arrTemp
                                   )
                                 )
                                .ToList();

      List<int> result = CountingSort
      (
        arr
      );

      textWriter.WriteLine
      (
        Join
        (
          " "
        , result
        )
      );

      textWriter.Flush();
      textWriter.Close();
    }
  }
}