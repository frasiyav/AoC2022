⟨ReplaceAll⟩ ← •Import "bqn-libs/strings.bqn"

i ← •BQN '⟨'∾'⟩'∾˜⟨"["‿"]","⟨"‿"⟩"⟩ReplaceAll •file.Chars "input13.txt"

•Show +´1+∧⊸≡˘⊸/⟜(↕≠)∘‿2⥊i
•Show ×´1+/0‿1∊˜⍋⟨⟨2⟩⟩‿⟨⟨6⟩⟩∾i
