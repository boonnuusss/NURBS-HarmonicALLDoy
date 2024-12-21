function [gongshi]=Harmonic_BasisFunction(time,longitude,maxfrequency,maxwave)
for frequency=0:maxfrequency
    for wave=-maxwave:maxwave
%Input parameters into the harmonic basis function
        gongshi((frequency)*(2*maxwave+1)+wave+(maxwave+1))=cos(frequency * 2 * pi * time /24 + (wave-frequency)*longitude/180*pi);
        gongshi((frequency)*(2*maxwave+1)+wave+(maxwave+1)+(maxfrequency+1)*(2*maxwave+1))=sin(frequency * 2 * pi * time /24 + (wave-frequency)*longitude/180*pi);
    end
end
gongshi(41:45)=[];
gongshi(6:9)=[];
end