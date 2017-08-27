using System.Runtime.InteropServices;

namespace ManagedCrunch
{
    public static class CrunchPInvoke
    {
#if __IOS__
        private const string DllName = "__Internal";
#else
        private const string DllName = "libCrunch";
#endif

        private const CallingConvention CallingConventionValue = CallingConvention.Cdecl;

        [DllImport(DllName, EntryPoint = "crn_get_width", CallingConvention = CallingConventionValue)]
        public static unsafe extern uint crn_get_width(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_height", CallingConvention = CallingConventionValue)]
        public static unsafe extern uint crn_get_height(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_levels", CallingConvention = CallingConventionValue)]
        public static unsafe extern uint crn_get_levels(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_dxt_format", CallingConvention = CallingConventionValue)]
        public static unsafe extern uint crn_get_dxt_format(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_get_uncompressed_size", CallingConvention = CallingConventionValue)]
        public static unsafe extern uint crn_get_uncompressed_size(byte* inBuffer, uint inBufferSize);

        [DllImport(DllName, EntryPoint = "crn_decompress", CallingConvention = CallingConventionValue)]
        public static unsafe extern void crn_decompress(byte* inBuffer, uint inBufferSize, byte* outBuffer, uint outBufferSize);
    }
}
