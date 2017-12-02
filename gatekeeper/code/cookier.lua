-- load var
local cookie_name = ngx.var.cookie_name
local cookie_value = ngx.var.cookie_value

-- domain for the website
local domain = "cssny.space"

local cookie = cookie_name .."=" .. cookie_value .. ";HttpOnly;Domain=" .. domain .. ";Path=/";

-- set the cookie
ngx.header['Set-Cookie'] = cookie

return ngx.exit(200)
