{-# OPTIONS_GHC -w #-}
module ParserMin where 
import LexerMin
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,177) ([32000,264,16384,0,0,0,0,768,0,0,0,0,65472,71,16,0,0,0,0,0,0,0,16,2169,1,34704,16,30976,264,0,0,0,61440,1025,51200,18431,30976,264,0,32,0,2169,1,34704,16,30976,264,36864,4231,0,2169,1,34704,16,0,0,36864,4231,0,2169,1,34704,16,30976,264,36864,4231,0,2169,1,0,0,0,2,0,1,0,512,0,256,0,30976,264,0,8128,64,64512,1025,49152,16415,0,508,4,8128,64,64512,1025,0,0,0,0,0,7168,64,49152,1025,0,16415,0,496,36868,4231,0,64512,1279,0,8192,30976,264,0,65488,71,0,0,34704,16,512,32764,4,65472,71,0,0,34704,16,0,32764,36868,4231,0,0,0,34704,16,0,32764,4,65472,71,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Line","Def","Exp","Exps","Args","let","in","def","int","var","func","if","then","else","\"=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"%\"","\"^\"","\"++\"","\"==\"","\"!=\"","\"<=\"","\"<\"","\">=\"","\">\"","','","'('","')'","\"!\"","%eof"]
        bit_start = st * 36
        bit_end = (st + 1) * 36
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..35]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (9) = happyShift action_6
action_0 (11) = happyShift action_3
action_0 (12) = happyShift action_7
action_0 (13) = happyShift action_8
action_0 (14) = happyShift action_9
action_0 (15) = happyShift action_10
action_0 (20) = happyShift action_11
action_0 (25) = happyShift action_12
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (13) = happyShift action_32
action_3 (14) = happyShift action_33
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (36) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (19) = happyShift action_18
action_5 (20) = happyShift action_19
action_5 (21) = happyShift action_20
action_5 (22) = happyShift action_21
action_5 (23) = happyShift action_22
action_5 (24) = happyShift action_23
action_5 (25) = happyShift action_24
action_5 (26) = happyShift action_25
action_5 (27) = happyShift action_26
action_5 (28) = happyShift action_27
action_5 (29) = happyShift action_28
action_5 (30) = happyShift action_29
action_5 (31) = happyShift action_30
action_5 (35) = happyShift action_31
action_5 _ = happyReduce_2

action_6 (13) = happyShift action_17
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_24

action_8 _ = happyReduce_25

action_9 (33) = happyShift action_16
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (9) = happyShift action_6
action_10 (12) = happyShift action_7
action_10 (13) = happyShift action_8
action_10 (14) = happyShift action_9
action_10 (15) = happyShift action_10
action_10 (20) = happyShift action_11
action_10 (25) = happyShift action_12
action_10 (6) = happyGoto action_15
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (9) = happyShift action_6
action_11 (12) = happyShift action_7
action_11 (13) = happyShift action_8
action_11 (14) = happyShift action_9
action_11 (15) = happyShift action_10
action_11 (20) = happyShift action_11
action_11 (25) = happyShift action_12
action_11 (6) = happyGoto action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (9) = happyShift action_6
action_12 (12) = happyShift action_7
action_12 (13) = happyShift action_8
action_12 (14) = happyShift action_9
action_12 (15) = happyShift action_10
action_12 (20) = happyShift action_11
action_12 (25) = happyShift action_12
action_12 (6) = happyGoto action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_22

action_14 (21) = happyShift action_20
action_14 (22) = happyShift action_21
action_14 (23) = happyShift action_22
action_14 (24) = happyShift action_23
action_14 (25) = happyShift action_24
action_14 (35) = happyShift action_31
action_14 _ = happyReduce_20

action_15 (16) = happyShift action_52
action_15 (19) = happyShift action_18
action_15 (20) = happyShift action_19
action_15 (21) = happyShift action_20
action_15 (22) = happyShift action_21
action_15 (23) = happyShift action_22
action_15 (24) = happyShift action_23
action_15 (25) = happyShift action_24
action_15 (26) = happyShift action_25
action_15 (27) = happyShift action_26
action_15 (28) = happyShift action_27
action_15 (29) = happyShift action_28
action_15 (30) = happyShift action_29
action_15 (31) = happyShift action_30
action_15 (35) = happyShift action_31
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (9) = happyShift action_6
action_16 (12) = happyShift action_7
action_16 (13) = happyShift action_8
action_16 (14) = happyShift action_9
action_16 (15) = happyShift action_10
action_16 (20) = happyShift action_11
action_16 (25) = happyShift action_12
action_16 (6) = happyGoto action_50
action_16 (7) = happyGoto action_51
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (18) = happyShift action_49
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (9) = happyShift action_6
action_18 (12) = happyShift action_7
action_18 (13) = happyShift action_8
action_18 (14) = happyShift action_9
action_18 (15) = happyShift action_10
action_18 (20) = happyShift action_11
action_18 (25) = happyShift action_12
action_18 (6) = happyGoto action_48
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (9) = happyShift action_6
action_19 (12) = happyShift action_7
action_19 (13) = happyShift action_8
action_19 (14) = happyShift action_9
action_19 (15) = happyShift action_10
action_19 (20) = happyShift action_11
action_19 (25) = happyShift action_12
action_19 (6) = happyGoto action_47
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (9) = happyShift action_6
action_20 (12) = happyShift action_7
action_20 (13) = happyShift action_8
action_20 (14) = happyShift action_9
action_20 (15) = happyShift action_10
action_20 (20) = happyShift action_11
action_20 (25) = happyShift action_12
action_20 (6) = happyGoto action_46
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (9) = happyShift action_6
action_21 (12) = happyShift action_7
action_21 (13) = happyShift action_8
action_21 (14) = happyShift action_9
action_21 (15) = happyShift action_10
action_21 (20) = happyShift action_11
action_21 (25) = happyShift action_12
action_21 (6) = happyGoto action_45
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (9) = happyShift action_6
action_22 (12) = happyShift action_7
action_22 (13) = happyShift action_8
action_22 (14) = happyShift action_9
action_22 (15) = happyShift action_10
action_22 (20) = happyShift action_11
action_22 (25) = happyShift action_12
action_22 (6) = happyGoto action_44
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (9) = happyShift action_6
action_23 (12) = happyShift action_7
action_23 (13) = happyShift action_8
action_23 (14) = happyShift action_9
action_23 (15) = happyShift action_10
action_23 (20) = happyShift action_11
action_23 (25) = happyShift action_12
action_23 (6) = happyGoto action_43
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_21

action_25 (9) = happyShift action_6
action_25 (12) = happyShift action_7
action_25 (13) = happyShift action_8
action_25 (14) = happyShift action_9
action_25 (15) = happyShift action_10
action_25 (20) = happyShift action_11
action_25 (25) = happyShift action_12
action_25 (6) = happyGoto action_42
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (9) = happyShift action_6
action_26 (12) = happyShift action_7
action_26 (13) = happyShift action_8
action_26 (14) = happyShift action_9
action_26 (15) = happyShift action_10
action_26 (20) = happyShift action_11
action_26 (25) = happyShift action_12
action_26 (6) = happyGoto action_41
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (9) = happyShift action_6
action_27 (12) = happyShift action_7
action_27 (13) = happyShift action_8
action_27 (14) = happyShift action_9
action_27 (15) = happyShift action_10
action_27 (20) = happyShift action_11
action_27 (25) = happyShift action_12
action_27 (6) = happyGoto action_40
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (9) = happyShift action_6
action_28 (12) = happyShift action_7
action_28 (13) = happyShift action_8
action_28 (14) = happyShift action_9
action_28 (15) = happyShift action_10
action_28 (20) = happyShift action_11
action_28 (25) = happyShift action_12
action_28 (6) = happyGoto action_39
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (9) = happyShift action_6
action_29 (12) = happyShift action_7
action_29 (13) = happyShift action_8
action_29 (14) = happyShift action_9
action_29 (15) = happyShift action_10
action_29 (20) = happyShift action_11
action_29 (25) = happyShift action_12
action_29 (6) = happyGoto action_38
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (9) = happyShift action_6
action_30 (12) = happyShift action_7
action_30 (13) = happyShift action_8
action_30 (14) = happyShift action_9
action_30 (15) = happyShift action_10
action_30 (20) = happyShift action_11
action_30 (25) = happyShift action_12
action_30 (6) = happyGoto action_37
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_23

action_32 (18) = happyShift action_36
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (13) = happyShift action_35
action_33 (8) = happyGoto action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (18) = happyShift action_59
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (13) = happyShift action_35
action_35 (8) = happyGoto action_58
action_35 _ = happyReduce_28

action_36 (9) = happyShift action_6
action_36 (12) = happyShift action_7
action_36 (13) = happyShift action_8
action_36 (14) = happyShift action_9
action_36 (15) = happyShift action_10
action_36 (20) = happyShift action_11
action_36 (25) = happyShift action_12
action_36 (6) = happyGoto action_57
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (19) = happyShift action_18
action_37 (20) = happyShift action_19
action_37 (21) = happyShift action_20
action_37 (22) = happyShift action_21
action_37 (23) = happyShift action_22
action_37 (24) = happyShift action_23
action_37 (25) = happyShift action_24
action_37 (35) = happyShift action_31
action_37 _ = happyReduce_17

action_38 (19) = happyShift action_18
action_38 (20) = happyShift action_19
action_38 (21) = happyShift action_20
action_38 (22) = happyShift action_21
action_38 (23) = happyShift action_22
action_38 (24) = happyShift action_23
action_38 (25) = happyShift action_24
action_38 (35) = happyShift action_31
action_38 _ = happyReduce_18

action_39 (19) = happyShift action_18
action_39 (20) = happyShift action_19
action_39 (21) = happyShift action_20
action_39 (22) = happyShift action_21
action_39 (23) = happyShift action_22
action_39 (24) = happyShift action_23
action_39 (25) = happyShift action_24
action_39 (35) = happyShift action_31
action_39 _ = happyReduce_16

action_40 (19) = happyShift action_18
action_40 (20) = happyShift action_19
action_40 (21) = happyShift action_20
action_40 (22) = happyShift action_21
action_40 (23) = happyShift action_22
action_40 (24) = happyShift action_23
action_40 (25) = happyShift action_24
action_40 (35) = happyShift action_31
action_40 _ = happyReduce_19

action_41 (19) = happyShift action_18
action_41 (20) = happyShift action_19
action_41 (21) = happyShift action_20
action_41 (22) = happyShift action_21
action_41 (23) = happyShift action_22
action_41 (24) = happyShift action_23
action_41 (25) = happyShift action_24
action_41 (35) = happyShift action_31
action_41 _ = happyReduce_15

action_42 (19) = happyShift action_18
action_42 (20) = happyShift action_19
action_42 (21) = happyShift action_20
action_42 (22) = happyShift action_21
action_42 (23) = happyShift action_22
action_42 (24) = happyShift action_23
action_42 (25) = happyShift action_24
action_42 (35) = happyShift action_31
action_42 _ = happyReduce_14

action_43 _ = happyReduce_13

action_44 _ = happyReduce_12

action_45 (23) = happyShift action_22
action_45 (24) = happyShift action_23
action_45 (25) = happyShift action_24
action_45 (35) = happyShift action_31
action_45 _ = happyReduce_11

action_46 (23) = happyShift action_22
action_46 (24) = happyShift action_23
action_46 (25) = happyShift action_24
action_46 (35) = happyShift action_31
action_46 _ = happyReduce_10

action_47 (21) = happyShift action_20
action_47 (22) = happyShift action_21
action_47 (23) = happyShift action_22
action_47 (24) = happyShift action_23
action_47 (25) = happyShift action_24
action_47 (35) = happyShift action_31
action_47 _ = happyReduce_9

action_48 (21) = happyShift action_20
action_48 (22) = happyShift action_21
action_48 (23) = happyShift action_22
action_48 (24) = happyShift action_23
action_48 (25) = happyShift action_24
action_48 (35) = happyShift action_31
action_48 _ = happyReduce_8

action_49 (9) = happyShift action_6
action_49 (12) = happyShift action_7
action_49 (13) = happyShift action_8
action_49 (14) = happyShift action_9
action_49 (15) = happyShift action_10
action_49 (20) = happyShift action_11
action_49 (25) = happyShift action_12
action_49 (6) = happyGoto action_56
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (19) = happyShift action_18
action_50 (20) = happyShift action_19
action_50 (21) = happyShift action_20
action_50 (22) = happyShift action_21
action_50 (23) = happyShift action_22
action_50 (24) = happyShift action_23
action_50 (25) = happyShift action_24
action_50 (26) = happyShift action_25
action_50 (27) = happyShift action_26
action_50 (28) = happyShift action_27
action_50 (29) = happyShift action_28
action_50 (30) = happyShift action_29
action_50 (31) = happyShift action_30
action_50 (32) = happyShift action_55
action_50 (35) = happyShift action_31
action_50 _ = happyReduce_26

action_51 (34) = happyShift action_54
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (9) = happyShift action_6
action_52 (12) = happyShift action_7
action_52 (13) = happyShift action_8
action_52 (14) = happyShift action_9
action_52 (15) = happyShift action_10
action_52 (20) = happyShift action_11
action_52 (25) = happyShift action_12
action_52 (6) = happyGoto action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (17) = happyShift action_63
action_53 (19) = happyShift action_18
action_53 (20) = happyShift action_19
action_53 (21) = happyShift action_20
action_53 (22) = happyShift action_21
action_53 (23) = happyShift action_22
action_53 (24) = happyShift action_23
action_53 (25) = happyShift action_24
action_53 (26) = happyShift action_25
action_53 (27) = happyShift action_26
action_53 (28) = happyShift action_27
action_53 (29) = happyShift action_28
action_53 (30) = happyShift action_29
action_53 (31) = happyShift action_30
action_53 (35) = happyShift action_31
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_7

action_55 (9) = happyShift action_6
action_55 (12) = happyShift action_7
action_55 (13) = happyShift action_8
action_55 (14) = happyShift action_9
action_55 (15) = happyShift action_10
action_55 (20) = happyShift action_11
action_55 (25) = happyShift action_12
action_55 (6) = happyGoto action_50
action_55 (7) = happyGoto action_62
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (10) = happyShift action_61
action_56 (19) = happyShift action_18
action_56 (20) = happyShift action_19
action_56 (21) = happyShift action_20
action_56 (22) = happyShift action_21
action_56 (23) = happyShift action_22
action_56 (24) = happyShift action_23
action_56 (25) = happyShift action_24
action_56 (26) = happyShift action_25
action_56 (27) = happyShift action_26
action_56 (28) = happyShift action_27
action_56 (29) = happyShift action_28
action_56 (30) = happyShift action_29
action_56 (31) = happyShift action_30
action_56 (35) = happyShift action_31
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (19) = happyShift action_18
action_57 (20) = happyShift action_19
action_57 (21) = happyShift action_20
action_57 (22) = happyShift action_21
action_57 (23) = happyShift action_22
action_57 (24) = happyShift action_23
action_57 (25) = happyShift action_24
action_57 (26) = happyShift action_25
action_57 (27) = happyShift action_26
action_57 (28) = happyShift action_27
action_57 (29) = happyShift action_28
action_57 (30) = happyShift action_29
action_57 (31) = happyShift action_30
action_57 (35) = happyShift action_31
action_57 _ = happyReduce_4

action_58 _ = happyReduce_29

action_59 (9) = happyShift action_6
action_59 (12) = happyShift action_7
action_59 (13) = happyShift action_8
action_59 (14) = happyShift action_9
action_59 (15) = happyShift action_10
action_59 (20) = happyShift action_11
action_59 (25) = happyShift action_12
action_59 (6) = happyGoto action_60
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (19) = happyShift action_18
action_60 (20) = happyShift action_19
action_60 (21) = happyShift action_20
action_60 (22) = happyShift action_21
action_60 (23) = happyShift action_22
action_60 (24) = happyShift action_23
action_60 (25) = happyShift action_24
action_60 (26) = happyShift action_25
action_60 (27) = happyShift action_26
action_60 (28) = happyShift action_27
action_60 (29) = happyShift action_28
action_60 (30) = happyShift action_29
action_60 (31) = happyShift action_30
action_60 (35) = happyShift action_31
action_60 _ = happyReduce_3

action_61 (9) = happyShift action_6
action_61 (12) = happyShift action_7
action_61 (13) = happyShift action_8
action_61 (14) = happyShift action_9
action_61 (15) = happyShift action_10
action_61 (20) = happyShift action_11
action_61 (25) = happyShift action_12
action_61 (6) = happyGoto action_65
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_27

action_63 (9) = happyShift action_6
action_63 (12) = happyShift action_7
action_63 (13) = happyShift action_8
action_63 (14) = happyShift action_9
action_63 (15) = happyShift action_10
action_63 (20) = happyShift action_11
action_63 (25) = happyShift action_12
action_63 (6) = happyGoto action_64
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (19) = happyShift action_18
action_64 (20) = happyShift action_19
action_64 (21) = happyShift action_20
action_64 (22) = happyShift action_21
action_64 (23) = happyShift action_22
action_64 (24) = happyShift action_23
action_64 (25) = happyShift action_24
action_64 (26) = happyShift action_25
action_64 (27) = happyShift action_26
action_64 (28) = happyShift action_27
action_64 (29) = happyShift action_28
action_64 (30) = happyShift action_29
action_64 (31) = happyShift action_30
action_64 (35) = happyShift action_31
action_64 _ = happyReduce_6

action_65 (19) = happyShift action_18
action_65 (20) = happyShift action_19
action_65 (21) = happyShift action_20
action_65 (22) = happyShift action_21
action_65 (23) = happyShift action_22
action_65 (24) = happyShift action_23
action_65 (25) = happyShift action_24
action_65 (26) = happyShift action_25
action_65 (27) = happyShift action_26
action_65 (28) = happyShift action_27
action_65 (29) = happyShift action_28
action_65 (30) = happyShift action_29
action_65 (31) = happyShift action_30
action_65 (35) = happyShift action_31
action_65 _ = happyReduce_5

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 5 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyTerminal (TFunc happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DefFn happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DefVar happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 6 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 6 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFunc happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (App happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "+" happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "-" happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "*" happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "/" happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "%" happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "^" happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "==" happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "!=" happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "<" happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin ">" happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin ">=" happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "<=" happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  6 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Unary "-" happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  6 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (PostInc "++" happy_var_1
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  6 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (PreInc "++" happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  6 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Unary "!" happy_var_1
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  6 happyReduction_24
happyReduction_24 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn6
		 (Cst happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  6 happyReduction_25
happyReduction_25 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  7 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  8 happyReduction_28
happyReduction_28 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  8 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_2)
	(HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLet -> cont 9;
	TIn -> cont 10;
	TDef -> cont 11;
	TInt happy_dollar_dollar -> cont 12;
	TVar happy_dollar_dollar -> cont 13;
	TFunc happy_dollar_dollar -> cont 14;
	TIf -> cont 15;
	TThen -> cont 16;
	TElse -> cont 17;
	TSym "=" -> cont 18;
	TSym "+" -> cont 19;
	TSym "-" -> cont 20;
	TSym "*" -> cont 21;
	TSym "/" -> cont 22;
	TSym "%" -> cont 23;
	TSym "^" -> cont 24;
	TSym "++" -> cont 25;
	TCompare "==" -> cont 26;
	TCompare "!=" -> cont 27;
	TCompare "<=" -> cont 28;
	TCompare "<" -> cont 29;
	TCompare ">=" -> cont 30;
	TCompare ">" -> cont 31;
	TComma -> cont 32;
	TLParenthesis -> cont 33;
	TRParenthesis -> cont 34;
	TSym "!" -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
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
      Unary Name Exp | PreInc Name Exp | PostInc Name Exp | If Exp Exp Exp | 
	  App Name [Exp] | DefFn Name [Name] Exp | DefVar Name Exp deriving Show
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
