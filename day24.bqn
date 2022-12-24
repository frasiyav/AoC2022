[n,s,w,e]←"^v<>"=⌜↓˘´⟜1‿¯1 1‿¯1↓´˜>•Flines "input24.txt"

l←•math.LCM´dim←≢n
n  1⊸⌽⍟(↕l)↩
s ¯1⊸⌽⍟(↕l)↩
w  1⊸⌽˘⍟(↕l)↩
e ¯1⊸⌽˘⍟(↕l)↩
m ← ¬∨˝>>[n,s,e,w]

Shifts ← »∨«∨»˘∨«˘∨⊢
I ← {1⌾(𝕨⊸⊑)𝕩}
F ← {a‿b𝕊c:
  c+↩1
  { 𝕩 ↩ a⊸I⍟(0≡·+´⥊) 𝕩
    𝕩 ↩ (m⊏˜l|c)×Shifts 𝕩
    c+↩1
    𝕩
  }•_while_(0≡b⊑⊢) a I dim⥊0
  c
}

a‿b ← ⟨0‿0,¯1‿¯1⟩

•Show a‿b F 0
•SHow 0 F´ ⟨a‿b,b‿a,a‿b⟩
