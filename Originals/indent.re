{	decreaseIndentPattern = '(?x)
  (
    ^\s*(
      (end|else|elseif|in|define)\b
    |
      # case .. of nil then .. (brackets) H|T then
      \bof\s.+\s+then\b|\[\]\s.+\sthen
    )
  )';
	increaseIndentPattern = '(?x)^(\s*|.+=\s*)
    (
      \b(
        class|proc|fun|local|import
        |if|else|elseif|for|in
        |case|meth
      )\b(?!.*?\bend\b)
    |
      # case .. of nil then .. (brackets) H|T then
      \bof\s.+\s+then\b|\[\]\s.+\sthen
    )
    .*$';
}