
DEBUG = 0;

omega = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};

stickValues = [1 1 1 1 1 1 1 1 1 1 1 1];

OMEGA_SIZE = length(omega);

stick = stickValues/OMEGA_SIZE;

houseWins = 0;
playerWins = 0;

% game components (weapon & enemy) to be randomely generated
weapons = {"Club", "Dagger", "Handaxe", "Warhammer", "Crossbow"};
enemies = {"Ogre", "Owlbear", "Lich", "Dragon", "Rust Monster"};
randomWeapon = randi(size(weapons));
randomEnemy = randi(size(enemies));
weapon = weapons{randomWeapon};
enemy = enemies{randomEnemy}; 

% userInput anonamous function
userInput  = @(prompt) input(prompt);

NUM_TRAILS = 1000;

% to keep track of selections in multiple trials
allSelections = [];

high = -1;
low = -1;

% wagers are placed
playerWager = userInput('Place a wager $50 - $1000: ');
while (playerWager < 50) || (playerWager > 1000) % ensuring user is within range
    playerWager = userInput('Please place a wager $50-$1000: '); 
end
houseWager = playerWager * 2; % house wager is double the players wager

fprintf('Starting Values | House: $%d, Player: $%d\n', houseWager, playerWager);

% user guesses the desired event
userGuess = userInput('Please enter a number from 1-12: ');
while (userGuess < 1) || (userGuess > 12)
    userGuess = userInput('Please enter a number from 1-12: '); 
end


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
                fprintf('House rolled: %d\n', selection);
                fprintf('Nice! The %s was killed with your %s\n',enemy, weapon);
                % function to update player and house wagers
                [houseWager, playerWager] = updateWagers(houseWager, playerWager, selection, userGuess);
                playerWins = playerWins + 1;
                break;
            else
                fprintf('House rolled: %d\n', selection);
                fprintf('Uh oh. The %s killed you and took your %s\n',enemy, weapon);
                [houseWager, playerWager] = updateWagers(houseWager, playerWager, selection, userGuess);
                houseWins = houseWins + 1;
                break;
            end          
        else
            % typical check
            if ((rndVal >= low) && (rndVal < high))
                selection = i;
                if (selection == userGuess)
                    fprintf('House rolled: %d\n', selection);
                    fprintf('Nice! The %s was killed with your %s\n',enemy, weapon);
                    [houseWager, playerWager] = updateWagers(houseWager, playerWager, selection, userGuess);
                    playerWins = playerWins + 1;
                    break;
                else
                    fprintf('House rolled: %d\n', selection);
                    fprintf('Uh oh. The %s killed you and took your %s\n',enemy, weapon);
                    [houseWager, playerWager] = updateWagers(houseWager, playerWager, selection, userGuess);
                    houseWins = houseWins + 1;
                    break;
                end
            end
        end
        
    end
    
    % appending selection from each trial to array
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

