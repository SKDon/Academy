﻿namespace SubtractingPolynomials
{
    using System;

    /*Extend the previous program to support also subtraction and multiplication of polynomials.*/

    class Extend
    {
        static decimal[] GetCoefficients(int degree)
        {
            decimal[] array = new decimal[degree + 1];
            for (int i = array.Length - 1; i >= 0; i--)
            {
                Console.Write("Enter coefficient on {0} degree: ", i);
                array[i] = int.Parse(Console.ReadLine());
            }

            Console.WriteLine();
            return array;
        }

        static decimal[] AddTwoPolinomials(decimal[] firstPolnomial, decimal[] secondPolinomial)
        {
            if (secondPolinomial.Length < firstPolnomial.Length)
            {
                return AddTwoPolinomials(secondPolinomial, firstPolnomial);
            }

            decimal[] result = new decimal[secondPolinomial.Length];
            for (int i = 0; i < firstPolnomial.Length; i++)
            {
                result[i] = firstPolnomial[i] + secondPolinomial[i];
            }

            for (int i = firstPolnomial.Length; i < secondPolinomial.Length; i++)
            {
                result[i] = secondPolinomial[i];
            }

            return result;
        }

        static decimal[] SubstractPolinomials(decimal[] firstPolinomial, decimal[] secondPolinomial)
        {
            for (int i = 0; i < secondPolinomial.Length; i++)
            {
                secondPolinomial[i] *= -1;
            }

            decimal[] result = AddTwoPolinomials(firstPolinomial, secondPolinomial);
            return result;
        }

        static decimal[] MultiplyPlonomials(decimal[] firstPolinomial, decimal[] secondPolinomial)
        {
            decimal[] result = new decimal[firstPolinomial.Length + secondPolinomial.Length - 1];
            for (int i = 0; i < firstPolinomial.Length; i++)
            {
                for (int j = 0; j < secondPolinomial.Length; j++)
                {
                    result[i + j] += (firstPolinomial[i] * secondPolinomial[j]);
                }
            }

            return result;
        }

        static void PrintPolinomial(decimal[] polinomial)
        {
            for (int i = polinomial.Length - 1; i >= 0; i--)
            {
                if (i == polinomial.Length - 1)
                {
                    if (polinomial[i] == 1)
                    {
                        Console.Write("x^{0}", i);
                    }
                    else if (polinomial[i] > 1)
                    {
                        Console.Write("{0}x^{1}", polinomial[i], i);
                    }
                    else if (polinomial[i] < -1)
                    {
                        Console.Write("{0}x^{1}", polinomial[i], i);
                    }
                    else if (polinomial[i] == -1)
                    {
                        Console.Write("-x^{0}", i);
                    }
                }
                else if (i < polinomial.Length - 1 && i > 1)
                {
                    if (polinomial[i] == 1)
                    {
                        Console.Write("+x^{0}", i);
                    }
                    else if (polinomial[i] > 1)
                    {
                        Console.Write("+{0}x^{1}", polinomial[i], i);
                    }
                    else if (polinomial[i] < -1)
                    {
                        Console.Write("{0}x^{1}", polinomial[i], i);
                    }
                    else if (polinomial[i] == -1)
                    {
                        Console.Write("-x^{0}", i);
                    }
                }
                else if (i == 1)
                {
                    if (polinomial[i] > 0)
                    {
                        Console.Write("+{0}x", polinomial[i]);
                    }
                    else if (polinomial[i] < 0)
                    {
                        Console.Write("{0}x", polinomial[i]);
                    }
                }
                else if (i == 0)
                {
                    if (polinomial[i] > 0)
                    {
                        Console.Write("+{0}", polinomial[i]);
                    }
                    else if (polinomial[i] < 0)
                    {
                        Console.Write(polinomial[i]);
                    }
                }
            }
        }

        static void Main()
        {
            Console.Write("Enter degree for first polinomial: ");
            int firstDegree = int.Parse(Console.ReadLine());
            Console.Write("Enter degree for second polinomial: ");
            int secondDegree = int.Parse(Console.ReadLine());
            Console.WriteLine();
            decimal[] firstPolinomial = GetCoefficients(firstDegree);
            decimal[] secondPolinomial = GetCoefficients(secondDegree);
            PrintPolinomial(firstPolinomial);
            Console.Write(" + ");
            PrintPolinomial(secondPolinomial);
            Console.Write(" = ");
            PrintPolinomial(AddTwoPolinomials(firstPolinomial, secondPolinomial));
            Console.WriteLine();
            Console.WriteLine();
            PrintPolinomial(firstPolinomial);
            Console.Write(" - ");
            Console.Write("(");
            PrintPolinomial(secondPolinomial);
            Console.Write(") = ");
            PrintPolinomial(SubstractPolinomials(firstPolinomial, secondPolinomial));
            Console.WriteLine();
            Console.Write("(");
            PrintPolinomial(firstPolinomial);
            Console.Write(")");
            Console.Write(" * ");
            Console.Write("(");
            PrintPolinomial(secondPolinomial);
            Console.Write(") = ");
            PrintPolinomial(MultiplyPlonomials(firstPolinomial, secondPolinomial));
            Console.WriteLine();
        }
    }
}