using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;

namespace ManagedCrunch
{
    public static class CrunchPInvoke
    {
#if __IOS__
        private const string DllName = "__Internal";
#else
        private const string DllName = "libCrunch";
#endif

        [DllImport(DllName, EntryPoint = "crn_get_width")]
        public static unsafe extern uint crn_get_width(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_height")]
        public static unsafe extern uint crn_get_height(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_levels")]
        public static unsafe extern uint crn_get_levels(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_dxt_format")]
        public static unsafe extern uint crn_get_dxt_format(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_uncompressed_size")]
        public static unsafe extern uint crn_get_uncompressed_size(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_decompress")]
        public static unsafe extern void crn_decompress(byte* inBuffer, uint inBufferSize, byte* outBuffer, uint outBufferSize);
    }
}
