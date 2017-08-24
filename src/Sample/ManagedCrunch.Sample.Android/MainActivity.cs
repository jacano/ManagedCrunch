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
        protected unsafe override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            FileHelper.ProcessEmbeddedFile("kodim15.crn", (b) =>
            {
                var dxt1Texture = CrunchHelper.CrnDecompress(b);
                // 196608
            });
        }
    }
}

