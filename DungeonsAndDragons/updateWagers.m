function [houseWager, playerWager] = updateWagers(houseWager, playerWager, selection, userGuess)

if (selection == userGuess)
    playerWager = playerWager + houseWager;
    houseWager = 0;
else
    houseWager = houseWager + playerWager;
    playerWager = 0;
end          

end