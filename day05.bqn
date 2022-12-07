⟨lf, Split, Trim, ToNats⟩ ← •Import "bqn-libs/strings.bqn"

init‿moves ← (¯1↓lf Split ⊢)¨(lf∾lf)Split •file.Chars "input05.txt"
init ↩ Trim¨<˘⍉>(1+4×↕9)⊸⊏¨init
moves ↩ (0‿1‿1-˜ToNats)¨moves

_Move ← {n‿a‿b←𝕨 ⋄ (n⊸↓⋈⊣∾˜·𝔽n⊸↑)˜´⌾(a‿b⊸⊏)𝕩}

•Show {⊑¨ init 𝕏_Move´⌽ moves}¨⌽‿⊢


# Array based solution
arr←∾init
n‿a‿b←<˘⍉>moves
i‿c←↕∘≠¨arr‿init
s←»+`≠¨init
u←n×-˝c<⌜˜b≍a
f←⊢˝g←s+`u
b↩b⊏˘g
a↩a⊏˘g↩s»g
R←⍉·≠˝i>⌜⎉1⊢-⎉1<˝
m←R b≍n+b
p←i⊸+˘m×x←a-b
o←|0⌊1+d←n××¬x
p+↩d×R o+⎉1 a≍b
pr←p+(+`⌾⌽-+`)⌾⍉⊸×m
•Show (f⊏arr⊏˝⌽)¨pr‿p
