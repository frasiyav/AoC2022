⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

i←{(⊑ToNums𝕩)⋈⟨0‿1,0‿¯1,¯1‿0,1‿0⟩⊑˜"RLDU"⊐𝕨}´¨' 'Split¨•FLines"input09.txt"

F ← {
  l←⟨⟩ ⋄ ⟨o,·‿s⟩←--`(⌊˝⋈⌈˝)+`>×´¨𝕩
  P ← ⊢+·(1⌊⊢×·∨´1<⊢)∘|⊸×⟜×-
  r←𝕨+⟜1⊸⥊<o
  r{n‿d𝕊𝕩: d{{l∾↩s⊸×⊸+´¯1⊑𝕩}⊸⊢ P`d⊸+⌾⊑𝕩}⍟n 𝕩}´⌽𝕩
  ≠⍷l
}

•Show F⟜i¨1‿9
