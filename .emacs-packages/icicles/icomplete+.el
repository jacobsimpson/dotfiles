<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icomplete+.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icomplete%2b.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icomplete+.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icomplete%2b.el" />
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
      title="Changes for icomplete+.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icomplete%2b.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icomplete%2b.el%22">icomplete+.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/icomplete%2b.el">Download</a></p><pre class="code"><span class="linecomment">;;; icomplete+.el --- Extensions to `icomplete.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icomplete+.el</span>
<span class="linecomment">;; Description: Extensions to `icomplete.el'.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Oct 16 13:33:18 1995</span>
<span class="linecomment">;; Version: 21.0</span>
<span class="linecomment">;; Last-Updated: Sun Jun  5 09:29:14 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 921</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icomplete+.el</span>
<span class="linecomment">;; Keywords: help, abbrev, internal, extensions, local</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `icomplete'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Extensions to `icomplete.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Faces defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icompletep-choices', `icompletep-determined',</span>
<span class="linecomment">;;    `icompletep-keys', `icompletep-nb-candidates'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User option defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icompletep-prospects-length'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Macros defined here (but identical to those in Emacs 23):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `with-local-quit', `with-no-input'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `icomplete.el'</span>
<span class="linecomment">;;              have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icomplete-completions' -</span>
<span class="linecomment">;;       Prepends total number of candidates.</span>
<span class="linecomment">;;       Sorts alternatives alphabetically, uses different face.</span>
<span class="linecomment">;;       Highlights key-binding text.</span>
<span class="linecomment">;;       Appends number of remaining cycle candidates (for Icicles).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icomplete-exhibit' -</span>
<span class="linecomment">;;       Saves match-data.</span>
<span class="linecomment">;;       Doesn't insert if input begins with `('</span>
<span class="linecomment">;;         (e.g. `repeat-complex-command').</span>
<span class="linecomment">;;       Ensures that the insertion doesn't deactivate mark.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This file should be loaded after loading the standard GNU file</span>
<span class="linecomment">;;  `icomplete.el'.  So, in your `~/.emacs' file, do this:</span>
<span class="linecomment">;;  (eval-after-load "icomplete" '(progn (require 'icomplete+)))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2011/06/05 dadams</span>
<span class="linecomment">;;     icomplete-completions: Handle Emacs 24's new METADATA arg for completion-try-completion.</span>
<span class="linecomment">;; 2011/01/04 dadams</span>
<span class="linecomment">;;     Removed autoload cookies from non def* sexps.  Added them for defgroup, defface.</span>
<span class="linecomment">;; 2010/07/29 dadams</span>
<span class="linecomment">;;     with-local-quit, with-no-input: Protect declare with fboundp.</span>
<span class="linecomment">;; 2009/08/06 dadams</span>
<span class="linecomment">;;     icomplete-completions (Emacs &lt; 23): Bind, don't set, to initialize nb-candidates.</span>
<span class="linecomment">;; 2008/06/01 dadams</span>
<span class="linecomment">;;     icomplete-completions (Emacs 23): Set candidates to nil if ((nil)).</span>
<span class="linecomment">;;     Commented out vanilla Emacs code that's not used (last, base-size).</span>
<span class="linecomment">;; 2008/05/30 dadams</span>
<span class="linecomment">;;     Updated for Emacs 23 - complete rewrite.</span>
<span class="linecomment">;;       Added: macros with-local-quit and with-no-input.</span>
<span class="linecomment">;;       Added and adapted icomplete-exhibit and icomplete-completions for Emacs 23.</span>
<span class="linecomment">;;     icompletep-prospects-length: Use only for Emacs &lt; 23.</span>
<span class="linecomment">;;     icomplete-exhibit: Removed vestigial test of icicle-apropos-completing-p.</span>
<span class="linecomment">;; 2006/07/30 dadams</span>
<span class="linecomment">;;     icomplete-exhibit: Save match-data.</span>
<span class="linecomment">;; 2006/07/16 dadams</span>
<span class="linecomment">;;     Added dark-background face suggestions from Le Wang - thx.</span>
<span class="linecomment">;; 2006/06/18 dadams</span>
<span class="linecomment">;;      icomplete-exhibit: Don't insert if Icicles apropos-completing.</span>
<span class="linecomment">;; 2006/01/07 dadams</span>
<span class="linecomment">;;      Added :link for sending bug report.</span>
<span class="linecomment">;; 2006/01/06 dadams</span>
<span class="linecomment">;;      Added defgroup.  Added :link.</span>
<span class="linecomment">;;      Renamed: prefix icomplete- to icompletep-.</span>
<span class="linecomment">;; 2005/12/18 dadams</span>
<span class="linecomment">;;     Renamed faces without "-face".</span>
<span class="linecomment">;;     Use defface.  Removed require of def-face-const.el.</span>
<span class="linecomment">;;     icomplete-prospects-length: defvar -&gt; defcustom.</span>
<span class="linecomment">;; 2005/09/30 dadams</span>
<span class="linecomment">;;     Commented out redefinitions of primitives, so no longer reset</span>
<span class="linecomment">;;       minibuffer-completion-table to nil. Leaving the commented code in for now.</span>
<span class="linecomment">;; 2005/08/16 dadams</span>
<span class="linecomment">;;     icomplete-completions: If icicles.el is loaded, change no-match message slightly.</span>
<span class="linecomment">;; 2005/07/24 dadams</span>
<span class="linecomment">;;     icomplete-exhibit: Set deactivate-mark to nil at end.</span>
<span class="linecomment">;;     Remove commented Emacs 19 code at end.</span>
<span class="linecomment">;; 2005/07/19 dadams</span>
<span class="linecomment">;;     Added: icomplete-nb-candidates-face.</span>
<span class="linecomment">;;     icomplete-completions: Add number of icomplete candidates.</span>
<span class="linecomment">;;                            Append number of other cycle candidates (icicle).</span>
<span class="linecomment">;; 2005/05/29 dadams</span>
<span class="linecomment">;;     read-from-minibuffer: Updated to deal with new arg in Emacs 22.</span>
<span class="linecomment">;; 2004/12/02 dadams</span>
<span class="linecomment">;;     Highlight keys (icomplete-completions).</span>
<span class="linecomment">;; 2004/09/21 dadams</span>
<span class="linecomment">;;     Removed (icomplete-mode 99) at end.</span>
<span class="linecomment">;; 2004/04/13 dadams</span>
<span class="linecomment">;;     I'm not sure that some of the "enhancements" here are still</span>
<span class="linecomment">;;     needed.  This code was written long ago.  In particular, I'm not</span>
<span class="linecomment">;;     sure that the changes to `icomplete-exhibit' and the</span>
<span class="linecomment">;;     redefinitions of the Emacs primitives are needed.  Even if they</span>
<span class="linecomment">;;     are not needed, I'm leaving them in, as they are benign :).</span>
<span class="linecomment">;; 1995/12/15 dadams</span>
<span class="linecomment">;;     Defined replacements that reset minibuffer-completion-table to avoid</span>
<span class="linecomment">;;     icompletion: read-string, read-from-minibuffer, read-no-blanks-input.</span>
<span class="linecomment">;; 1995/11/30 dadams</span>
<span class="linecomment">;;     Added redefinition of yes-or-no-p.</span>
<span class="linecomment">;; 1995/10/17 dadams</span>
<span class="linecomment">;;     1) Added icomplete-choices-face and icomplete-determined-face.</span>
<span class="linecomment">;;     2) Redefined icomplete-exhibit: Doesn't insert if input</span>
<span class="linecomment">;;        begins with `('  (e.g. repeat-complex-command).</span>
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

(require 'icomplete)

<span class="linecomment">;; Quiet the byte-compiler.</span>
(defvar icomplete-eoinput)
(defvar icompletep-prospects-length)
(defvar icicle-nb-of-other-cycle-candidates)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;;;###autoload</span>
(defgroup Icomplete-Plus nil
  "<span class="quote">Icomplete Enhancements.</span>"
  :prefix "<span class="quote">icompletep-</span>"
  :group 'completion :group 'convenience :group 'matching :group 'minibuffer
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
icomplete+.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icomplete+.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/IcompleteMode#IcompleteModePlus</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Commentary</span>" "<span class="quote">icomplete+</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defface icompletep-choices
    '((((background dark)) (:foreground "<span class="quote">Snow4</span>"))
      (t (:foreground "<span class="quote">DarkBlue</span>")))
  "<span class="quote">*Face for minibuffer reminder of possible completion suffixes.</span>"
  :group 'Icomplete-Plus)

<span class="linecomment">;;;###autoload</span>
(defface icompletep-determined
    '((t (:foreground "<span class="quote">SeaGreen</span>")))
  "<span class="quote">*Face for minibuffer reminder of possible completion prefix.</span>"
  :group 'Icomplete-Plus)

<span class="linecomment">;;;###autoload</span>
(defface icompletep-nb-candidates
  '((((background dark)) (:foreground "<span class="quote">SpringGreen</span>"))
    (t (:foreground "<span class="quote">DarkMagenta</span>")))
  "<span class="quote">*Face for minibuffer reminder of number of completion candidates.
This has no effect unless library `icicles.el' is being used.</span>"
  :group 'Icomplete-Plus)

<span class="linecomment">;;;###autoload</span>
(defface icompletep-keys
    '((t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">*Face for minibuffer reminder of possible completion key bindings.</span>"
  :group 'Icomplete-Plus)

(when (&lt; emacs-major-version 23)
  (defcustom icompletep-prospects-length 100 <span class="linecomment">; Default was 80</span>
    "<span class="quote">*Length of string displaying icompletion candidates.</span>"
    :type 'integer :group 'Icomplete-Plus))

<span class="linecomment">;;; Quiet the byte-compiler.</span>
(defvar icomplete-overlay)
(defvar icomplete-prospects-height)



<span class="linecomment">;; REPLACES ORIGINAL defined in `icomplete.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Save match-data.</span>
<span class="linecomment">;; Don't insert if input begins with `(' (e.g. `repeat-complex-command').</span>
<span class="linecomment">;;</span>
(when (&lt; emacs-major-version 23)        <span class="linecomment">; Emacs 20, 21, 22.</span>
  (defun icomplete-exhibit ()
    "<span class="quote">Insert icomplete completions display.
Should be run via minibuffer `post-command-hook'.
See `icomplete-mode' and `minibuffer-setup-hook'.</span>"
    (when (icomplete-simple-completing-p)
      (save-match-data
        (let* ((minibuf-begin (if (&lt; emacs-major-version 21)
                                  (point-min)
                                (minibuffer-prompt-end)))
               (contents (buffer-substring minibuf-begin (point-max)))
               (buffer-undo-list t))
          (save-excursion
            (goto-char (point-max))
            <span class="linecomment">;; Register the end of input, so we know where the extra stuff</span>
            <span class="linecomment">;; (match-status info) begins:</span>
            (unless (boundp 'icomplete-eoinput)
              <span class="linecomment">;; In case it got wiped out by major mode business:</span>
              (make-local-variable 'icomplete-eoinput))
            (setq icomplete-eoinput (point))
            <span class="linecomment">;; Insert the match-status information:</span>
            (when (and (&gt; (point-max) minibuf-begin)
                       (save-excursion  <span class="linecomment">; Do nothing if looking at a list, string, etc.</span>
                         (goto-char minibuf-begin)
                         (not (looking-at <span class="linecomment">; No (, ", ', 9 etc. at start.</span>
                               "<span class="quote">\\(\\s-+$\\|\\s-*\\(\\s(\\|\\s\"\\|\\s'\\|\\s&lt;\\|[0-9]\\)\\)</span>")))
                       (or
                        <span class="linecomment">;; Don't bother with delay after certain number of chars:</span>
                        (&gt; (point-max) icomplete-max-delay-chars)
                        <span class="linecomment">;; Don't delay if alternatives number is small enough:</span>
                        (if minibuffer-completion-table
                            (cond ((numberp minibuffer-completion-table)
                                   (&lt; minibuffer-completion-table
                                      icomplete-delay-completions-threshold))
                                  ((sequencep minibuffer-completion-table)
                                   (&lt; (length minibuffer-completion-table)
                                      icomplete-delay-completions-threshold))
                                  ))
                        <span class="linecomment">;; Delay - give some grace time for next keystroke, before</span>
                        <span class="linecomment">;; embarking on computing completions:</span>
                        (sit-for icomplete-compute-delay)))
              (insert
               (icomplete-completions contents minibuffer-completion-table
                                      minibuffer-completion-predicate
                                      (not minibuffer-completion-confirm)))))
          (setq deactivate-mark nil)))))) <span class="linecomment">; Don't let the insert deactivate the mark.</span>


<span class="linecomment">;;; These two macros are defined in `subr.el' for Emacs 23+.</span>
<span class="linecomment">;;; They are included here only so you can, if needed, byte-compile this file using Emacs &lt; 23</span>
<span class="linecomment">;;; and still use the byte-compiled file in Emacs 23+.</span>
(defmacro with-local-quit (&rest body)
  "<span class="quote">Execute BODY, allowing quits to terminate BODY but not escape further.
When a quit terminates BODY, `with-local-quit' returns nil but
requests another quit.  That quit will be processed as soon as quitting
is allowed once again.  (Immediately, if `inhibit-quit' is nil.)</span>"
  (when (fboundp 'declare) (declare (debug t) (indent 0)))
  `(condition-case nil
    (let ((inhibit-quit nil))
      ,@body)
    (quit (setq quit-flag t)
     <span class="linecomment">;; This call is to give a chance to handle quit-flag</span>
     <span class="linecomment">;; in case inhibit-quit is nil.</span>
     <span class="linecomment">;; Without this, it will not be handled until the next function</span>
     <span class="linecomment">;; call, and that might allow it to exit thru a condition-case</span>
     <span class="linecomment">;; that intends to handle the quit signal next time.</span>
     (eval '(ignore nil)))))

(defmacro while-no-input (&rest body)   <span class="linecomment">; Defined in `subr.el'.</span>
  "<span class="quote">Execute BODY only as long as there's no pending input.
If input arrives, that ends the execution of BODY,
and `while-no-input' returns t.  Quitting makes it return nil.
If BODY finishes, `while-no-input' returns whatever value BODY produced.</span>"
  (when (fboundp 'declare) (declare (debug t) (indent 0)))
  (let ((catch-sym (make-symbol "<span class="quote">input</span>")))
    `(with-local-quit
      (catch ',catch-sym
        (let ((throw-on-input ',catch-sym))
          (or (input-pending-p)
              (progn ,@body)))))))



<span class="linecomment">;; REPLACES ORIGINAL defined in `icomplete.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Save match-data.</span>
<span class="linecomment">;; Don't insert if input begins with `(' (e.g. `repeat-complex-command').</span>
<span class="linecomment">;;</span>
(when (&gt; emacs-major-version 22)        <span class="linecomment">; Emacs 23+</span>
  (defun icomplete-exhibit ()
  "<span class="quote">Insert icomplete completions display.
Should be run via minibuffer `post-command-hook'.  See `icomplete-mode'
and `minibuffer-setup-hook'.</span>"
  (when (and icomplete-mode (icomplete-simple-completing-p))
    (save-excursion
      (goto-char (point-max))
      <span class="linecomment">;; Insert the match-status information.</span>
      (when (and (&gt; (point-max) (minibuffer-prompt-end))
                 buffer-undo-list       <span class="linecomment">; Wait for some user input.</span>
                 (save-excursion <span class="linecomment">; Do nothing if looking at a list, string, etc.</span>
                   (goto-char (minibuffer-prompt-end))
                   (save-match-data
                     (not (looking-at   <span class="linecomment">; No (, ", ', 9 etc. at start.</span>
                           "<span class="quote">\\(\\s-+$\\|\\s-*\\(\\s(\\|\\s\"\\|\\s'\\|\\s&lt;\\|[0-9]\\)\\)</span>"))))
                 (or
                  <span class="linecomment">;; Don't bother with delay after certain number of chars:</span>
                  (&gt; (- (point) (field-beginning)) icomplete-max-delay-chars)
                  <span class="linecomment">;; Don't delay if alternatives number is small enough:</span>
                  (and (sequencep minibuffer-completion-table)
                       (&lt; (length minibuffer-completion-table)
                          icomplete-delay-completions-threshold))
                  <span class="linecomment">;; Delay - give some grace time for next keystroke, before</span>
                  <span class="linecomment">;; embarking on computing completions:</span>
                  (sit-for icomplete-compute-delay)))
        (let ((text             (while-no-input
                                  (icomplete-completions
                                   (field-string)
                                   minibuffer-completion-table
                                   minibuffer-completion-predicate
                                   (not minibuffer-completion-confirm))))
              (buffer-undo-list t)
              deactivate-mark)
          <span class="linecomment">;; Do nothing if `while-no-input' was aborted.</span>
          (when (stringp text)
            (move-overlay icomplete-overlay (point) (point) (current-buffer))
            <span class="linecomment">;; The current C cursor code doesn't know to use the overlay's</span>
            <span class="linecomment">;; marker's stickiness to figure out whether to place the cursor</span>
            <span class="linecomment">;; before or after the string, so let's spoon-feed it the pos.</span>
            (put-text-property 0 1 'cursor t text)
            (overlay-put icomplete-overlay 'after-string text))))))))



<span class="linecomment">;; REPLACES ORIGINAL defined in `icomplete.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Prepends total number of candidates.</span>
<span class="linecomment">;; 2. Sorts alternatives, puts them in a different face, and separates them more.</span>
<span class="linecomment">;; 3. Highlights key-binding text.</span>
<span class="linecomment">;; 4. Appends number of remaining cycle candidates (for Icicles).</span>
<span class="linecomment">;;</span>
(when (&lt; emacs-major-version 23)        <span class="linecomment">; Emacs 20, 21, 22.</span>
  (defun icomplete-completions (name candidates predicate require-match)
    "<span class="quote">Identify prospective candidates for minibuffer completion.
NAME is the name to complete.
CANDIDATES are the candidates to match.
PREDICATE filters matches: they succeed only if this returns non-nil.
REQUIRE-MATCH non-nil means the input must match a candidate.

The display is updated with each minibuffer keystroke during
minibuffer completion.

Prospective completion suffixes (if any) are displayed, bracketed by
\"()\", \"[]\", or \"{}\".  The choice of brackets is as follows:

  \(...) - A single prospect is identified and matching is enforced.
  \[...] - A single prospect is identified and matching is optional.
  \{...} - Multiple prospects are indicated, and further input is
          needed to distinguish a single one.

The displays for unambiguous matches have \" [ Matched ]\" appended
\(whether complete or not), or \" \[ No match ]\", if no eligible
matches exist.
Keybindings for uniquely matched commands are displayed within the [].

When more than one completion is available, the total number precedes
the suffixes display, like this:
  M-x forw    14 (ard-) { char line list...}

If library `icicles.el' is also loaded, then you can cycle
completions.  When you change cycling direction, the number of
additional cycle candidates, besides the current one, is displayed
following the rest of the icomplete info:
  M-x forward-line   [Matched]  (13 more).</span>"
    <span class="linecomment">;; `all-completions' doesn't like empty `minibuffer-completion-table's (ie: (nil))</span>
    (when (and (listp candidates) (null (car candidates))) (setq candidates nil))
    (let* ((comps (all-completions name candidates predicate))
           (open-bracket-determined (if require-match "<span class="quote">(</span>" "<span class="quote"> [</span>"))
           (close-bracket-determined (if require-match "<span class="quote">) </span>" "<span class="quote">] </span>"))
           (keys nil)
           (nb-candidates (length comps))
           nb-candidates-string)
      <span class="linecomment">;; `concat'/`mapconcat' is the slow part.  With the introduction of</span>
      <span class="linecomment">;; `icompletep-prospects-length', there is no need for `catch'/`throw'.</span>
      (if (null comps) (format (if (fboundp 'icicle-apropos-complete)
                                   "<span class="quote">\t%sNo prefix matches%s</span>"
                                 "<span class="quote">\t%sNo matches%s</span>")
                               open-bracket-determined
                               close-bracket-determined)
        (let* ((most-try (try-completion name (mapcar #'list comps)))
               (most (if (stringp most-try) most-try (car comps)))
               (most-len (length most))
               (determ (and (&gt; most-len (length name))
                            (concat open-bracket-determined
                                    (substring most (length name))
                                    close-bracket-determined)))
               (open-bracket-prospects "<span class="quote">{ </span>")
               (close-bracket-prospects "<span class="quote"> }</span>")
               (prospects-len 0)
               prompt prompt-rest prospects most-is-exact comp)
          (when determ
            (put-text-property 0 (length determ) 'face 'icompletep-determined determ))
          (if (eq most-try t)
              (setq prospects nil)
            (while (and comps (&lt; prospects-len icompletep-prospects-length))
              (setq comp (substring (car comps) most-len)
                    comps (cdr comps))
              (cond ((string-equal comp "<span class="quote"></span>") (setq most-is-exact t))
                    ((member comp prospects))
                    (t (setq prospects (cons comp prospects)
                             prospects-len (+ (length comp) 1 prospects-len))))))
          (setq prompt-rest
                (if prospects
                    (concat open-bracket-prospects
                            (and most-is-exact "<span class="quote">, </span>")
                            (mapconcat 'identity
                                       (sort prospects (function string-lessp))
                                       "<span class="quote">  </span>")
                            (and comps "<span class="quote">...</span>")
                            close-bracket-prospects)
                  (concat "<span class="quote">\t[ Matched</span>"
                          (if (setq keys (and icomplete-show-key-bindings
                                              (commandp (intern-soft most))
                                              (icomplete-get-keys most)))
                              (concat "<span class="quote">; </span>" keys)
                            (setq keys nil))
                          "<span class="quote"> ]</span>")))
          (put-text-property 0 (length prompt-rest)
                             'face 'icompletep-choices prompt-rest)
          (cond ((&lt; nb-candidates 2)
                 (setq prompt (concat "<span class="quote">      </span>" determ prompt-rest))
                 (when (eq last-command this-command)
                   (setq icicle-nb-of-other-cycle-candidates 0))) <span class="linecomment">; We know now, so reset it.</span>
                (t
                 (setq nb-candidates-string (format "<span class="quote">%7d </span>" nb-candidates))
                 (put-text-property (string-match "<span class="quote">\\S-</span>" nb-candidates-string)
                                    (1- (length nb-candidates-string))
                                    'face 'icompletep-nb-candidates nb-candidates-string)
                 (setq prompt (concat nb-candidates-string determ prompt-rest))))
          <span class="linecomment">;; Highlight keys, after "Matched; " (18 chars).</span>
          (when keys (put-text-property (+ 18 (length determ)) (1- (length prompt))
                                        'face 'icompletep-keys prompt))
          <span class="linecomment">;; Append mention of number of other cycle candidates (from `icicles.el').</span>
          (when (and (boundp 'icicle-last-completion-candidate)
                     (&gt; icicle-nb-of-other-cycle-candidates 0)
                     (= 1 nb-candidates)
                     icicle-last-completion-candidate
                     (not (eq last-command this-command)))
            (setq nb-candidates-string  <span class="linecomment">; Reuse the string.</span>
                  (format "<span class="quote">  (%d more)</span>" icicle-nb-of-other-cycle-candidates))
            (put-text-property (string-match "<span class="quote">\\S-</span>" nb-candidates-string)
                               (length nb-candidates-string)
                               'face 'icompletep-nb-candidates nb-candidates-string)
            (setq prompt (concat prompt nb-candidates-string)))
          prompt)))))



<span class="linecomment">;; REPLACES ORIGINAL defined in `icomplete.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Prepends total number of candidates.</span>
<span class="linecomment">;; 2. Sorts alternatives alphabetically, puts them in a different face, and separates them more.</span>
<span class="linecomment">;; 3. Highlights key-binding text.</span>
<span class="linecomment">;; 4. Appends number of remaining cycle candidates (for Icicles).</span>
<span class="linecomment">;;</span>
(when (&gt; emacs-major-version 22)        <span class="linecomment">; Emacs 23.</span>
  (defun icomplete-completions (name candidates predicate require-match)
    "<span class="quote">Identify prospective candidates for minibuffer completion.
NAME is the name to complete.
CANDIDATES are the candidates to match.
PREDICATE filters matches: they succeed only if it returns non-nil.
REQUIRE-MATCH non-nil means the input must match a candidate.

The display is updated with each minibuffer keystroke during
minibuffer completion.

Prospective completion suffixes (if any) are displayed, bracketed by
\"()\", \"[]\", or \"{}\".  The choice of brackets is as follows:

  \(...) - A single prospect is identified, and matching is enforced.
  \[...] - A single prospect is identified, and matching is optional.
  \{...} - Multiple prospects are indicated, and further input is
          needed to distinguish a single one.

The displays for unambiguous matches have ` [ Matched ]' appended
\(whether complete or not), or ` \[ No matches ]', if no eligible
matches exist.  \(Keybindings for uniquely matched commands are
exhibited within brackets, [].)

When more than one completion is available, the total number precedes
the suffixes display, like this:
  M-x forw    14 (ard-) { char line list...}

If library `icicles.el' is also loaded, then you can cycle
completions.  When you change cycling direction, the number of
additional cycle candidates, besides the current one, is displayed
following the rest of the icomplete info:
  M-x forward-line   [Matched]  (13 more).</span>"
    <span class="linecomment">;; `all-completions' doesn't like empty `minibuffer-completion-table's (ie: (nil))</span>
    (when (and (listp candidates) (null (car candidates))) (setq candidates nil))
    (let* (<span class="linecomment">;; Don't use `completion-all-sorted-completions' as in vanilla Emacs.</span>
           <span class="linecomment">;; We need the number of comps, and we don't need that sort order.</span>
           <span class="linecomment">;; (comps (completion-all-sorted-completions))</span>
           (comps (all-completions name candidates predicate))
           (nb-candidates (length comps))
<span class="linecomment">;;; We don't use `completion-all-sorted-completions', so we don't need `last' or `base-size'.</span>
<span class="linecomment">;;; $$$$$      (last (if (consp comps) (last comps)))</span>
<span class="linecomment">;;;            (base-size (cdr last))</span>
           (open-bracket (if require-match "<span class="quote">(</span>" "<span class="quote"> [</span>"))
           (close-bracket (if require-match "<span class="quote">) </span>" "<span class="quote">] </span>")))
      <span class="linecomment">;; `concat'/`mapconcat' is the slow part.</span>
      (if (not (consp comps))
          (format (if (fboundp 'icicle-apropos-complete)
                      "<span class="quote">\t%sNo prefix matches%s</span>"
                    "<span class="quote">\t%sNo matches%s</span>")
                  open-bracket close-bracket)
<span class="linecomment">;;; $$$$$   (if last (setcdr last nil))</span>
        (let* ((mdata  (and (fboundp 'completion--field-metadata)
                            (completion--field-metadata (field-beginning))))
               (most-try
<span class="linecomment">;;; $$$$$           (if (and base-size (&gt; base-size 0))</span>
<span class="linecomment">;;;                     (completion-try-completion name candidates predicate (length name))</span>
<span class="linecomment">;;;                   ;; If `comps' are 0-based, result should be the same with `comps'.</span>

                <span class="linecomment">;; $$$$$$$$ UNLESS BUG #8795 is fixed, need METADATA even if nil.</span>
                (if (fboundp 'completion--field-metadata) <span class="linecomment">; Emacs 24 added a 5th arg, METADATA.</span>
                    (completion-try-completion name comps nil (length name) mdata)
                  (completion-try-completion name comps nil (length name))))
               (most (if (consp most-try) (car most-try) (if most-try (car comps) "<span class="quote"></span>")))
               <span class="linecomment">;; Compare name and most, so we can determine if name is</span>
               <span class="linecomment">;; a prefix of most, or something else.</span>
               (compare (compare-strings name nil nil most nil nil completion-ignore-case))
               (determ (and (not (or (eq t compare) (eq t most-try)
                                     (= (setq compare (1- (abs compare))) (length most))))
                            (concat open-bracket
                                    (cond ((= compare (length name)) <span class="linecomment">; Typical: name is a prefix</span>
                                           (substring most compare))
                                          ((&lt; compare 5) most)
                                          (t (concat "<span class="quote">...</span>" (substring most compare))))
                                    close-bracket)))
               (prospects-len (+ (string-width (buffer-string)) <span class="linecomment">; for prompt</span>
                                 8      <span class="linecomment">; for `nb-candidates-string': "%7d "</span>
                                 (length determ) <span class="linecomment">; for determined part</span>
                                 2      <span class="linecomment">; for "{ "</span>
                                 -2     <span class="linecomment">; for missing last "  " after last candidate</span>
                                 5))    <span class="linecomment">; for "... }"</span>
               (prospects-max
                <span class="linecomment">;; Max total length to use, including the minibuffer content.</span>
                (* (+ icomplete-prospects-height
                      <span class="linecomment">;; If the minibuffer content already uses up more than</span>
                      <span class="linecomment">;; one line, increase the allowable space accordingly.</span>
                      (/ prospects-len (window-width)))
                   (window-width)))
               (prefix-len
                <span class="linecomment">;; Find the common prefix among `comps'.</span>
                (if (eq t (compare-strings (car comps) nil (length most) most nil nil
                                           completion-ignore-case))
                    (length most)       <span class="linecomment">; Common case.</span>
                  (let ((comps-prefix (try-completion "<span class="quote"></span>" comps)))
                    (and (stringp comps-prefix) (length comps-prefix)))))
               (keys nil)
               prompt nb-candidates-string prompt-rest
               prospects most-is-exact comp limit)
          (when determ
            (put-text-property 0 (length determ) 'face 'icompletep-determined determ))
          (if (eq most-try t)           <span class="linecomment">; (or (null (cdr comps))</span>
              (setq prospects nil)
            (while (and comps (not limit))
              (setq comp   (if prefix-len (substring (car comps) prefix-len) (car comps))
                    comps  (cdr comps))
              (cond ((string-equal comp "<span class="quote"></span>") (setq most-is-exact t))
                    ((member comp prospects))
                    (t (setq prospects-len (+ (string-width comp)
                                              2 <span class="linecomment">; for "  "</span>
                                              prospects-len))
                       (if (&lt; prospects-len prospects-max)
                           (push comp prospects)
                         (setq limit t))))))
<span class="linecomment">;;; $$$$$    ;; Restore the base-size info, since `completion-all-sorted-completions' is cached.</span>
<span class="linecomment">;;;          (when last (setcdr last base-size))</span>
          (setq prompt-rest
                (if prospects
                    (concat "<span class="quote">{ </span>" (and most-is-exact "<span class="quote">, </span>")
                            (mapconcat 'identity (sort prospects (function string-lessp)) "<span class="quote">  </span>")
                            (and limit "<span class="quote">...</span>") "<span class="quote"> }</span>")
                  (concat "<span class="quote">\t[ Matched</span>"
                          (if (setq keys (and icomplete-show-key-bindings
                                              (commandp (intern-soft most))
                                              (icomplete-get-keys most)))
                              (concat "<span class="quote">; </span>" keys)
                            (setq keys nil))
                          "<span class="quote"> ]</span>")))
          (put-text-property 0 (length prompt-rest) 'face 'icompletep-choices prompt-rest)
          (cond ((&lt; nb-candidates 2)
                 (setq prompt (concat "<span class="quote">      </span>" determ prompt-rest))
                 (when (eq last-command this-command)
                   (setq icicle-nb-of-other-cycle-candidates 0))) <span class="linecomment">; We know now, so reset it.</span>
                (t
                 (setq nb-candidates-string (format "<span class="quote">%7d </span>" nb-candidates))
                 (put-text-property (string-match "<span class="quote">\\S-</span>" nb-candidates-string)
                                    (1- (length nb-candidates-string))
                                    'face 'icompletep-nb-candidates nb-candidates-string)
                 (setq prompt (concat nb-candidates-string determ prompt-rest))))
          <span class="linecomment">;; Highlight keys, after "Matched; " (18 chars).</span>
          (when keys (put-text-property (+ 18 (length determ)) (1- (length prompt))
                                        'face 'icompletep-keys prompt))
          <span class="linecomment">;; Append mention of number of other cycle candidates (from `icicles.el').</span>
          (when (and (boundp 'icicle-last-completion-candidate)
                     (&gt; icicle-nb-of-other-cycle-candidates 0)
                     (= 1 nb-candidates)
                     icicle-last-completion-candidate
                     (not (eq last-command this-command)))
            (setq nb-candidates-string  <span class="linecomment">; Reuse the string.</span>
                  (format "<span class="quote">  (%d more)</span>" icicle-nb-of-other-cycle-candidates))
            (put-text-property (string-match "<span class="quote">\\S-</span>" nb-candidates-string)
                               (length nb-candidates-string)
                               'face 'icompletep-nb-candidates nb-candidates-string)
            (setq prompt (concat prompt nb-candidates-string)))          
          prompt)))))



<span class="linecomment">;;; The following functions have been REDEFINED to reset the</span>
<span class="linecomment">;;; `minibuffer-completion-table' in order to avoid icompletion.</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>


<span class="linecomment">;; Note:  The function `read-input' is an alias for `read-string'.</span>

<span class="linecomment">;; (or (fboundp 'old-read-string)</span>
<span class="linecomment">;; (fset 'old-read-string (symbol-function 'read-string)))</span>

<span class="linecomment">;; ;; REPLACES ORIGINAL:</span>
<span class="linecomment">;; ;; Resets `minibuffer-completion-table' to avoid icompletion.</span>
<span class="linecomment">;; (defsubst read-string</span>
<span class="linecomment">;;   (prompt &optional initial-input history default-value inherit-input-method)</span>
<span class="linecomment">;;   "Read a string from the minibuffer, prompting with string PROMPT.</span>
<span class="linecomment">;; If non-nil, second arg INITIAL-INPUT is a string to insert before</span>
<span class="linecomment">;;     reading.  This argument has been superseded by DEFAULT-VALUE and</span>
<span class="linecomment">;;     should normally be `nil' in new code.  It behaves as in</span>
<span class="linecomment">;;     `read-from-minibuffer'.  See the documentation for that function.</span>
<span class="linecomment">;; The third arg HISTORY, if non-nil, specifies a history list and</span>
<span class="linecomment">;;     optionally the initial position in that list.</span>
<span class="linecomment">;;     See `read-from-minibuffer' for details of argument HISTORY.</span>
<span class="linecomment">;; Fourth arg DEFAULT-VALUE is the default value.  If non-nil, it is used</span>
<span class="linecomment">;;     for history commands and as the value to return if the user enters</span>
<span class="linecomment">;;     an empty string.</span>
<span class="linecomment">;; Fifth arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer</span>
<span class="linecomment">;;     inherits the current input method and setting of</span>
<span class="linecomment">;;     `enable-multibyte-characters'."</span>
<span class="linecomment">;;   (setq minibuffer-completion-table nil) ; So won't icomplete by default.</span>
<span class="linecomment">;;   (old-read-string prompt initial-input history default-value inherit-input-method))</span>


<span class="linecomment">;; (or (fboundp 'old-read-from-minibuffer)</span>
<span class="linecomment">;; (fset 'old-read-from-minibuffer (symbol-function 'read-from-minibuffer)))</span>

<span class="linecomment">;; ;; REPLACES ORIGINAL:</span>
<span class="linecomment">;; ;; Resets `minibuffer-completion-table' to avoid icompletion.</span>
<span class="linecomment">;; (defsubst read-from-minibuffer</span>
<span class="linecomment">;;   (prompt &optional initial-contents keymap read hist default-value</span>
<span class="linecomment">;;           inherit-input-method keep-all)</span>
<span class="linecomment">;;   "Read a string from the minibuffer, prompting with string PROMPT.</span>
<span class="linecomment">;; The optional second arg INITIAL-CONTENTS is an obsolete alternative to</span>
<span class="linecomment">;;   DEFAULT-VALUE.  It normally should be nil in new code, except when</span>
<span class="linecomment">;;   HIST is a cons.  It is discussed in more detail below.</span>
<span class="linecomment">;; Third arg KEYMAP is a keymap to use while reading;</span>
<span class="linecomment">;;   if omitted or nil, the default is `minibuffer-local-map'.</span>
<span class="linecomment">;; If fourth arg READ is non-nil, then interpret the result as a Lisp</span>
<span class="linecomment">;;   object and return that object.  In other words, do this:</span>
<span class="linecomment">;;       `(car (read-from-string INPUT-STRING))'</span>
<span class="linecomment">;; Fifth arg HIST, if non-nil, specifies a history list and optionally</span>
<span class="linecomment">;;   the initial position in the list.</span>
<span class="linecomment">;;   It can be a symbol, which is the history list variable to use,</span>
<span class="linecomment">;;   or it can be a cons cell (HISTVAR . HISTPOS).</span>
<span class="linecomment">;;   In that case, HISTVAR is the history-list variable to use,</span>
<span class="linecomment">;;   and HISTPOS is the initial position for use by the minibuffer</span>
<span class="linecomment">;;   history commands.  For consistency, you should also specify that</span>
<span class="linecomment">;;   element of the history as the value of INITIAL-CONTENTS.</span>
<span class="linecomment">;;   Positions are counted starting from 1 at the beginning of the list.</span>
<span class="linecomment">;; Sixth arg DEFAULT-VALUE is the default value.  If non-nil, it is</span>
<span class="linecomment">;;   available for history commands; but, unless READ is non-nil,</span>
<span class="linecomment">;;   `read-from-minibuffer' does NOT return DEFAULT-VALUE if the user</span>
<span class="linecomment">;;   enters empty input!  It returns the empty string.</span>
<span class="linecomment">;; Seventh arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer</span>
<span class="linecomment">;;   inherits the current input method and the setting of</span>
<span class="linecomment">;;   `enable-multibyte-characters'.</span>
<span class="linecomment">;; Eighth arg KEEP-ALL, if non-nil, says to put all inputs in the history</span>
<span class="linecomment">;;  list, even empty or duplicate inputs. (This argument is not available</span>
<span class="linecomment">;;  in Emacs versions prior to Emacs 22.)</span>
<span class="linecomment">;; If variable `minibuffer-allow-text-properties' is non-nil, then the</span>
<span class="linecomment">;;   string returned includes whatever text properties were present in</span>
<span class="linecomment">;;   the minibuffer.  Otherwise the value has no text properties.</span>

<span class="linecomment">;; The remainder of this documentation describes INITIAL-CONTENTS in more</span>
<span class="linecomment">;; detail.  It is relevant only when studying existing code, or when HIST</span>
<span class="linecomment">;; is a cons.  If non-nil, INITIAL-CONTENTS is a string to be inserted</span>
<span class="linecomment">;; into the minibuffer before reading input.  Normally, point is put at</span>
<span class="linecomment">;; the end of that string.  However, if INITIAL-CONTENTS is (STRING .</span>
<span class="linecomment">;; POSITION), the initial input is STRING, but point is placed at</span>
<span class="linecomment">;; _one-indexed_ position POSITION in the minibuffer.  Any integer value</span>
<span class="linecomment">;; less than or equal to one puts point at the beginning of the string.</span>
<span class="linecomment">;; *Note* that this behavior differs from the way such arguments are used</span>
<span class="linecomment">;; in `completing-read' and some related functions, which use</span>
<span class="linecomment">;; zero-indexing for POSITION."</span>
<span class="linecomment">;;   (setq minibuffer-completion-table nil) ; So won't icomplete by default.</span>
<span class="linecomment">;;   (if (or (string-match "22." emacs-version) (string-match "21.3.50" emacs-version))</span>
<span class="linecomment">;;       (old-read-from-minibuffer prompt initial-contents keymap read hist</span>
<span class="linecomment">;;                                 default-value inherit-input-method keep-all)</span>
<span class="linecomment">;;     (old-read-from-minibuffer prompt initial-contents keymap read hist</span>
<span class="linecomment">;;                               default-value inherit-input-method))) ; No KEEP-ALL</span>


<span class="linecomment">;; (or (fboundp 'old-read-no-blanks-input)</span>
<span class="linecomment">;; (fset 'old-read-no-blanks-input (symbol-function 'read-no-blanks-input)))</span>

<span class="linecomment">;; ;; REPLACES ORIGINAL:</span>
<span class="linecomment">;; ;; Resets `minibuffer-completion-table' to avoid icompletion.</span>
<span class="linecomment">;; (defsubst read-no-blanks-input (prompt &optional initial-contents inherit-input-method)</span>
<span class="linecomment">;;   "Read a string from the minibuffer, not allowing blanks.</span>
<span class="linecomment">;; Arg PROMPT is a prompt string.  Whitespace terminates the input.</span>

<span class="linecomment">;; If optional second arg INITIAL-CONTENTS is non-nil, it should be a</span>
<span class="linecomment">;; string, which is used as initial input, with point positioned at the</span>
<span class="linecomment">;; end, so that a SPACE will accept the input.  INITIAL-CONTENTS can</span>
<span class="linecomment">;; alternatively be a cons of a string and an integer.  Such values are</span>
<span class="linecomment">;; treated as in `read-from-minibuffer', but are normally not useful in</span>
<span class="linecomment">;; this function.</span>

<span class="linecomment">;; Third arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer</span>
<span class="linecomment">;; inherits the current input method and the setting of</span>
<span class="linecomment">;; `enable-multibyte-characters'."</span>
<span class="linecomment">;;   (setq minibuffer-completion-table nil) ; So won't icomplete by default.</span>
<span class="linecomment">;;   (old-read-no-blanks-input prompt initial-contents inherit-input-method))</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icomplete+)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icomplete+.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icomplete+.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icomplete%2b.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icomplete%2b.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icomplete%2b.el">Administration</a></span><span class="time"><br /> Last edited 2011-06-05 16:29 UTC by <a class="author" title="from 148.87.67.201" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icomplete%2b.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
