⟨lf, Split, Trim, ToNats⟩ ← •Import "bqn-libs/strings.bqn"

init‿moves ← (¯1↓lf Split ⊢)¨(lf∾lf)Split •file.Chars "input05.txt"
init ↩ Trim¨<˘⍉>(1+4×↕9)⊸⊏¨init
moves ↩ (0‿1‿1-˜ToNats)¨moves

_Move ← {n‿a‿b←𝕨 ⋄ (n⊸↓⋈⊣∾˜·𝔽n⊸↑)˜´⌾(a‿b⊸⊏)𝕩}

•Show {⊑¨ init 𝕏_Move´⌽ moves}¨⌽‿⊢


# Array based solution
a ← ∾init
c ← »+`≠¨init
i ← ↕≠a
R ← ≠○(i⊸>)´⊢-<´
G ← -˜´(↕≠init)⊸>¨

_F ← {n‿a‿b rev _𝕣 s‿arr:
  d←×b-a
  f←a⊏s
  t←b⊏s+↩n×G a‿b
  p←i+(f-t)×z←R 0‿n+t
  p+↩n×d×R f‿t+(d<0)×n-1
  p+↩rev×(⊢×+`⌾⌽-+`)z
  s⋈p⊏arr
}

•Show {⊏´c‿a 𝕩 _F´⌽ moves}¨1‿0
