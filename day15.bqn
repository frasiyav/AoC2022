⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

i ← (2(↑⋈↓)·∾·(ToNums 2↓⊢)¨2‿3‿8‿9⊏' 'Split⊢)¨•file.Lines"input15.txt"
d ← +˝|-˝˘[[sx,·],[sy,·]]←1‿2‿0⍉>⍉>i

F ← ((«⊸<∨»⊸<)·«⊸≠«≤1+⊢)⊸/·⥊·⌈`sx(∧-(</·⍉≍)+)d-sy|∘-⊢

•Show +´-˜´˘∘‿2⥊F 2000000

y ← 0 ⋄ max ← 4000000
•Show y+max×1+1⊑{𝕊:F y+↩1}•_while_(2≥≠) @
