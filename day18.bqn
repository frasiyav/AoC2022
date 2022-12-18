⟨ToNums⟩ ← •Import "bqn-libs/strings.bqn"

d←1+⌈´˘i←⍉>ToNums¨•file.Lines"input18.txt"
g←d⥊d×´⊸↑/⁼+˝i××`1»d

Pad ← {»⎉1 »⎉2 » (2+≢)⊸↑𝕩}
NeighborC ← {(⊑×·+´·¬1↓⊢)13‿4‿10‿12‿14‿16‿22⊏⥊𝕩}⎉3
SA ← +´∘⥊ ·NeighborC 3‿3‿3↕Pad

•Show SA g

Shifts ← «⎉1∾»⎉1∾«⎉2∾»⎉2∾«∾»≍⊢
Flood ← {𝕨𝕊⍟(𝕩⊸≢) 𝕨×⌈˝Shifts 𝕩}⟜(⊢×≢⥊↕∘≠∘⥊)

•Show SA ⌈´∘⥊⊸≠ Flood ¬g
