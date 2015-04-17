%COMO LO EJECUTO: 
%[tiempo1,alturas] = caida(10,600,10,0.2,1e-3);
% para otro valor de a: [tiempo2,alturas] = caida(10,600,10,0.4,1e-3);
%plot(alturas,tiempo1,'ko-') cada globito es una raiz obtenida por newton para esa ec y al cambiar la altura (valor de C) cambia el cero
%plot(alturas,tiempo1,'ko-;a=0.2 1/s;' ,alturas,tiempo2,'kx-;a=0.4 1/s;')
%este segundo codigo no me lo toma en matlab porq es octave.. le puedo
%cambiar las leyendas directamente cuando te aparece el grafico.
%modo especial de copiar el ploteo para pasarlo a word"quick word" o algo
%asi... vas a word y te queda como en el portapapeles de word.. lo tenes
%directo para pegar

function [T, h] = caida(hi, hf, paso, a, prec)%devolvemos tambien h para que sea mas facil hacer el dibujo.
h = hi:paso:hf;%generamos el vector
T = zeros(size(h));%devuelve la cant de filas y cols q tiene h y llena con ceros.
g = 10;
 % valor inicial para primer valor de h. valor inicial para el tiempo de caída. Podría ser el C calculado para el ej1, pero esta es otra forma. Es el tiempo de caída con caida libre.
A = sqrt(2*h(1)/g);
for k=1:length(T)
    % aqui puede programarse el método de Newton
    % h(k) contiene el valor actual de la altura.
    % Sea A la raíz obtenida para la precisión solicitada ...
    %La cte C la vamos a calcular.
    C = (1/a)*(1+h(k)*a^2/g);
    E=1000;
    %hasta que la distancia entre el actual y el anterior es menor a prec.
    while E>prec
        %genereacion del actual con el anterior, por newton
        B = A-(A+(1/a)*exp(-a*A)-C)/(1-exp(-a*A));
        E=abs(B-A);
        A=B;%hacemos que A sea el ultimo valor calculado para que se convierta en anterior.
    end
    T(k)=A;
end