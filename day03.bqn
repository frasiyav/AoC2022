i ← •file.Lines "input03.txt"

a ← ⥊"aA"+⌜↕26
v ← ⥊1‿27+⌜↕26
Vals ← a⊸⊐⊸⊏⟜v
Occurs ← ×·≠¨∾⟜53⊸⊔
F ← +´{⊑/∧´Occurs∘Vals¨𝕩}˘

•Show F ><˘¨2‿∘⊸⥊¨i
•Show F ∘‿3⥊i
