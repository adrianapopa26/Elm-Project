module VerifyExamples.Model.Date.MonthsBetweenMonths1 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Test
import Expect

import Model.Date exposing (..)







spec1 : Test.Test
spec1 =
    Test.test "#monthsBetweenMonths: \n\n    monthsBetweenMonths Jan Apr\n    --> 3" <|
        \() ->
            Expect.equal
                (
                monthsBetweenMonths Jan Apr
                )
                (
                3
                )