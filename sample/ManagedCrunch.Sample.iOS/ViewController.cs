using ManagedCrunch.Sample.Shared;
using System;

using UIKit;

namespace ManagedCrunch.Sample.iOS
{
    public partial class ViewController : UIViewController
    {
        public ViewController(IntPtr handle) : base(handle)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            // Perform any additional setup after loading the view, typically from a nib.

            FileHelper.ProcessEmbeddedFile("kodim15.crn", (b) =>
            {
                var dxt1Texture = CrunchHelper.CrnDecompress(b);

                if (dxt1Texture.Length == 196608)
                {
                    var msg = new UIAlertView("Ok", "", (IUIAlertViewDelegate)null, "Close", null);
                    msg.Show();
                }
                else
                {
                    var msg = new UIAlertView("Error", "", (IUIAlertViewDelegate)null, "Close", null);
                    msg.Show();
                }
            });
        }

        public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }
    }
}