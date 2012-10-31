r = require "rex_pcre".new("(\\d+) (\\d+)", 0)
function read_data(filename)
   local rslt = {}
   for line in io.lines(filename) do
      i, j = r.match(r, line)
      table.insert(rslt, {tonumber(i), tonumber(j)})
   end
   return rslt
end

function read_sort(filename)
   rslt = read_data(filename)
   table.sort(rslt, function (i, j) return i[2] < j[2] end)
   return rslt
end

read_sort("mnt/data.txt")
