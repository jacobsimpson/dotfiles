<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: apropos-fn+var.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=apropos-fn%2bvar.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: apropos-fn+var.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=apropos-fn%2bvar.el" />
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
      title="Changes for apropos-fn+var.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=apropos-fn%2bvar.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22apropos-fn%2bvar.el%22">apropos-fn+var.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/apropos-fn%2bvar.el">Download</a></p><pre class="code"><span class="linecomment">;;; apropos-fn+var.el --- Apropos for functions and variables</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Filename: apropos-fn.el</span>
<span class="linecomment">;; Description: Apropos for functions and variables</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Nov 28 15:41:09 2005</span>
<span class="linecomment">;; Version: </span>
<span class="linecomment">;; Last-Updated: Thu Mar 31 11:00:17 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 151</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/apropos-fn+var.el</span>
<span class="linecomment">;; Keywords: apropos</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Commentary: </span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Standard `apropos' commands `apropos-variable' and</span>
<span class="linecomment">;;  `apropos-command' do not distinguish, by command name, between the</span>
<span class="linecomment">;;  different types of target object (but you can do that via `C-u').</span>
<span class="linecomment">;;  This library provides individual `apropos' commands for user</span>
<span class="linecomment">;;  options, variables in general (not just options), and functions in</span>
<span class="linecomment">;;  general (not just commands).  These commands are defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `apropos-option'   - Apropos a user option</span>
<span class="linecomment">;;    `apropos-variable' - Apropos any variable, not just user option</span>
<span class="linecomment">;;    `apropos-function' - Apropos any function, not just command</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `apropos.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `apropos-variable' - See above (the standard command does what</span>
<span class="linecomment">;;                       `apropos-option' does here).</span>
<span class="linecomment">;;  `apropos-print'    - Identifies user options with label `Option'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;  Slightly different versions of `apropos-function' and</span>
<span class="linecomment">;;  `apropos-variable' were posted by Kevin Rodgers to bug-gnu-emacs,</span>
<span class="linecomment">;;  Tue, 06 Sep 2005 14:34:54 -0600.  Kevin didn't actually redefine</span>
<span class="linecomment">;;  `apropos-variable' (he would never do that ;-)), but he provided</span>
<span class="linecomment">;;  the new definition.  I redefined `apropos-print' and added button</span>
<span class="linecomment">;;  type `apropos-option'.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2011/03/31 dadams</span>
<span class="linecomment">;;     apropos-print: Added Emacs 24+ version.</span>
<span class="linecomment">;; 2006/03/03 dadams</span>
<span class="linecomment">;;     Updated to latest Emacs 22 CVS version:</span>
<span class="linecomment">;;       apropos-orig-regexp was renamed to apropos-pattern.</span>
<span class="linecomment">;;       apropos-print now has an additional optional arg.</span>
<span class="linecomment">;; 2006/02/25 dadams</span>
<span class="linecomment">;;     apropos-variable: Added ignored optional arg, for compatibility.</span>
<span class="linecomment">;; 2005/11/29 dadams</span>
<span class="linecomment">;;     Added redefinition of apropos-print and button type apropos-option.</span>
<span class="linecomment">;;     Made arg to apropos-function and apropos-variable mandatory.</span>
<span class="linecomment">;; 2005/11/28 dadams</span>
<span class="linecomment">;;     Redefined apropos-variable. Defined apropos-option as old version.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;; Code:</span>

(require 'apropos)

<span class="linecomment">;; Quiet byte compiler</span>
(unless (boundp 'apropos-pattern) (defvar apropos-pattern))
(unless (boundp 'apropos-sort-by-scores) (defvar apropos-sort-by-scores))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;</span>


(if (&lt; emacs-major-version 22)
    (defun apropos-function (pattern)
      "<span class="quote">Show functions that match PATTERN (a regular expression).
This includes functions that are not commands.</span>"
      (interactive "<span class="quote">i</span>")                 <span class="linecomment">; Ignored when interactive</span>
      (if (interactive-p)
          (let ((apropos-do-all t))
            (call-interactively 'apropos-command))
        (apropos-command pattern t)))
  (defun apropos-function (pattern)
    "<span class="quote">Show functions that match PATTERN.
This includes functions that are not commands.
PATTERN can be a word, a list of words (separated by spaces),
or a regexp (using some regexp special characters).  If it is a word,
search for matches for that word as a substring.  If it is a list of words,
search for matches for any two (or more) of those words.

When called from a Lisp program, a string PATTERN is used as a regexp,
while a list of strings is used as a word list.</span>"
    (interactive "<span class="quote">i</span>")                   <span class="linecomment">; Ignored when interactive</span>
    (if (interactive-p)
        (let ((apropos-do-all t))
          (call-interactively 'apropos-command))
      (apropos-command pattern t))))


<span class="linecomment">;;; REPLACE ORIGINAL defined in `apropos.el'.</span>
<span class="linecomment">;;; Allow for non user-option variables too.</span>
<span class="linecomment">;;; Rename original command as `apropos-option'.</span>
<span class="linecomment">;;; </span>
(or (fboundp 'apropos-option)
(fset 'apropos-option (symbol-function 'apropos-variable)))

(if (&lt; emacs-major-version 22)
    (defun apropos-variable (pattern &optional ignore)
      "<span class="quote">Show variables that match PATTERN (a regular expression).
This includes variables that are not user options.</span>"
      (interactive "<span class="quote">i</span>")                 <span class="linecomment">; Ignored when interactive</span>
      (if (interactive-p)
          (let ((apropos-do-all t))
            (call-interactively 'apropos-option))
        (apropos-option pattern t)))
  (defun apropos-variable (pattern &optional ignore)
    "<span class="quote">Show variables that match PATTERN.
This includes variables that are not user options.
PATTERN can be a word, a list of words (separated by spaces),
or a regexp (using some regexp special characters).  If it is a word,
search for matches for that word as a substring.  If it is a list of
words, search for matches for any two (or more) of those words.</span>"
    (interactive "<span class="quote">i</span>")                   <span class="linecomment">; Ignored when interactive</span>
    (if (interactive-p)
        (let ((apropos-do-all t))
          (call-interactively 'apropos-option))
      (apropos-option pattern t))))


<span class="linecomment">;;; REPLACE ORIGINAL defined in `apropos.el'.</span>
<span class="linecomment">;;; Use label "Option" for user options.</span>
<span class="linecomment">;;; </span>
(cond ((&lt; emacs-major-version 22)       <span class="linecomment">; Emacs 20 and 21.</span>
       (defun apropos-print (do-keys spacing)
         "<span class="quote">Output result of apropos searching into buffer `*Apropos*'.
The value of `apropos-accumulator' is the list of items to output.
Each element should have the format (SYMBOL FN-DOC VAR-DOC [PLIST-DOC]).
The return value is the list that was in `apropos-accumulator', sorted
alphabetically by symbol name; but this function also sets
`apropos-accumulator' to nil before returning.</span>"
         (if (null apropos-accumulator)
             (message "<span class="quote">No apropos matches for `%s'</span>" apropos-regexp)
           (setq apropos-accumulator
                 (sort apropos-accumulator (lambda (a b)
                                             (string-lessp (car a) (car b)))))
           (and apropos-label-face
                (symbolp apropos-label-face)
                (setq apropos-label-face `(face ,apropos-label-face
                                           mouse-face highlight)))
           (with-output-to-temp-buffer "<span class="quote">*Apropos*</span>"
             (let ((p apropos-accumulator)
                   (old-buffer (current-buffer))
                   symbol item point1 point2)
               (set-buffer standard-output)
               (apropos-mode)
               (if window-system
                   (insert "<span class="quote">If you move the mouse over text that changes color,\n</span>"
                           (substitute-command-keys
                            "<span class="quote">you can click \\[apropos-mouse-follow] to get more information.\n</span>")))
               (insert (substitute-command-keys
                        "<span class="quote">In this buffer, type \\[apropos-follow] to get full documentation.\n\n</span>"))
               (while (consp p)
                 (or (not spacing) (bobp) (terpri))
                 (setq apropos-item (car p)
                       symbol (car apropos-item)
                       p (cdr p)
                       point1 (point))
                 (princ symbol)         <span class="linecomment">; print symbol name</span>
                 (setq point2 (point))
                 <span class="linecomment">;; Calculate key-bindings if we want them.</span>
                 (and do-keys
                      (commandp symbol)
                      (indent-to 30 1)
                      (if (let ((keys
                                 (save-excursion
                                   (set-buffer old-buffer)
                                   (where-is-internal symbol)))
                                filtered)
                            <span class="linecomment">;; Copy over the list of key sequences,</span>
                            <span class="linecomment">;; omitting any that contain a buffer or a frame.</span>
                            (while keys
                              (let ((key (car keys))
                                    (i 0)
                                    loser)
                                (while (&lt; i (length key))
                                  (if (or (framep (aref key i))
                                          (bufferp (aref key i)))
                                      (setq loser t))
                                  (setq i (1+ i)))
                                (or loser
                                    (setq filtered (cons key filtered))))
                              (setq keys (cdr keys)))
                            (setq item filtered))
                          <span class="linecomment">;; Convert the remaining keys to a string and insert.</span>
                          (insert
                           (mapconcat
                            (lambda (key)
                              (setq key (condition-case () 
                                            (key-description key)
                                          (error)))
                              (if apropos-keybinding-face
                                  (put-text-property 0 (length key)
                                                     'face apropos-keybinding-face
                                                     key))
                              key)
                            item "<span class="quote">, </span>"))
                        (insert "<span class="quote">M-x</span>")
                        (put-text-property (- (point) 3) (point)
                                           'face apropos-keybinding-face)
                        (insert "<span class="quote"> </span>" (symbol-name symbol) "<span class="quote"> </span>")
                        (insert "<span class="quote">RET</span>")
                        (put-text-property (- (point) 3) (point)
                                           'face apropos-keybinding-face)))
                 (terpri)
                 <span class="linecomment">;; only now so we don't propagate text attributes all over</span>
                 (put-text-property point1 point2 'item
                                    (if (eval `(or ,@(cdr apropos-item)))
                                        (car apropos-item)
                                      apropos-item))
                 (if apropos-symbol-face
                     (put-text-property point1 point2 'face apropos-symbol-face))
                 (apropos-print-doc 'describe-function 1 (if (commandp symbol)
                                                             "<span class="quote">Command</span>"
                                                           (if (apropos-macrop symbol)
                                                               "<span class="quote">Macro</span>"
                                                             "<span class="quote">Function</span>"))
                                    t)
                 <span class="linecomment">;; We used to use customize-variable-other-window instead</span>
                 <span class="linecomment">;; for a customizable variable, but that is slow.</span>
                 <span class="linecomment">;; It is better to show an ordinary help buffer</span>
                 <span class="linecomment">;; and let the user click on the customization button</span>
                 <span class="linecomment">;; in that buffer, if he wants to.</span>
                 <span class="linecomment">;; Likewise for `customize-face-other-window'.</span>
                 (apropos-print-doc 'describe-variable 2 (if (user-variable-p symbol)
                                                             "<span class="quote">Option</span>"
                                                           "<span class="quote">Variable</span>")
                                    t)
                 (apropos-print-doc 'customize-group-other-window 6 "<span class="quote">Group</span>" t)
                 (apropos-print-doc 'describe-face 5 "<span class="quote">Face</span>" t)
                 (apropos-print-doc 'widget-browse-other-window 4 "<span class="quote">Widget</span>" t)
                 (apropos-print-doc 'apropos-describe-plist 3 "<span class="quote">Plist</span>" nil))
               (setq buffer-read-only t))))
         (prog1 apropos-accumulator
           (setq apropos-accumulator ()))))
      ((&lt; emacs-major-version 24)       <span class="linecomment">; Emacs 22 and 23.</span>
       (defun apropos-print (do-keys spacing &optional text nosubst)
         "<span class="quote">Output result of apropos searching into buffer `*Apropos*'.
The value of `apropos-accumulator' is the list of items to output.
Each element should have the format
 (SYMBOL SCORE FN-DOC VAR-DOC [PLIST-DOC WIDGET-DOC FACE-DOC GROUP-DOC]).
The return value is the list that was in `apropos-accumulator', sorted
alphabetically by symbol name; but this function also sets
`apropos-accumulator' to nil before returning.

If SPACING is non-nil, it should be a string; separate items with that string.
If non-nil TEXT is a string that will be printed as a heading.</span>"
         (if (null apropos-accumulator)
             (message "<span class="quote">No apropos matches for `%s'</span>" apropos-pattern)
           (setq apropos-accumulator
                 (sort apropos-accumulator
                       (lambda (a b)
                         <span class="linecomment">;; Don't sort by score if user can't see the score.</span>
                         <span class="linecomment">;; It would be confusing.  -- rms.</span>
                         (if (and (boundp 'apropos-sort-by-scores)
                                  apropos-sort-by-scores)
                             (or (&gt; (cadr a) (cadr b))
                                 (and (= (cadr a) (cadr b))
                                      (string-lessp (car a) (car b))))
                           (string-lessp (car a) (car b))))))
           (with-output-to-temp-buffer "<span class="quote">*Apropos*</span>"
             (let ((p apropos-accumulator)
                   (old-buffer (current-buffer))
                   symbol item)
               (set-buffer standard-output)
               (apropos-mode)
               (if (display-mouse-p)
                   (insert
                    "<span class="quote">If moving the mouse over text changes the text's color, </span>"
                    "<span class="quote">you can click\n</span>"
                    "<span class="quote">mouse-2 (second button from right) on that text to </span>"
                    "<span class="quote">get more information.\n</span>"))
               (insert "<span class="quote">In this buffer, go to the name of the command, function, or variable,\n</span>"
                       (substitute-command-keys
                        "<span class="quote">and type \\[apropos-follow] to get full documentation.\n\n</span>"))
               (if text (insert text "<span class="quote">\n\n</span>"))
               (while (consp p)
                 (when (and spacing (not (bobp)))
                   (princ spacing))
                 (setq apropos-item (car p)
                       symbol (car apropos-item)
                       p (cdr p))
                 <span class="linecomment">;; Insert dummy score element for backwards compatibility with 21.x</span>
                 <span class="linecomment">;; apropos-item format.</span>
                 (if (not (numberp (cadr apropos-item)))
                     (setq apropos-item
                           (cons (car apropos-item)
                                 (cons nil (cdr apropos-item)))))
                 (insert-text-button (symbol-name symbol)
                                     'type 'apropos-symbol
                                     <span class="linecomment">;; Can't use default, since user may have</span>
                                     <span class="linecomment">;; changed the variable!</span>
                                     <span class="linecomment">;; Just say `no' to variables containing faces!</span>
                                     'face apropos-symbol-face)
                 (if (and (eq apropos-sort-by-scores 'verbose)
                          (cadr apropos-item))
                     (insert "<span class="quote"> (</span>" (number-to-string (cadr apropos-item)) "<span class="quote">) </span>"))
                 <span class="linecomment">;; Calculate key-bindings if we want them.</span>
                 (and do-keys
                      (commandp symbol)
                      (indent-to 30 1)
                      (if (let ((keys
                                 (save-excursion
                                   (set-buffer old-buffer)
                                   (where-is-internal symbol)))
                                filtered)
                            <span class="linecomment">;; Copy over the list of key sequences,</span>
                            <span class="linecomment">;; omitting any that contain a buffer or a frame.</span>
                            (while keys
                              (let ((key (car keys))
                                    (i 0)
                                    loser)
                                (while (&lt; i (length key))
                                  (if (or (framep (aref key i))
                                          (bufferp (aref key i)))
                                      (setq loser t))
                                  (setq i (1+ i)))
                                (or loser
                                    (setq filtered (cons key filtered))))
                              (setq keys (cdr keys)))
                            (setq item filtered))
                          <span class="linecomment">;; Convert the remaining keys to a string and insert.</span>
                          (insert
                           (mapconcat
                            (lambda (key)
                              (setq key (condition-case ()
                                            (key-description key)
                                          (error)))
                              (if apropos-keybinding-face
                                  (put-text-property 0 (length key)
                                                     'face apropos-keybinding-face
                                                     key))
                              key)
                            item "<span class="quote">, </span>"))
                        (insert "<span class="quote">M-x ... RET</span>")
                        (when apropos-keybinding-face
                          (put-text-property (- (point) 11) (- (point) 8)
                                             'face apropos-keybinding-face)
                          (put-text-property (- (point) 3) (point)
                                             'face apropos-keybinding-face))))
                 (terpri)
                 (apropos-print-doc 2 (if (commandp symbol)
                                          'apropos-command
                                        (if (apropos-macrop symbol)
                                            'apropos-macro
                                          'apropos-function))
                                    (not nosubst))
                 (apropos-print-doc 3 (if (user-variable-p symbol)
                                          'apropos-option
                                        'apropos-variable)
                                    (not nosubst))
                 (apropos-print-doc 7 'apropos-group t)
                 (apropos-print-doc 6 'apropos-face t)
                 (apropos-print-doc 5 'apropos-widget t)
                 (apropos-print-doc 4 'apropos-plist nil))
               (setq buffer-read-only t))))
         (prog1 apropos-accumulator
           (setq apropos-accumulator ())))) <span class="linecomment">; permit gc</span>
      (t                                <span class="linecomment">; Emacs 24+.</span>
       (defun apropos-print (do-keys spacing &optional text nosubst)
         "<span class="quote">Output result of apropos searching into buffer `*Apropos*'.
The value of `apropos-accumulator' is the list of items to output.
Each element should have the format
 (SYMBOL SCORE FN-DOC VAR-DOC [PLIST-DOC WIDGET-DOC FACE-DOC GROUP-DOC]).
The return value is the list that was in `apropos-accumulator', sorted
alphabetically by symbol name; but this function also sets
`apropos-accumulator' to nil before returning.

If SPACING is non-nil, it should be a string; separate items with that string.
If non-nil TEXT is a string that will be printed as a heading.</span>"
         (if (null apropos-accumulator)
             (message "<span class="quote">No apropos matches for `%s'</span>" apropos-pattern)
           (setq apropos-accumulator
                 (sort apropos-accumulator
                       (lambda (a b)
                         <span class="linecomment">;; Don't sort by score if user can't see the score.</span>
                         <span class="linecomment">;; It would be confusing.  -- rms.</span>
                         (if apropos-sort-by-scores
                             (or (&gt; (cadr a) (cadr b))
                                 (and (= (cadr a) (cadr b))
                                      (string-lessp (car a) (car b))))
                           (string-lessp (car a) (car b))))))
           (with-output-to-temp-buffer "<span class="quote">*Apropos*</span>"
             (let ((p apropos-accumulator)
                   (old-buffer (current-buffer))
                   (inhibit-read-only t)
                   symbol item)
               (set-buffer standard-output)
               (apropos-mode)
               (if (display-mouse-p)
                   (insert
                    "<span class="quote">If moving the mouse over text changes the text's color, </span>"
                    "<span class="quote">you can click\n</span>"
                    "<span class="quote">mouse-2 or hit `RET' on that text to get more information.\n</span>"))
               (insert "<span class="quote">In this buffer, go to the name of the command, function, or variable,\n</span>"
                       (substitute-command-keys
                        "<span class="quote">and type \\[apropos-follow] to get full documentation.\n\n</span>"))
               (if text (insert text "<span class="quote">\n\n</span>"))
               (dolist (apropos-item p)
                 (when (and spacing (not (bobp)))
                   (princ spacing))
                 (setq symbol (car apropos-item))
                 <span class="linecomment">;; Insert dummy score element for backwards compatibility with 21.x</span>
                 <span class="linecomment">;; apropos-item format.</span>
                 (if (not (numberp (cadr apropos-item)))
                     (setq apropos-item
                           (cons (car apropos-item)
                                 (cons nil (cdr apropos-item)))))
                 (insert-text-button (symbol-name symbol)
                                     'type 'apropos-symbol
                                     'skip apropos-multi-type
                                     <span class="linecomment">;; Can't use default, since user may have</span>
                                     <span class="linecomment">;; changed the variable!</span>
                                     <span class="linecomment">;; Just say `no' to variables containing faces!</span>
                                     'face apropos-symbol-face)
                 (if (and (eq apropos-sort-by-scores 'verbose)
                          (cadr apropos-item))
                     (insert "<span class="quote"> (</span>" (number-to-string (cadr apropos-item)) "<span class="quote">) </span>"))
                 <span class="linecomment">;; Calculate key-bindings if we want them.</span>
                 (unless apropos-compact-layout
                   (and do-keys
                        (commandp symbol)
                        (not (eq symbol 'self-insert-command))
                        (indent-to 30 1)
                        (if (let ((keys
                                   (with-current-buffer old-buffer
                                     (where-is-internal symbol)))
                                  filtered)
                              <span class="linecomment">;; Copy over the list of key sequences,</span>
                              <span class="linecomment">;; omitting any that contain a buffer or a frame.</span>
                              <span class="linecomment">;; FIXME: Why omit keys that contain buffers and</span>
                              <span class="linecomment">;; frames?  This looks like a bad workaround rather</span>
                              <span class="linecomment">;; than a proper fix.  Does anybod know what problem</span>
                              <span class="linecomment">;; this is trying to address?  --Stef</span>
                              (dolist (key keys)
                                (let ((i 0)
                                      loser)
                                  (while (&lt; i (length key))
                                    (if (or (framep (aref key i))
                                            (bufferp (aref key i)))
                                        (setq loser t))
                                    (setq i (1+ i)))
                                  (or loser
                                      (push key filtered))))
                              (setq item filtered))
                            <span class="linecomment">;; Convert the remaining keys to a string and insert.</span>
                            (insert
                             (mapconcat
                              (lambda (key)
                                (setq key (condition-case ()
                                              (key-description key)
                                            (error)))
                                (if apropos-keybinding-face
                                    (put-text-property 0 (length key)
                                                       'face apropos-keybinding-face
                                                       key))
                                key)
                              item "<span class="quote">, </span>"))
                          (insert "<span class="quote">M-x ... RET</span>")
                          (when apropos-keybinding-face
                            (put-text-property (- (point) 11) (- (point) 8)
                                               'face apropos-keybinding-face)
                            (put-text-property (- (point) 3) (point)
                                               'face apropos-keybinding-face))))
                   (terpri))
                 (apropos-print-doc 2 (if (commandp symbol)
                                          'apropos-command
                                        (if (apropos-macrop symbol)
                                            'apropos-macro
                                          'apropos-function))
                                    (not nosubst))
                 (apropos-print-doc 3 (if (user-variable-p symbol)
                                          'apropos-option
                                        'apropos-variable)
                                    (not nosubst))
                 (apropos-print-doc 7 'apropos-group t)
                 (apropos-print-doc 6 'apropos-face t)
                 (apropos-print-doc 5 'apropos-widget t)
                 (apropos-print-doc 4 'apropos-plist nil))
               (set (make-local-variable 'truncate-partial-width-windows) t)
               (set (make-local-variable 'truncate-lines) t))))
         (prog1 apropos-accumulator
           (setq apropos-accumulator ()))))) <span class="linecomment">; permit gc</span>

(when (&gt;= emacs-major-version 22)
  (define-button-type 'apropos-option
      'apropos-label "<span class="quote">Option</span>"
      'help-echo "<span class="quote">mouse-2, RET: Display more help on this user option (variable)</span>"
      'follow-link t
      'action (lambda (button)
                (describe-variable (button-get button 'apropos-symbol)))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;</span>

(provide 'apropos-fn+var)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; apropos-fn.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=apropos-fn+var.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=apropos-fn%2bvar.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=apropos-fn%2bvar.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=apropos-fn%2bvar.el">Administration</a></span><span class="time"><br /> Last edited 2011-03-31 18:00 UTC by <a class="author" title="from inet-hqmc02-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=apropos-fn%2bvar.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
