# Imports

_Cribbed from https://wiki.haskell.org/Import_

Supposing that the module Mod exports four functions named `x`, `y`, `z`, and `(+++)`...

```
Import command 	                    What is brought into scope 	                        Notes
--------------                      --------------------------                          -----
import Mod                          x, y, z, (+++), Mod.x, Mod.y, Mod.z, (Mod.+++)      (By default, qualified and unqualified names.)
import Mod ()                       (Nothing!)                                          (Useful for only importing instances of typeclasses and nothing else)
import Mod (x,y, (+++))             x, y, (+++), Mod.x, Mod.y, (Mod.+++)                (Only x, y, and (+++), no z.)
import qualified Mod                Mod.x, Mod.y, Mod.z, (Mod.+++)                      (Only qualified versions; no unqualified versions.)
import qualified Mod (x,y)          Mod.x, Mod.y                                        (Only x and y, only qualified.)
import Mod hiding (x,y,(+++)        z, Mod.z                                            (x and y are hidden.)
import qualified Mod hiding (x,y)   Mod.z, (Mod.+++)                                    (x and y are hidden.)
import Mod as Foo                   x, y, z, (+++), Foo.x, Foo.y, Foo.z, (Foo.+++)      (Unqualified names as before. Qualified names use Foo instead of Mod.)
import Mod as Foo (x,y)             x, y, Foo.x, Foo.y                                  (Only import x and y.)
import qualified Mod as Foo         Foo.x, Foo.y, Foo.z, (Foo.+++)                      (Only qualified names, using new qualifier.)
import qualified Mod as Foo (x,y)   Foo.x, Foo.y                                        (Only qualified versions of x and y, using new qualifier)
```