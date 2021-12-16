using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using static System.Math;

namespace Flipping_The_Matrix
{
  internal static class Program
  {
    private static int FlippingMatrix
    (
      List<List<int>> matrix
    )
    {
      int sum = 0;
      int quadSize = matrix.Count / 2;
      for (int r = 0
            ; r < quadSize
            ; r++)
      {
        for (int c = 0
              ; c < quadSize
              ; c++)
        {
          int p1 = matrix[r][2 * quadSize - c - 1];
          int p2 = matrix[r][c];
          int p3 = matrix[2 * quadSize - r - 1][c];
          int p4 = matrix[2 * quadSize - r - 1][2 * quadSize - c - 1];
          sum += Max
          (
            p1
          , Max
            (
              p2
            , Max
              (
                p3
              , p4
              )
            )
          );
        }
      }

      return sum;
    }

    public static void Main()
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

      int q = Convert.ToInt32
      (
        Console.ReadLine()
              ?.Trim()
      );

      for (int qItr = 0
            ; qItr < q
            ; qItr++)
      {
        int n = Convert.ToInt32
        (
          Console.ReadLine()
                ?.Trim()
        );

        List<List<int>> matrix = new List<List<int>>();

        for (int i = 0
              ; i < 2 * n
              ; i++)
        {
          matrix.Add
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
                      matrixTemp => Convert.ToInt32
                      (
                        matrixTemp
                      )
                    )
                   .ToList()
          );
        }

        int result = FlippingMatrix
        (
          matrix
        );

        textWriter.WriteLine
        (
          result
        );
      }

      textWriter.Flush();
      textWriter.Close();
    }
  }
}