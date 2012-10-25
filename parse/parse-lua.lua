-- for line in io.lines("data.txt") do
--    for w in string.gmatch(line, "%d+") do
--       -- print(w)
--    end
-- end
r = require "rex_pcre".new("(\\d+) (\\d+)", 0)
for line in io.lines("data.txt") do
   r.match(r, line)
end
