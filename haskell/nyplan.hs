
-- Pr linje gør følgende: --
-- Parse til move --
-- Check om det er tilladt:: --
  -- Check out of bounds, check om kortet er i brug, check om det er korrekt, check om der står en pawn på pladsen, Check om spillet er slut.

-- Lav moved og opdatere den state som er gemt undervejs. --
-- Send state videre gennem rekursion, og parse det næste move --

-- rekursion med state og move skal laves således --
-- Måske lav den med hjælpemetode som det rekursive og så update som start på rekursionen. --
-- update <state> <input> = hjælpemetode <state> (parseMove <move>)

