⟨lf, Split, Trim, ToNats⟩ ← •Import "bqn-libs/strings.bqn"

init‿moves ← (¯1↓lf Split ⊢)¨(lf∾lf)Split •file.Chars "input05.txt"
init ↩ Trim¨<˘⍉>(1+4×↕9)⊸⊏¨init
moves ↩ (0‿1‿1-˜ToNats)¨moves

_Move ← {n‿a‿b←𝕨 ⋄ (n⊸↓⋈⊣∾˜·𝔽n⊸↑)˜´⌾(a‿b⊸⊏)𝕩}

•Show {⊑¨ init 𝕏_Move´⌽ moves}¨⌽‿⊢


# Array based solution
n‿a‿b←<˘⍉>moves
o←|0⌊1+d←n××b-a
c←↕≠init
u←n×⍉(c>⌜b)-(c>⌜a)
i ← ↕≠∾init
R ← ≠○(i⊸>)´⊢-<´

F ← {𝕊 rev:
  arr←∾init
  g←»+`≠¨init
  Move ← {u𝕊n‿a‿b‿d‿o:
    f←a⊏g
    t←b⊏g+↩u
    m←R 0‿n+t
    p←i
    p+↩m×f-t
    p+↩d×R f‿t+o
    p+↩rev◶⟨0,⊢×+`⌾⌽-+`⟩m
    arr↩p⊏arr
  }
  u Move˘⍉>n‿a‿b‿d‿o
  g⊏arr
}

•Show F¨1‿0
