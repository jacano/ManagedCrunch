using System;
using System.IO;
using WaveCity3D;

namespace ManagedCrunch.Test
{
    public class Program
    {
        public static unsafe void Main()
        {
            var textureData = File.ReadAllBytes("kodim15.crn");
            var textureLength = (uint)textureData.Length;
            fixed (byte* src = textureData)
            {
                var width = (int)CrunchPInvoke.Crn_get_width(src, textureLength);
                var height = (int)CrunchPInvoke.Crn_get_height(src, textureLength);

                var uncompressedSize = CrunchPInvoke.Crn_get_uncompressed_size(src, textureLength);

                var dxt1Texture = new byte[uncompressedSize];

                fixed (byte* dst = dxt1Texture)
                {
                    CrunchPInvoke.Crn_decompress(src, textureLength, dst, uncompressedSize);
                }

                File.WriteAllBytes("kodim15.dds", dxt1Texture);
            }  
        }
    }
}
