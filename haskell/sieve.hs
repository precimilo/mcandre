#!/usr/bin/env runhaskell

-- Andrew Pennebaker
--
-- Sieve of Eratosthenes
-- http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

module Eratosthenes where

import Test.QuickCheck
import Data.List (isPrefixOf)

sieve :: (Integral a) => [a] -> [a]
sieve (n:ns) = n : sieve ns'
  where ns' = filter ((/= 0) . flip rem n) (n:ns)

primes :: (Integral a) => [a]
primes = sieve [2..]

propFirst :: Bool
propFirst = head primes == 2

propFirstTen :: Bool
propFirstTen = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] `isPrefixOf` primes

propThousandth :: Bool
propThousandth = primes !! 999 == 7919

composite :: (Integral a) => a -> Bool
composite n
  | n < 2 = True
  | otherwise = any ((== 0) . rem n) [2..n-1]

propNoCompositesThousand :: Bool
propNoCompositesThousand = (not . any composite . take 1000) primes

-- Computation time demands manual evaluation
propTenThousandth :: Bool
propTenThousandth = primes !! 9999 == 104729

main :: IO ()
main = do
  quickCheck propFirst
  quickCheck propFirstTen
  quickCheck propThousandth
  quickCheck propNoCompositesThousand
