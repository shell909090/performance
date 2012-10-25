function find_item(tbl, obj)
   for i, v in pairs(tbl) do
      if v == obj then return i end
   end
   return nil
end

function remove_duplicates (tbl)
   local newtbl = {}
   for i, v in pairs(tbl) do
      if find_item(newtbl, v) == nil then
	 table.insert(newtbl, v)
      end
   end
   return newtbl
end

function fmt_exp (e)
   if type(e) ~= 'table' then
      return tostring(e)
   else
      return '(' .. fmt_exp(e[3]) .. e[1] .. fmt_exp(e[4]) .. ')'
   end
end

function eval_exp (e)
   if type(e) ~= 'table' then
      return tonumber(e)
   else
      return e[2](eval_exp(e[3]), eval_exp(e[4]))
   end
end

function chkexp (target)
   return function (e)
	     if eval_exp(e) == target then
		-- print(fmt_exp(e))
	     end
	  end
end

function fmt_list (e)
   if type(e) ~= 'table' then return tostring(e) end
   s = '['
   for i, v in pairs(e) do
      s = s .. fmt_list(v) .. ', '
   end
   return s .. ']'
end

function iter_all_exp (f, ops, ns, e)
   if table.maxn(ns) == 0 then return f(e) end
   for i, r in pairs(remove_duplicates(ns)) do
      table.remove(ns, find_item(ns, r))
      if e == nil then
	 iter_all_exp(f, ops, ns, r)
      else
	 for op, fp in pairs(ops) do
	    iter_all_exp(f, ops, ns, {op, fp, e, r})
	    if find_item(exchangable, op) == nil then
	       iter_all_exp(f, ops, ns, {op, fp, r, e})
	    end
	 end
      end
      table.insert(ns, r)
   end
end

exchangable = {'+', '*'}
opts = {
   ['+'] = function (a, b) return a + b end,
   ['-'] = function (a, b) return a - b end,
   ['*'] = function (a, b) return a * b end,
   ['/'] = function (a, b) return a / b end,
}

for i = 0, 99, 1 do
   iter_all_exp(chkexp(24), opts, {3, 4, 6, 8})
end
