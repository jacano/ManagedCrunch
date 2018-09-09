# ManagedCrunch
Managed wrapper for crnlib (https://github.com/BinomialLLC/crunch)

[![Build Status](https://jacanovsts.visualstudio.com/ManagedCrunch/_apis/build/status/jacano.ManagedCrunch)](https://jacanovsts.visualstudio.com/ManagedCrunch/_build/latest?definitionId=1)
[![NuGet Badge](https://buildstats.info/nuget/ManagedCrunch)](https://www.nuget.org/packages/ManagedCrunch/)

ManagedCrunch exposes the following crnlib functions in C# using direct Pinvokes to C/C++ code:
* crn_get_width
* crn_get_height
* crn_get_levels
* crn_get_dxt_format
* crn_get_uncompressed_size
* crn_decompress

| Platforms      |
| ------------   |
| netstandard1.1 |
| net45          |
| XamariniOS     |
| MonoAndroid    |
| uap10.0        |
