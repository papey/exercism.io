#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>

bool
is_armstrong_number (int candidate)
{

  if (candidate == 0)
    {
      return true;
    }

  int nb_digit = 0;
  int value = candidate;

  while (value > 0)
    {
      nb_digit++;
      value /= 10;
    }

  value = candidate;
  int sum = 0;

  while (value > 0)
    {
      double digit = value % 10;
      sum += (int) pow (digit, nb_digit);
      value /= 10;
    }

  return candidate == sum;
}
