⟨lf, Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

m‿i ← (lf∾lf)Split •FChars "input22.txt"
layoutdim ← 4‿3

m ↩ ¯1+" .#"⊐>(⌈´≠¨)⊸(↑¨) lf Split m
midx ← ↕≢m
facedim ← layoutdim÷˜≢m

instructions ← ⍉(ToNums≍0∾˜"LR"⊸(¯1‿1⊏˜⊣⊐∊˜/⊢)) ¯1↓i
start ← 0⋈˜0∾⊑/0=⊏m

layoutkey ← {y‿x:y/x/˘(⊢⥊·↕×´)layoutdim}facedim
faces ← (facedim⊸⥊¨ layoutkey ⊔○⥊ ⊢)¨m‿midx
cubekey ← ∾facedim⊸⥊¨[¯1‿0‿1,¯1‿2‿¯1,3‿4‿¯1,5‿¯1‿¯1]

Cube ← { m‿mi 𝕊 rot‿order:
  m‿mi ↩ {rot{(⌽⍉)⍟𝕨 𝕩}¨order⊏𝕩}¨m‿mi
  mr ← facedim⊸⥊¨rot
  ∾⟜(midx{<𝕨⍋⊸⊏⌾⥊˜𝕩⊑𝕨}1⊑⊢) (∾layoutdim⥊⊢)¨m‿mi‿mr
}

cubes ← faces⊸Cube¨⟨
  ⟨0‿0‿0‿0‿1‿0‿2‿0‿0‿0‿0‿0,0‿7‿3‿5‿9‿8‿6‿1‿2‿10‿4‿11⟩
  ⟨0‿0‿0‿0‿0‿0‿0‿0‿2‿0‿1‿0,0‿6‿3‿5‿9‿8‿1‿2‿7‿10‿4‿11⟩
  ⟨0‿1‿0‿0‿0‿0‿3‿0‿3‿0‿0‿0,0‿9‿3‿5‿1‿8‿6‿4‿2‿10‿7‿11⟩
  ⟨0‿0‿0‿0‿1‿0‿2‿0‿0‿0‿0‿0,0‿2‿3‿5‿4‿8‿1‿6‿7‿10‿9‿11⟩
  ⟨0‿0‿0‿0‿0‿0‿0‿0‿2‿0‿1‿0,0‿1‿3‿5‿4‿8‿6‿7‿2‿10‿9‿11⟩
  ⟨0‿1‿0‿0‿0‿0‿3‿0‿3‿0‿0‿0,0‿4‿3‿5‿6‿8‿1‿9‿7‿10‿2‿11⟩
⟩

GetRow ← { 𝕨𝕊c‿d:
  y‿x ← c ⊑ ¯1⊑𝕨
  (<·c⊸≡¨1⊑⊢)⊸∾ d◶⟨y⊏⊢,x⊏⍉,⌽y⊏⊢,⌽x⊏⍉⟩¨¯1↓𝕨
}

_Move ← {n‿rot 𝔽 _𝕣 c‿r:
  p‿m‿mi‿mr ← 𝔽⊸GetRow 𝕩
  np ← ⊑∘/ m {(⊢⊣⍟(∨´𝕨∧⊢)¯1⌽⊢)⍟n 𝕩}⌾((0≤m)⊸/) p
  ⟨np⊑mi, 4|rot+r+np⊑mr⟩
}

p1cube ← (<midx)∾˜∾⟜(<·0¨⊑)m‿midx

P1 ← m‿midx‿(0¨m)‿midx _Move
P2 ← ⊑⟜cubekey⊸⊑⟜cubes∘⊑ _Move
PW ← +´1000‿4‿1×·∾1⊸+⌾⊑

•Show PW start P1˝⌽instructions
•Show PW start P2˝⌽instructions
