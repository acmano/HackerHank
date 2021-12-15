using System;
using System.Collections.Generic;
using System.Linq;

using static System.Console;

namespace PlusMinus
{
  internal static class Program
  {
    private static void PlusMinus
    (
      List<int> arr
    )
    {
      int qtd = 0;
      int ratioPlusQtd = 0;
      int ratioMinusQtd = 0;
      int ratioZeroQtd = 0;
      foreach (int number in arr)
      {
        if (number >= -100
             && number <= 100)
        {
          qtd++;
          if (number > 0)
          {
            ratioPlusQtd++;
          }
          else
          {
            if (number < 0)
            {
              ratioMinusQtd++;
            }
            else
            {
              ratioZeroQtd++;
            }
          }
        }
      }

      if (qtd > 0)
      {
        WriteLine
        (
          (ratioPlusQtd / (double)qtd).ToString
          (
            "0.000000"
          )
        );
        WriteLine
        (
          (ratioMinusQtd / (double)qtd).ToString
          (
            "0.000000"
          )
        );
        WriteLine
        (
          (ratioZeroQtd / (double)qtd).ToString
          (
            "0.000000"
          )
        );
      }
    }

    private static void Main
    (
      string[] args
    )
    {
      int n = Convert.ToInt32
      (
        ReadLine()
         .Trim()
      );
      List<int> arr = ReadLine()
                        .TrimEnd()
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
      PlusMinus
      (
        arr
      );
    }
  }
}