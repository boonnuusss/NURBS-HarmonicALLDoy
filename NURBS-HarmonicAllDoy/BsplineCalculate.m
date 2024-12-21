function [Nfunction]=BsplineCalculate(ControlPoint,ilat)
lat=[-36 -32 -30 ControlPoint 48 55 62 64];%Add points outside the latitude range of the ControlPoint to assist the calculation, ensuring that the control points at the edge can calculate the B-spline function, and the selected points only needs to be out of the ControlPoint.
Nfunction=zeros(1,length(lat)-4);
for i=1:length(lat)-4%Calculate the B-spline basis function of order 4
    if ilat>=lat(i)&&ilat<lat(i+1)
    Nfunction(i)=(ilat-lat(i))^3/((lat(i+3)-lat(i))*(lat(i+2)-lat(i))*(lat(i+1)-lat(i)));
    end
    if ilat>=lat(i+1)&&ilat<lat(i+2)
    Nfunction(i)=[(ilat-lat(i))^2*(lat(i+2)-ilat)/((lat(i+3)-lat(i))*(lat(i+2)-lat(i))*(lat(i+2)-lat(i+1)))]+[(ilat-lat(i))*(lat(i+3)-ilat)*(ilat-lat(i+1))/((lat(i+3)-lat(i))*(lat(i+3)-lat(i+1))*(lat(i+2)-lat(i+1)))]+[(lat(i+4)-ilat)*(ilat-lat(i+1))^2/(((lat(i+4)-lat(i+1)))*(lat(i+3)-lat(i+1))*(lat(i+2)-lat(i+1)))];
    end
    if ilat>=lat(i+2)&&ilat<lat(i+3)
    Nfunction(i)=[(ilat-lat(i))*(lat(i+3)-ilat)^2/((lat(i+3)-lat(i))*(lat(i+3)-lat(i+1))*(lat(i+3)-lat(i+2)))]+[((ilat-lat(i+1))*(lat(i+4)-ilat)*(lat(i+3)-ilat))/((lat(i+4)-lat(i+1))*(lat(i+3)-lat(i+1))*(lat(i+3)-lat(i+2)))]+[(lat(i+4)-ilat)^2*(ilat-lat(i+2))/((lat(i+4)-lat(i+1))*(lat(i+4)-lat(i+2))*(lat(i+3)-lat(i+2)))];
    end
    if ilat>=lat(i+3)&&ilat<lat(i+4)
    Nfunction(i)=(lat(i+4)-ilat)^3/((lat(i+4)-lat(i+1))*(lat(i+4)-lat(i+2))*(lat(i+4)-lat(i+3)));
    end
    if ilat<lat(i)||ilat>=lat(i+4)
    Nfunction(i)=0;
    end
end
 Nfunction(1)=[];
 Nfunction(end-1:end)=[];%Base function deletion (no practical meaning)
if sum(Nfunction)<1
    a=sum(Nfunction);%Normalized the spline basis function for the edge
    Nfunction=Nfunction*(1/a);
end

end