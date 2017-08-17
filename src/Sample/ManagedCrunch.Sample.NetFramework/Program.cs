using ManagedCrunch.Sample.Shared;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManagedCrunch.Sample.NetFramework
{
    class Program
    {
        static void Main(string[] args)
        {
            var textureData = File.ReadAllBytes("kodim15.crn");

            var dxt1Texture = CrunchTest.CrnDecompress(textureData);

            File.WriteAllBytes("kodim15.dds.raw", dxt1Texture);
        }
    }
}
