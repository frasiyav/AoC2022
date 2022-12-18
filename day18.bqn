⟨ToNums⟩ ← •Import "bqn-libs/strings.bqn"

i ← >ToNums¨•Flines"input18.txt"
g←0⥊˜1+⌈˝i ⋄ {g↩1⌾(𝕩⊸⊑)g}˘i

Pad ← {»⎉1 »⎉2 » (2+≢)⊸↑𝕩}
NeighborC ← {(⊑×·+´·¬1↓⊢)13‿4‿10‿12‿14‿16‿22⊏⥊𝕩}⎉3
SA ← +´∘⥊ ·NeighborC 3‿3‿3↕Pad

•Show SA g

Shifts ← «⎉1∾»⎉1∾«⎉2∾»⎉2∾«∾»≍⊢
Flood ← {𝕨𝕊⍟(𝕩⊸≢) 𝕨×⌈˝Shifts 𝕩}⟜(⊢×≢⥊↕∘≠∘⥊)

•Show SA ⌈´∘⥊⊸≠ Flood ¬g
