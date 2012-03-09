<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-mac.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mac.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-mac.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mac.el" />
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
      title="Changes for icicles-mac.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mac.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-mac.el%22">icicles-mac.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/icicles-mac.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-mac.el --- Macros for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-mac.el</span>
<span class="linecomment">;; Description: Macros for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:24:28 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Fri Jun 24 11:39:49 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 678</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-mac.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
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
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  macros.  For Icicles documentation, see `icicles-doc1.el' and</span>
<span class="linecomment">;;  `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Macros defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-buffer-bindings', `icicle-define-add-to-alist-command',</span>
<span class="linecomment">;;    `icicle-define-command', `icicle-define-file-command',</span>
<span class="linecomment">;;    `icicle-define-sort-command', `icicle-file-bindings',</span>
<span class="linecomment">;;    `icicle-with-selected-window'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-assoc-delete-all', `icicle-try-switch-buffer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Standard Emacs function defined here for older Emacs versions:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `select-frame-set-input-focus'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You might also be interested in my library `imenu+.el', which</span>
<span class="linecomment">;;  teaches the macros defined here to Imenu, so the functions defined</span>
<span class="linecomment">;;  with those macros show up in Imenu menus.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  I've also included some commented-out code at the end, which you</span>
<span class="linecomment">;;  might want to use in your init file (~/.emacs).  It provides</span>
<span class="linecomment">;;  better indentation for the doc string when you use the macros here</span>
<span class="linecomment">;;  in your code.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For descriptions of changes to this file, see `icicles-chg.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ******************</span>
<span class="linecomment">;;  NOTE: Whenever you update Icicles (i.e., download new versions of</span>
<span class="linecomment">;;  Icicles source files), I recommend that you do the following:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;      1. Delete all existing byte-compiled Icicles files</span>
<span class="linecomment">;;         (icicles*.elc).</span>
<span class="linecomment">;;      2. Load Icicles (`load-library' or `require').</span>
<span class="linecomment">;;      3. Byte-compile the source files.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  In particular, always load `icicles-mac.el' (not</span>
<span class="linecomment">;;  `icicles-mac.elc') before you byte-compile new versions of the</span>
<span class="linecomment">;;  files, in case there have been any changes to Lisp macros (in</span>
<span class="linecomment">;;  `icicles-mac.el').</span>
<span class="linecomment">;;  ******************</span>
 
<span class="linecomment">;;(@&gt; "Index")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you have library `linkd.el' and Emacs 22 or later, load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections of this doc.  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index, as well as the cross-references and section</span>
<span class="linecomment">;;  headings throughout this file.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://dto.freeshell.org/notebook/Linkd.html.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  (@&gt; "Macros")</span>
<span class="linecomment">;;  (@&gt; "Functions")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 3, or (at your option)</span>
<span class="linecomment">;; any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street,</span>
<span class="linecomment">;; Fifth Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;; Byte-compiling this file, you will likely get some error or warning</span>
<span class="linecomment">;; messages. All of the following are benign.  They are due to</span>
<span class="linecomment">;; differences between different versions of Emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 20:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; the function x-focus-frame is not known to be defined.</span>

(eval-when-compile (when (&lt; emacs-major-version 21) (require 'cl))) <span class="linecomment">;; for Emacs &lt; 21: dolist, push</span>

<span class="linecomment">;; Quiet the byte compiler for Emacs versions before 22.  For some reason, a value is required.</span>
(unless (boundp 'minibuffer-completing-symbol)
  (defvar minibuffer-completing-symbol nil)
  (defvar minibuffer-message-timeout 2)
  (defvar minibuffer-prompt-properties nil))

<span class="linecomment">;; Quiet the byte-compiler.</span>
(defvar icicle-inhibit-try-switch-buffer)
(defvar read-file-name-completion-ignore-case)


<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Macros")</span>

<span class="linecomment">;;; Macros -----------------------------------------------------------</span>

(if (fboundp 'with-selected-window)     <span class="linecomment">; Emacs 22+</span>
    (defalias 'icicle-with-selected-window (symbol-function 'with-selected-window))
  (defmacro icicle-with-selected-window (window &rest body)
    "<span class="quote">Execute the forms in BODY with WINDOW as the selected window.
The value returned is the value of the last form in BODY.

This macro saves and restores the selected window, as well as the
selected window of each frame.  It does not change the order of
recently selected windows.  If the previously selected window of
some frame is no longer live at the end of BODY, that frame's
selected window is left alone.  If the selected window is no
longer live, then whatever window is selected at the end of BODY
remains selected.

This macro uses `save-current-buffer' to save and restore the
current buffer, since otherwise its normal operation could
potentially make a different buffer current.  It does not alter
the buffer list ordering.</span>"
    (when (fboundp 'declare) (declare (indent 1) (debug t)))
    <span class="linecomment">;; Most of this code is a copy of save-selected-window.</span>
    `(let ((save-selected-window-window  (selected-window))
           <span class="linecomment">;; It is necessary to save all of these, because calling</span>
           <span class="linecomment">;; select-window changes frame-selected-window for whatever</span>
           <span class="linecomment">;; frame that window is in.</span>
           (save-selected-window-alist   (mapcar #'(lambda (frame)
                                                     (list frame (frame-selected-window frame)))
                                          (frame-list))))
      (save-current-buffer
        (unwind-protect
             (progn (if (&gt; emacs-major-version 21)
                        (select-window ,window 'norecord) <span class="linecomment">; Emacs 22+</span>
                      (select-window ,window))
                    ,@body)
          (dolist (elt save-selected-window-alist)
            (and (frame-live-p (car elt))
                 (window-live-p (cadr elt))
                 (if (&gt; emacs-major-version 22)
                     (set-frame-selected-window (car elt) (cadr elt) 'norecord) <span class="linecomment">; Emacs 23+</span>
                   (set-frame-selected-window (car elt) (cadr elt)))))
          (when (window-live-p save-selected-window-window)
            (if (&gt; emacs-major-version 21)
                (select-window save-selected-window-window 'norecord) <span class="linecomment">; Emacs 22+</span>
              (select-window save-selected-window-window))))))))

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-add-to-alist-command (command doc-string construct-item-fn alist-var
                                              &optional dont-save)
  "<span class="quote">Define COMMAND that adds an item to an alist user option.
Any items with the same key are first removed from the alist.
DOC-STRING is the doc string of COMMAND.
CONSTRUCT-ITEM-FN is a function that constructs the new item.
  It reads user input.
ALIST-VAR is the alist user option.
Optional arg DONT-SAVE non-nil means do not call
`customize-save-variable' to save the updated variable.</span>"
  `(defun ,command ()
    ,(concat doc-string "<span class="quote">\n\nNote: Any items with the same key are first removed from the alist.</span>")
    (interactive)
    (let ((new-item  (funcall ,construct-item-fn)))
      (setq ,alist-var  (icicle-assoc-delete-all (car new-item) ,alist-var))
      (push new-item ,alist-var)
      ,(unless dont-save `(customize-save-variable ',alist-var ,alist-var))
      (message "<span class="quote">Added to `%s': `%S'</span>" ',alist-var new-item))))

(if (&gt; emacs-major-version 20)
    (defmacro icicle-buffer-bindings (&optional pre-bindings post-bindings)
      "<span class="quote">Bindings to use in multi-command definitions for buffer names.
PRE-BINDINGS is a list of additional bindings, which are created
before the others.  POST-BINDINGS is similar, but the bindings are
created after the others.</span>"
      `(,@pre-bindings
        (completion-ignore-case                      (or (and (boundp 'read-buffer-completion-ignore-case)
                                                          read-buffer-completion-ignore-case)
                                                      completion-ignore-case))
        (icicle-show-Completions-initially-flag      (or icicle-show-Completions-initially-flag
                                                      icicle-buffers-ido-like-flag))
        (icicle-top-level-when-sole-completion-flag  (or icicle-top-level-when-sole-completion-flag
                                                      icicle-buffers-ido-like-flag))
        (icicle-default-value                        (if (and icicle-buffers-ido-like-flag
                                                              icicle-default-value)
                                                         icicle-buffers-ido-like-flag
                                                       icicle-default-value))
        (icicle-must-match-regexp                    icicle-buffer-match-regexp)
        (icicle-must-not-match-regexp                icicle-buffer-no-match-regexp)
        (icicle-must-pass-after-match-predicate      icicle-buffer-predicate)
        (icicle-require-match-flag                   icicle-buffer-require-match-flag)
        (icicle-extra-candidates                     icicle-buffer-extras)
        (icicle-ignore-space-prefix-flag             icicle-buffer-ignore-space-prefix-flag)
        (icicle-delete-candidate-object              'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buf</span>
        (icicle-transform-function                   'icicle-remove-dups-if-extras)
        (icicle--temp-orders
         (append (list
                  '("<span class="quote">by last access</span>")   <span class="linecomment">; Renamed from "turned OFF'.</span>
                  '("<span class="quote">*...* last</span>" . icicle-buffer-sort-*...*-last)
                  '("<span class="quote">by buffer size</span>" . icicle-buffer-smaller-p)
                  '("<span class="quote">by major mode name</span>" . icicle-major-mode-name-less-p)
                  (and (fboundp 'icicle-mode-line-name-less-p)
                   '("<span class="quote">by mode-line mode name</span>" . icicle-mode-line-name-less-p))
                  '("<span class="quote">by file/process name</span>" . icicle-buffer-file/process-name-less-p))
          (delete '("<span class="quote">turned OFF</span>") (copy-sequence icicle-sort-orders-alist))))
        <span class="linecomment">;; Put `icicle-buffer-sort' first.  If already in the list, move it, else add it, to beginning.</span>
        (icicle-sort-orders-alist
         (progn (when (and icicle-buffer-sort-first-time-p icicle-buffer-sort)
                  (setq icicle-sort-comparer           icicle-buffer-sort
                        icicle-buffer-sort-first-time-p  nil))
                (if icicle-buffer-sort
                    (let ((already-there  (rassq icicle-buffer-sort icicle--temp-orders)))
                      (if already-there
                          (cons already-there (setq icicle--temp-orders
                                                    (delete already-there icicle--temp-orders)))
                        (cons `("<span class="quote">by `icicle-buffer-sort'</span>" . ,icicle-buffer-sort) icicle--temp-orders)))
                  icicle--temp-orders)))
        (icicle-candidate-alt-action-fn
         (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
        (icicle-all-candidates-list-alt-action-fn
         (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
        (icicle-bufflist
         (if current-prefix-arg
             (cond ((zerop (prefix-numeric-value current-prefix-arg))
                    (let ((this-mode  major-mode))
                      (icicle-remove-if-not #'(lambda (bf)
                                                (with-current-buffer bf (eq major-mode this-mode)))
                                            (buffer-list))))
                   ((&lt; (prefix-numeric-value current-prefix-arg) 0)
                    (cdr (assq 'buffer-list (frame-parameters))))
                   (t
                    (icicle-remove-if-not #'(lambda (bf) (buffer-file-name bf)) (buffer-list))))
           (buffer-list)))
        ,@post-bindings))

  <span class="linecomment">;; Emacs 20 has a bug that makes us use the obsolete backquote syntax instead of ,@post-bindings.</span>
  (defmacro icicle-buffer-bindings (&optional pre-bindings post-bindings)
    "<span class="quote">Bindings to use in multi-command definitions for buffer names.
PRE-BINDINGS is a list of additional bindings, which are created
before the others.  POST-BINDINGS is similar, but the bindings are
created after the others.</span>"
    (` ((,@ pre-bindings)
        (completion-ignore-case                      (or (and (boundp 'read-buffer-completion-ignore-case)
                                                              read-buffer-completion-ignore-case)
                                                         completion-ignore-case))
        (icicle-show-Completions-initially-flag      (or icicle-show-Completions-initially-flag
                                                         icicle-buffers-ido-like-flag))
        (icicle-top-level-when-sole-completion-flag  (or icicle-top-level-when-sole-completion-flag
                                                         icicle-buffers-ido-like-flag))
        (icicle-default-value                        (if (and icicle-buffers-ido-like-flag
                                                              icicle-default-value)
                                                         icicle-buffers-ido-like-flag
                                                       icicle-default-value))
        (icicle-must-match-regexp                    icicle-buffer-match-regexp)
        (icicle-must-not-match-regexp                icicle-buffer-no-match-regexp)
        (icicle-must-pass-after-match-predicate      icicle-buffer-predicate)
        (icicle-require-match-flag                   icicle-buffer-require-match-flag)
        (icicle-extra-candidates                     icicle-buffer-extras)
        (icicle-ignore-space-prefix-flag             icicle-buffer-ignore-space-prefix-flag)
        (icicle-delete-candidate-object              'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buf</span>
        (icicle-transform-function                   'icicle-remove-dups-if-extras)
        (icicle--temp-orders
         (append (list
                  '("<span class="quote">by last access</span>")   <span class="linecomment">; Renamed from "turned OFF'.</span>
                  '("<span class="quote">*...* last</span>" . icicle-buffer-sort-*...*-last)
                  '("<span class="quote">by buffer size</span>" . icicle-buffer-smaller-p)
                  '("<span class="quote">by major mode name</span>" . icicle-major-mode-name-less-p)
                  (and (fboundp 'icicle-mode-line-name-less-p)
                       '("<span class="quote">by mode-line mode name</span>" . icicle-mode-line-name-less-p))
                  '("<span class="quote">by file/process name</span>" . icicle-buffer-file/process-name-less-p))
                 (delete '("<span class="quote">turned OFF</span>") (copy-sequence icicle-sort-orders-alist))))
        <span class="linecomment">;; Put `icicle-buffer-sort' first.  If already in the list, move it, else add it, to beginning.</span>
        (icicle-sort-orders-alist
         (progn (when (and icicle-buffer-sort-first-time-p icicle-buffer-sort)
                  (setq icicle-sort-comparer           icicle-buffer-sort
                        icicle-buffer-sort-first-time-p  nil))
                (if icicle-buffer-sort
                    (let ((already-there  (rassq icicle-buffer-sort icicle--temp-orders)))
                      (if already-there
                          (cons already-there (setq icicle--temp-orders
                                                    (delete already-there icicle--temp-orders)))
                        (cons (` ("<span class="quote">by `icicle-buffer-sort'</span>" . (, icicle-buffer-sort))) icicle--temp-orders)))
                  icicle--temp-orders)))
        (icicle-candidate-alt-action-fn
         (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
        (icicle-all-candidates-list-alt-action-fn
         (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
        (icicle-bufflist
         (if current-prefix-arg
             (cond ((zerop (prefix-numeric-value current-prefix-arg))
                    (let ((this-mode  major-mode))
                      (icicle-remove-if-not #'(lambda (bf)
                                                (with-current-buffer bf (eq major-mode this-mode)))
                                            (buffer-list))))
                   ((&lt; (prefix-numeric-value current-prefix-arg) 0)
                    (cdr (assq 'buffer-list (frame-parameters))))
                   (t
                    (icicle-remove-if-not #'(lambda (bf) (buffer-file-name bf)) (buffer-list))))
           (buffer-list)))
        (,@ post-bindings)))))          <span class="linecomment">; Emacs 20 bug requires us to use obsolete backquote syntax here.</span>

(if (&gt; emacs-major-version 20)
    (defmacro icicle-file-bindings (&optional pre-bindings post-bindings)
      "<span class="quote">Bindings to use in multi-command definitions for file names.
PRE-BINDINGS is a list of additional bindings, which are created
before the others.  POST-BINDINGS is similar, but the bindings are
created after the others.</span>"
      `(,@pre-bindings
        (completion-ignore-case
         (or (and (boundp 'read-file-name-completion-ignore-case) read-file-name-completion-ignore-case)
          completion-ignore-case))
        (icicle-show-Completions-initially-flag      (or icicle-show-Completions-initially-flag
                                                      icicle-files-ido-like-flag))
        (icicle-top-level-when-sole-completion-flag  (or icicle-top-level-when-sole-completion-flag
                                                      icicle-files-ido-like-flag))
        (icicle-default-value                        (if (and icicle-files-ido-like-flag
                                                              icicle-default-value)
                                                         icicle-files-ido-like-flag
                                                       <span class="linecomment">;;  Get default via `M-n', but do not insert it.</span>
                                                       (and (memq icicle-default-value '(t nil))
                                                            icicle-default-value)))
        (icicle-must-match-regexp                    icicle-file-match-regexp)
        (icicle-must-not-match-regexp                icicle-file-no-match-regexp)
        (icicle-must-pass-after-match-predicate      icicle-file-predicate)
        (icicle-require-match-flag                   icicle-file-require-match-flag)
        (icicle-extra-candidates                     icicle-file-extras)
        (icicle-transform-function                   'icicle-remove-dups-if-extras)
        <span class="linecomment">;; Put `icicle-file-sort' first.  If already in the list, move it, else add it, to beginning.</span>
        (icicle--temp-orders                         (copy-sequence icicle-sort-orders-alist))
        (icicle-sort-orders-alist
         (progn (when (and icicle-file-sort-first-time-p icicle-file-sort)
                  (setq icicle-sort-comparer           icicle-file-sort
                        icicle-file-sort-first-time-p  nil))
                (if icicle-file-sort
                    (let ((already-there  (rassq icicle-file-sort icicle--temp-orders)))
                      (if already-there
                          (cons already-there (setq icicle--temp-orders
                                                    (delete already-there icicle--temp-orders)))
                        (cons `("<span class="quote">by `icicle-file-sort'</span>" . ,icicle-file-sort) icicle--temp-orders)))
                  icicle--temp-orders)))
        (icicle-ignore-space-prefix-flag             icicle-buffer-ignore-space-prefix-flag)
        (icicle-candidate-help-fn                    #'(lambda (cand)
                                                         (icicle-describe-file cand current-prefix-arg)))
        (icicle-candidate-alt-action-fn
         (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">file</span>")))
        (icicle-all-candidates-list-alt-action-fn
         (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">file</span>")))
        (icicle-delete-candidate-object              'icicle-delete-file-or-directory)
        ,@post-bindings))

  <span class="linecomment">;; Emacs 20 has a bug that makes us use the obsolete backquote syntax instead of ,@post-bindings.</span>
  (defmacro icicle-file-bindings (&optional pre-bindings post-bindings)
    "<span class="quote">Bindings to use in multi-command definitions for file names.
PRE-BINDINGS is a list of additional bindings, which are created
before the others.  POST-BINDINGS is similar, but the bindings are
created after the others.</span>"
    (` ((,@ pre-bindings)
        (completion-ignore-case
         (or (and (boundp 'read-file-name-completion-ignore-case) read-file-name-completion-ignore-case)
             completion-ignore-case))
        (icicle-show-Completions-initially-flag      (or icicle-show-Completions-initially-flag
                                                         icicle-files-ido-like-flag))
        (icicle-top-level-when-sole-completion-flag  (or icicle-top-level-when-sole-completion-flag
                                                         icicle-files-ido-like-flag))
        (icicle-default-value                        (if (and icicle-files-ido-like-flag
                                                              icicle-default-value)
                                                         icicle-files-ido-like-flag
                                                       <span class="linecomment">;;  Get default via `M-n', but do not insert it.</span>
                                                       (and (memq icicle-default-value '(t nil))
                                                            icicle-default-value)))
        (icicle-must-match-regexp                    icicle-file-match-regexp)
        (icicle-must-not-match-regexp                icicle-file-no-match-regexp)
        (icicle-must-pass-after-match-predicate      icicle-file-predicate)
        (icicle-require-match-flag                   icicle-file-require-match-flag)
        (icicle-extra-candidates                     icicle-file-extras)
        (icicle-transform-function                   'icicle-remove-dups-if-extras)
        <span class="linecomment">;; Put `icicle-file-sort' first.  If already in the list, move it, else add it, to beginning.</span>
        (icicle--temp-orders                         (copy-sequence icicle-sort-orders-alist))
        (icicle-sort-orders-alist
         (progn (when (and icicle-file-sort-first-time-p icicle-file-sort)
                  (setq icicle-sort-comparer           icicle-file-sort
                        icicle-file-sort-first-time-p  nil))
                (if icicle-file-sort
                    (let ((already-there  (rassq icicle-file-sort icicle--temp-orders)))
                      (if already-there
                          (cons already-there (setq icicle--temp-orders
                                                    (delete already-there icicle--temp-orders)))
                        (cons (` ("<span class="quote">by `icicle-file-sort'</span>" . (, icicle-file-sort))) icicle--temp-orders)))
                  icicle--temp-orders)))
        (icicle-ignore-space-prefix-flag             icicle-buffer-ignore-space-prefix-flag)
        (icicle-candidate-help-fn                    #'(lambda (cand)
                                                         (icicle-describe-file cand current-prefix-arg)))
        (icicle-candidate-alt-action-fn
         (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">file</span>")))
        (icicle-all-candidates-list-alt-action-fn
         (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">file</span>")))
        (icicle-delete-candidate-object              'icicle-delete-file-or-directory)
        (,@ post-bindings)))))          <span class="linecomment">; Emacs 20 bug requires us to use obsolete backquote syntax here.</span>

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-command
    (command doc-string function prompt collection &optional
     predicate require-match initial-input hist def inherit-input-method
     bindings first-sexp undo-sexp last-sexp not-interactive-p)
  <span class="linecomment">;; Hard-code these in doc string, because \\[...] prefers ASCII</span>
  <span class="linecomment">;; `C-RET'   instead of `\\[icicle-candidate-action]'</span>
  <span class="linecomment">;; `C-down'  instead of `\\[icicle-next-candidate-per-mode-action]'</span>
  <span class="linecomment">;; `C-up', `C-wheel-up' instead of `\\[icicle-previous-candidate-per-mode-action]'</span>
  <span class="linecomment">;; `C-next'  instead of `\\[icicle-next-apropos-candidate-action]'</span>
  <span class="linecomment">;; `C-prior' instead of `\\[icicle-previous-apropos-candidate-action]'</span>
  <span class="linecomment">;; `C-end'   instead of `\\[icicle-next-prefix-candidate-action]'</span>
  <span class="linecomment">;; `C-home'  instead of `\\[icicle-previous-prefix-candidate-action]'</span>
  "<span class="quote">Define COMMAND with DOC-STRING based on FUNCTION.
COMMAND is a symbol.  DOC-STRING is a string.
FUNCTION is a function that takes one argument, read as input.
  (If the argument to FUNCTION is a file name or directory name, then
  use macro `icicle-define-file-command', instead.)

BINDINGS is a list of `let*' bindings added around the command code.
  The following bindings are pre-included - you can refer to them in
  the command body (including in FIRST-SEXP, LAST-SEXP, UNDO-SEXP).

  `icicle-orig-buff'   is bound to (current-buffer)
  `icicle-orig-window' is bound to (selected-window)
BINDINGS is macroexpanded, so it can also be a macro call that expands
to a list of bindings.  For example, you can use
`icicle-buffer-bindings' here.

In case of user quit (`C-g') or error, an attempt is made to restore
the original buffer.

FIRST-SEXP is a sexp evaluated before the main body of the command.
UNDO-SEXP is a sexp evaluated in case of error or if the user quits.
LAST-SEXP is a sexp evaluated after the main body of the command.
NOT-INTERACTIVE-P non-nil means to define COMMAND as a non-interactive
 function that reads multi-command input.

Other arguments are as for `completing-read'.

In order, the created command does this:

 - Uses DOC-STRING, with information about Icicles bindings appended.
 - Binds BINDINGS for the rest of the command.
 - Evaluates FIRST-SEXP.
 - Reads input with `completing-read', using PROMPT, COLLECTION,
   PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST, DEF, and
   INHERIT-INPUT-METHOD.
 - Calls FUNCTION on the input that was read.
 - Evaluates UNDO-SEXP in case of error or if the user quits.
 - Evaluates LAST-SEXP.

The created command also binds `icicle-candidate-action-fn' to a
function that calls FUNCTION on the current completion candidate.
Note that the BINDINGS are of course not in effect within
`icicle-candidate-action-fn'.</span>"
  `(defun ,command ()
    ,(concat doc-string "<span class="quote">\n\nRead input, then </span>"
             (and (symbolp function) (concat "<span class="quote">call `</span>" (symbol-name function) "<span class="quote">'\nto </span>"))
             "<span class="quote">act on it.

Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

\\&lt;minibuffer-local-completion-map&gt;\
`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down', `C-wheel-down' - Move to next completion candidate and act
`C-up', `C-wheel-up' - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`\\[icicle-all-candidates-action]'     - Act on *all* candidates, successively (careful!)

When candidate action and cycling are combined (e.g. `C-next'), user
option `icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.

This is an Icicles command - see command `icicle-mode'.</span>")
    ,(and (not not-interactive-p) '(interactive))
    (let* ((icicle-orig-buff    (current-buffer))
           (icicle-orig-window  (selected-window))
           ,@(macroexpand bindings)
           (icicle-candidate-action-fn
            (lambda (candidate)
              (let ((minibuffer-completion-table      minibuffer-completion-table)
                    (minibuffer-completion-predicate  minibuffer-completion-predicate)
                    (minibuffer-completion-confirm    minibuffer-completion-confirm)
                    (minibuffer-completing-file-name  minibuffer-completing-file-name)
                    (minibuffer-completing-symbol     (and (boundp 'minibuffer-completing-symbol)
                                                           minibuffer-completing-symbol))
                    (minibuffer-exit-hook             minibuffer-exit-hook)
                    (minibuffer-help-form             minibuffer-help-form)
                    (minibuffer-history-variable      minibuffer-history-variable)
                    (minibuffer-history-case-insensitive-variables
                     minibuffer-history-case-insensitive-variables)
                    (minibuffer-history-sexp-flag     minibuffer-history-sexp-flag)
                    (minibuffer-message-timeout       (and (boundp 'minibuffer-message-timeout)
                                                           minibuffer-message-timeout))
                    (minibuffer-prompt-properties     (and (boundp 'minibuffer-prompt-properties)
                                                           minibuffer-prompt-properties))
                    (minibuffer-setup-hook            minibuffer-setup-hook)
                    (minibuffer-text-before-history   minibuffer-text-before-history))
                (condition-case in-action-fn
                    <span class="linecomment">;; Treat 3 cases, because previous use of `icicle-candidate-action-fn'</span>
                    <span class="linecomment">;; might have killed the buffer or deleted the window.</span>
                    (cond ((and (buffer-live-p icicle-orig-buff) (window-live-p icicle-orig-window))
                           (with-current-buffer icicle-orig-buff
                             (save-selected-window (select-window icicle-orig-window)
                                                   (funcall #',function candidate))))
                          ((window-live-p icicle-orig-window)
                           (save-selected-window (select-window icicle-orig-window)
                                                 (funcall #',function candidate)))
                          (t
                           (funcall #',function candidate)))
                  (error (unless (string= "<span class="quote">Cannot switch buffers in minibuffer window</span>"
                                          (error-message-string in-action-fn))
                           (error "<span class="quote">%s</span>" (error-message-string in-action-fn)))
                         (when (window-live-p icicle-orig-window)
                           (select-window icicle-orig-window)
                           (select-frame-set-input-focus (selected-frame)))
                         (funcall #',function candidate)))
                (select-window (minibuffer-window))
                (select-frame-set-input-focus (selected-frame))
                nil))))                 <span class="linecomment">; Return nil for success.</span>
      ,first-sexp
      (condition-case act-on-choice
          (let ((cmd-choice  (completing-read ,prompt ,collection ,predicate ,require-match
                                              ,initial-input ,hist ,def ,inherit-input-method)))
            <span class="linecomment">;; Reset after reading input, so that commands can tell whether input has been read.</span>
            (setq icicle-candidate-action-fn  nil)
            (funcall #',function cmd-choice))
        (quit  (icicle-try-switch-buffer icicle-orig-buff) ,undo-sexp)
        (error (icicle-try-switch-buffer icicle-orig-buff) ,undo-sexp
               (error "<span class="quote">%s</span>" (error-message-string act-on-choice))))
      ,last-sexp)))

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-file-command
    (command doc-string function prompt &optional
     dir default-filename require-match initial-input predicate
     bindings first-sexp undo-sexp last-sexp not-interactive-p)
  <span class="linecomment">;; Hard-code these in doc string, because \\[...] prefers ASCII</span>
  <span class="linecomment">;; `C-RET'   instead of `\\[icicle-candidate-action]'</span>
  <span class="linecomment">;; `C-down'  instead of `\\[icicle-next-candidate-per-mode-action]'</span>
  <span class="linecomment">;; `C-up', `C-wheel-up' instead of `\\[icicle-previous-candidate-per-mode-action]'</span>
  <span class="linecomment">;; `C-next'  instead of `\\[icicle-next-apropos-candidate-action]'</span>
  <span class="linecomment">;; `C-prior' instead of `\\[icicle-previous-apropos-candidate-action]'</span>
  <span class="linecomment">;; `C-end'   instead of `\\[icicle-next-prefix-candidate-action]'</span>
  <span class="linecomment">;; `C-home'  instead of `\\[icicle-previous-prefix-candidate-action]'</span>
  "<span class="quote">Define COMMAND with DOC-STRING based on FUNCTION.
COMMAND is a symbol.  DOC-STRING is a string.
FUNCTION is a function that takes one file-name or directory-name
argument, read as input.  (Use macro `icicle-define-command' for a
FUNCTION whose argument is not a file or directory name.)

BINDINGS is a list of `let*' bindings added around the command code.
  The following bindings are pre-included - you can refer to them in
  the command body (including in FIRST-SEXP, LAST-SEXP, UNDO-SEXP).

  `icicle-orig-buff'   is bound to (current-buffer)
  `icicle-orig-window' is bound to (selected-window)
BINDINGS is macroexpanded, so it can also be a macro call that expands
to a list of bindings.  For example, you can use
`icicle-buffer-bindings' or `icicle-file-bindings' here.

In case of user quit (`C-g') or error, an attempt is made to restore
the original buffer.

FIRST-SEXP is a sexp evaluated before the main body of the command.
UNDO-SEXP is a sexp evaluated in case of error or if the user quits.
LAST-SEXP is a sexp evaluated after the main body of the command.
NOT-INTERACTIVE-P non-nil means to define COMMAND as a non-interactive
 function that reads multi-command input.

Other arguments are as for `read-file-name'.

In order, the created command does this:

 - Uses DOC-STRING, with information about Icicles bindings appended.
 - Binds BINDINGS for the rest of the command.
 - Evaluates FIRST-SEXP.
 - Reads input with `read-file-name', using PROMPT, DIR,
   DEFAULT-FILENAME, REQUIRE-MATCH, INITIAL-INPUT, and PREDICATE.
 - Calls FUNCTION on the input that was read.
 - Evaluates UNDO-SEXP in case of error or if the user quits.
 - Evaluates LAST-SEXP.

The created command also binds `icicle-candidate-action-fn' to a
function that calls FUNCTION on the current completion candidate.
Note that the BINDINGS are of course not in effect within
`icicle-candidate-action-fn'.</span>"
  `(defun ,command ()
    ,(concat doc-string "<span class="quote">\n\nRead input, then </span>"
             (and (symbolp function) (concat "<span class="quote">call `</span>" (symbol-name function) "<span class="quote">'\nto </span>"))
             "<span class="quote">act on it.

Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

\\&lt;minibuffer-local-completion-map&gt;\
`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down', `C-wheel-down' - Move to next completion candidate and act
`C-up', `C-wheel-up' - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`\\[icicle-all-candidates-action]'     - Act on *all* candidates, successively (careful!)

When candidate action and cycling are combined (e.g. `C-next'), user
option `icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.

This is an Icicles command - see command `icicle-mode'.</span>")
    ,(and (not not-interactive-p) '(interactive))
    (let* ((icicle-orig-buff    (current-buffer))
           (icicle-orig-window  (selected-window))
           ,@(macroexpand bindings)
           (icicle-candidate-action-fn
            (lambda (candidate)
              (let ((minibuffer-completion-table      minibuffer-completion-table)
                    (minibuffer-completion-predicate  minibuffer-completion-predicate)
                    (minibuffer-completion-confirm    minibuffer-completion-confirm)
                    (minibuffer-completing-file-name  minibuffer-completing-file-name)
                    (minibuffer-completing-symbol     (and (boundp 'minibuffer-completing-symbol)
                                                           minibuffer-completing-symbol))
                    (minibuffer-exit-hook             minibuffer-exit-hook)
                    (minibuffer-help-form             minibuffer-help-form)
                    (minibuffer-history-variable      minibuffer-history-variable)
                    (minibuffer-history-case-insensitive-variables
                     minibuffer-history-case-insensitive-variables)
                    (minibuffer-history-sexp-flag     minibuffer-history-sexp-flag)
                    (minibuffer-message-timeout       (and (boundp 'minibuffer-message-timeout)
                                                           minibuffer-message-timeout))
                    (minibuffer-prompt-properties     (and (boundp 'minibuffer-prompt-properties)
                                                           minibuffer-prompt-properties))
                    (minibuffer-setup-hook            minibuffer-setup-hook)
                    (minibuffer-text-before-history   minibuffer-text-before-history))
                (setq candidate  (expand-file-name
                                  candidate (icicle-file-name-directory icicle-last-input)))
                (condition-case in-action-fn
                    <span class="linecomment">;; Treat 3 cases, because previous use of `icicle-candidate-action-fn'</span>
                    <span class="linecomment">;; might have deleted the file or the window.</span>
                    (cond ((and (buffer-live-p icicle-orig-buff) (window-live-p icicle-orig-window))
                           (with-current-buffer icicle-orig-buff
                             (save-selected-window (select-window icicle-orig-window)
                                                   (funcall #',function candidate))))
                          ((window-live-p icicle-orig-window)
                           (save-selected-window (select-window icicle-orig-window)
                                                 (funcall #',function candidate)))
                          (t
                           (funcall #',function candidate)))
                  (error (unless (string= "<span class="quote">Cannot switch buffers in minibuffer window</span>"
                                          (error-message-string in-action-fn))
                           (error "<span class="quote">%s</span>" (error-message-string in-action-fn)))
                         (when (window-live-p icicle-orig-window)
                           (select-window icicle-orig-window)
                           (select-frame-set-input-focus (selected-frame)))
                         (funcall #',function candidate)))
                (select-window (minibuffer-window))
                (select-frame-set-input-focus (selected-frame))
                nil))))                 <span class="linecomment">; Return nil for success.</span>
      ,first-sexp
      (condition-case act-on-choice
          (let ((file-choice
                 (if (&lt; emacs-major-version 21) <span class="linecomment">; No predicate arg for Emacs 20.</span>
                     (read-file-name ,prompt ,dir ,default-filename ,require-match ,initial-input)
                   (read-file-name ,prompt ,dir ,default-filename ,require-match
                                   ,initial-input ,predicate))))
            <span class="linecomment">;; Reset after reading input, so that commands can tell whether input has been read.</span>
            (setq icicle-candidate-action-fn  nil) <span class="linecomment">; Reset after completion.</span>
            (funcall #',function file-choice))
        (quit  (icicle-try-switch-buffer icicle-orig-buff) ,undo-sexp)
        (error (icicle-try-switch-buffer icicle-orig-buff) ,undo-sexp
               (error "<span class="quote">%s</span>" (error-message-string act-on-choice))))
      ,last-sexp)))

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-sort-command (sort-order comparison-fn doc-string)
  "<span class="quote">Define a command to sort completions by SORT-ORDER.
SORT-ORDER is a short string (or symbol) describing the sort order.
 It is used after the phrase \"Sorting is now \".  Examples: \"by date\",
 \"alphabetically\", \"directories first\", and \"previously used first\".

The new command is named by replacing any spaces in SORT-ORDER with
hyphens (`-') and then adding the prefix `icicle-sort-'.

COMPARISON-FN is a function that compares two strings, returning
 non-nil if and only if the first string sorts before the second.

DOC-STRING is the doc string of the new command.</span>"
  (unless (stringp sort-order) (setq sort-order  (symbol-name sort-order)))
  (let ((command  (intern (concat "<span class="quote">icicle-sort-</span>"
                                  (replace-regexp-in-string "<span class="quote">\\s-+</span>" "<span class="quote">-</span>" sort-order)))))
    `(progn
      (setq icicle-sort-orders-alist  (icicle-assoc-delete-all
                                       ,sort-order
                                       icicle-sort-orders-alist))
      (push (cons ,sort-order ',comparison-fn) icicle-sort-orders-alist)
      (defun ,command ()
        ,doc-string
        (interactive)
        (setq icicle-sort-comparer  #',comparison-fn)
        (message "<span class="quote">Sorting is now %s%s</span>" ,sort-order (if icicle-reverse-sort-p "<span class="quote">, REVERSED</span>" "<span class="quote"></span>"))
        (icicle-complete-again-update)))))
 
<span class="linecomment">;;(@* "Functions")</span>

<span class="linecomment">;;; Functions --------------------------------------------------------</span>

(defun icicle-assoc-delete-all (key alist)
  "<span class="quote">Delete from ALIST all elements whose car is `equal' to KEY.
Return the modified alist.
Elements of ALIST that are not conses are ignored.</span>"
  (while (and (consp (car alist)) (equal (car (car alist)) key))
    (setq alist  (cdr alist)))
  (let ((tail  alist)  tail-cdr)
    (while (setq tail-cdr  (cdr tail))
      (if (and (consp (car tail-cdr))  (equal (car (car tail-cdr)) key))
          (setcdr tail (cdr tail-cdr))
        (setq tail  tail-cdr))))
  alist)

(defun icicle-try-switch-buffer (buffer)
  "<span class="quote">Try to switch to BUFFER, first in same window, then in other window.</span>"
  (when (and (buffer-live-p buffer) (not icicle-inhibit-try-switch-buffer))
    (condition-case err-switch-to
        (switch-to-buffer buffer)
      (error (and (string= "<span class="quote">Cannot switch buffers in minibuffer window</span>"
                           (error-message-string err-switch-to))
                  <span class="linecomment">;; Try another window.  Don't bother if the buffer to switch to is a minibuffer.</span>
                  (condition-case err-switch-other
                      (unless (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>" (buffer-name buffer))
                        (switch-to-buffer-other-window buffer))
                    (error (error-message-string err-switch-other))))))))

(unless (fboundp 'select-frame-set-input-focus) <span class="linecomment">; Defined in Emacs 22.</span>
  (defun select-frame-set-input-focus (frame)
    "<span class="quote">Select FRAME, raise it, and set input focus, if possible.</span>"
    (select-frame frame)
    (raise-frame frame)
    <span class="linecomment">;; Ensure, if possible, that frame gets input focus.</span>
    (cond ((eq window-system 'x) (x-focus-frame frame))
          ((eq window-system 'w32) (w32-focus-frame frame)))
    (cond (focus-follows-mouse (set-mouse-position (selected-frame) (1- (frame-width)) 0)))))


<span class="linecomment">;;; Miscellaneous  -----------------------------------------</span>

<span class="linecomment">;; Make Emacs-Lisp mode fontify definitions of Icicles commands.</span>
(font-lock-add-keywords
 'emacs-lisp-mode
 `((,(concat "<span class="quote">(</span>" (regexp-opt '("<span class="quote">icicle-define-add-to-alist-command</span>" "<span class="quote">icicle-define-command</span>"
                               "<span class="quote">icicle-define-file-command</span>" "<span class="quote">icicle-define-sort-command</span>")
                             t)
             <span class="linecomment">;; $$ "\\s-+\\(\\sw\\(\\sw\\|\\s_\\)+\\)")</span>
             "<span class="quote">\\&gt;[ \t'\(]*\\(\\sw+\\)?</span>")
    (1 font-lock-keyword-face)
    <span class="linecomment">;; Index (2 or 3) depends on whether or not shy groups are supported.</span>
    ,(list (if (string-match "<span class="quote">\\(?:\\)</span>" "<span class="quote"></span>") 2 3) font-lock-function-name-face nil t))))

<span class="linecomment">;; This is commented out, but you might also want to use it or something similar.  I use it in</span>
<span class="linecomment">;; my init file.  The `icicle-define-*' lines cause doc strings to be indented correctly.</span>
<span class="linecomment">;; (defun lisp-indentation-hack ()</span>
<span class="linecomment">;;   "Better Lisp indenting.  Use in Lisp mode hooks</span>
<span class="linecomment">;; such as `lisp-mode-hook', `emacs-lisp-mode-hook', and</span>
<span class="linecomment">;; `lisp-interaction-mode-hook'."</span>
<span class="linecomment">;;   (unless (assoc "cl-indent" load-history) (load "cl-indent" nil t))</span>
<span class="linecomment">;;   (set (make-local-variable 'lisp-indent-function) 'common-lisp-indent-function)</span>
<span class="linecomment">;;   (setq lisp-indent-maximum-backtracking  10)</span>
<span class="linecomment">;;   (put 'define-derived-mode 'common-lisp-indent-function '(4 4 4 2 &body))</span>
<span class="linecomment">;;   (put 'if 'common-lisp-indent-function '(nil nil &body))</span>
<span class="linecomment">;;   (put 'icicle-define-command 'common-lisp-indent-function '(4 &body))</span>
<span class="linecomment">;;   (put 'icicle-define-file-command 'common-lisp-indent-function '(4 &body))</span>
<span class="linecomment">;;   (put 'icicle-define-sort-command 'common-lisp-indent-function '(4 4 &body))</span>
<span class="linecomment">;;   (put 'icicle-define-add-to-alist-command 'common-lisp-indent-function '(4 &body)))</span>

<span class="linecomment">;; (add-hook 'emacs-lisp-mode-hook 'lisp-indentation-hack)</span>
<span class="linecomment">;; (add-hook 'lisp-mode-hook             'lisp-indentation-hack)</span>
<span class="linecomment">;; (add-hook 'lisp-interaction-mode-hook 'lisp-indentation-hack)</span>


<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-mac)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-mac.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-mac.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mac.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-mac.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-mac.el">Administration</a></span><span class="time"><br /> Last edited 2011-06-24 18:44 UTC by <a class="author" title="from 148.87.67.197" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-mac.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
