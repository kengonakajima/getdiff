require("newmodule")
require("modnochange")

function g_nochange(a,b,c)
  p("hoge")
  sl="sssssss"
  call1()
end

function g_newfunc()
  p("fuga-new")
  call2()
end

function g_tobemodified(a,b,c,d)
  -- newcomment
  newlit = "newnewnenewn"
end

newlit2 = "n2n2n2n2n2n2"

-- newcomment 2
function Hoge()
  local t={}
  function t:m_nochange()
    p("mnochange")
  end
  function t:m_tobemodified(a,b,c)
    p("mmodifymoku")
    -- new comment 3
    p("mmmm")
    local a=1
    call3()
  end
end

call2()
call2()
