⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"
⟨Hashmap⟩ ← •Import "bqn-libs/hashmap.bqn"

[key,flow,c]←⍉>{⟨1⊑𝕩, ⊑ToNums 4⊑𝕩, 2↑¨9↓𝕩⟩}¨' 'Split¨•file.Lines"input16.txt"

adj ← >(≠key)↑¨(/⁼key⊸⊐)¨c
paths ← 1+{𝕩𝕊⍟≢⌊˝∘+⎉1‿∞˜⊸⌊𝕩}∞⋆¬adj
start ← key(⊣≠⊸↑·/⁼⊐⟜⋈)"AA"

NZ ← (start∨0≠flow)⊸/
paths NZ˘∘NZ↩
flow NZ↩
start ↩ ⊑/init←NZ start
n ← ≠paths

memo ← Hashmap˜⟨⟩

Search ← {
  memo.Has 𝕩? memo.Get 𝕩;
  𝕊 ⟨open, cr, t⟩:
    𝕩{𝕗 memo.Set 𝕩}⊸⊢ ⌈´{
      (𝕩⊑open) ∨ 𝕩≡cr? 0;
      0 < nt←t-cr‿𝕩⊑paths?
        0 ⌈ (nt×𝕩⊑flow) + Search ⟨1⌾(𝕩⊸⊑)open, 𝕩, nt⟩
      ; 0
    }¨↕n
}

•Show Search ⟨init, start, 30⟩

•Show ⌈´+○{Search⟨init∨𝕩, start, 26⟩}⟜¬˘∘‿16⥊⟨16‿'c',1⟩•bit._Cast@+↕2⋆n
