i←'0'-˜>•file.Lines"input08.txt"

_r←{(↕4)𝔽{𝔽⌾(⌽∘⍉⍟𝕨)𝕩}¨<}
   
•Show +´⥊∨´(¬·»«≤⌈`)_r i
•Show ⌈´⥊×´(0‿0⍉·»·(1+×)`<⌜˜)˘_r i

# Faster Part 2
•Show ⌈´⥊×´{v←10⥊0⋄0{r←𝕩⊑v⋄v↩1+v×𝕩<↕10⋄r}`𝕩}˘_r i
