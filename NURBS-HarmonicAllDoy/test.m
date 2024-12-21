%%
%test
clc
clear
%Set parameters
lt=12;
lat=0;
lon=120;
altitude=250;
doy=173;
%if input CoefficientPath (Path of coeffients and code)
CoefficientPath='F:\ICONModel\NURBS-HarmonicAllDoy\';
[ZonalWind,MeridionalWind]=NURBSHarmonicMain(lt,lat,lon,altitude,doy,CoefficientPath);
%if not iuput CoefficientPath, you need to set current folder to the model folder
[ZonalWind,MeridionalWind]=NURBSHarmonicMain(lt,lat,lon,altitude,doy);