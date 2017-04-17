using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;

namespace WaveCity3D
{
    public static class CrunchPInvoke
    {
        private const string DllName = "libCrunch.dll";
        private const CallingConvention DefaultCallingConvention = CallingConvention.Cdecl;

        [DllImport(DllName, CallingConvention = DefaultCallingConvention)]
        public static unsafe extern uint Crn_get_width(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, CallingConvention = DefaultCallingConvention)]
        public static unsafe extern uint Crn_get_height(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, CallingConvention = DefaultCallingConvention)]
        public static unsafe extern uint Crn_get_levels(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, CallingConvention = DefaultCallingConvention)]
        public static unsafe extern uint Crn_get_dxt_format(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, CallingConvention = DefaultCallingConvention)]
        public static unsafe extern uint Crn_get_uncompressed_size(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, CallingConvention = DefaultCallingConvention)]
        public static unsafe extern void Crn_decompress(byte* inBuffer, uint inBufferSize, byte* outBuffer, uint outBufferSize);
    }
}
