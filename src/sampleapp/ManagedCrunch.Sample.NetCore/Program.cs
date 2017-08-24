using ManagedCrunch.Sample.Shared;
using System.IO;

namespace ManagedCrunch.Test
{
    public class Program
    {
        public static void Main()
        {
            FileHelper.ProcessEmbeddedFile("kodim15.crn", (b) =>
            {
                var dxt1Texture = CrunchHelper.CrnDecompress(b);
                // 196608
            });
        }
    }
}
