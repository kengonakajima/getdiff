require("modnochange")
require("modremove")


function g_nochange(a,b,c)
  p("hoge")
  sl="sssssss"
end

function g_toberemoved()
  p("piyo")
end

-- removed comment
function g_tobemodified(a,b,c)
  p("hage")
  p("gugu")
  call1()
  call2()
end

function Hoge()
  local t={}
  function t:m_nochange()
    p("mnochange")
    call3()
  end
  function t:m_toberemoved()
    p("mremoved")
    call4()
  end
  function t:m_tobemodified(a,b,c)
    p("mmodify")
    p("mmmm")
  end
end
