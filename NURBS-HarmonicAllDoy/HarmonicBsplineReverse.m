function [wind]=HarmonicBsplineReverse(xishu,ControlPoint,lat,lt,lon)
maxfrequency=3;
maxwave=4;
for ilang=1:length(lat)
    for iAB=1:length(xishu(1,:))
        ilat=lat(ilang);
        [Nfunction]=BsplineCalculate(ControlPoint,ilat);%Calculate the spline basis function
        AB(iAB)=Nfunction*xishu(:,iAB);%Calculate the coefficients by matrix division
    end
    %Calculate the harmonic basis function
    [Coefficient]=Harmonic_BasisFunction(lt,lon,maxfrequency,maxwave);
    wind(ilang)=AB*Coefficient';
end
end