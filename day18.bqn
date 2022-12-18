⟨ToNums⟩ ← •Import "bqn-libs/strings.bqn"
A ← {𝕎⎉𝕩}

d←1+⌈´˘i←⍉>ToNums¨•FLines"input18.txt"
r←1+↕n←=g←d⥊d×´⊸↑/⁼+˝i××`1»d
pad ← {⊢↑˜2+≢}{𝕎𝕏}´»˙⊸A¨r
shifts ← {≍}{𝕨∾𝕏}´⥊«‿»A⌜r
ns ← ∾○/○⥊⟜(⊢¬⊸∧·∨˝Shifts) 3(⥊⟜1(⊑=⊢)⥊⥊·↕⋆)˜n
NeighborC ← ((⊑×·+´·¬1↓⊢)ns⊏⥊)⎉n
SA ← +´∘⥊ ·NeighborC (n⥊3)↕Pad
Flood ← {𝕨𝕊⍟(𝕩⊸≢) 𝕨×⌈˝Shifts 𝕩}⟜(⊢×≢⥊↕∘≠∘⥊)

•Show SA g
•Show SA ⌈´∘⥊⊸≠ Flood ¬g
