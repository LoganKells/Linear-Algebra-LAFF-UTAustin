function TestSequence(functionName, y_out, y_out_default)
%TESTSEQUENCE Summary of this function goes here
fprintf("Testing Algorithm: " + functionName + "...\n");
if (isequal(y_out, y_out_default))
    disp("Correct. It appears " + functionName + " computes correctly.")
else
    disp( "Error! " + functionName + " has a problem.")
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end

end

