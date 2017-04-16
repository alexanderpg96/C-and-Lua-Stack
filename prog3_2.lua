function InfixToPostfix(str)

    stack = {}
    stackSize = 0

    postfix = {}
    postSize = 0
    operators = {}
    operatorSize = 0

    output = ""

    for token in string.gmatch(str, "[^%s]+") do

        -- Check if the first token is an operator

        if string.match(token, "+") or string.match(token, "-") or string.match(token, "*") or string.match(token, "/") then

            -- Operator stack is empty

            if operatorSize == 0 then
                table.insert(operators,token)
                operatorSize = operatorSize + 1
            else
                bool = 1
                while bool == 1 do
                    precedence = 0
                    poppedPrec = 0 

                    if operatorSize == 0 then
                        table.insert(operators,token)
                        operatorSize = operatorSize + 1
                        bool = 0
                        break
                    end
        
                    -- Set precedence of top operator on stack

                    if string.match(operators[operatorSize],"*")  then precedence = 3 end
                    if string.match(operators[operatorSize],"/")  then precedence = 3 end
                    if string.match(operators[operatorSize],"-")  then precedence = 2 end
                    if string.match(operators[operatorSize],"+")  then precedence = 2 end

                    -- Set precedence of popped operator

                    if string.match(token,"*")  then poppedPrec = 3 end
                    if string.match(token,"/")  then poppedPrec = 3 end
                    if string.match(token,"-")  then poppedPrec = 2 end
                    if string.match(token,"+")  then poppedPrec = 2 end
        
                    -- If the top operator has higer precedence, pop and push; loop again

                    if precedence >= poppedPrec then
                        table.insert(postfix, table.remove(operators))
                        postSize = postSize + 1
                        operatorSize = operatorSize - 1
                    else
                        table.insert(operators, token)
                        operatorSize = operatorSize + 1
                        bool = 0
                    end
                end
            end
        else
            table.insert(postfix, token)
            postSize = postSize + 1
        end
    end

    while operatorSize > 0 do
        table.insert(postfix, table.remove(operators))
        operatorSize = operatorSize -1
        postSize = postSize + 1
    end

    i = 1
    
    while i <= postSize do
        output = output .. postfix[i] .. " " 
        i = i + 1
    end

    return output
    
end

