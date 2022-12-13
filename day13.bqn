⟨ReplaceAll⟩ ← •Import "bqn-libs/strings.bqn"

i ← ⟨"["‿"]","⟨"‿"⟩"⟩ReplaceAll •file.Chars "input13.txt"
i ↩ •BQN '⟨'∾i∾'⟩'
i ↩ ⊑⍟(1≡≠)⚇1 i

•Show +´1+∧⊸≡˘⊸/⟜(↕≠)∘‿2⥊i
•Show ×´1+/0‿1∊˜⍋2‿6∾i
