-- You can benchmark your code quickly and effectively with Criterion. See its
-- website for help: <http://www.serpentine.com/criterion/>.
import Criterion.Main

import Math (square, cube)

main :: IO ()
main = defaultMain [bench "square" (whnf square (2 :: Int)), bench "cube" (whnf cube (2 :: Int))]
