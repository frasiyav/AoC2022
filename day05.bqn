⟨lf, Split, Trim, ToNats⟩ ← •Import "bqn-libs/strings.bqn"

i‿m ← (¯1↓lf Split ⊢)¨(lf∾lf)Split •file.Chars "input05.txt"
init ← Trim¨<˘⍉>(1+4×↕9)⊸⊏¨i
moves ← ToNats¨m

_Move ← {n‿a‿b←𝕨 ⋄ (n⊸↓⋈⊣∾˜·𝔽n⊸↑)˜´⌾((a‿b-1)⊸⊏)𝕩}

•Show {⊑¨ init 𝕏_Move´⌽ moves}¨⌽‿⊢
