⟨ToNums⟩ ← •Import "bqn-libs/strings.bqn"
⟨Hashmap⟩ ← •Import "bqn-libs/hashmap.bqn"

blueprints ← {𝕊·‿a‿b‿c‿d‿e‿f: [a‿0‿0,b‿0‿0,c‿d‿0,e‿0‿f]}∘Tonums¨•FLines"input19.txt"

F ← {mins 𝕊 bp:
  m ← Hashmap˜⟨⟩
  maxr ← mins∾˜⌈˝bp
  MaxG ← {
    1≥t←⊑𝕩? t×¯1⊑1⊑𝕩;
    m.Has 𝕩? m.Get 𝕩;
    𝕊 t‿robots‿res:
      rb ← 3↑robots
      gb ← ¯1⊑robots
      𝕩⊸m.Set⊸⊢(t×gb)⌈´{
        ∨´(rb+𝕩⊏bp)≥res?
          b←𝕩
          recipe ← b⊏bp
          tn ← {∧´0≥𝕩? 1; ⌈´𝕩⊸+⊸{𝕨×⊸×(mins×¬×𝕩)+𝕨⌈∘÷1⌈𝕩}rb} recipe-res
          t≥tn?
            (tn×gb) + MaxG ⟨t-tn, 1⊸+⌾(b⊸⊑)robots, recipe-˜res+tn×rb⟩
        ; 0
      }¨{t≤3?⟨3⟩;(maxr>robots)/↕4}
  }
  MaxG ⟨mins, 1‿0‿0‿0, 0‿0‿0⟩
}
•Show +´((1+·↕≠)×24 F¨⊢) blueprints
•Show ×´32 F¨ 3↑blueprints
