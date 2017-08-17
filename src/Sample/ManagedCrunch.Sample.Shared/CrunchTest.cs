using System;
using System.Collections.Generic;
using System.Text;

namespace ManagedCrunch.Sample.Shared
{
    public static class CrunchTest
    {
        public static unsafe byte[] CrnDecompress(byte[] textureIn)
        {
            var textureLength = (uint)textureIn.Length;
            fixed (byte* src = textureIn)
            {
                var width = (int)CrunchPInvoke.Crn_get_width(src, textureLength);
                var height = (int)CrunchPInvoke.Crn_get_height(src, textureLength);

                var uncompressedSize = CrunchPInvoke.Crn_get_uncompressed_size(src, textureLength);

                var dxt1Texture = new byte[uncompressedSize];

                fixed (byte* dst = dxt1Texture)
                {
                    CrunchPInvoke.Crn_decompress(src, textureLength, dst, uncompressedSize);
                }

                return dxt1Texture;
            }
        }
    }
}
