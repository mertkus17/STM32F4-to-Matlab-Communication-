
clear all;
clc;

pause(0.1);
s = serial('COM11');

set(s,'BaudRate',115200,'DataBits', 8, 'Parity', 'none','StopBits', 1, 'FlowControl', 'none','Terminator','CR/LF');
fclose(s);
fopen(s);
pause(3);
roll=zeros(1,200);
a=1;
x=1;
filtered_veri=zeros(1,200);
while (1)
    axis([0 100 -50 50]);
    x=x+1;
    if(x>100)
        f=100;
    end
    if (x<101)
        f=x;
    end
    
    y1(f)=fscanf(s,'%d');
    plot (y1,'b','linewidth',1);
    grid on;
    hold on;
    drawnow
    hold off;
    if(x>=100)
        loop=0;
        while(loop<99)
            loop=loop+1;
            y1(loop)=y1(loop+1);
        end
    end
end
fclose(s);
delete(s);
clear s;

