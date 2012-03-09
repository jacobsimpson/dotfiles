<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: hexrgb.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=hexrgb.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: hexrgb.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=hexrgb.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for hexrgb.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=hexrgb.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22hexrgb.el%22">hexrgb.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/hexrgb.el">Download</a></p><pre class="code"><span class="linecomment">;;; hexrgb.el --- Functions to manipulate colors, including RGB hex strings.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: hexrgb.el</span>
<span class="linecomment">;; Description: Functions to manipulate colors, including RGB hex strings.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2004-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Sep 20 22:58:45 2004</span>
<span class="linecomment">;; Version: 21.0</span>
<span class="linecomment">;; Last-Updated: Wed Feb 16 16:49:51 2011 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 782</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/hexrgb.el</span>
<span class="linecomment">;; Keywords: number, hex, rgb, color, background, frames, display</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   None</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions to manipulate colors, including RGB hex strings.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This library provides functions for converting between RGB (red,</span>
<span class="linecomment">;;  green, blue) color components and HSV (hue, saturation, value)</span>
<span class="linecomment">;;  color components.  It helps you convert among Emacs color</span>
<span class="linecomment">;;  components (whole numbers from 0 through 65535), RGB and HSV</span>
<span class="linecomment">;;  floating-point components (0.0 through 1.0), Emacs color-name</span>
<span class="linecomment">;;  strings (such as "blue"), and hex RGB color strings (such as</span>
<span class="linecomment">;;  "#FC43A7912").</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  An RGB hex string, such as used as a frame `background-color'</span>
<span class="linecomment">;;  property, is a string of 1 + (3 * n) characters, the first of</span>
<span class="linecomment">;;  which is "#".  The other characters are hexadecimal digits, in</span>
<span class="linecomment">;;  three groups representing (from the left): red, green, and blue</span>
<span class="linecomment">;;  hex codes.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Constants defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `hexrgb-defined-colors', `hexrgb-defined-colors-alist',</span>
<span class="linecomment">;;    `hexrgb-defined-colors-no-dups',</span>
<span class="linecomment">;;    `hexrgb-defined-colors-no-dups-alist'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Options defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `hexrgb-canonicalize-defined-colors-flag'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `hexrgb-blue', `hexrgb-complement', `hexrgb-green',</span>
<span class="linecomment">;;    `hexrgb-hue', `hexrgb-read-color', `hexrgb-red',</span>
<span class="linecomment">;;    `hexrgb-saturation', `hexrgb-value'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `hexrgb-approx-equal', `hexrgb-canonicalize-defined-colors',</span>
<span class="linecomment">;;    `hexrgb-color-name-to-hex', `hexrgb-color-values-to-hex',</span>
<span class="linecomment">;;    `hexrgb-color-value-to-float', `hexrgb-defined-colors',</span>
<span class="linecomment">;;    `hexrgb-defined-colors-alist',</span>
<span class="linecomment">;;    `hexrgb-delete-whitespace-from-string',</span>
<span class="linecomment">;;    `hexrgb-float-to-color-value', `hexrgb-hex-char-to-integer',</span>
<span class="linecomment">;;    `hexrgb-hex-to-color-values', `hexrgb-hex-to-hsv',</span>
<span class="linecomment">;;    `hexrgb-hex-to-rgb', `hexrgb-hsv-to-hex', `hexrgb-hex-to-int',</span>
<span class="linecomment">;;    `hexrgb-hsv-to-rgb', `hexrgb-increment-blue',</span>
<span class="linecomment">;;    `hexrgb-increment-equal-rgb', `hexrgb-increment-green',</span>
<span class="linecomment">;;    `hexrgb-increment-hex', `hexrgb-increment-red',</span>
<span class="linecomment">;;    `hexrgb-int-to-hex', `hexrgb-rgb-hex-string-p',</span>
<span class="linecomment">;;    `hexrgb-rgb-to-hex', `hexrgb-rgb-to-hsv'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Add this to your initialization file (~/.emacs or ~/_emacs):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (require 'hexrgb)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Do not try to use this library without a window manager.</span>
<span class="linecomment">;;  That is, do not use this with `emacs -nw'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2011/02/16 dadams</span>
<span class="linecomment">;;     hexrgb-increment-hex: INCOMPATIBLE CHANGE:</span>
<span class="linecomment">;;                           Swapped order of args NB-DIGITS, INCREMENT, to fit other functions.</span>
<span class="linecomment">;;     hexrgb-increment-*: Took the change to hexrgb-increment-hex into account.</span>
<span class="linecomment">;;     Improved various doc strings.</span>
<span class="linecomment">;; 2011/01/08 dadams</span>
<span class="linecomment">;;     Restored autoload cookie for eval-and-compile hexrgb-canonicalize-defined-colors.</span>
<span class="linecomment">;; 2011/01/03 dadams</span>
<span class="linecomment">;;     Removed autoload cookies from non-interactive functions.</span>
<span class="linecomment">;; 2010/12/18 dadams</span>
<span class="linecomment">;;     hexrgb-canonicalize-defined-colors: Added autoload cookie.  Thx to Richard Kim.</span>
<span class="linecomment">;; 2010/12/06 dadams</span>
<span class="linecomment">;;     hexrgb-hex-to-color-values: Correct start offset for blue.  Thx to "Linda" on Emacs Wiki.</span>
<span class="linecomment">;; 2009/11/14 dadams</span>
<span class="linecomment">;;    hexrgb-rgb-to-hsv: Corrected hue when &gt; 1.0.  Use strict inequality for hue limit tests.</span>
<span class="linecomment">;;    hexrgb-approx-equal: Convert RFUZZ and AFUZZ to their absolute values.</span>
<span class="linecomment">;; 2009/11/03 dadams</span>
<span class="linecomment">;;    Added: hexrgb-delete-whitespace-from-string, hexrgb-canonicalize-defined-colors,</span>
<span class="linecomment">;;           hexrgb-defined-colors(-no-dups)(-alist), hexrgb-canonicalize-defined-colors-flag.</span>
<span class="linecomment">;;    hexrgb-read-color: Use function hexrgb-defined-colors-alist, not the constant.</span>
<span class="linecomment">;; 2008/12/25 dadams</span>
<span class="linecomment">;;    hexrgb-rgb-to-hsv:</span>
<span class="linecomment">;;      Replace (not (equal 0.0e+NaN saturation)) by standard test (= saturation saturation).</span>
<span class="linecomment">;;      Thx to  Michael Heerdegen for the bug report.</span>
<span class="linecomment">;; 2008-10-17 dadams</span>
<span class="linecomment">;;    hexrgb-defined-colors(-alist): Prevent load-time error if user tries to use emacs -nw.</span>
<span class="linecomment">;; 2007/12/30 dadams</span>
<span class="linecomment">;;    Added: hexrgb-hex-to-color-values.</span>
<span class="linecomment">;; 2007/10/20 dadams</span>
<span class="linecomment">;;    hexrgb-read-color: Treat pseudo colors too (e.g. *point foreground*).</span>
<span class="linecomment">;; 2007/01/21 dadams</span>
<span class="linecomment">;;    hexrgb-read-color: Error if empty string (and not allow-empty-name-p).</span>
<span class="linecomment">;; 2006/06/06 dadams</span>
<span class="linecomment">;;    Added: hexrgb-defined-colors(-alist).  Use instead of (x-defined-colors).</span>
<span class="linecomment">;;    hexrgb-(red|green|blue): Added interactive specs.</span>
<span class="linecomment">;; 2006/06/04 dadams</span>
<span class="linecomment">;;    hexrgb-read-color: Added optional arg allow-empty-name-p.</span>
<span class="linecomment">;; 2006/06/02 dadams</span>
<span class="linecomment">;;    Added: hexrgb-rgb-hex-string-p.  Used it.</span>
<span class="linecomment">;; 2006/05/30 dadams</span>
<span class="linecomment">;;    Added: hexrgb-hex-to-(hsv|rgb), hexrgb-hsv-to-hex, hexrgb-color-name-to-hex,</span>
<span class="linecomment">;;           hexrgb-complement, hexrgb-read-color, hexrgb-hue, hexrgb-saturation,</span>
<span class="linecomment">;;           hexrgb-value, hexrgb-red, hexrgb-blue, hexrgb-green.</span>
<span class="linecomment">;;    approx-equal: Add optional fuzz factor arguments.  Changed the algorithm.</span>
<span class="linecomment">;;    Renamed: approx-equal to hexrgb-approx-equal.</span>
<span class="linecomment">;;    hexrgb-rgb-to-hsv: Changed test from &lt; to &lt;=: (when (&lt;= hue 0.0)...).</span>
<span class="linecomment">;;    hexrgb-hsv-to-rgb: Treat hue = 0.0 (int 0) the same as hue = 1.0 (int 6).</span>
<span class="linecomment">;;    hexrgb-rgb-to-hex, hexrgb-increment-hex: Corrected doc strings.</span>
<span class="linecomment">;; 2006/05/22 dadams</span>
<span class="linecomment">;;    Added: hexrgb-hsv-to-hex, hexrgb-rgb-to-hex.  Require cl.el when byte-compile.</span>
<span class="linecomment">;; 2005/08/09 dadams</span>
<span class="linecomment">;;    hexrgb-rgb-to-hsv: Side-stepped Emacs-20 bug in comparing NaN.</span>
<span class="linecomment">;;    hexrgb-increment-*: Added optional arg wrap-p.</span>
<span class="linecomment">;;    hexrgb-increment-hex: Prevent wrap if not wrap-p.</span>
<span class="linecomment">;; 2005/08/02 dadams</span>
<span class="linecomment">;;    hexrgb-rgb-to-hes: Bug fix: If delta is zero, then so are hue and saturation.</span>
<span class="linecomment">;; 2005/06/24 dadams</span>
<span class="linecomment">;;    hexrgb-rgb-to-hsv: Bug fix: test for NaN (e.g. on divide by zero).</span>
<span class="linecomment">;; 2005/02/08 dadams</span>
<span class="linecomment">;;    hexrgb-hsv-to-rgb: Bug fix (typo: p, q -&gt; pp, qq; added ww).</span>
<span class="linecomment">;; 2005/01/09 dadams</span>
<span class="linecomment">;;    hexrgb-int-to-hex: Fixed bug in hexrgb-int-to-hex: nb-digits not respected.</span>
<span class="linecomment">;;    Added: hexrgb-hsv-to-rgb, hexrgb-rgb-to-hsv, approx-equal.</span>
<span class="linecomment">;;    Renamed old hexrgb-increment-value to hexrgb-increment-equal-rgb.</span>
<span class="linecomment">;; 2005/01/05 dadams</span>
<span class="linecomment">;;    hexrgb-int-to-hex: Used a suggestion from Juri Linkov.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; case</span>

<span class="linecomment">;; Unless you first load `hexrgb.el', then either `palette.el' or `eyedropper.el', you will get</span>
<span class="linecomment">;; warnings about variables and functions with prefix `eyedrop-' when you byte-compile</span>
<span class="linecomment">;; `hexrgb.el'.  You can ignore these warnings.</span>

(defvar eyedrop-picked-foreground)
(defvar eyedrop-picked-background)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;;;###autoload</span>
(eval-and-compile
 (defun hexrgb-canonicalize-defined-colors (list)
   "<span class="quote">Copy of LIST with color names canonicalized.
LIST is a list of color names (strings).
Canonical names are lowercase, with no whitespace.
There are no duplicate names.</span>"
   (let ((tail  list)
         this new)
     (while tail
       (setq this  (car tail)
             this  (hexrgb-delete-whitespace-from-string (downcase this) 0 (length this)))
       (unless (member this new) (push this new))
       (pop tail))
     (nreverse new)))

 (defun hexrgb-delete-whitespace-from-string (string &optional from to)
   "<span class="quote">Remove whitespace from substring of STRING from FROM to TO.
If FROM is nil, then start at the beginning of STRING (FROM = 0).
If TO is nil, then end at the end of STRING (TO = length of STRING).
FROM and TO are zero-based indexes into STRING.
Character FROM is affected (possibly deleted).  Character TO is not.</span>"
   (setq from  (or from 0)
         to    (or to (length string)))
   (with-temp-buffer
     (insert string)
     (goto-char (+ from (point-min)))
     (let ((count  from)
           char)
       (while (and (not (eobp))  (&lt; count to))
         (setq char  (char-after))
         (if (memq char '(?\  ?\t ?\n))  (delete-char 1)  (forward-char 1))
         (setq count  (1+ count)))
       (buffer-string)))))

<span class="linecomment">;;;###autoload</span>
(defconst hexrgb-defined-colors (eval-when-compile (and window-system (x-defined-colors)))
  "<span class="quote">List of all supported colors.</span>")

<span class="linecomment">;;;###autoload</span>
(defconst hexrgb-defined-colors-no-dups
    (eval-when-compile
     (and window-system (hexrgb-canonicalize-defined-colors (x-defined-colors))))
  "<span class="quote">List of all supported color names, with no duplicates.
Names are all lowercase, without any spaces.</span>")

<span class="linecomment">;;;###autoload</span>
(defconst hexrgb-defined-colors-alist
    (eval-when-compile (and window-system (mapcar #'list (x-defined-colors))))
  "<span class="quote">Alist of all supported color names, for use in completion.
See also `hexrgb-defined-colors-no-dups-alist', which is the same
thing, but without any duplicates, such as \"light blue\" and
\"LightBlue\".</span>")

<span class="linecomment">;;;###autoload</span>
(defconst hexrgb-defined-colors-no-dups-alist
    (eval-when-compile
     (and window-system
          (mapcar #'list (hexrgb-canonicalize-defined-colors (x-defined-colors)))))
  "<span class="quote">Alist of all supported color names, with no duplicates, for completion.
Names are all lowercase, without any spaces.</span>")

<span class="linecomment">;;;###autoload</span>
(defcustom hexrgb-canonicalize-defined-colors-flag t
  "<span class="quote">*Non-nil means remove duplicate color names.
Names are considered duplicates if they are the same when abstracting
from whitespace and letter case.</span>"
  :type 'boolean
  :group 'Icicles :group 'doremi-frame-commands :group 'faces :group 'convenience)

<span class="linecomment">;; You should use these two functions, not the constants, so users can change</span>
<span class="linecomment">;; the behavior by customizing `hexrgb-canonicalize-defined-colors-flag'.</span>

(defun hexrgb-defined-colors ()
  "<span class="quote">List of supported color names.
If `hexrgb-canonicalize-defined-colors-flag' is non-nil, then names
are lowercased, whitespace is removed, and there are no duplicates.</span>"
  (if hexrgb-canonicalize-defined-colors-flag
      hexrgb-defined-colors-no-dups
    hexrgb-defined-colors))

(defun hexrgb-defined-colors-alist ()
  "<span class="quote">Alist of supported color names.  Usable for completion.
If `hexrgb-canonicalize-defined-colors-flag' is non-nil, then names
are lowercased, whitespace is removed, and there are no duplicates.</span>"
  (if hexrgb-canonicalize-defined-colors-flag
      hexrgb-defined-colors-no-dups-alist
    hexrgb-defined-colors-alist))

<span class="linecomment">;; RMS added this function to Emacs (23) as `read-color', with some feature loss.</span>
<span class="linecomment">;;;###autoload</span>
(defun hexrgb-read-color (&optional convert-to-RGB-p allow-empty-name-p prompt)
  "<span class="quote">Read a color name or RGB hex value: #RRRRGGGGBBBB.
Completion is available for color names, but not for RGB hex strings.
If you input an RGB hex string, it must have the form #XXXXXXXXXXXX or
XXXXXXXXXXXX, where each X is a hex digit.  The number of Xs must be a
multiple of 3, with the same number of Xs for each of red, green, and
blue.  The order is red, green, blue.

Color names that are normally considered equivalent are canonicalized:
They are lowercased, whitespace is removed, and duplicates are
eliminated.  E.g. \"LightBlue\" and \"light blue\" are both replaced
by \"lightblue\".  If you do not want this behavior, but want to
choose names that might contain whitespace or uppercase letters, then
customize option `hexrgb-canonicalize-defined-colors-flag' to nil.

In addition to standard color names and RGB hex values, the following
are available as color candidates.  In each case, the corresponding
color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the cursor
* `*point background*'   - background under the cursor

\(You can copy a color using eyedropper commands such as
`eyedrop-pick-foreground-at-mouse'.)

Checks input to be sure it represents a valid color.  If not, raises
an error (but see exception for empty input with non-nil
ALLOW-EMPTY-NAME-P).

Interactively, or with optional arg CONVERT-TO-RGB-P non-nil, converts
an input color name to an RGB hex string.  Returns the RGB hex string.

Optional arg ALLOW-EMPTY-NAME-P controls what happens if you enter an
empty color name (that is, you just hit `RET').  If non-nil, then
`hexrgb-read-color' returns an empty color name, \"\".  If nil, then
it raises an error.  Programs must test for \"\" if ALLOW-EMPTY-NAME-P
is non-nil.  They can then perform an appropriate action in case of
empty input.

Optional arg PROMPT is the prompt.  Nil means use a default prompt.</span>"
  (interactive "<span class="quote">p</span>")                     <span class="linecomment">; Always convert to RGB interactively.</span>
  (let* ((completion-ignore-case  t)
         <span class="linecomment">;; Free variables here: `eyedrop-picked-foreground', `eyedrop-picked-background'.</span>
         <span class="linecomment">;; They are defined in library `palette.el' or library `eyedropper.el'.</span>
         (colors                  (if (fboundp 'eyedrop-foreground-at-point)
                                      (append (and eyedrop-picked-foreground
                                                   '(("<span class="quote">*copied foreground*</span>")))
                                              (and eyedrop-picked-background
                                                   '(("<span class="quote">*copied background*</span>")))
                                              '(("<span class="quote">*mouse-2 foreground*</span>")
                                                ("<span class="quote">*mouse-2 background*</span>")
                                                ("<span class="quote">*point foreground*</span>") ("<span class="quote">*point background*</span>"))
                                              (hexrgb-defined-colors-alist))
                                    (hexrgb-defined-colors-alist)))
         (color                   (completing-read (or prompt "<span class="quote">Color (name or #R+G+B+): </span>")
                                                   colors))
         hex-string)
    (when (fboundp 'eyedrop-foreground-at-point)
      (cond ((string= "<span class="quote">*copied foreground*</span>" color) (setq color  eyedrop-picked-foreground))
            ((string= "<span class="quote">*copied background*</span>" color) (setq color  eyedrop-picked-background))
            ((string= "<span class="quote">*point foreground*</span>" color)  (setq color  (eyedrop-foreground-at-point)))
            ((string= "<span class="quote">*point background*</span>" color)  (setq color  (eyedrop-background-at-point)))
            ((string= "<span class="quote">*mouse-2 foreground*</span>" color)
             (setq color  (prog1 (eyedrop-foreground-at-mouse
                                  (read-event "<span class="quote">Click `mouse-2' to choose foreground color - </span>"))
                            (read-event)))) <span class="linecomment">; Discard mouse up event.</span>
            ((string= "<span class="quote">*mouse-2 background*</span>" color)
             (setq color  (prog1 (eyedrop-background-at-mouse
                                  (read-event "<span class="quote">Click `mouse-2' to choose background color - </span>"))
                            (read-event)))))) <span class="linecomment">; Discard mouse up event.</span>
    (setq hex-string  (or (string-match "<span class="quote">^#\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$</span>" color)
                          (and (string-match "<span class="quote">^\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$</span>" color)
                               t)))
    (if (and allow-empty-name-p (string= "<span class="quote"></span>" color))
        "<span class="quote"></span>"
      (when (and hex-string (not (eq 0 hex-string)))
        (setq color  (concat "<span class="quote">#</span>" color))) <span class="linecomment">; No #; add it.</span>
      (unless hex-string
        (when (or (string= "<span class="quote"></span>" color)
                  (not (if (fboundp 'test-completion) <span class="linecomment">; Not defined in Emacs 20.</span>
                           (test-completion color colors)
                         (try-completion color colors))))
          (error "<span class="quote">No such color: %S</span>" color))
        (when convert-to-RGB-p (setq color  (hexrgb-color-name-to-hex color))))
      (when (interactive-p) (message "<span class="quote">Color: `%s'</span>" color))
      color)))

(defun hexrgb-rgb-hex-string-p (color &optional laxp)
  "<span class="quote">Non-nil if COLOR is an RGB string #XXXXXXXXXXXX.
Each X is a hex digit.  The number of Xs must be a multiple of 3, with
the same number of Xs for each of red, green, and blue.

Non-nil optional arg LAXP means that the initial `#' is optional.  In
that case, for a valid string of hex digits: when # is present 0 is
returned; otherwise, t is returned.</span>"
  (or (string-match "<span class="quote">^#\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$</span>" color)
      (and laxp (string-match "<span class="quote">^\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$</span>" color) t)))

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-complement (color)
  "<span class="quote">Return the color that is the complement of COLOR.</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (let ((red    (hexrgb-red color))
        (green  (hexrgb-green color))
        (blue   (hexrgb-blue color)))
    (setq color  (hexrgb-rgb-to-hex (- 1.0 red) (- 1.0 green) (- 1.0 blue))))
  (when (interactive-p) (message "<span class="quote">Complement: `%s'</span>" color))
  color)

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-hue (color)
  "<span class="quote">Return the hue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (car (hexrgb-rgb-to-hsv (hexrgb-red color) (hexrgb-green color) (hexrgb-blue color))))

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-saturation (color)
  "<span class="quote">Return the saturation component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (cadr (hexrgb-rgb-to-hsv (hexrgb-red color) (hexrgb-green color) (hexrgb-blue color))))

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-value (color)
  "<span class="quote">Return the value component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (caddr (hexrgb-rgb-to-hsv (hexrgb-red color) (hexrgb-green color) (hexrgb-blue color))))

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-red (color)
  "<span class="quote">Return the red component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (/ (hexrgb-hex-to-int (substring color 1 (1+ (/ (1- (length color)) 3))))
     (expt 16.0 (/ (1- (length color)) 3.0))))

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-green (color)
  "<span class="quote">Return the green component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (let* ((len    (/ (1- (length color)) 3))
         (start  (1+ len)))
    (/ (hexrgb-hex-to-int (substring color start (+ start len)))
       (expt 16.0 (/ (1- (length color)) 3.0)))))

<span class="linecomment">;;;###autoload</span>
(defun hexrgb-blue (color)
  "<span class="quote">Return the blue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".</span>"
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (let* ((len    (/ (1- (length color)) 3))
         (start  (+ 1 len len)))
    (/ (hexrgb-hex-to-int (substring color start (+ start len)))
       (expt 16.0 (/ (1- (length color)) 3.0)))))

(defun hexrgb-rgb-to-hsv (red green blue)
  "<span class="quote">Convert RED, GREEN, BLUE components to HSV (hue, saturation, value).
Each input component is 0.0 to 1.0, inclusive.
Returns a list of HSV components of value 0.0 to 1.0, inclusive.</span>"
  (let* ((min    (min red green blue))
         (max    (max red green blue))
         (value  max)
         (delta  (- max min))
         hue saturation)
    (if (hexrgb-approx-equal 0.0 delta)
        (setq hue         0.0
              saturation  0.0)          <span class="linecomment">; Gray scale - no color; only value.</span>
      (if (and (condition-case nil
                   (setq saturation  (/ delta max))
                 (arith-error nil))
               <span class="linecomment">;; Must be a number, not a NaN.  The standard test for a NaN is (not (= N N)),</span>
               <span class="linecomment">;; but an Emacs 20 bug makes (= N N) return t for a NaN also.</span>
               (or (&lt; emacs-major-version 21) (= saturation saturation)))                
          (if (hexrgb-approx-equal 0.0 saturation)
              (setq hue         0.0
                    saturation  0.0)    <span class="linecomment">; Again, no color; only value.</span>
            <span class="linecomment">;; Color</span>
            (setq hue  (if (hexrgb-approx-equal red max)
                           (/ (- green blue) delta) <span class="linecomment">; Between yellow & magenta.</span>
                         (if (hexrgb-approx-equal green max)
                             (+ 2.0 (/ (- blue red) delta)) <span class="linecomment">; Between cyan & yellow.</span>
                           (+ 4.0 (/ (- red green) delta)))) <span class="linecomment">; Between magenta & cyan.</span>
                  hue  (/ hue 6.0))
            <span class="linecomment">;; (when (&lt;= hue 0.0) (setq hue  (+ hue 1.0)))  ; $$$$$$</span>
            <span class="linecomment">;; (when (&gt;= hue 1.0) (setq hue  (- hue 1.0)))) ; $$$$$$</span>
            (when (&lt; hue 0.0) (setq hue  (+ hue 1.0)))
            (when (&gt; hue 1.0) (setq hue  (- hue 1.0))))
        (setq hue         0.0           <span class="linecomment">; Div by zero (max=0): H:=0, S:=0. (Hue undefined.)</span>
              saturation  0.0)))
    (list hue saturation value)))

(defun hexrgb-hsv-to-rgb (hue saturation value)
  "<span class="quote">Convert HUE, SATURATION, VALUE components to RGB (red, green, blue).
Each input component is 0.0 to 1.0, inclusive.
Returns a list of RGB components of value 0.0 to 1.0, inclusive.</span>"
  (let (red green blue int-hue fract pp qq tt ww)
    (if (hexrgb-approx-equal 0.0 saturation)
        (setq red    value
              green  value
              blue   value)             <span class="linecomment">; Gray</span>
      (setq hue      (* hue 6.0)        <span class="linecomment">; Sectors: 0 to 5</span>
            int-hue  (floor hue)
            fract    (- hue int-hue)
            pp       (* value (- 1 saturation))
            qq       (* value (- 1 (* saturation fract)))
            ww       (* value (- 1 (* saturation (- 1 (- hue int-hue))))))
      (case int-hue
        ((0 6) (setq red    value
                     green  ww
                     blue   pp))
        (1 (setq red    qq
                 green  value
                 blue   pp))
        (2 (setq red    pp
                 green  value
                 blue   ww))
        (3 (setq red    pp
                 green  qq
                 blue   value))
        (4 (setq red    ww
                 green  pp
                 blue   value))
        (otherwise (setq red    value
                         green  pp
                         blue   qq))))
    (list red green blue)))

(defun hexrgb-hsv-to-hex (hue saturation value)
  "<span class="quote">Return the hex RBG color string for inputs HUE, SATURATION, VALUE.
The inputs are each in the range 0 to 1.
The output string is of the form \"#RRRRGGGGBBBB\".</span>"
  (hexrgb-color-values-to-hex
   (mapcar (lambda (x) (floor (* x 65535.0))) (hexrgb-hsv-to-rgb hue saturation value))))

(defun hexrgb-rgb-to-hex (red green blue)
  "<span class="quote">Return the hex RBG color string for inputs RED, GREEN, BLUE.
The inputs are each in the range 0 to 1.
The output string is of the form \"#RRRRGGGGBBBB\".</span>"
  (hexrgb-color-values-to-hex
   (mapcar (lambda (x) (floor (* x 65535.0))) (list red green blue))))

(defun hexrgb-hex-to-hsv (color)
  "<span class="quote">Return a list of HSV (hue, saturation, value) color components.
Each component is a value from 0.0 to 1.0, inclusive.
COLOR is a color name or a hex RGB string that starts with \"#\" and
is followed by an equal number of hex digits for red, green, and blue
components.</span>"
  (let ((rgb-components  (hexrgb-hex-to-rgb color)))
    (apply #'hexrgb-rgb-to-hsv rgb-components)))

(defun hexrgb-hex-to-rgb (color)
  "<span class="quote">Return a list of RGB (red, green, blue) color components.
Each component is a value from 0.0 to 1.0, inclusive.
COLOR is a color name or a hex RGB string that starts with \"#\" and
is followed by an equal number of hex digits for red, green, and blue
components.</span>"
  (unless (hexrgb-rgb-hex-string-p color) (setq color  (hexrgb-color-name-to-hex color)))
  (let ((len  (/ (1- (length color)) 3)))
    (list (/ (hexrgb-hex-to-int (substring color 1 (1+ len))) 65535.0)
          (/ (hexrgb-hex-to-int (substring color (1+ len) (+ 1 len len))) 65535.0)
          (/ (hexrgb-hex-to-int (substring color (+ 1 len len))) 65535.0))))

(defun hexrgb-color-name-to-hex (color)
  "<span class="quote">Return the RGB hex string for the COLOR name, starting with \"#\".
If COLOR is already a string starting with \"#\", then just return it.</span>"
  (let ((components  (x-color-values color)))
    (unless components (error "<span class="quote">No such color: %S</span>" color))
    (unless (hexrgb-rgb-hex-string-p color)
      (setq color  (hexrgb-color-values-to-hex components))))
  color)

<span class="linecomment">;; Color "components" would be better in the name than color "value"</span>
<span class="linecomment">;; but this name follows the Emacs tradition (e.g. `x-color-values',</span>
<span class="linecomment">;; 'ps-color-values', `ps-e-x-color-values').</span>
(defun hexrgb-color-values-to-hex (components)
  "<span class="quote">Convert list of rgb color COMPONENTS to a hex string, #XXXXXXXXXXXX.
Each X in the string is a hexadecimal digit.
Input COMPONENTS is as for the output of `x-color-values'.</span>"
<span class="linecomment">;; Just hard-code 4 as the number of hex digits, since `x-color-values'</span>
<span class="linecomment">;; seems to produce appropriate integer values for `4'.</span>
  (concat "<span class="quote">#</span>" (hexrgb-int-to-hex (nth 0 components) 4) <span class="linecomment">; red</span>
          (hexrgb-int-to-hex (nth 1 components) 4) <span class="linecomment">; green</span>
          (hexrgb-int-to-hex (nth 2 components) 4))) <span class="linecomment">; blue</span>

(defun hexrgb-hex-to-color-values (color)
  "<span class="quote">Convert hex COLOR to a list of RGB color components.
COLOR is a hex rgb color string, #XXXXXXXXXXXX
Each X in the string is a hexadecimal digit.  There are 3N X's, N &gt; 0.
The output list is as for `x-color-values'.</span>"
  (let* ((hex-strgp  (string-match
                      "<span class="quote">^\\(#\\)?\\(\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+\\)$</span>"
                      color))
         (ndigits    (/ (if (eq (match-beginning 1) (match-end 1))
                            (length color)
                          (1- (length color)))
                        3))
         red green blue)
    (unless hex-strgp (error "<span class="quote">Invalid RGB color string: %s</span>" color))
    (setq color  (substring color (match-beginning 2) (match-end 2))
          red    (hexrgb-hex-to-int (substring color 0 ndigits))
          green  (hexrgb-hex-to-int (substring color ndigits (* 2 ndigits)))
          blue   (hexrgb-hex-to-int (substring color (* 2 ndigits) (* 3 ndigits))))
    (list red green blue)))
    
(defun hexrgb-increment-red (hex nb-digits increment &optional wrap-p)
  "<span class="quote">Increment red component of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#000ffffff\".</span>"
  (concat "<span class="quote">#</span>"
          (hexrgb-increment-hex (substring hex 1 (1+ nb-digits)) nb-digits increment wrap-p)
          (substring hex (1+ nb-digits) (1+ (* nb-digits 2)))
          (substring hex (1+ (* nb-digits 2)))))

(defun hexrgb-increment-green (hex nb-digits increment &optional wrap-p)
  "<span class="quote">Increment green component of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#fff000fff\".</span>"
  (concat
   "<span class="quote">#</span>" (substring hex 1 (1+ nb-digits))
   (hexrgb-increment-hex (substring hex (1+ nb-digits) (1+ (* nb-digits 2)))
                         nb-digits
                         increment
                         wrap-p)
   (substring hex (1+ (* nb-digits 2)))))

(defun hexrgb-increment-blue (hex nb-digits increment &optional wrap-p)
  "<span class="quote">Increment blue component of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#ffffff000\".</span>"
  (concat "<span class="quote">#</span>" (substring hex 1 (1+ (* nb-digits 2)))
          (hexrgb-increment-hex (substring hex (1+ (* nb-digits 2)))
                                nb-digits
                                increment
                                wrap-p)))

(defun hexrgb-increment-equal-rgb (hex nb-digits increment &optional wrap-p)
  "<span class="quote">Increment each color component (r,g,b) of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#000000000\".</span>"
  (concat
   "<span class="quote">#</span>"
   (hexrgb-increment-hex (substring hex 1 (1+ nb-digits)) nb-digits increment wrap-p)
   (hexrgb-increment-hex (substring hex (1+ nb-digits) (1+ (* nb-digits 2)))
                         nb-digits
                         increment
                         wrap-p)
   (hexrgb-increment-hex (substring hex (1+ (* nb-digits 2))) nb-digits increment wrap-p)))

(defun hexrgb-increment-hex (hex nb-digits increment &optional wrap-p)
  "<span class="quote">Increment hexadecimal-digits string HEX by INCREMENT.
Only the first NB-DIGITS of HEX are used.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"fff\" by 1 causes it
  to wrap around to \"000\".</span>"
  (let* ((int      (hexrgb-hex-to-int hex))
         (new-int  (+ increment int)))
    (if (or wrap-p
            (and (&gt;= int 0)             <span class="linecomment">; Not too large for the machine.</span>
                 (&gt;= new-int 0)         <span class="linecomment">; For the case where increment &lt; 0.</span>
                 (&lt;= (length (format (concat "<span class="quote">%X</span>") new-int)) nb-digits))) <span class="linecomment">; Not too long.</span>
        (hexrgb-int-to-hex new-int nb-digits) <span class="linecomment">; Use incremented number.</span>
      hex)))                            <span class="linecomment">; Don't increment.</span>

(defun hexrgb-hex-to-int (hex)
  "<span class="quote">Convert HEX string argument to an integer.
The characters of HEX must be hex characters.</span>"
  (let* ((factor  1)
         (len     (length hex))
         (indx    (1- len))
         (int     0))
    (while (&gt;= indx 0)
      (setq int     (+ int (* factor (hexrgb-hex-char-to-integer (aref hex indx))))
            indx    (1- indx)
            factor  (* 16 factor)))
    int))

<span class="linecomment">;; From `hexl.el'.  This is the same as `hexl-hex-char-to-integer' defined there.</span>
(defun hexrgb-hex-char-to-integer (character)
  "<span class="quote">Take a CHARACTER and return its value as if it were a hex digit.</span>"
  (if (and (&gt;= character ?0) (&lt;= character ?9))
      (- character ?0)
    (let ((ch  (logior character 32)))
      (if (and (&gt;= ch ?a) (&lt;= ch ?f))
          (- ch (- ?a 10))
        (error "<span class="quote">Invalid hex digit `%c'</span>" ch)))))

<span class="linecomment">;; Originally, I used the code from `int-to-hex-string' in `float.el'.</span>
<span class="linecomment">;; This version is thanks to Juri Linkov &lt;juri@jurta.org&gt;.</span>
<span class="linecomment">;;</span>
(defun hexrgb-int-to-hex (int &optional nb-digits)
  "<span class="quote">Convert integer argument INT to a #XXXXXXXXXXXX format hex string.
Each X in the output string is a hexadecimal digit.
NB-DIGITS is the number of hex digits.  If INT is too large to be
represented with NB-DIGITS, then the result is truncated from the
left.  So, for example, INT=256 and NB-DIGITS=2 returns \"00\", since
the hex equivalent of 256 decimal is 100, which is more than 2 digits.</span>"
  (setq nb-digits  (or nb-digits 4))
  (substring (format (concat "<span class="quote">%0</span>" (int-to-string nb-digits) "<span class="quote">X</span>") int) (- nb-digits)))

<span class="linecomment">;; Inspired by Elisp Info manual, node "Comparison of Numbers".</span>
(defun hexrgb-approx-equal (x y &optional rfuzz afuzz)
  "<span class="quote">Return non-nil if numbers X and Y are approximately equal.
RFUZZ is a relative fuzz factor.  AFUZZ is an absolute fuzz factor.
RFUZZ defaults to 1.0e-8.  AFUZZ defaults to (/ RFUZZ 10).
RFUZZ and AFUZZ are converted to their absolute values.
The algorithm is:
 (&lt; (abs (- X Y)) (+ AFUZZ (* RFUZZ (+ (abs X) (abs Y))))).</span>"
  (setq rfuzz  (or rfuzz 1.0e-8)
        rfuzz  (abs rfuzz)
        afuzz  (or afuzz (/ rfuzz 10))
        afuzz  (abs afuzz))
  (&lt; (abs (- x y)) (+ afuzz (* rfuzz (+ (abs x) (abs y))))))

(defun hexrgb-color-value-to-float (n)
  "<span class="quote">Return the floating-point equivalent of color-component value N.
N must be an integer between 0 and 65535, or else an error is raised.</span>"
  (unless (and (wholenump n) (&lt;= n 65535))
    (error "<span class="quote">Not a whole number less than 65536</span>"))
  (/ (float n) 65535.0))

(defun hexrgb-float-to-color-value (x)
  "<span class="quote">Return the color-component value equivalent of floating-point number X.
X must be between 0.0 and 1.0, or else an error is raised.</span>"
  (unless (and (numberp x) (&lt;= 0.0 x) (&lt;= x 1.0))
    (error "<span class="quote">Not a floating-point number between 0.0 and 1.0</span>"))
  (floor (* x 65535.0)))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'hexrgb)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; hexrgb.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=hexrgb.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=hexrgb.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=hexrgb.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=hexrgb.el">Administration</a></span><span class="time"><br /> Last edited 2011-02-17 00:50 UTC by <a class="author" title="from inet-rmmc06-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=hexrgb.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
