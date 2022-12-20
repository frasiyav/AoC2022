⟨ToNums⟩ ← •Import "bqn-libs/strings.bqn"
i ← ⊑∘ToNums¨•Flines"input20.txt"
key ← 811589153

M ← ¬≠⊸↑⟜(/⁼⋈)
Mix ← {n𝕊e: e⊏˜{F←(𝕩 M ⊑𝕩⊐𝕨)⊸/ ⋄ (𝕨⊑e)⊸⌽⌾F 𝕩}´⟜⌽⟜p⍟n p←↕≠e}
Coords ← (≠|1000‿2000‿3000+·⊑∘/0=⊢)⊸⊏

•Show +´ Coords 1  Mix i
•Show +´ Coords 10 Mix i×key
