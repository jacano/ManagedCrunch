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
            FileHelper.ProcessEmbeddedFile("kodim15.crn", (b) =>
            {
                var dxt1Texture = CrunchHelper.CrnDecompress(b);
                // 196608
            });
        }
    }
}
