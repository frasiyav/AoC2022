i ← •file.Lines "input03.txt"

a ← ⥊"aA"+⌜↕26
v ← ⥊1‿27+⌜↕26
Vals ← a⊸⊐⊸⊏⟜v¨
Unique ← ⊑(∊/⊣)´
F ← +´ Unique∘Vals˘

•Show F ><˘¨2‿∘⊸⥊¨i
•Show F ∘‿3⥊i
