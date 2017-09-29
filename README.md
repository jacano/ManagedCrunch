# ManagedCrunch
Managed wrapper for crnlib (https://github.com/BinomialLLC/crunch)

[![Build status](https://ci.appveyor.com/api/projects/status/l3eo3qg5jja5cha9/branch/develop?svg=true)](https://ci.appveyor.com/project/jacano/managedcrunch/branch/develop)
[![Build Status](https://travis-ci.org/jacano/ManagedCrunch.svg?branch=develop)](https://travis-ci.org/jacano/ManagedCrunch)
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
