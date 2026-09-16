# ManagedCrunch

Managed C# wrapper for [crnlib](https://github.com/BinomialLLC/crunch), the crunch texture compression library.

[![NuGet](https://img.shields.io/nuget/v/ManagedCrunch?logo=nuget)](https://www.nuget.org/packages/ManagedCrunch/)
[![NuGet downloads](https://img.shields.io/nuget/dt/ManagedCrunch?logo=nuget)](https://www.nuget.org/packages/ManagedCrunch/)

## Install

```
dotnet add package ManagedCrunch
```

## What it exposes

ManagedCrunch calls crnlib from C# with direct P/Invokes:

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
