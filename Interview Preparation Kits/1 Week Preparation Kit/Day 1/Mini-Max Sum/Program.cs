using System;
using System.Collections.Generic;
using System.Linq;

using static System.Console;

namespace Mini_Max_Sum
{
  internal static class Program
  {
    private static void MiniMaxSum
    (
      List<long> arr
    )
    {
      arr.Sort();
      long sumMinor = 0;
      long sumMax = 0;
      for (int i = 0
            ; i < 5
            ; i++)
      {
        if (arr[i] < 1
             || arr[i] > 1000000000)
        {
          arr[i] = 0;
        }

        if (i < 4)
        {
          sumMinor += arr[i];
        }

        if (i > 0)
        {
          sumMax += arr[i];
        }
      }

      WriteLine
      (
        "{0} {1}"
      , sumMinor
      , sumMax
      );
    }

    public static void Main
    (
      string[] args
    )
    {
      List<long> arr = ReadLine()
                        ?.TrimEnd()
                         .Split
                          (
                            ' '
                          )
                         .ToList()
                         .Select
                          (
                            arrTemp => Convert.ToInt64
                            (
                              arrTemp
                            )
                          )
                         .ToList();

      MiniMaxSum
      (
        arr
      );
    }
  }
}