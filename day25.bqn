i ← •FLines "input25.txt"
k ← "=-012"

_ToBase ← {(𝕗⥊˜·⌈𝕗⋆⁼⊢)⊸(⊣|·>·⌊∘÷`⌾⌽«˜⟜<)}
Decode ← +⟜(5⊸×)´∘⌽ 2-˜k⊐⊢
Encode ← k⊏˜2+·(5⊸|⌾(2⊸+)0⊸>⊸+)`⌾⌽ 5 _ToBase

•Show Encode +´ Decode¨i
