{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}

module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, selfIntroduction, schedule
	]

title :: Page
title = writeTitle "Haskell Dojo #1 (Shinjuku.hs #17)" "ようこそ" :| []

prelude :: Page
prelude = pageTitle "ごあいさつ" :| [
	text "おあつまりいただき、ありがとうございます",
	writeImage 0.3 0.25 170 210 "images/cover.png",
	text "「Haskell - 教養としての関数型プログラミング」の",
	itext 20 "著者です"
	]

selfIntroduction :: Page
selfIntroduction = pageTitle "自己紹介" :| [
	text "このひとは、こういうひと",
	itext 4 "OS: Gentoo on KVM on Gentoo",
	itext 4 "言語: Haskell",
	itext 4 "エディタ: Vim",
	itext 4 "日本語入力: TUT-code (漢字直接入力)",
	itext 4 "GUI: Xmonad",
	itext 4 "ターミナルエミュレータ: rxvt-unicode",
	itext 4 "仮想端末: Tmux",
	itext 4 "シェル: zsh",
	itext 4 "ブラウザ: Firefox + Vimperator",
	itext 4 "メールソフト: Mutt",
	itext 4 "キーボード: HHKB"
	]

schedule :: Page
schedule = pageTitle "スケジュール" :| [
	text "スケジュールは、つぎのようになります",
	itext 4 "10:35 - 10:55 自己紹介と今日の予定",
	itext 4 "10:55 - 12:30 作業",
	itext 4 "12:30 - 13:30 ランチ",
	itext 4 "13:30 - 14:30 作業",
	itext 4 "14:30 - 15:00 成果発表",
	nextLine,
	text "必要なかたには、入門書をおかしします" ]
