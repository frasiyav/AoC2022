⟨lf, Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"
N ← ⊑ToNums

i ← (' 'Split¨lf Split ⊢)¨(lf∾lf)Split ¯1↓•file.Chars "input11.txt"

Monkey ← {𝕊 ·‿a‿b‿c‿d‿e:
  ct⇐0 ⋄ items ← N¨4↓a
  test‿t‿f ⇐ (N ¯1⊑⊢)¨c‿d‿e
  op ← {"*":×;"+":+}⊸{𝕏⊸𝕎}⟜{𝕊"old":⊢;N𝕩}´¯2↑b
  _Inspect ← {ct+↩≠𝕩 ⋄ {·:items↩⟨⟩}⊸⊢ 𝔽 Op¨𝕩} 
  Catch ⇐ {items∾↩𝕩}
  Turn ⇐ {(t‿f⊏𝕨){𝕨.Catch𝕩/new}¨⋈⟜¬(0=test|⊢)new←𝕏_Inspect items}
}

_Round ← {𝕗{m𝕩.Turn𝕗}¨m←𝕩⋄m}
P1 ← (⌊÷⟜3)_Round⍟20 Monkey¨
P2 ← (•math.LCM´{𝕩.test}¨)⊸{𝕨⊸|_Round⍟10000 𝕩} Monkey¨
•Show (×´2↑·∨{𝕩.ct}¨)¨(P1⋈P2)i
