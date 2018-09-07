using ManagedCrunch.Sample.Shared;
using System;

namespace ManagedCrunch.Sample.NetFramework
{
    class Program
    {
        static void Main(string[] args)
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
