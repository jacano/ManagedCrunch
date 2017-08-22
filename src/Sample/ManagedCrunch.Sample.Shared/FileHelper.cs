using System;
using System.IO;
using System.Reflection;

namespace ManagedCrunch.Sample.Shared
{
    public static class FileHelper
    {
        public static void ProcessEmbeddedFile(string name, Action<byte[]> action)
        {
            using (var stream = typeof(FileHelper).GetTypeInfo().Assembly.GetManifestResourceStream(name))
            {
                var buffer = new byte[stream.Length];
                using (var memoryStream = new MemoryStream(buffer))
                {
                    stream.CopyTo(memoryStream);
                    action(buffer);
                }
            }
        }
    }
}
