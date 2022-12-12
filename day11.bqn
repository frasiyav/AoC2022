⟨lf, Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"
N ← ⊑ToNums

i ← (' 'Split¨1↓lf Split ⊢)¨(lf∾lf)Split ¯1↓•file.Chars "input11.txt"

Monkey ← {𝕊 a‿b‿c‿d‿e:
  ct⇐0
  items ← N¨4↓a
  test‿t‿f ⇐ N¨¯1⊑¨c‿d‿e
  op ← {"*":×;"+":+}⊸{𝕏⊸𝕎}⟜{"old":⊢;N𝕩}´¯2↑b

  Catch ⇐ {items∾↩𝕩}
  _Turn ⇐ {
    new ← 𝔽 Op items
    ct+↩≠items ⋄ items↩⟨⟩
    (t‿f⊏𝕩){𝕨.Catch𝕩/new}¨ ⋈⟜¬ 0=test|new
  }
}

_Round ← {F _𝕣 m: {F 𝕩._Turn m}¨m ⋄ m}
MB ← ×´2↑·∨{𝕩.ct}¨

•Show MB (⌊÷⟜3)_Round⍟20 Monkey¨i
•Show MB {(•math.LCM´{𝕩.test}¨𝕩)⊸|_Round⍟10000 𝕩}Monkey¨i




{ # Regex parsing example
pcre2 ← •Import "../bqn-pcre2/pcre2.bqn"
re ← {extended⇐1} pcre2.Compile "
\Q  Starting items: \E       (\d+(?:,\ \d+)*) \n
\Q  Operation: new = old \E     ([+*])\ (\w+) \n
\Q  Test: divisible by \E               (\d+) \n
\Q    If true: throw to monkey \E       (\d+) \n
\Q    If false: throw to monkey \E      (\d+) \n
"
•Show ⍉≍i ← 1↓¨re.MatchAll •file.Chars "input11.txt"
i ↩ ToNums⌾⊑¨{"*":×;"+":+;"old":⊢;N𝕩}¨⌾(1⊸↓)¨i

Monkey ← {
  items‿a‿b‿d‿t‿f⇐𝕩 ⋄ ct⇐0
  Catch ⇐ {items∾↩𝕩}
  _Turn ⇐ {
    new ← 𝔽 A⟜B items
    ct+↩≠items ⋄ items↩⟨⟩
    (t‿f⊏𝕩){𝕨.Catch 𝕩/new}¨ ⋈⟜¬ 0=d|new
  }
}

_Round ← {F _𝕣 m: {F 𝕩._Turn m}¨m ⋄ m}
MB ← ×´2↑·∨{𝕩.ct}¨

•Show MB (⌊÷⟜3)_Round⍟20 Monkey¨i
•Show MB {(•math.LCM´{𝕩.d}¨𝕩)⊸|_Round⍟10000 𝕩}Monkey¨i
}
