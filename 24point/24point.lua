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
      return '(' .. fmt_exp(e[2]) .. e[1] .. fmt_exp(e[3]) .. ')'
   end
end

function chkexp (target)
   return function (e, v)
	     if v == target then
		-- print(fmt_exp(e) .. '=' .. target)
	     end
	  end
end

function iter_all_exp (f, ops, ns, e, v)
   if table.maxn(ns) == 0 then return f(e, v) end
   for i, r in pairs(remove_duplicates(ns)) do
      table.remove(ns, find_item(ns, r))
      for op, fp in pairs(ops) do
	 iter_all_exp(f, ops, ns, {op, e, r}, fp(v, r))
	 if find_item(exchangable, op) == nil then
	    iter_all_exp(f, ops, ns, {op, r, e}, fp(r, v))
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

f = chkexp(24)
ns = {3, 4, 5, 6, 7, 8}
for i, r in pairs(remove_duplicates(ns)) do
   table.remove(ns, find_item(ns, r))
   iter_all_exp(f, opts, ns, r, r)
   table.insert(ns, r)
end
