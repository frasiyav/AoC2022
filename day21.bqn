⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

[m,j] ← ⍉>':'Split¨•Flines "input21.txt"
j(1↓' 'Split⊢)¨↩

L ← j⊑˜·⊑m⊐<
T ← 3≡•Type

_R ← {
  S _R a‿op‿b:
    f ← ⟨+,-,×,÷⟩⊑˜"+-*/"⊐op
    2⊸×⊸+○T◶{𝕨F𝕩}‿{𝕨F𝕏}‿{𝕩F˜𝕎}‿{𝕎F𝕏}´ S¨a‿b;
  ⊑∘ToNums ⊑𝕩
}
P1 ← {𝕊_R L 𝕩}
P2 ← {𝕊"humn": ⊢; 𝕊_R L 𝕩}

•Show P1 "root"
•Show <○T◶{𝕎⁼𝕩}‿{𝕏⁼𝕨}´ P2¨ 0‿2⊏L"root"
