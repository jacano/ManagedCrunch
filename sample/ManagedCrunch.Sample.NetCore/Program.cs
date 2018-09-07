using ManagedCrunch.Sample.Shared;
using System;

namespace ManagedCrunch.Test
{
    public class Program
    {
        public static void Main()
        {
            FileHelper.ProcessEmbeddedFile("kodim15.crn", (b) =>
            {
                var dxt1Texture = CrunchHelper.CrnDecompress(b);

                if (dxt1Texture.Length == 196608)
                {
                    Console.WriteLine("Ok");
                }
                else
                {
                    Console.WriteLine("Error");
                }
            });

            Console.ReadLine();
        }
    }
}
