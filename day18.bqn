⟨ToNums⟩ ← •Import "bqn-libs/strings.bqn"
A ← {𝕎⎉𝕩}

d←1+⌈´˘i←⍉>ToNums¨•FLines"input18.txt"
r←1+↕n←=g←d⥊d×´⊸↑/⁼+˝i××`⌾⌽1«d
pad ← {⊢↑˜2+≢}{𝕎𝕏}´{»}A¨r
shifts ← {⊢}{𝕎∨𝕏}´⥊«‿»A⌜r
c←⌊2÷˜+´ns←⥊∨⟜Shifts n(⥊⟜1(⊑=⊢)⥊⥊·↕⋆)3
NCount ← (c⊸⊏×·+´¬)ns/⥊
SArea ← +´∘⥊ ·NCount⎉n (n⥊3)↕Pad
Flood ← {𝕨𝕊⍟(𝕩⊸≢) 𝕨×Shifts 𝕩}⟜(1⌾⊑0×⊢)

•Show SArea g
•Show SArea ⊑⊸≠ Flood ¬g
