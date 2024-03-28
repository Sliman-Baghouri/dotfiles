local t = {}  -- Create an empty table

t["hey"] = "this is value"  -- Insert a named value into the table

-- Printing the table
for key, value in pairs(t) do
    print(key, value)
end

