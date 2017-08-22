namespace ManagedCrunch.Sample.Shared
{
    public static class CrunchTest
    {
        public static unsafe byte[] CrnDecompress(byte[] textureIn)
        {
            var textureLength = (uint)textureIn.Length;
            fixed (byte* src = textureIn)
            {
                var width = (int)CrunchPInvoke.crn_get_width(src, textureLength);
                var height = (int)CrunchPInvoke.crn_get_height(src, textureLength);

                var uncompressedSize = CrunchPInvoke.crn_get_uncompressed_size(src, textureLength);

                var dxt1Texture = new byte[uncompressedSize];

                fixed (byte* dst = dxt1Texture)
                {
                    CrunchPInvoke.crn_decompress(src, textureLength, dst, uncompressedSize);
                }

                return dxt1Texture;
            }
        }
    }
}
