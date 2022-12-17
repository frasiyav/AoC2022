⟨lf, Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"
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

Position ← {h‿w←≢𝕩 ⋄ »˘9↑˘⟨3+h,-2+w⟩↑𝕩}
shapes Position¨↩

Extend ← 1«˘·»˘1»˘0×⊢
TrimTop ← (⊑∘/2<+´˘)⊸↓
Blocked ← (+○(+´)≠·+´∨)○⥊
_shift ← {𝕨 ¬∘Blocked n←𝔽˘𝕩? n; 𝕩}
_Push ← {𝔽◶⟨«_shift,»_shift⟩}

init ← ⟨0, 0, 0, 1‿9⥊1⟩

Drop ← { 𝕊 ⟨h, piececount, jetindex, grid⟩:
  piece ← shapes ⊑˜ 5|piececount
  g ← (Extend piece) ∾ grid
  p ← piece ∾ 0×grid
  moving ← 1
  While {𝕊:moving}‿{𝕊:
    p ↩ g (jetindex⊑jets)_Push p
    jetindex ((≠jets)|+)↩1
    g ¬∘Blocked n←»p? p↩n;
    g+↩p ⋄ moving↩0
  }
  g TrimTop↩
  ⟨h+g-○≠grid, 1+piececount, jetindex, 40↑g⟩
}

# Part 1
•Show ⊑ Drop⍟2022 init

# Part 2
cache ← Hashmap˜⟨⟩
cycle←@ ⋄ found ← 0
state ← init
While {𝕊:¬found}‿{𝕊:
  state Drop↩
  {cache.Has 𝕩?
    cycle ↩ (cache.Get𝕩)∾2↑state
    found ↩ 1
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
