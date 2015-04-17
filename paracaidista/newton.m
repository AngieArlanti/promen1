%function [ output_args ] = Untitled( input_args )
%%UNTITLED Summary of this function goes here
%%   PARA EJECUTAR: 
%[aprox, contaerror, nroiter, casicero] = newton(el nro que le resto a f(x),error que quiero, numero grande para las iteraciones);
 %[aprox, contaerror, nroiter, casicero] = newton(9,1e-3,100);
%end



function [p0,err,k,y]=newton(p0,delta,max1)
% M�todo de Newton
% Sintaxis [p0,err,k,y]=newton(p0,delta,max1)
% Entrada - p0 es la aproximacion inicial a la ra�z de f
% - delta es la tolerancia o precisi�n
% - max1 es n�mero maximo de iteraciones
% Salida - p0 es la aproximaci�n de Newton-Raphson para la ra�z
% - err es la estimaci�n del error para p0
% - k es el n�mero de iteraciones
% - y = f(p0)
% f = hay que definirla por afuera como otro .m.
%df= derivada primera de f. Por afuera.
for k=1:max1
    p1=p0-f(p0)/df(p0);
    err=abs(p1-p0);
    p0=p1;
    y=f(p0);
    %Si la suc es convergente la dist entre dos consecutivos tiene limite cero. Encontraste la aproximacion. Entonces salimos.
    if (err<=delta)
        break
    end
end