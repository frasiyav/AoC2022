⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

i←' 'Split¨•FLines"input09.txt"
i↩∾{(⊑ToNums𝕩)/⋈⟨0‿1,0‿¯1,¯1‿0,1‿0⟩⊑˜"RLDU"⊐𝕨}´¨i

F ← (<0‿0)(⊢+(××·∨´1<|)∘-)˜`⊢

•Show ≠∘⍷¨F⍟1‿9+`i

