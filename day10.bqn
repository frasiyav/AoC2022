⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

i ← +`1∾{∨´"na"∊˜𝕩?0;⊑ToNums𝕩}¨∾' 'Split¨•FLines"input10.txt"

•Show +´20‿60‿100‿140‿180‿220(⊣×-⟜1⊸⊏)i
•Show ".#"⊏˜6‿40⥊(≠⥊↕∘40)⊸(2>·|-)i
