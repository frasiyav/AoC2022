⟨lf, Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"
While ← {𝕩{𝔽⍟𝔾∘𝔽_𝕣_𝔾∘𝔽⍟𝔾𝕩}𝕨@}´

i ← ToNums⚇1 " -> "⊸Split¨ •file.Lines "input14.txt"

grid ← 0⥊˜¬´·‿min←500‿0(⌈´⋈⌊´)∾i
{grid 1¨⌾((𝕨⊸+¨↕𝕩¬𝕨)⊸⊑)↩}´∘∧˘∾2↕¨i-⚇1 min
drop ← 500‿0-min

P1 ← { 𝕊 grid:
  OOB ← ∨´1≠(0∾˘≢grid)⍋˘⊢
  c←0 ⋄ done←0
  While {𝕊:¬done}‿{𝕊:
    { Step 𝕩:
      ×≠m←¬∘⊑⟜grid⊸/𝕩+⚇1⟨0‿1,¯1‿1,1‿1⟩?
        OOB◶Step‿{𝕊:done↩1⋄c} ⊑m
      ;
        c+↩1 ⋄ grid 1⌾(𝕩⊸⊑)↩
    } drop
  }
}

P2 ← { 𝕊 grid:
  grid 1⌾(drop⊸⊑)↩
  grid (⍉·»⊢↑˜2‿1+≢)↩
  grid («∨»∨⊢)⊸∧⟜¬`⌾(<˘)↩

  e←⊑∘/˘0‿¯1⊏⍉grid
  (+´⥊grid)+´+⟜1⊸×⊸÷⟜2 (⊑≢grid)-1+e
}

•Show P1 grid
•Show P2 grid
