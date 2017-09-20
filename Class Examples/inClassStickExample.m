
DEBUG = 0;
omega = {"1", "2", "3", "4", "5", "6"};

stickValues = [1 1 1 1 1 1];

OMEGA_SIZE = length(omega);

stick = stickValues/OMEGA_SIZE;

NUM_TRAILS = 1;

high = -1;
low = -1;

for t=1:1:NUM_TRAILS
    
    high = 0;
    low = 0;
    
    rndVal = rand(1);
    for i=1:1:OMEGA_SIZE
        
        low = high;
        high = high + stick(i);
        
        if (i == OMEGA_SIZE)
            %special check if in last position
            if ((rndVal >= low) && (rndVal <= high))
                selection = i;
                break;
            end
        else
            % typical check
            if ((rndVal >= low) && (rndVal < high))
                selection = i;
                break;
            end
        end
        
    end
    
    msg = sprintf('trial(%d) = %s',t,omega{selection});
    
    if (DEBUG)
        disp(msg);
    end
end


disp('done');
