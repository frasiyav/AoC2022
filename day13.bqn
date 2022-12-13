⟨lf, Split, ReplaceAll⟩ ← •Import "bqn-libs/strings.bqn"

i ← lf Split¨(lf∾lf)Split ¯1↓•file.Chars "input13.txt"
i ↩ (•BQN ⟨"["‿"]","⟨"‿"⟩"⟩⊸ReplaceAll)⚇1 i

•Show +´(1+≡⟜∧¨/·↕≠)i
•Show ×´⟨⟨2⟩⟩‿⟨⟨6⟩⟩{1+/∊⟜0‿1⍋𝕨∾𝕩}∾i
