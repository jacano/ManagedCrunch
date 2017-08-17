using Android.App;
using Android.Widget;
using Android.OS;
using ManagedCrunch.Sample.Shared;
using System.IO;

namespace ManagedCrunch.Sample.Android
{
    [Activity(Label = "ManagedCrunch.Sample.Android", MainLauncher = true)]
    public class MainActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            var textureData = File.ReadAllBytes("kodim15.crn");

            var dxt1Texture = CrunchTest.CrnDecompress(textureData);

            File.WriteAllBytes("kodim15.dds.raw", dxt1Texture);
        }
    }
}

