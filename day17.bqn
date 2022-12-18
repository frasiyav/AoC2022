⟨HashMap⟩ ← •Import "bqn-libs/hashmap.bqn"
While ← {𝕩•_while_𝕨@}´

jets ← 1⌊'<'-˜¯1↓•file.Chars"input17.txt"

shapes ← ⟨
  [1‿1‿1‿1]
  [0‿1‿0,1‿1‿1,0‿1‿0]
  [0‿0‿1,0‿0‿1,1‿1‿1]
 ⍉[1‿1‿1‿1]
  [1‿1,1‿1]
⟩

shapes {h‿w←≢𝕩 ⋄ »˘7↑˘⟨3+h,-1+w⟩↑𝕩}¨↩

_blocked ← {𝕨(∨=○(+´)∨⟜⥊⟜𝕩)○⥊◶0‿⊢ 𝔽𝕩}
TrimTop ← (⊑∘/∨´˘)⊸↓

init ← ⟨0, 0, 0, 1‿7⥊1⟩

Drop ← { 𝕊 ⟨h, piececount, j, grid⟩:
  piece ← shapes ⊑˜ 5|piececount
  g ← grid ∾˜ 0×piece
  p ← piece ∾ 0×grid
  moving ← 1
  While {𝕊:moving}‿{𝕊:
    p ↩ 0≢◶p‿⊢ g (j⊑jets)◶«‿»˘_blocked p
    j ↩ (≠jets)|j+1
    0≢◶{𝕊:g+↩p⋄moving↩0}‿{p↩𝕩} g »_blocked p
  }
  g TrimTop↩
  ⟨h+g-○≠grid, 1+piececount, j, 40↑g⟩
}

# Part 1
•Show ⊑ Drop⍟2022 init

# Part 2
cache ← Hashmap˜⟨⟩
cycle ← 0
state ← init
While {𝕊:0≡cycle}‿{𝕊:
  state Drop↩
  {cache.Has 𝕩?
    cycle ↩ (cache.Get𝕩)∾2↑state
  ;
    𝕩 cache.Set 2↑state
  } 5⊸|⌾⊑ 1↓state
}

n ← 1_000_000_000_000
cstarth‿cstart‿cendh‿cend ← cycle
clen ← cend - cstart
cheight ← cendh - cstarth
repeats‿remainder ← clen (⌊∘÷˜⋈|) n-cstart
•Show (cheight × repeats) + ⊑ Drop⍟(cstart+remainder) init
