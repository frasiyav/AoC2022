⟨ ToNums⟩ ← •Import "bqn-libs/strings.bqn"

d ← +˝|-˝˘[[sx,·],[sy,·]]←2‿1‿0⍉∘‿2‿2⥊>ToNums¨•file.Lines"input15.txt"

F ← ((«⊸<∨»⊸<)·«⊸≠«≤1+⊢)⊸/·⥊·⌈`sx(∧-(</·⍉≍)+)d-sy|∘-⊢

•Show +´-˜´˘∘‿2⥊F 2000000

y ← 0 ⋄ max ← 4000000
•Show y+max×1+1⊑{𝕊:F y+↩1}•_while_(2≥≠) @
