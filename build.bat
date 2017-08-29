@echo off

call prepare_msbuild.bat

call build_native.bat

call build_managed.bat