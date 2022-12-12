i ← >•file.Lines "input12.txt"

[start,end]←"SE"=⌜i
zero←0=e←(25×end)+0⌈i-'a'
Moves ← «˘∾»˘∾»≍«
m←¯1≤-⎉2⟜Moves e
Step ← ⊢+·∨˝m∧·×Moves
F ← {⌈´⥊ Step•_while_(¬·∨´·⥊𝕩×⊢) end}

•Show F¨start‿zero
