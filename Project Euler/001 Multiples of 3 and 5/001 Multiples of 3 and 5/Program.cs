using System;
using System.Collections.Generic;

namespace _001_Multiples_of_3_and_5
{
  class Program
  {

    static void Main(String[] args)
    {
      long t = Convert.ToInt32(Console.ReadLine());
      if (t >= 1 && t <= 100000)
      {
        List<long> numbers = new List<long>();
        for (long a0 = 0; a0 < t; a0++)
        {
          long n = Convert.ToInt64 (Console.ReadLine());
          if (n >= 1 && n <= 1000000000)
            numbers.Add(n);
        }
        foreach (long number in numbers)
        {
          long n0 = number - 1;
          long n1 = n0 / 3;
          long n2 = n0 / 5;
          long n3 = n0 / 15;
          long r = (3 * n1 * (n1 + 1) / 2) + (5 * n2 * (n2 + 1) / 2) - (15 * n3 * (n3 + 1) / 2);
          Console.WriteLine(r);
          
        }
      }
    }
  }
}
