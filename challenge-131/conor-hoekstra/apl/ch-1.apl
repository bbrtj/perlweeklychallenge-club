
solution ← (1,1≠2-⍨/⊢)⊂⊢

⍝ Tests

      solution 1 2 3 6 7 8 9
┌─────┬───────┐
│1 2 3│6 7 8 9│
└─────┴───────┘
      solution 11 12 14 17 18 19
┌─────┬──┬────────┐
│11 12│14│17 18 19│
└─────┴──┴────────┘
      solution 2 4 6 8
┌─┬─┬─┬─┐
│2│4│6│8│
└─┴─┴─┴─┘
      solution 1 2 3 4 5
┌─────────┐
│1 2 3 4 5│
└─────────┘