⟨ToNats⟩ ← •Import "bqn-libs/strings.bqn"

i ← (2‿2⥊ToNats)¨•file.Lines "input04.txt"

•Show {+´0‿1⊸+⊸⍋{𝔽∨○𝔾𝔽˜}(𝕏´1⊸=)˝¨i}¨∧‿∨
