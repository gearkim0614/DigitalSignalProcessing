function hLines = stemdata(x,y,lineProps,varargin)
%STEMDATA Create stem plot data
%
%   STEMDATA(x,y,lineProp) creates a stem plot from data x and y and stores
%   line handles in hLines, with lineProp: {'marker','color'}
%
%       example: hLines = stemdata([0 1],[0.5 1],{'o','r'});

%   STEMDATA(x,y,lineProp,hLines) changes the stem plot given by the handles
%   in hLines to the new data x and y.
%
%        example: stemdata([0 1],[0.5 1],[],hLines); 
%
%   The input x and y should be equal length vectors.

% Jordan Rosenthal, 5/4/98
%          Revised, 1/20/99
% Rajbabu, Revised, 11/19/2002
% Krudysz, Revised, 06/2/2009

N = length(x);
xx = zeros( 3*N, 1);
yy = zeros( 3*N, 1);
xx(1:3:end) = x;
xx(2:3:end) = x;
xx(3:3:end) = nan;
yy(2:3:end) = y;
yy(3:3:end) = nan;

if nargin == 3
    hax = get(gcf,'currentAxes');
    hLines(1) = line(x,y,'parent',hax,'linestyle','none','marker',lineProps{1},'color',lineProps{2},'markerfacecolor',lineProps{2});
    hLines(2) = line(xx,yy,'parent',hax,'color',lineProps{2});
    hLines(3) = line([min(x) max(x)],[0 0],'parent',hax,'color','k');
else
    hLines = varargin{1};
    set(hLines(1:2),{'XData','YData'},{x y; xx yy});
end