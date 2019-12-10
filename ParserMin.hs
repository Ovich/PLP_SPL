{-# OPTIONS_GHC -w #-}
module ParserMin where 
import LexerMin
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,215) ([8000,66,256,0,16384,0,0,65472,71,12,0,0,0,0,0,0,4096,8000,66,32000,264,62464,1057,0,0,0,31744,256,64640,1151,8692,4,8192,0,1024,0,32000,264,62464,1057,53248,4231,16384,16927,0,2173,1,8692,4,0,0,8000,66,32000,264,62464,1057,53248,4231,16384,16927,0,2173,1,0,0,8192,0,8000,66,0,508,4,2032,16,8128,64,32512,256,64512,1025,61440,4103,0,0,0,0,0,448,4,1792,16,7936,64,31744,256,512,0,64,0,34768,16,0,16383,1,0,62466,1057,0,65488,71,0,0,2173,1,61440,4103,0,0,8000,66,512,32764,62468,1057,0,8128,64,0,0,2173,1,61440,4607,49152,18431,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","Exps","Args","let","in","def","int","var","func","if","then","else","\"=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"%\"","\"^\"","\"++\"","\"==\"","\"!=\"","\"<=\"","\"<\"","\">=\"","\">\"","','","'('","')'","\"!\"","%eof"]
        bit_start = st * 34
        bit_end = (st + 1) * 34
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..33]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (7) = happyShift action_2
action_0 (9) = happyShift action_4
action_0 (10) = happyShift action_5
action_0 (11) = happyShift action_6
action_0 (12) = happyShift action_7
action_0 (13) = happyShift action_8
action_0 (18) = happyShift action_9
action_0 (23) = happyShift action_10
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (7) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (11) = happyShift action_31
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (17) = happyShift action_17
action_3 (18) = happyShift action_18
action_3 (19) = happyShift action_19
action_3 (20) = happyShift action_20
action_3 (21) = happyShift action_21
action_3 (22) = happyShift action_22
action_3 (23) = happyShift action_23
action_3 (24) = happyShift action_24
action_3 (25) = happyShift action_25
action_3 (26) = happyShift action_26
action_3 (27) = happyShift action_27
action_3 (28) = happyShift action_28
action_3 (29) = happyShift action_29
action_3 (33) = happyShift action_30
action_3 (34) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (11) = happyShift action_15
action_4 (12) = happyShift action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_19

action_6 _ = happyReduce_20

action_7 (31) = happyShift action_14
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (7) = happyShift action_2
action_8 (9) = happyShift action_4
action_8 (10) = happyShift action_5
action_8 (11) = happyShift action_6
action_8 (12) = happyShift action_7
action_8 (13) = happyShift action_8
action_8 (18) = happyShift action_9
action_8 (23) = happyShift action_10
action_8 (4) = happyGoto action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (7) = happyShift action_2
action_9 (9) = happyShift action_4
action_9 (10) = happyShift action_5
action_9 (11) = happyShift action_6
action_9 (12) = happyShift action_7
action_9 (13) = happyShift action_8
action_9 (18) = happyShift action_9
action_9 (23) = happyShift action_10
action_9 (4) = happyGoto action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (7) = happyShift action_2
action_10 (9) = happyShift action_4
action_10 (10) = happyShift action_5
action_10 (11) = happyShift action_6
action_10 (12) = happyShift action_7
action_10 (13) = happyShift action_8
action_10 (18) = happyShift action_9
action_10 (23) = happyShift action_10
action_10 (4) = happyGoto action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_14

action_12 (19) = happyShift action_19
action_12 (20) = happyShift action_20
action_12 (21) = happyShift action_21
action_12 (22) = happyShift action_22
action_12 (23) = happyShift action_23
action_12 (33) = happyShift action_30
action_12 _ = happyReduce_8

action_13 (14) = happyShift action_50
action_13 (17) = happyShift action_17
action_13 (18) = happyShift action_18
action_13 (19) = happyShift action_19
action_13 (20) = happyShift action_20
action_13 (21) = happyShift action_21
action_13 (22) = happyShift action_22
action_13 (23) = happyShift action_23
action_13 (24) = happyShift action_24
action_13 (25) = happyShift action_25
action_13 (26) = happyShift action_26
action_13 (27) = happyShift action_27
action_13 (28) = happyShift action_28
action_13 (29) = happyShift action_29
action_13 (33) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (7) = happyShift action_2
action_14 (9) = happyShift action_4
action_14 (10) = happyShift action_5
action_14 (11) = happyShift action_6
action_14 (12) = happyShift action_7
action_14 (13) = happyShift action_8
action_14 (18) = happyShift action_9
action_14 (23) = happyShift action_10
action_14 (4) = happyGoto action_48
action_14 (5) = happyGoto action_49
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (16) = happyShift action_47
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (11) = happyShift action_46
action_16 (6) = happyGoto action_45
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (7) = happyShift action_2
action_17 (9) = happyShift action_4
action_17 (10) = happyShift action_5
action_17 (11) = happyShift action_6
action_17 (12) = happyShift action_7
action_17 (13) = happyShift action_8
action_17 (18) = happyShift action_9
action_17 (23) = happyShift action_10
action_17 (4) = happyGoto action_44
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (7) = happyShift action_2
action_18 (9) = happyShift action_4
action_18 (10) = happyShift action_5
action_18 (11) = happyShift action_6
action_18 (12) = happyShift action_7
action_18 (13) = happyShift action_8
action_18 (18) = happyShift action_9
action_18 (23) = happyShift action_10
action_18 (4) = happyGoto action_43
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (7) = happyShift action_2
action_19 (9) = happyShift action_4
action_19 (10) = happyShift action_5
action_19 (11) = happyShift action_6
action_19 (12) = happyShift action_7
action_19 (13) = happyShift action_8
action_19 (18) = happyShift action_9
action_19 (23) = happyShift action_10
action_19 (4) = happyGoto action_42
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (7) = happyShift action_2
action_20 (9) = happyShift action_4
action_20 (10) = happyShift action_5
action_20 (11) = happyShift action_6
action_20 (12) = happyShift action_7
action_20 (13) = happyShift action_8
action_20 (18) = happyShift action_9
action_20 (23) = happyShift action_10
action_20 (4) = happyGoto action_41
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (7) = happyShift action_2
action_21 (9) = happyShift action_4
action_21 (10) = happyShift action_5
action_21 (11) = happyShift action_6
action_21 (12) = happyShift action_7
action_21 (13) = happyShift action_8
action_21 (18) = happyShift action_9
action_21 (23) = happyShift action_10
action_21 (4) = happyGoto action_40
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (7) = happyShift action_2
action_22 (9) = happyShift action_4
action_22 (10) = happyShift action_5
action_22 (11) = happyShift action_6
action_22 (12) = happyShift action_7
action_22 (13) = happyShift action_8
action_22 (18) = happyShift action_9
action_22 (23) = happyShift action_10
action_22 (4) = happyGoto action_39
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_13

action_24 (7) = happyShift action_2
action_24 (9) = happyShift action_4
action_24 (10) = happyShift action_5
action_24 (11) = happyShift action_6
action_24 (12) = happyShift action_7
action_24 (13) = happyShift action_8
action_24 (18) = happyShift action_9
action_24 (23) = happyShift action_10
action_24 (4) = happyGoto action_38
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (7) = happyShift action_2
action_25 (9) = happyShift action_4
action_25 (10) = happyShift action_5
action_25 (11) = happyShift action_6
action_25 (12) = happyShift action_7
action_25 (13) = happyShift action_8
action_25 (18) = happyShift action_9
action_25 (23) = happyShift action_10
action_25 (4) = happyGoto action_37
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (7) = happyShift action_2
action_26 (9) = happyShift action_4
action_26 (10) = happyShift action_5
action_26 (11) = happyShift action_6
action_26 (12) = happyShift action_7
action_26 (13) = happyShift action_8
action_26 (18) = happyShift action_9
action_26 (23) = happyShift action_10
action_26 (4) = happyGoto action_36
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (7) = happyShift action_2
action_27 (9) = happyShift action_4
action_27 (10) = happyShift action_5
action_27 (11) = happyShift action_6
action_27 (12) = happyShift action_7
action_27 (13) = happyShift action_8
action_27 (18) = happyShift action_9
action_27 (23) = happyShift action_10
action_27 (4) = happyGoto action_35
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (7) = happyShift action_2
action_28 (9) = happyShift action_4
action_28 (10) = happyShift action_5
action_28 (11) = happyShift action_6
action_28 (12) = happyShift action_7
action_28 (13) = happyShift action_8
action_28 (18) = happyShift action_9
action_28 (23) = happyShift action_10
action_28 (4) = happyGoto action_34
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (7) = happyShift action_2
action_29 (9) = happyShift action_4
action_29 (10) = happyShift action_5
action_29 (11) = happyShift action_6
action_29 (12) = happyShift action_7
action_29 (13) = happyShift action_8
action_29 (18) = happyShift action_9
action_29 (23) = happyShift action_10
action_29 (4) = happyGoto action_33
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_22

action_31 (16) = happyShift action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (7) = happyShift action_2
action_32 (9) = happyShift action_4
action_32 (10) = happyShift action_5
action_32 (11) = happyShift action_6
action_32 (12) = happyShift action_7
action_32 (13) = happyShift action_8
action_32 (18) = happyShift action_9
action_32 (23) = happyShift action_10
action_32 (4) = happyGoto action_57
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (17) = happyShift action_17
action_33 (18) = happyShift action_18
action_33 (19) = happyShift action_19
action_33 (20) = happyShift action_20
action_33 (21) = happyShift action_21
action_33 (22) = happyShift action_22
action_33 (23) = happyShift action_23
action_33 (33) = happyShift action_30
action_33 _ = happyReduce_18

action_34 (17) = happyShift action_17
action_34 (18) = happyShift action_18
action_34 (19) = happyShift action_19
action_34 (20) = happyShift action_20
action_34 (21) = happyShift action_21
action_34 (22) = happyShift action_22
action_34 (23) = happyShift action_23
action_34 (33) = happyShift action_30
action_34 _ = happyReduce_2

action_35 (17) = happyShift action_17
action_35 (18) = happyShift action_18
action_35 (19) = happyShift action_19
action_35 (20) = happyShift action_20
action_35 (21) = happyShift action_21
action_35 (22) = happyShift action_22
action_35 (23) = happyShift action_23
action_35 (33) = happyShift action_30
action_35 _ = happyReduce_17

action_36 (17) = happyShift action_17
action_36 (18) = happyShift action_18
action_36 (19) = happyShift action_19
action_36 (20) = happyShift action_20
action_36 (21) = happyShift action_21
action_36 (22) = happyShift action_22
action_36 (23) = happyShift action_23
action_36 (33) = happyShift action_30
action_36 _ = happyReduce_3

action_37 (17) = happyShift action_17
action_37 (18) = happyShift action_18
action_37 (19) = happyShift action_19
action_37 (20) = happyShift action_20
action_37 (21) = happyShift action_21
action_37 (22) = happyShift action_22
action_37 (23) = happyShift action_23
action_37 (33) = happyShift action_30
action_37 _ = happyReduce_16

action_38 (17) = happyShift action_17
action_38 (18) = happyShift action_18
action_38 (19) = happyShift action_19
action_38 (20) = happyShift action_20
action_38 (21) = happyShift action_21
action_38 (22) = happyShift action_22
action_38 (23) = happyShift action_23
action_38 (33) = happyShift action_30
action_38 _ = happyReduce_15

action_39 _ = happyReduce_12

action_40 _ = happyReduce_11

action_41 (21) = happyShift action_21
action_41 (22) = happyShift action_22
action_41 (23) = happyShift action_23
action_41 (33) = happyShift action_30
action_41 _ = happyReduce_10

action_42 (21) = happyShift action_21
action_42 (22) = happyShift action_22
action_42 (23) = happyShift action_23
action_42 (33) = happyShift action_30
action_42 _ = happyReduce_9

action_43 (19) = happyShift action_19
action_43 (20) = happyShift action_20
action_43 (21) = happyShift action_21
action_43 (22) = happyShift action_22
action_43 (23) = happyShift action_23
action_43 (33) = happyShift action_30
action_43 _ = happyReduce_7

action_44 (19) = happyShift action_19
action_44 (20) = happyShift action_20
action_44 (21) = happyShift action_21
action_44 (22) = happyShift action_22
action_44 (23) = happyShift action_23
action_44 (33) = happyShift action_30
action_44 _ = happyReduce_6

action_45 (16) = happyShift action_56
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (11) = happyShift action_46
action_46 (6) = happyGoto action_55
action_46 _ = happyReduce_26

action_47 (7) = happyShift action_2
action_47 (9) = happyShift action_4
action_47 (10) = happyShift action_5
action_47 (11) = happyShift action_6
action_47 (12) = happyShift action_7
action_47 (13) = happyShift action_8
action_47 (18) = happyShift action_9
action_47 (23) = happyShift action_10
action_47 (4) = happyGoto action_54
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (17) = happyShift action_17
action_48 (18) = happyShift action_18
action_48 (19) = happyShift action_19
action_48 (20) = happyShift action_20
action_48 (21) = happyShift action_21
action_48 (22) = happyShift action_22
action_48 (23) = happyShift action_23
action_48 (24) = happyShift action_24
action_48 (25) = happyShift action_25
action_48 (26) = happyShift action_26
action_48 (27) = happyShift action_27
action_48 (28) = happyShift action_28
action_48 (29) = happyShift action_29
action_48 (30) = happyShift action_53
action_48 (33) = happyShift action_30
action_48 _ = happyReduce_24

action_49 (32) = happyShift action_52
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (7) = happyShift action_2
action_50 (9) = happyShift action_4
action_50 (10) = happyShift action_5
action_50 (11) = happyShift action_6
action_50 (12) = happyShift action_7
action_50 (13) = happyShift action_8
action_50 (18) = happyShift action_9
action_50 (23) = happyShift action_10
action_50 (4) = happyGoto action_51
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (15) = happyShift action_61
action_51 (17) = happyShift action_17
action_51 (18) = happyShift action_18
action_51 (19) = happyShift action_19
action_51 (20) = happyShift action_20
action_51 (21) = happyShift action_21
action_51 (22) = happyShift action_22
action_51 (23) = happyShift action_23
action_51 (24) = happyShift action_24
action_51 (25) = happyShift action_25
action_51 (26) = happyShift action_26
action_51 (27) = happyShift action_27
action_51 (28) = happyShift action_28
action_51 (29) = happyShift action_29
action_51 (33) = happyShift action_30
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_23

action_53 (7) = happyShift action_2
action_53 (9) = happyShift action_4
action_53 (10) = happyShift action_5
action_53 (11) = happyShift action_6
action_53 (12) = happyShift action_7
action_53 (13) = happyShift action_8
action_53 (18) = happyShift action_9
action_53 (23) = happyShift action_10
action_53 (4) = happyGoto action_48
action_53 (5) = happyGoto action_60
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_17
action_54 (18) = happyShift action_18
action_54 (19) = happyShift action_19
action_54 (20) = happyShift action_20
action_54 (21) = happyShift action_21
action_54 (22) = happyShift action_22
action_54 (23) = happyShift action_23
action_54 (33) = happyShift action_30
action_54 _ = happyReduce_4

action_55 _ = happyReduce_27

action_56 (7) = happyShift action_2
action_56 (9) = happyShift action_4
action_56 (10) = happyShift action_5
action_56 (11) = happyShift action_6
action_56 (12) = happyShift action_7
action_56 (13) = happyShift action_8
action_56 (18) = happyShift action_9
action_56 (23) = happyShift action_10
action_56 (4) = happyGoto action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (8) = happyShift action_58
action_57 (17) = happyShift action_17
action_57 (18) = happyShift action_18
action_57 (19) = happyShift action_19
action_57 (20) = happyShift action_20
action_57 (21) = happyShift action_21
action_57 (22) = happyShift action_22
action_57 (23) = happyShift action_23
action_57 (24) = happyShift action_24
action_57 (25) = happyShift action_25
action_57 (26) = happyShift action_26
action_57 (27) = happyShift action_27
action_57 (28) = happyShift action_28
action_57 (29) = happyShift action_29
action_57 (33) = happyShift action_30
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (7) = happyShift action_2
action_58 (9) = happyShift action_4
action_58 (10) = happyShift action_5
action_58 (11) = happyShift action_6
action_58 (12) = happyShift action_7
action_58 (13) = happyShift action_8
action_58 (18) = happyShift action_9
action_58 (23) = happyShift action_10
action_58 (4) = happyGoto action_63
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (17) = happyShift action_17
action_59 (18) = happyShift action_18
action_59 (19) = happyShift action_19
action_59 (20) = happyShift action_20
action_59 (21) = happyShift action_21
action_59 (22) = happyShift action_22
action_59 (23) = happyShift action_23
action_59 (33) = happyShift action_30
action_59 _ = happyReduce_5

action_60 _ = happyReduce_25

action_61 (7) = happyShift action_2
action_61 (9) = happyShift action_4
action_61 (10) = happyShift action_5
action_61 (11) = happyShift action_6
action_61 (12) = happyShift action_7
action_61 (13) = happyShift action_8
action_61 (18) = happyShift action_9
action_61 (23) = happyShift action_10
action_61 (4) = happyGoto action_62
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (17) = happyShift action_17
action_62 (18) = happyShift action_18
action_62 (19) = happyShift action_19
action_62 (20) = happyShift action_20
action_62 (21) = happyShift action_21
action_62 (22) = happyShift action_22
action_62 (23) = happyShift action_23
action_62 (24) = happyShift action_24
action_62 (25) = happyShift action_25
action_62 (26) = happyShift action_26
action_62 (27) = happyShift action_27
action_62 (28) = happyShift action_28
action_62 (29) = happyShift action_29
action_62 (33) = happyShift action_30
action_62 _ = happyReduce_21

action_63 (17) = happyShift action_17
action_63 (18) = happyShift action_18
action_63 (19) = happyShift action_19
action_63 (20) = happyShift action_20
action_63 (21) = happyShift action_21
action_63 (22) = happyShift action_22
action_63 (23) = happyShift action_23
action_63 (24) = happyShift action_24
action_63 (25) = happyShift action_25
action_63 (26) = happyShift action_26
action_63 (27) = happyShift action_27
action_63 (28) = happyShift action_28
action_63 (29) = happyShift action_29
action_63 (33) = happyShift action_30
action_63 _ = happyReduce_1

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin ">=" happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "<=" happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (DefVar happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 5 4 happyReduction_5
happyReduction_5 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	(HappyTerminal (TFunc happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (DefFn happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "+" happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "-" happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Unary "-" happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "*" happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "/" happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "%" happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "^" happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  4 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (PostInc "++" happy_var_1
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (PreInc "++" happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "==" happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "!=" happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin "<" happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin ">" happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  4 happyReduction_19
happyReduction_19 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn4
		 (Cst happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  4 happyReduction_20
happyReduction_20 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happyReduce 6 4 happyReduction_21
happyReduction_21 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_2  4 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Unary "!" happy_var_1
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFunc happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (App happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_1  5 happyReduction_24
happyReduction_24 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  5 happyReduction_25
happyReduction_25 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  6 happyReduction_26
happyReduction_26 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  6 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_2)
	(HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 34 34 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLet -> cont 7;
	TIn -> cont 8;
	TDef -> cont 9;
	TInt happy_dollar_dollar -> cont 10;
	TVar happy_dollar_dollar -> cont 11;
	TFunc happy_dollar_dollar -> cont 12;
	TIf -> cont 13;
	TThen -> cont 14;
	TElse -> cont 15;
	TSym "=" -> cont 16;
	TSym "+" -> cont 17;
	TSym "-" -> cont 18;
	TSym "*" -> cont 19;
	TSym "/" -> cont 20;
	TSym "%" -> cont 21;
	TSym "^" -> cont 22;
	TSym "++" -> cont 23;
	TCompare "==" -> cont 24;
	TCompare "!=" -> cont 25;
	TCompare "<=" -> cont 26;
	TCompare "<" -> cont 27;
	TCompare ">=" -> cont 28;
	TCompare ">" -> cont 29;
	TComma -> cont 30;
	TLParenthesis -> cont 31;
	TRParenthesis -> cont 32;
	TSym "!" -> cont 33;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 34 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a 
parseError _ = error "Parse error" 

-- Définition du type Exp utilisé pour construire l'arbre syntaxique. 
data Exp = Let Name Exp Exp | Bin Name Exp Exp | Cst Int | Var Name | 
      Unary Name Exp | PreInc Name Exp | PostInc Name Exp | If Exp Exp Exp | App Name [Exp] | DefFn Name [Name] Exp | DefVar Name Exp deriving Show
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc1900_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
