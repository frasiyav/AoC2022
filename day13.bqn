⟨ReplaceAll⟩ ← •Import "bqn-libs/strings.bqn"

i ← ⟨"["‿"]","⟨"‿"⟩"⟩ReplaceAll •file.Chars "input13.txt"
i ↩ •BQN '⟨'∾i∾'⟩'
i ↩ {𝕊⍟(𝕩⊸≢)⊑⍟(1≡≠)⚇1𝕩} i

•Show +´1+/⊑∘⍒˘∘‿2⥊i
•Show ×´1‿2+˝i(⊑∘⍒⋈)⌜2‿6
