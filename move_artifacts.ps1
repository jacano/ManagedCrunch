Copy-Item artifacts/windows/* src/ManagedCrunch/ManagedCrunch.Native/build/net45 -Force -Recurse
Copy-Item artifacts/uwp/* src/ManagedCrunch/ManagedCrunch.Native/build/uap10.0 -Force -Recurse
Copy-Item artifacts/android/* src/ManagedCrunch/ManagedCrunch.Native/build/MonoAndroid -Force -Recurse
Copy-Item artifacts/ios/* src/ManagedCrunch/ManagedCrunch.Native/build/XamariniOS -Force -Recurse