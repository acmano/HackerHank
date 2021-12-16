using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using static System.String;

namespace Diagonal_Difference
{
  internal static class Program
  {
    private static int DiagonalDifference
    (
      IReadOnlyList<List<int>> arr
    )
    {
      int diagonal1 = 0;
      int diagonal2 = 0;
      int dimensao = arr[0]
       .Count;
      for (int cursor = 0
            ; cursor < dimensao
            ; cursor++)
      {
        diagonal1 += arr[cursor][cursor];
        diagonal2 += arr[cursor][dimensao - 1 - cursor];
      }

      int dd = Math.Abs
      (
        diagonal1 - diagonal2
      );
      return dd;
    }

    private static void Main()
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

      List<List<int>> arr = new List<List<int>>();

      for (int i = 0
            ; i < n
            ; i++)
      {
        arr.Add
        (
          Console.ReadLine()
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
                 .ToList()
        );
      }

      int result = DiagonalDifference
      (
        arr
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