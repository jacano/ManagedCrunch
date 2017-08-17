using ManagedCrunch.Sample.Shared;
using System.IO;

namespace ManagedCrunch.Test
{
    public class Program
    {
        public static void Main()
        {
            var textureData = File.ReadAllBytes("kodim15.crn");

            var dxt1Texture = CrunchTest.CrnDecompress(textureData);

            File.WriteAllBytes("kodim15.dds.raw", dxt1Texture);
        }
    }
}
