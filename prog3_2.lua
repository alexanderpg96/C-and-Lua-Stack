function InfixToPostfix(str)

    print("running")

    stack = {}
    stackSize = 0

    postfix = {}
    postSize = 0
    operators = {}
    operatorSize = 0

    output = ""

    for token in string.gmatch(str, "[^%s]+") do
        print("in for loop")
        table.insert(stack, token)
        stackSize = stackSize + 1
    end

    print(stackSize)

    while stackSize > 0 do
        popped = table.remove(stack)
        stackSize = stackSize - 1;

        print("In while")

        -- Check if the first token is an operator

        if string.match(popped, "+") or string.match(popped, "-") or string.match(popped, "*") or string.match(popped, "/") then
            print("in operator if")

            -- Operator stack is empty

            if operatorSize == 0 then
                print("inserted empty operator")
                table.insert(operators,popped)
                operatorSize = operatorSize + 1
            else
                print("dealing with operators")
                bool = true
                while bool do
                    precedence = 0
                    index = operatorSize 
        
                    -- Set precedence of top operator on stack

                    if string.match(operators[index],"*")          then precedence = 3
                        elseif string.match(operators[index],"/")  then precedence = 3
                        elseif string.match(operators[index],"-")  then precedence = 2
                        else                                            precedence = 2
                    end

                    -- Set precedence of popped operator

                    if string.match(popped,"*")          then precedence = 3
                        elseif string.match(popped,"/")  then precedence = 3
                        elseif string.match(popped,"-")  then precedence = 2
                        else                                  precedence = 2
                    end
        
                    -- If the top operator has higer precedence, pop and push; loop again

                    if precedence > popped then
                        table.insert(postfix, table.remove(operators))
                        postSize = postSize + 1
                        operatorSize = operatorSize - 1
                    else
                        table.insert(operators, popped)
                        operatorSize = operatorSize + 1
                    end
                end
            end
        else
            print("Inserted")
            table.insert(postfix, popped)
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

    print(output)
    
end

function PrintHello()
    print("Hi")
end

