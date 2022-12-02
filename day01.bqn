⟨lf, Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

•Show (⊑⋈+´) 3↑∨ +´∘ToNums¨ (2⥊lf) Split •file.Chars "input01.txt"
