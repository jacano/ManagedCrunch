using Android.App;
using Android.Widget;
using Android.OS;
using ManagedCrunch.Sample.Shared;

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

                if (dxt1Texture.Length == 196608)
                {
                    Toast.MakeText(this, "Ok", ToastLength.Long).Show();
                }
                else
                {
                    Toast.MakeText(this, "Error", ToastLength.Long).Show();
                }
            });
        }
    }
}

