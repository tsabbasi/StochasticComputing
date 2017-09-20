
DEBUG = 0;
omega = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
weapons = {"Club", "Dagger", "Handaxe", "Warhammer", "Crossbow"};
enemies = {"Ogre", "Owlbear", "Lich", "Dragon", "Rust Monster"};

randomWeapon = randi(size(weapons));


% wagers are placed
houseWager = 100;

prompt = 'Place a wager $50 - $1000: ';
playerWager = input(prompt);
 
disp('House Value before round: ');
disp(houseWager);
disp('Player Value before round: ');
disp(playerWager);

% user guessed the desired event

prompt = 'Please enter a number from 1-12: ';
userGuess = input(prompt);

stickValues = [1 1 1 1 1 1 1 1 1 1 1 1];

OMEGA_SIZE = length(omega);

stick = stickValues/OMEGA_SIZE;

NUM_TRAILS = 50;

high = -1;
low = -1;

allSelections = [];

for t=1:1:NUM_TRAILS
    
    high = 0;
    low = 0;
    
    rndVal = rand(1);
    for i=1:1:OMEGA_SIZE
        
        low = high;
        high = high + stick(i); 
%         disp(stick(i));
        
        if (i == OMEGA_SIZE)
            %special check if in last position
%             disp('you are at the last position')
            if ((rndVal >= low) && (rndVal <= high))
                selection = i;                      
            end
            
            if (selection == userGuess)
                disp('The player guessed the correct number!')
                disp('House rolled ');
                disp(selection);
                playerWager = playerWager + houseWager;
                houseWager = 0;
                break;
            else
                disp('Wrong guess');
                disp('House rolled: ');
                disp(selection);
                houseWager = houseWager + playerWager;
                playerWager = 0;
                break;
            end          
        else
%             disp('This is a typical check')
            % typical check
            if ((rndVal >= low) && (rndVal < high))
                selection = i;
                if (selection == userGuess)
                    disp('The user guessed the correct number!')
                    disp('House rolled: ');
                    disp(selection);
                    playerWager = playerWager + houseWager;
                    houseWager = 0;
                    break;
                else
                    disp('Wrong guess');
                    disp('House rolled: ');
                    disp(selection);
                    houseWager = houseWager + playerWager;
                    playerWager = 0;
                    break;
                end
            end
        end
        
    end
    
    allSelections = [allSelections selection];
    
    disp('House Value after round: ');
    disp(houseWager);
    disp('Player Value after round: ');
    disp(playerWager);
    
    msg = sprintf('trial(%d) = %s',t,omega{selection});
    
%     disp(omega{selection});
    
    if (DEBUG)
        disp(msg);
    end
end


disp('done');
