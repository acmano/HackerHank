using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Find_The_Median
{
  internal class Program
  {
    private static int FindMedian
    (
      List<int> arr
    )
    {
      arr.Sort();
      int x = (arr.Count - 1) / 2;
      return arr[x];
    }

    private static void Main()
    {
      TextWriter textWriter = new StreamWriter
      (
        Environment.GetEnvironmentVariable
        (
          "OUTPUT_PATH"
        )
        ?? string.Empty
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
      int result = FindMedian
      (
        arr
      );
      textWriter.WriteLine
      (
        result
      );
      textWriter.Flush();
    }
  }
}