⟨HashMap⟩ ← •Import "bqn-libs/hashmap.bqn"
While ← {𝕏•_while_𝕎@}´

elves ← /○⥊⟜(↕≢)".#"⊐>•Flines "input23.txt"
pdir‿dir ← <˘¨⋈⟜(1⊑˘⊢)0‿2(⊏∾⊏⟜⍉)¯1+↕3‿3
RG ← (×´1+⌈´-⌊´)⊸-⟜≠
h ← elves Hashmap 1¨elves

# Slow
c ← 0 ⋄ done ← 0
While {𝕊:¬done}‿{𝕊:
  •Show∘RG⍟(10≡c)elves
  pd ← {⊑/1∾˜(∨´∘∾×·¬∨´¨)pdir(h.Has◶0‿h.Get¨+⚇1)¨<𝕩}¨elves
  p ← pd ⊑⟜(dir∾0‿0)⊸+¨ elves
  m ← (∊∧∊⌾⌽) p
  done ↩ ∧´m¬⊸∨4=pd
  elves {𝕩 h.Set 0 ⋄ 𝕨 h.Set 1 ⋄ 𝕨}¨⌾(m⊸/)˜↩ p
  dir‿pdir 1⊸⌽¨↩
  c+↩1
}
•Show c
