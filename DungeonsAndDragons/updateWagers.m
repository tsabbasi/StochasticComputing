function wagers = updateWagers(selection, userGuess, houseWager, enemy, weapon)

if (selection == userGuess)
    fprintf('House rolled: %d\n', selection);
    playerWager = playerWager + houseWager;
    houseWager = 0;
    fprintf('Nice! The %s was killed with your %s\n',enemy, weapon);
else
    fprintf('House rolled: %d\n', selection);
    houseWager = houseWager + playerWager;
    playerWager = 0;
    fprintf('Uh oh. The %s killed you and took your %s\n',enemy, weapon);
end          

end