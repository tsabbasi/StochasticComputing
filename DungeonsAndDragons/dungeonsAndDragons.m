
DEBUG = 0;

omega = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};

stickValues = [1 1 1 1 1 1 1 1 1 1 1 1];

OMEGA_SIZE = length(omega);

stick = stickValues/OMEGA_SIZE;

% game components (weapon & enemy) to be randomely generated
weapons = {"Club", "Dagger", "Handaxe", "Warhammer", "Crossbow"};
enemies = {"Ogre", "Owlbear", "Lich", "Dragon", "Rust Monster"};

randomWeapon = randi(size(weapons));
randomEnemy = randi(size(enemies));
weapon = weapons{randomWeapon};
enemy = enemies{randomEnemy}; 

% simple anonamous functions
userInput  = @(prompt) input(prompt);
houseRoll = @(selection) fprintf('House rolled: %d\n', selection); 
playerWon = @(enemy, weapon) fprintf('Nice! The %s was killed with your %s\n',enemy, weapon); 
playerLost = @(enemy, weapon) fprintf('Uh oh. The %s killed you and took your %s\n',enemy, weapon);

NUM_TRAILS = 1;

high = -1;
low = -1;

allSelections = [];

% wagers are placed
playerWager = userInput('Place a wager $50 - $1000: ');
houseWager = playerWager * 2; % house wager is double the players wager

fprintf('Starting Values | House: $%d, Player: $%d\n', houseWager, playerWager);

% user guesses the desired event
userGuess = userInput('Please enter a number from 1-12: ');


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
            end
            
            if (selection == userGuess)
%                 houseRoll(selection);
%                 playerWon(enemy, weapon);
                fprintf('House rolled: %d\n', selection);
                fprintf('Nice! The %s was killed with your %s\n',enemy, weapon);
                playerWager = playerWager + houseWager;
                houseWager = 0;
                break;
            else
%                 houseRoll(selection);
%                 playerLost(enemy, weapon)
                fprintf('House rolled: %d\n', selection);
                fprintf('Uh oh. The %s killed you and took your %s\n',enemy, weapon);
                houseWager = houseWager + playerWager;
                playerWager = 0;
                break;
            end          
        else
            % typical check
            if ((rndVal >= low) && (rndVal < high))
                selection = i;
                if (selection == userGuess)
%                     houseRoll(selection);
%                     playerWon(enemy, weapon);
                    fprintf('House rolled: %d\n', selection);
                    fprintf('Nice! The %s was killed with your %s\n',enemy, weapon);
                    playerWager = playerWager + houseWager;
                    houseWager = 0;                    
                    break;
                else
%                     houseRoll(selection);
%                     playerLost(enemy, weapon);
                    fprintf('House rolled: %d\n', selection);
                    fprintf('Uh oh. The %s killed you and took your %s\n',enemy, weapon);
                    houseWager = houseWager + playerWager;
                    playerWager = 0;
                    break;
                end
            end
        end
        
    end
    
    allSelections = [allSelections selection];
    
    fprintf('Final Values | House: $%d, Player: $%d\n', houseWager, playerWager);
  
    msg = sprintf('trial(%d) = %s',t,omega{selection});
    
    if (DEBUG)
        disp(msg);
    end
end 


if playerWager == 0
    disp('You lost! :(');
else 
    disp('You won!');
    
    
end

