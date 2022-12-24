[u,d,l,r]←"^v<>"=⌜↓˘´⟜1‿¯1 1‿¯1↓´˜>•Flines "input24.txt"

u  1⊸⌽⍟(↕≠)↩
d ¯1⊸⌽⍟(↕≠)↩
l  1⊸⌽˘⍟(↕·≠⊏)↩
r ¯1⊸⌽˘⍟(↕·≠⊏)↩

m ← ¬∨˝>>(lcm←•math.LCM´≢⊑u)⊸⥊¨u‿d‿l‿r
z ← 0⥊˜≢⊏m
Shifts ← »∨«∨»˘∨«˘∨⊢
Empty ← 0≡·+´⥊
I ← {1⌾(𝕨⊸⊑)𝕩}
F ← {a‿b𝕊c: c+↩1 ⋄ {{𝕤⋄c+↩1}⊸⊢(m⊏˜lcm|c)×Shifts a⊸I⍟Empty 𝕩}•_while_(0≡b⊑⊢) a I z ⋄ c}

s ← 0‿0
e ← ¯1‿¯1

•Show s‿e F 0
•SHow 0 F´ ⟨s‿e,e‿s,s‿e⟩
