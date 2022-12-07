⟨Split, ToNums⟩ ← •Import "bqn-libs/strings.bqn"

Directory ← {
  name‿size ⇐ 𝕩‿0
  files‿subdirs ⇐ ⟨⟩‿⟨⟩
  Add ⇐ {
    𝕊s‿f:
      files ∾↩ <𝕩
      size  +↩ ⊑ToNums s
    ;
    𝕊d:
      subdirs ∾↩ d
      size    +↩ d.size
  }
}

i ← ' 'Split¨•file.Lines"input07.txt"
Pop ← {·:x←⊑i⋄i↩1↓i⋄x}
Parse ← {
  ⟨⟩≡i? 𝕩;
  dir←𝕩
  {𝕏𝕨}´(Pop@)‿{
    "$"‿"cd"‿"..":
      dir
  ;
    "$"‿"cd"‿x:
      dir.Add Parse Directory x
      Parse dir
  ;
    "dir"‿x:
      Parse dir
  ;
    "$"‿"ls":
      Parse dir
  ;
    size‿file:
      dir.Add size‿file
      Parse dir
  }
}

fs ← Parse Directory "/"

# Part 1
•Show {(100000⊸≥⊸×𝕩.size)+´𝕊¨𝕩.subdirs}fs

# Part 2
t←fs.size
req←30000000-70000000-t
•Show {(req⊸>⊸×⟜t⊸⌈𝕩.size)⌊´𝕊¨𝕩.subdirs}fs

