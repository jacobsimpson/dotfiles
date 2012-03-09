<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-mode.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mode.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-mode.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mode.el" />
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
      title="Changes for icicles-mode.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mode.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-mode.el%22">icicles-mode.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/icicles-mode.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-mode.el --- Icicle Mode definition for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-mode.el</span>
<span class="linecomment">;; Description: Icicle Mode definition for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 10:21:10 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sun May 22 13:21:19 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 7460</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-mode.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `advice', `advice-preload', `apropos', `apropos+',</span>
<span class="linecomment">;;   `apropos-fn+var', `avoid', `bookmark', `bookmark+',</span>
<span class="linecomment">;;   `bookmark+-1', `bookmark+-bmu', `bookmark+-key',</span>
<span class="linecomment">;;   `bookmark+-lit', `bookmark+-mac', `cl', `cus-edit', `cus-face',</span>
<span class="linecomment">;;   `cus-load', `cus-start', `custom', `dired', `dired+',</span>
<span class="linecomment">;;   `dired-aux', `dired-x', `doremi', `easymenu', `ediff-diff',</span>
<span class="linecomment">;;   `ediff-help', `ediff-init', `ediff-merg', `ediff-mult',</span>
<span class="linecomment">;;   `ediff-util', `ediff-wind', `el-swank-fuzzy', `ffap', `ffap-',</span>
<span class="linecomment">;;   `fit-frame', `frame-cmds', `frame-fns', `fuzzy', `fuzzy-match',</span>
<span class="linecomment">;;   `help+20', `hexrgb', `icicles-cmd1', `icicles-cmd2',</span>
<span class="linecomment">;;   `icicles-face', `icicles-fn', `icicles-mcmd', `icicles-opt',</span>
<span class="linecomment">;;   `icicles-var', `image-dired', `info', `info+', `kmacro',</span>
<span class="linecomment">;;   `levenshtein', `menu-bar', `menu-bar+', `misc-cmds', `misc-fns',</span>
<span class="linecomment">;;   `mkhtml', `mkhtml-htmlize', `mouse3', `mwheel', `pp', `pp+',</span>
<span class="linecomment">;;   `regexp-opt', `ring', `ring+', `second-sel', `strings',</span>
<span class="linecomment">;;   `thingatpt', `thingatpt+', `unaccent', `w32-browser',</span>
<span class="linecomment">;;   `w32browser-dlgopen', `wid-edit', `wid-edit+', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines the</span>
<span class="linecomment">;;  command `icicle-mode'.  For Icicles documentation, see</span>
<span class="linecomment">;;  `icicles-doc1.el' and `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-handle-switch-frame', `icicle-mode', `icy-mode',</span>
<span class="linecomment">;;    `icicle-skip-this-command', `old-bbdb-complete-name',</span>
<span class="linecomment">;;    `old-comint-dynamic-complete',</span>
<span class="linecomment">;;    `old-comint-dynamic-complete-filename',</span>
<span class="linecomment">;;    `old-comint-replace-by-expanded-filename',</span>
<span class="linecomment">;;    `old-dired-read-shell-command', `old-ess-complete-object-name',</span>
<span class="linecomment">;;    `old-gud-gdb-complete-command', `old-read-shell-command',</span>
<span class="linecomment">;;    `orig-read-file-name'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-activate-mark', `icicle-add-menu-item-to-cmd-history',</span>
<span class="linecomment">;;    `icicle-bind-completion-keys', `icicle-bind-isearch-keys',</span>
<span class="linecomment">;;    `icicle-bind-key-completion-keys-for-map-var',</span>
<span class="linecomment">;;    `icicle-bind-key-completion-keys-in-keymaps-from',</span>
<span class="linecomment">;;    `icicle-bind-other-keymap-keys',</span>
<span class="linecomment">;;    `icicle-cancel-Help-redirection', `icicle-define-cycling-keys',</span>
<span class="linecomment">;;    `icicle-define-icicle-maps', `icicle-define-minibuffer-maps',</span>
<span class="linecomment">;;    `icicle-minibuffer-setup', `icicle-rebind-global',</span>
<span class="linecomment">;;    `icicle-redefine-standard-functions',</span>
<span class="linecomment">;;    `icicle-redefine-standard-options',</span>
<span class="linecomment">;;    `icicle-redefine-std-completion-fns',</span>
<span class="linecomment">;;    `icicle-restore-completion-keys',</span>
<span class="linecomment">;;    `icicle-restore-other-keymap-keys',</span>
<span class="linecomment">;;    `icicle-restore-region-face',</span>
<span class="linecomment">;;    `icicle-restore-standard-functions',</span>
<span class="linecomment">;;    `icicle-restore-standard-options',</span>
<span class="linecomment">;;    `icicle-restore-std-completion-fns',</span>
<span class="linecomment">;;    `icicle-run-icicle-post-command-hook',</span>
<span class="linecomment">;;    `icicle-run-icicle-pre-command-hook',</span>
<span class="linecomment">;;    `icicle-select-minibuffer-contents', `icicle-set-calling-cmd',</span>
<span class="linecomment">;;    `icicle-S-iso-lefttab-to-S-TAB', `icicle-top-level-prep',</span>
<span class="linecomment">;;    `icicle-unbind-isearch-keys',</span>
<span class="linecomment">;;    `icicle-unbind-key-completion-keys-for-map-var',</span>
<span class="linecomment">;;    `icicle-unbind-key-completion-keys-in-keymaps-from',</span>
<span class="linecomment">;;    `icicle-undo-std-completion-faces', `icicle-unmap',</span>
<span class="linecomment">;;    `icicle-update-ignored-extensions-regexp'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options defined here (in Custom group `Icicles'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-mode', `icicle-mode-hook'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-bookmark-menu-map', `icicle-custom-menu-map',</span>
<span class="linecomment">;;    `icicle-describe-menu-map', `icicle-edit-menu-map',</span>
<span class="linecomment">;;    `icicle-file-menu-map', `icicle-frames-menu-map',</span>
<span class="linecomment">;;    `icicle-info-menu-map', `icicle-mode-map',</span>
<span class="linecomment">;;    `icicle-options-menu-map', `icicle-search-menu-map',</span>
<span class="linecomment">;;    `icicle-search-tags-menu-map'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For descriptions of changes to this file, see `icicles-chg.el'.</span>
 
<span class="linecomment">;;(@&gt; "Index")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you have library `linkd.el' and Emacs 22 or later, load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections of this doc.  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index, as well as the cross-references and section</span>
<span class="linecomment">;;  headings throughout this file.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://dto.freeshell.org/notebook/Linkd.html.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  (@&gt; "User Options (alphabetical)")</span>
<span class="linecomment">;;  (@&gt; "Internal variables (alphabetical)")</span>
<span class="linecomment">;;  (@&gt; "Icicle mode command")</span>
<span class="linecomment">;;  (@&gt; "Other Icicles functions that define Icicle mode")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; ;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-mode "icicles" "Toggle Icicle mode." t nil)</span>
<span class="linecomment">;;;###autoload (autoload 'icy-mode    "icicles" "Toggle Icicle mode." t nil)</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; pushnew, case</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: push, dolist</span>

(require 'advice)
  <span class="linecomment">;; ad-activate, ad-copy-advice-info, ad-deactivate, ad-disable-advice, ad-enable-advice,</span>
  <span class="linecomment">;; ad-find-some-advice, ad-get-arg, ad-is-active, ad-set-advice-info</span>

(require 'icicles-opt)                  <span class="linecomment">; (This is required anyway by `icicles-var.el'.)</span>
  <span class="linecomment">;; icicle-buffer-configs, icicle-buffer-extras, icicle-change-region-background-flag,</span>
  <span class="linecomment">;; icicle-default-cycling-mode, icicle-incremental-completion-flag,</span>
  <span class="linecomment">;; icicle-default-value, icicle-kmacro-ring-max, icicle-minibuffer-setup-hook,</span>
  <span class="linecomment">;; icicle-modal-cycle-down-keys, icicle-modal-cycle-up-keys,</span>
  <span class="linecomment">;; icicle-functions-to-redefine, icicle-regexp-search-ring-max,</span>
  <span class="linecomment">;; icicle-region-background, icicle-search-ring-max, icicle-show-Completions-initially-flag,</span>
  <span class="linecomment">;; icicle-top-level-key-bindings, icicle-touche-pas-aux-menus-flag,</span>
  <span class="linecomment">;; icicle-word-completion-keys, icicle-yank-function</span>
(require 'icicles-fn)                   <span class="linecomment">; (This is required anyway by `icicles-cmd1.el'.)</span>
  <span class="linecomment">;; assq-delete-all, icicle-completing-p, icicle-isearch-complete-past-string,</span>
  <span class="linecomment">;; icicle-toggle-icicle-mode-twice, icicle-unhighlight-lighter</span>
(require 'icicles-var)                  <span class="linecomment">; (This is required anyway by `icicles-fn.el'.)</span>
  <span class="linecomment">;; icicle-candidate-action-fn, icicle-candidate-nb, icicle-cmd-calling-for-completion,</span>
  <span class="linecomment">;; icicle-completing-p, icicle-completion-candidates,</span>
  <span class="linecomment">;; icicle-current-completion-mode, icicle-default-directory, icicle-ignored-extensions,</span>
  <span class="linecomment">;; icicle-ignored-extensions-regexp, icicle-incremental-completion-p, icicle-initial-value,</span>
  <span class="linecomment">;; icicle-last-completion-candidate, icicle-last-completion-command, icicle-last-input,</span>
  <span class="linecomment">;; icicle-menu-map, icicle-pre-minibuffer-buffer, icicle-minor-mode-map-entry,</span>
  <span class="linecomment">;; icicle-saved-completion-candidates, icicle-saved-kmacro-ring-max,</span>
  <span class="linecomment">;; icicle-saved-regexp-search-ring-max, icicle-saved-region-background,</span>
  <span class="linecomment">;; icicle-saved-search-ring-max, icicle-search-current-overlay, icicle-search-overlays,</span>
  <span class="linecomment">;; icicle-search-refined-overlays</span>
(require 'icicles-cmd1)                 <span class="linecomment">; (This is required anyway by `icicles-cmd2.el'.)</span>
  <span class="linecomment">;; icicle-add-buffer-candidate, icicle-add-buffer-config, icicle-bbdb-complete-name,</span>
  <span class="linecomment">;; icicle-customize-face, icicle-customize-face-other-window, icicle-dabbrev-completion,</span>
  <span class="linecomment">;; icicle-select-bookmarked-region</span>
(require 'icicles-cmd2)
  <span class="linecomment">;; icicle-imenu, icicle-occur, icicle-search, icicle-search-bookmark,</span>
  <span class="linecomment">;; icicle-search-bookmarks-together, icicle-search-buffer, icicle-search-file</span>

<span class="linecomment">;; Use `condition-case' because if `mb-depth.el' can't be found, `mb-depth+.el' is not provided.</span>
(when (&gt;= emacs-major-version 22) (condition-case nil (require 'mb-depth+ nil t) (error nil)))
  <span class="linecomment">;; (no error if not found): minibuffer-depth-indicate-mode</span>

(require 'dired+ nil t) <span class="linecomment">;; (no error if not found):</span>
                        <span class="linecomment">;; diredp-menu-bar-operate-menu, diredp-menu-bar-subdir-menu</span>
(require 'dired) <span class="linecomment">;; dired-mode-map</span>
(require 'menu-bar+ nil t) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; menu-bar-apropos-menu, menu-bar-describe-menu, menu-bar-edit-menu,</span>
  <span class="linecomment">;; menu-bar-file-menu, menu-bar-frames-menu, menu-bar-options-menu, menu-bar-search-tags-menu</span>

<span class="linecomment">;; `icicle-apropos-complete' is used here.  It is defined in `icicles-mcmd.el'.</span>
<span class="linecomment">;; `icicle-file-name-input-p' is used here.  It is defined in `icicles-fn.el'.</span>

<span class="linecomment">;;; Defvars to quiet byte-compiler:</span>
(when (&lt; emacs-major-version 22)
  (defvar kmacro-ring-max)
  (defvar minibuffer-local-filename-completion-map)
  (defvar minibuffer-local-must-match-filename-map)
  (defvar minibuffer-local-filename-must-match-map)
  (defvar mouse-wheel-down-event)
  (defvar mouse-wheel-up-event)
  (defvar read-file-name-function))

(defvar Buffer-menu-mode-map)           <span class="linecomment">; In `buff-menu.el'.</span>
(defvar comint-mode-map)                <span class="linecomment">; In `comint.el'.</span>
(defvar crm-local-completion-map)       <span class="linecomment">; In `crm.el'.</span>
(defvar crm-local-must-match-map)       <span class="linecomment">; In `crm.el'.</span>
(defvar dired-mode-map)                 <span class="linecomment">; In `dired.el'.</span>
(defvar gud-minibuffer-local-map)       <span class="linecomment">; In `gud.el'.</span>
(defvar ibuffer-mode-map)               <span class="linecomment">; In `ibuffer.el'.</span>
(defvar ibuffer-mode-operate-map)       <span class="linecomment">; In `ibuffer.el'.</span>
(defvar icicle-crm-local-completion-map) <span class="linecomment">; In `icicles-fn.el' after load `crm.el'.</span>
(defvar icicle-crm-local-must-match-map) <span class="linecomment">; In `icicles-fn.el' after load `crm.el'.</span>
(defvar icicle-kmacro-ring-max)         <span class="linecomment">; In `icicles-opt.el' for Emacs 22+.</span>
(defvar icicle-saved-kmacro-ring-max)   <span class="linecomment">; In `icicles-var.el' for Emacs 22+.</span>
(defvar ielm-map)                       <span class="linecomment">; In `ielm.el'.</span>
(defvar inferior-tcl-mode-map)          <span class="linecomment">; In `tcl.el'.</span>
(defvar Info-mode-map)                  <span class="linecomment">; In `info.el'.</span>
(defvar isearch-mode-map)               <span class="linecomment">; In `isearch.el'.</span>
(defvar old-crm-local-completion-map)   <span class="linecomment">; In `icicles-fn.el' after load `crm.el'.</span>
(defvar old-crm-local-must-match-map)   <span class="linecomment">; In `icicles-fn.el' after load `crm.el'.</span>
(defvar savehist-minibuffer-history-variables) <span class="linecomment">; In `savehist.el'</span>
(defvar shell-mode-map)                 <span class="linecomment">; In `shell.el'.</span>
(defvar sh-mode-map)                    <span class="linecomment">; In `sh-script.el'.</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "User Options (alphabetical)")</span>

<span class="linecomment">;;; User Options (alphabetical) --------------------------------------</span>

<span class="linecomment">;; Emacs 20 only</span>
(unless (fboundp 'define-minor-mode)
  (defcustom icicle-mode nil
    "<span class="quote">*Toggle minibuffer input completion and cycling.
Setting this variable directly does not take effect;
use either \\[customize] or command `icy-mode' (aka `icicle-mode').</span>"
    :set (lambda (symbol value) (icicle-mode (if value 1 -1)))
    :initialize 'custom-initialize-default
    :type 'boolean :group 'Icicles-Miscellaneous :require 'icicles))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-mode-hook nil
  "<span class="quote">*Functions run after entering and exiting Icicle mode.</span>"
  :type 'hook :group 'Icicles-Miscellaneous)
 
<span class="linecomment">;;(@* "Internal variables (alphabetical)")</span>

<span class="linecomment">;;; Internal variables (alphabetical) --------------------------------</span>

(defvar icicle-mode-map nil
  "<span class="quote">Keymap for Icicle mode.  These are top-level key bindings.
See also `icicle-define-minibuffer-maps' for minibuffer bindings and
bindings in `*Completions*'.</span>")
 
<span class="linecomment">;;(@* "Icicle mode command")</span>

<span class="linecomment">;;; Icicle mode command ----------------------------------------------</span>

<span class="linecomment">;; Main command.  Inspired from `icomplete-mode'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'icy-mode 'icicle-mode)
(when (fboundp 'define-minor-mode)      <span class="linecomment">; Emacs 21+ ------------</span>
  (when (&gt; emacs-major-version 22)
    (defadvice call-interactively (after icicle-save-to-history disable activate)
      "<span class="quote">Save command to `icicle-interactive-history'.</span>"
      <span class="linecomment">;; If command's input is not a parameterized (e.g. mouse) event, record it.</span>
      (let* ((fn   (ad-get-arg 0))
             (int  (interactive-form fn)))
        (when (and (symbolp fn) (consp int) (or (not (stringp (cadr int)))
                                                (string= (cadr int) "<span class="quote"></span>")
                                                (not (eq ?e (aref (cadr int) 0)))))
          (pushnew (symbol-name fn) icicle-interactive-history))))
    (when (boundp 'savehist-save-hook)  <span class="linecomment">; Do not save `icicle-interactive-history' (too large).</span>
      (add-hook 'savehist-save-hook
                (lambda () (setq savehist-minibuffer-history-variables
                                 (delq 'icicle-interactive-history
                                       savehist-minibuffer-history-variables))))))
  (when (&gt; emacs-major-version 21)
    (defadvice describe-face (before icicle-respect-WYSIWYG activate)
      "<span class="quote">`read-face-name' respects `icicle-WYSIWYG-Completions-flag'.
If non-nil, then it does not use `completing-read-multiple' (which
cannot take advantage of WYSIWYG).</span>"
      (interactive (list (read-face-name "<span class="quote">Describe face</span>" "<span class="quote">= `default' face</span>"
                                         (not icicle-WYSIWYG-Completions-flag))))))

  (eval '(define-minor-mode icicle-mode
          "<span class="quote">Icicle mode: Toggle minibuffer input completion and cycling.
Non-nil prefix ARG turns mode on if ARG &gt; 0, else turns it off.
Icicle mode is a global minor mode.  It binds keys in the minibuffer.

The following top-level commands are also available in Icicle mode.
In many cases there are also `other-window' versions.

`clear-option' (alias)                 - Set binary option(s) to nil
`icicle-add-buffer-candidate'          - Add always-candidate buffer
`icicle-add-buffer-config'             - To `icicle-buffer-configs'
`icicle-add-entry-to-saved-completion-set' - Add completion to a set
`icicle-add/update-saved-completion-set' - To
                                        `icicle-saved-completion-sets'
`icicle-apply'                         - Apply function to alist items
`icicle-apropos'                       - `apropos', but shows matches
`icicle-apropos-command'               - Enhanced `apropos-command'
`icicle-apropos-variable'              - Enhanced `apropos-variable'
`icicle-apropos-zippy'                 - Show matching Zippy quotes
`icicle-bookmark'                      - Jump to a bookmark
`icicle-bookmark-bookmark-list'        - Jump to a bookmark list
`icicle-bookmark-desktop'              - Jump to a desktop bookmark
`icicle-bookmark-dired'                - Jump to a Dired bookmark
`icicle-bookmark-file'                 - Jump to a file bookmark
`icicle-bookmark-gnus'                 - Jump to a Gnus bookmark
`icicle-bookmark-info'                 - Jump to an Info bookmark
`icicle-bookmark-local-file'           - Jump to local-file bookmark
`icicle-bookmark-man'                  - Jump to a `man'-page bookmark
`icicle-bookmark-non-file'             - Jump to a buffer bookmark
`icicle-bookmark-region'               - Jump to a region bookmark
`icicle-bookmark-remote-file'          - Jump to a remote file
`icicle-bookmark-specific-buffers'     - Jump to a bookmarked buffer
`icicle-bookmark-specific-files'       - Jump to a bookmarked file
`icicle-bookmark-this-buffer'          - Jump to bookmark for this buf
`icicle-bookmark-url'                  - Jump to a URL bookmark
`icicle-bookmark-w3m'                  - Jump to a W3M (URL) bookmark
`icicle-buffer'                        - Switch to buffer
`icicle-buffer-config'                 - Pick `icicle-buffer' options
`icicle-buffer-list'                   - Choose a list of buffer names
`icicle-change-alternative-sort-order' - Choose an alternative sort
`icicle-change-sort-order'             - Choose a sort order
`icicle-clear-current-history'         - Clear current history entries
`icicle-clear-history'                 - Clear entries from a history
`icicle-color-theme'                   - Change color theme
`icicle-comint-command'                - Reuse shell etc. command
`icicle-comint-dynamic-complete'       - Text completion in shell
`icicle-comint-search'                 - Reuse shell etc. command
`icicle-command-abbrev'                - Multi-command `M-x' + abbrevs
`icicle-compilation-search'            - `icicle-search' and show hits
`icicle-complete-keys'                 - Complete keys
`icicle-complete-thesaurus-entry'      - Complete word using thesaurus
`icicle-completing-yank'               - `yank' using completion
`icicle-customize-face'                - Multi-`customize-face'
`icicle-customize-icicles-group'       - Customize options and faces
`icicle-delete-file'                   - Delete file/directory
`icicle-delete-window'                 - Delete window (`C-u': buffer)
`icicle-delete-windows'                - Delete all windows for buffer
`icicle-dired'                         - Multi-command Dired
`icicle-doc'                           - Show doc for fn, var, or face
`icicle-doremi-candidate-width-factor+' - +/- candidate column width
`icicle-doremi-increment-max-candidates+' - +/- max number candidates
`icicle-doremi-increment-swank-prefix-length+' - +/- swank prefix
`icicle-doremi-increment-swank-timeout+' - +/- swank completion msec
`icicle-doremi-increment-variable+'    - Increment var using Do Re Mi
`icicle-doremi-inter-candidates-min-spaces+' - +/- candidate spacing
`icicle-doremi-zoom-Completions+'      - +/- `*Completions*' text size
`icicle-execute-extended-command'      - Multi-command `M-x'
`icicle-execute-named-keyboard-macro'  - Execute named keyboard macro
`icicle-face-list'                     - Choose a list of face names
`icicle-file-list'                     - Choose a list of file names
`icicle-file'                          - Visit file/directory
`icicle-find-file'                     -       same: relative only
`icicle-find-file-absolute'            -       same: absolute only
`icicle-find-file-in-tags-table'       - File in tags table
`icicle-find-first-tag'                - Visit definition with tag
`icicle-find-tag'                      - Visit definition with tag
`icicle-font'                          - Change font of frame
`icicle-frame-bg'                      - Change background of frame
`icicle-frame-fg'                      - Change foreground of frame
`icicle-fundoc'                        - Show function description
`icicle-goto-global-marker'            - Go to a global marker
`icicle-goto-marker'                   - Go to a marker in this buffer
`icicle-imenu*'                        - Navigate among Imenu entries
`icicle-increment-option'              - Increment numeric option
`icicle-increment-variable'            - Increment numeric variable
`icicle-Info-goto-node'                - Multi-cmd `Info-goto-node'
`icicle-Info-index'                    - Multi-command `Info-index'
`icicle-Info-menu'                     - Multi-command `Info-menu'
`icicle-Info-virtual-book'             - Open a virtual Info book
`icicle-insert-buffer'                 - Multi-command `insert-buffer'
`icicle-insert-thesaurus-entry'        - Insert thesaurus entry(s)
`icicle-keyword-list'                  - Choose a list of keywords
`icicle-kill-buffer'                   - Kill buffer
`icicle-kmacro'                        - Execute a keyboard macro
`icicle-locate-file'                   - Visit file(s) in a directory
`icicle-minibuffer-help'               - Show Icicles minibuffer help
`icicle-mode' or `icy-mode'            - Toggle Icicle mode
`icicle-next-S-TAB-completion-method'  - Next S-TAB completion method
`icicle-next-TAB-completion-method'    - Next TAB completion method
`icicle-occur'                         - Incremental `occur'
`icicle-other-window-or-frame'         - Other window/frame or select
`icicle-plist'                         - Show symbols, property lists
`icicle-recent-file'                   - Open recently used file(s)
`icicle-recompute-shell-command-candidates' - Update from search path
`icicle-remove-buffer-candidate'       - Remove always-candidate buf
`icicle-remove-buffer-config'          - From `icicle-buffer-configs'
`icicle-remove-entry-from-saved-completion-set' - From a saved set
`icicle-remove-file-from-recentf-list' - Remove from recent files list
`icicle-remove-saved-completion-set'   - From
                                        `icicle-saved-completion-sets'
`icicle-reset-option-to-nil'           - Set binary option(s) to nil
`icicle-save-string-to-variable'       - Save text for use with `C-='
`icicle-search'                        - Search with regexps & cycling
`icicle-search-bookmark'               - Search bookmarks separately
`icicle-search-bookmark-list-bookmark' - Search bookmark lists
`icicle-search-bookmarks-together'     - Search bookmarks together
`icicle-search-char-property'          - Search for overlay/text props
`icicle-search-dired-bookmark'         - Search Dired bookmarks
`icicle-search-dired-marked'           - Search marked files in Dired
`icicle-search-file'                   - Search multiple files
`icicle-search-file-bookmark'          - Search bookmarked files
`icicle-search-gnus-bookmark'          - Search bookmarked Gnus msgs
`icicle-search-ibuffer-marked'         - Search marked bufs in Ibuffer
`icicle-search-info-bookmark'          - Search bookmarked Info nodes
`icicle-search-keywords'               - Search with regexp keywords
`icicle-search-local-file-bookmark'    - Search bookmarked local files
`icicle-search-man-bookmark'           - Search bookmarked `man' pages
`icicle-search-non-file-bookmark'      - Search bookmarked buffers
`icicle-search-overlay-property'       - Search for overlay properties
`icicle-search-pages'                  - Search Emacs pages
`icicle-search-paragraphs'             - Search Emacs paragraphs
`icicle-search-region-bookmark'        - Search bookmarked regions
`icicle-search-remote-file-bookmark'   - Search remote bookmarks
`icicle-search-sentences'              - Search sentences as contexts
`icicle-search-text-property'          - Search for faces etc.
`icicle-search-url-bookmark'           - Search bookmarked URLs
`icicle-search-word'                   - Whole-word search
`icicle-select-bookmarked-region'      - Select bookmarked regions
`icicle-select-frame'                  - Select a frame by name
`icicle-select-window'                 - Select window by buffer name
`icicle-send-bug-report'               - Send Icicles bug report
`icicle-set-option-to-t'               - Set binary option(s) to t
`icicle-toggle-~-for-home-dir'         - Toggle using `~' for $HOME
`icicle-toggle-alternative-sorting'    - Swap alternative sort
`icicle-toggle-angle-brackets'         - Toggle using angle brackets
`icicle-toggle-C-for-actions'          - Toggle using `C-' for actions
`icicle-toggle-case-sensitivity'       - Toggle case sensitivity
`icicle-toggle-dot'                    - Toggle `.' matching newlines
`icicle-toggle-expand-to-common-match' - Toggle input ECM expansion
`icicle-toggle-hiding-common-match'    - Toggle match, `*Completions*'
`icicle-toggle-highlight-all-current'  - Toggle max search highlight
`icicle-toggle-highlight-historical-candidates'
                                       - Toggle past-input highlight
`icicle-toggle-highlight-saved-candidates'
                                       - Toggle highlighting saved
`icicle-toggle-ignored-extensions'     - Toggle ignored files
`icicle-toggle-ignored-space-prefix'   - Toggle ignoring space prefix
`icicle-toggle-ignoring-comments'      - Toggle ignoring comments
`icicle-toggle-incremental-completion' - Toggle apropos icompletion
`icicle-toggle-option'                 - Toggle binary user option
`icicle-toggle-proxy-candidates'       - Toggle proxy candidates
`icicle-toggle-regexp-quote'           - Toggle regexp escaping
`icicle-toggle-search-cleanup'         - Toggle search highlighting
`icicle-toggle-search-replace-common-match' - Toggle ECM replacement
`icicle-toggle-search-replace-whole'   - Toggle replacing whole hit
`icicle-toggle-search-whole-word'      - Toggle whole-word searching
`icicle-toggle-show-multi-completion'  - Toggle multi-completions
`icicle-toggle-sorting'                - Toggle sorting of completions
`icicle-toggle-transforming'           - Toggle duplicate removal
`icicle-toggle-WYSIWYG-Completions'   - Toggle WYSIWYG `*Completions*'
`icicle-vardoc'                        - Show variable description
`icicle-where-is'                      - `where-is' multi-command
`icicle-yank-maybe-completing'         - `yank' maybe using completion
`toggle' (alias)                       - Toggle binary user option

For more information, use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-minibuffer-help]' \
when the minibuffer is active.

Note: Depending on your platform, if you use Icicles in a text
terminal (that is, without a window system/manager), then you might
need to change some of the key bindings, if some of the default
bindings are not available to you.</span>"
          :global t :group 'Icicles-Miscellaneous :lighter "<span class="quote"> Icy</span>" :init-value nil
          (cond (icicle-mode
                 <span class="linecomment">;; (when (interactive-p)</span>
                 <span class="linecomment">;;   (unless (or window-system (and (fboundp 'daemonp) (daemonp)))</span>
                 <span class="linecomment">;;     (with-output-to-temp-buffer "*Attention*"</span>
                 <span class="linecomment">;;       (princ "You are using Icicles in a text terminal (no window ")</span>
                 <span class="linecomment">;;       (princ "system/manager).\n\nIcicles makes use of many keys that are ")</span>
                 <span class="linecomment">;;      (princ "unavailable when running\nEmacs in a text terminal.  You will ")</span>
                 <span class="linecomment">;;       (princ "want to rebind those keys.\n")</span>
                 <span class="linecomment">;;       (princ "See the Icicles doc, section Key Bindings.\n"))</span>
                 <span class="linecomment">;;  (message "Icicles uses keys that might not be suitable for a text terminal")</span>
                 <span class="linecomment">;;     (sit-for 5)))</span>
                 (icicle-define-icicle-maps)
                 (icicle-bind-other-keymap-keys)
                 (add-hook 'minibuffer-setup-hook       'icicle-minibuffer-setup)
                 (add-hook 'minibuffer-exit-hook        'icicle-cancel-Help-redirection)
                 (add-hook 'minibuffer-exit-hook        'icicle-restore-region-face)
                 (add-hook 'minibuffer-exit-hook        'icicle-unhighlight-lighter)
                 (add-hook 'icicle-post-command-hook    'icicle-activate-mark 'append)
                 (add-hook 'completion-setup-hook       'icicle-set-calling-cmd 'append)
                 (when icicle-customize-save-flag
                   (add-hook 'kill-emacs-hook           'icicle-command-abbrev-save))
                 (add-hook 'comint-mode-hook            'icicle-comint-hook-fn)
                 (add-hook 'compilation-mode-hook       'icicle-compilation-hook-fn)
                 (add-hook 'compilation-minor-mode-hook 'icicle-compilation-hook-fn)
                 <span class="linecomment">;; $$$$$$ Do this only in `icicle-display-candidates-in-Completions' now.</span>
                 <span class="linecomment">;; $$$$$$ (add-hook 'temp-buffer-show-hook       'icicle-fit-completions-window)</span>
                 (icicle-undo-std-completion-faces)
                 (icicle-redefine-std-completion-fns)
                 (icicle-redefine-standard-functions)
                 (icicle-redefine-standard-options)
                 (when (ad-find-some-advice 'describe-face 'before 'icicle-respect-WYSIWYG)
                   (ad-enable-advice 'describe-face 'before 'icicle-respect-WYSIWYG))
                 (when (fboundp 'minibuffer-depth-indicate-mode) <span class="linecomment">; In `mb-depth(+).el'</span>
                   (minibuffer-depth-indicate-mode 99))
                 (if icicle-menu-items-to-history-flag
                     (add-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history)
                   (remove-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history))
                 (when (&gt; emacs-major-version 22)
                   (when icicle-populate-interactive-history-flag
                     (ad-enable-advice 'call-interactively 'after 'icicle-save-to-history))
                   (ad-activate 'call-interactively))
                 (dolist (fn  icicle-inhibit-advice-functions)
                   (when (and (fboundp fn) (ad-is-active fn))
                     (push (cons fn (ad-copy-advice-info fn)) icicle-advice-info-list)
                     (ad-deactivate fn))))
                (t
                 (makunbound 'icicle-mode-map)
                 (icicle-restore-other-keymap-keys)
                 (remove-hook 'minibuffer-setup-hook    'icicle-minibuffer-setup)
                 (remove-hook 'minibuffer-exit-hook     'icicle-cancel-Help-redirection)
                 (remove-hook 'minibuffer-exit-hook     'icicle-restore-region-face)
                 (remove-hook 'icicle-post-command-hook 'icicle-activate-mark)
                 <span class="linecomment">;; The pre- and post-command hooks are local to the minibuffer,</span>
                 <span class="linecomment">;; So they are added in `icicle-minibuffer-setup', not here.</span>
                 <span class="linecomment">;; Nevertheless, they are removed here when Icicle mode is exited.</span>
                 (remove-hook 'pre-command-hook         'icicle-top-level-prep)
                 (remove-hook 'pre-command-hook         'icicle-run-icicle-pre-command-hook t)
                 (remove-hook 'post-command-hook        'icicle-run-icicle-post-command-hook t)
                 (remove-hook 'completion-setup-hook    'icicle-set-calling-cmd)
                 (remove-hook 'kill-emacs-hook          'icicle-command-abbrev-save)
                 (remove-hook 'comint-mode-hook         'icicle-comint-hook-fn)
                 (remove-hook 'compilation-mode-hook    'icicle-compilation-hook-fn)
                 (remove-hook 'compilation-minor-mode-hook 'icicle-compilation-hook-fn)
                 <span class="linecomment">;; $$$$$$ Do this only in `icicle-display-candidates-in-Completions' now.</span>
                 <span class="linecomment">;; $$$$$$ (remove-hook 'temp-buffer-show-hook    'icicle-fit-completions-window)</span>

                 <span class="linecomment">;; $$ Should restore standard completion faces here.</span>
                 (icicle-restore-std-completion-fns)
                 (icicle-restore-standard-functions)
                 (icicle-restore-standard-options)
                 (when (ad-find-some-advice 'describe-face 'before 'icicle-respect-WYSIWYG)
                   (ad-disable-advice 'describe-face 'before 'icicle-respect-WYSIWYG))
                 (when (fboundp 'minibuffer-depth-indicate-mode)
                   (minibuffer-depth-indicate-mode -99))
                 (remove-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history)
                 (when (&gt; emacs-major-version 22)
                   (ad-disable-advice 'call-interactively 'after 'icicle-save-to-history)
                   (ad-activate 'call-interactively))
                 (dolist (fn  icicle-inhibit-advice-functions)
                   (let ((info  (memq fn icicle-advice-info-list)))
                     (when (and (fboundp fn) info)
                       (ad-set-advice-info fn info)
                       (when (ad-is-active fn) (ad-activate fn)))))))
          (unless (eq icicle-guess-commands-in-path 'load)
            (setq icicle-shell-command-candidates-cache  ())) <span class="linecomment">; Reset - toggle Icy to update.</span>
          (message "<span class="quote">Turning %s Icicle mode...</span>" (if icicle-mode "<span class="quote">ON</span>" "<span class="quote">OFF</span>"))
          (icicle-define-minibuffer-maps icicle-mode)
          (run-hooks 'icicle-mode-hook)
          (message "<span class="quote">Turning %s Icicle mode...done</span>" (if icicle-mode "<span class="quote">ON</span>" "<span class="quote">OFF</span>")))))

(unless (fboundp 'define-minor-mode)    <span class="linecomment">; Emacs 20 ------------</span>
  (defun icicle-mode (&optional arg)
    "<span class="quote">Icicle mode: Toggle minibuffer input completion and cycling.
Non-nil prefix ARG turns mode on if ARG &gt; 0, else turns it off.
Icicle mode is a global minor mode.  It binds keys in the minibuffer.

The following top-level commands are also available in Icicle mode.
In many cases there are also `other-window' versions.

`clear-option' (alias)                 - Set binary option(s) to nil
`icicle-add-buffer-candidate'          - Add always-candidate buffer
`icicle-add-buffer-config'             - To `icicle-buffer-configs'
`icicle-add-entry-to-saved-completion-set' - Add completion to a set
`icicle-add/update-saved-completion-set' - To
                                        `icicle-saved-completion-sets'
`icicle-apply'                         - Apply function to alist items
`icicle-apropos'                       - `apropos', but shows matches
`icicle-apropos-command'               - Enhanced `apropos-command'
`icicle-apropos-variable'              - Enhanced `apropos-variable'
`icicle-apropos-zippy'                 - Show matching Zippy quotes
`icicle-bookmark'                      - Jump to a bookmark
`icicle-bookmark-bookmark-list'        - Jump to a bookmark list
`icicle-bookmark-desktop'              - Jump to a desktop bookmark
`icicle-bookmark-dired'                - Jump to a Dired bookmark
`icicle-bookmark-file'                 - Jump to a file bookmark
`icicle-bookmark-gnus'                 - Jump to a Gnus bookmark
`icicle-bookmark-info'                 - Jump to an Info bookmark
`icicle-bookmark-local-file'           - Jump to local-file bookmark
`icicle-bookmark-man'                  - Jump to a `man'-page bookmark
`icicle-bookmark-non-file'             - Jump to a buffer bookmark
`icicle-bookmark-region'               - Jump to a region bookmark
`icicle-bookmark-remote-file'          - Jump to a remote file
`icicle-bookmark-specific-buffers'     - Jump to a bookmarked buffer
`icicle-bookmark-specific-files'       - Jump to a bookmarked file
`icicle-bookmark-this-buffer'          - Jump to bookmark for this buf
`icicle-bookmark-url'                  - Jump to a URL bookmark
`icicle-bookmark-w3m'                  - Jump to a W3M (URL) bookmark
`icicle-buffer'                        - Switch to buffer
`icicle-buffer-config'                 - Pick `icicle-buffer' options
`icicle-buffer-list'                   - Choose a list of buffer names
`icicle-change-alternative-sort-order' - Choose an alternative sort
`icicle-change-sort-order'             - Choose a sort order
`icicle-clear-current-history'         - Clear current history entries
`icicle-clear-history'                 - Clear entries from a history
`icicle-color-theme'                   - Change color theme
`icicle-comint-command'                - Reuse shell etc. command
`icicle-comint-dynamic-complete'       - Text completion in shell
`icicle-comint-search'                 - Reuse shell etc. command
`icicle-command-abbrev'                - Multi-command `M-x' + abbrevs
`icicle-compilation-search'            - `icicle-search' and show hits
`icicle-complete-thesaurus-entry'      - Complete word using thesaurus
`icicle-completing-yank'               - `yank' using completion
`icicle-customize-face'                - Multi-`customize-face'
`icicle-customize-icicles-group'       - Customize options and faces
`icicle-delete-file'                   - Delete file/directory
`icicle-delete-window'                 - Delete window (`C-u': buffer)
`icicle-delete-windows'                - Delete all windows for buffer
`icicle-dired'                         - Multi-command Dired
`icicle-doc'                           - Show doc for fn, var, or face
`icicle-doremi-candidate-width-factor+' - +/- candidate column width
`icicle-doremi-increment-max-candidates+' - +/- max number candidates
`icicle-doremi-increment-swank-prefix-length+' - +/- swank prefix
`icicle-doremi-increment-swank-timeout+' - +/- swank completion msec
`icicle-doremi-increment-variable+'    - Increment var using Do Re Mi
`icicle-doremi-inter-candidates-min-spaces+' - +/- candidate spacing
`icicle-doremi-zoom-Completions+'      - +/- `*Completions*' text size
`icicle-execute-extended-command'      - Multi-command `M-x'
`icicle-execute-named-keyboard-macro'  - Execute named keyboard macro
`icicle-face-list'                     - Choose a list of face names
`icicle-file-list'                     - Choose a list of file names
`icicle-file'                          - Visit file/directory
`icicle-find-file'                     -       same: relative only
`icicle-find-file-absolute'            -       same: absolute only
`icicle-find-file-in-tags-table'       - File in tags table
`icicle-find-first-tag'                - Visit definition with tag
`icicle-find-tag'                      - Visit definition with tag
`icicle-font'                          - Change font of frame
`icicle-frame-bg'                      - Change background of frame
`icicle-frame-fg'                      - Change foreground of frame
`icicle-fundoc'                        - Show function description
`icicle-goto-global-marker'            - Go to a global marker
`icicle-goto-marker'                   - Go to a marker in this buffer
`icicle-imenu*'                        - Navigate among Imenu entries
`icicle-increment-option'              - Increment numeric option
`icicle-increment-variable'            - Increment numeric variable
`icicle-Info-goto-node'                - Multi-cmd `Info-goto-node'
`icicle-Info-index'                    - Multi-command `Info-index'
`icicle-Info-menu'                     - Multi-command `Info-menu'
`icicle-insert-buffer'                 - Multi-command `insert-buffer'
`icicle-insert-thesaurus-entry'        - Insert thesaurus entry(s)
`icicle-keyword-list'                  - Choose a list of keywords
`icicle-kill-buffer'                   - Kill buffer
`icicle-locate-file'                   - Visit file(s) in a directory
`icicle-minibuffer-help'               - Show Icicles minibuffer help
`icicle-mode' or `icy-mode'            - Toggle Icicle mode
`icicle-next-S-TAB-completion-method'  - Next S-TAB completion method
`icicle-next-TAB-completion-method'    - Next TAB completion method
`icicle-occur'                         - Incremental `occur'
`icicle-other-window-or-frame'         - Other window/frame or select
`icicle-plist'                         - Show symbols, property lists
`icicle-recent-file'                   - Open recently used file(s)
`icicle-recompute-shell-command-candidates' - Update from search path
`icicle-remove-buffer-candidate'       - Remove always-candidate buf
`icicle-remove-buffer-config'          - From `icicle-buffer-configs'
`icicle-remove-entry-from-saved-completion-set' - From a saved set
`icicle-remove-file-from-recentf-list' - Remove from recent files list
`icicle-remove-saved-completion-set'   - From
                                        `icicle-saved-completion-sets'
`icicle-reset-option-to-nil'           - Set binary option(s) to nil
`icicle-save-string-to-variable'       - Save text for use with `C-='
`icicle-search'                        - Search with regexps & cycling
`icicle-search-bookmark'               - Search bookmarks separately
`icicle-search-bookmark-list-bookmark' - Search bookmark lists
`icicle-search-bookmarks-together'     - Search bookmarks together
`icicle-search-char-property'          - Search for overlay/text props
`icicle-search-dired-bookmark'         - Search Dired bookmarks
`icicle-search-dired-marked'           - Search marked files in Dired
`icicle-search-file'                   - Search multiple files
`icicle-search-file-bookmark'          - Search bookmarked files
`icicle-search-gnus-bookmark'          - Search bookmarked Gnus msgs
`icicle-search-ibuffer-marked'         - Search marked bufs in Ibuffer
`icicle-search-info-bookmark'          - Search bookmarked Info nodes
`icicle-search-keywords'               - Search with regexp keywords
`icicle-search-local-file-bookmark'    - Search bookmarked local files
`icicle-search-man-bookmark'           - Search bookmarked `man' pages
`icicle-search-non-file-bookmark'      - Search bookmarked buffers
`icicle-search-overlay-property'       - Search for overlay properties
`icicle-search-pages'                  - Search Emacs pages
`icicle-search-paragraphs'             - Search Emacs paragraphs
`icicle-search-region-bookmark'        - Search bookmarked regions
`icicle-search-remote-file-bookmark'   - Search remote bookmarks
`icicle-search-sentences'              - Search sentences as contexts
`icicle-search-text-property'          - Search for faces etc.
`icicle-search-url-bookmark'           - Search bookmarked URLs
`icicle-search-word'                   - Whole-word search
`icicle-select-bookmarked-region'      - Select bookmarked regions
`icicle-select-frame'                  - Select a frame by name
`icicle-select-window'                 - Select window by buffer name
`icicle-send-bug-report'               - Send Icicles bug report
`icicle-set-option-to-t'               - Set binary option(s) to t
`icicle-toggle-~-for-home-dir'         - Toggle using `~' for $HOME
`icicle-toggle-alternative-sorting'    - Swap alternative sort
`icicle-toggle-angle-brackets'         - Toggle using angle brackets
`icicle-toggle-C-for-actions'          - Toggle using `C-' for actions
`icicle-toggle-case-sensitivity'       - Toggle case sensitivity
`icicle-toggle-dot'                    - Toggle `.' matching newlines
`icicle-toggle-expand-to-common-match' - Toggle input ECM expansion
`icicle-toggle-hiding-common-match'    - Toggle match, `*Completions*'
`icicle-toggle-highlight-all-current'  - Toggle max search highlight
`icicle-toggle-highlight-historical-candidates'
                                       - Toggle past-input highlight
`icicle-toggle-highlight-saved-candidates'
                                       - Toggle highlighting saved
`icicle-toggle-ignored-extensions'     - Toggle ignored files
`icicle-toggle-ignored-space-prefix'   - Toggle ignoring space prefix
`icicle-toggle-ignoring-comments'      - Toggle ignoring comments
`icicle-toggle-incremental-completion' - Toggle apropos icompletion
`icicle-toggle-option'                 - Toggle binary user option
`icicle-toggle-proxy-candidates'       - Toggle proxy candidates
`icicle-toggle-regexp-quote'           - Toggle regexp escaping
`icicle-toggle-search-cleanup'         - Toggle search highlighting
`icicle-toggle-search-replace-common-match' - Toggle ECM replacement
`icicle-toggle-search-replace-whole'   - Toggle replacing whole hit
`icicle-toggle-search-whole-word'      - Toggle whole-word searching
`icicle-toggle-show-multi-completion'  - Toggle multi-completions
`icicle-toggle-sorting'                - Toggle sorting of completions
`icicle-toggle-transforming'           - Toggle duplicate removal
`icicle-toggle-WYSIWYG-Completions'   - Toggle WYSIWYG `*Completions*'
`icicle-vardoc'                        - Show variable description
`icicle-where-is'                      - `where-is' multi-command
`icicle-yank-maybe-completing'         - `yank' maybe using completion
`toggle' (alias)                       - Toggle binary user option

For more information, use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-minibuffer-help]' \
when the minibuffer is active.

Note: Depending on your platform, if you use Icicles in a text
terminal (that is, without a window system/manager), then you might
need to change some of the key bindings, if some of the default
bindings are not available to you.</span>"
    (interactive "<span class="quote">P</span>")
    (setq icicle-mode  (if arg (&gt; (prefix-numeric-value arg) 0) (not icicle-mode)))
    (icicle-define-minibuffer-maps icicle-mode)
    (cond (icicle-mode
           <span class="linecomment">;; (when (interactive-p)</span>
           <span class="linecomment">;;   (unless (or window-system (and (fboundp 'daemonp) (daemonp)))</span>
           <span class="linecomment">;;     (with-output-to-temp-buffer "*Attention*"</span>
           <span class="linecomment">;;       (princ "You are using Icicles in a text terminal (no window ")</span>
           <span class="linecomment">;;       (princ "system/manager).\n\nIcicles makes use of many keys that are ")</span>
           <span class="linecomment">;;       (princ "unavailable when running\nEmacs in a text terminal.  You will ")</span>
           <span class="linecomment">;;       (princ "want to rebind those keys.\n")</span>
           <span class="linecomment">;;       (princ "See the Icicles doc, section Key Bindings.\n"))</span>
           <span class="linecomment">;;     (message "Icicles uses keys that might not be suitable for a text terminal")</span>
           <span class="linecomment">;;     (sit-for 5)))</span>
           (icicle-define-icicle-maps)
           (icicle-bind-other-keymap-keys)
           <span class="linecomment">;; This is not really necessary after the first time - no great loss.</span>
           (add-hook 'minibuffer-setup-hook       'icicle-minibuffer-setup)
           (add-hook 'minibuffer-exit-hook        'icicle-cancel-Help-redirection)
           (add-hook 'minibuffer-exit-hook        'icicle-restore-region-face)
           (add-hook 'minibuffer-exit-hook        'icicle-unhighlight-lighter)
           (add-hook 'icicle-post-command-hook    'icicle-activate-mark 'append)
           (add-hook 'completion-setup-hook       'icicle-set-calling-cmd 'append)
           (when icicle-customize-save-flag
             (add-hook 'kill-emacs-hook           'icicle-command-abbrev-save))
           (add-hook 'comint-mode-hook            'icicle-comint-hook-fn)
           (add-hook 'compilation-mode-hook       'icicle-compilation-hook-fn)
           (add-hook 'compilation-minor-mode-hook 'icicle-compilation-hook-fn)
           <span class="linecomment">;; $$$$$$ Do this only in `icicle-display-candidates-in-Completions' now.</span>
           <span class="linecomment">;; $$$$$$ (add-hook 'temp-buffer-show-hook       'icicle-fit-completions-window)</span>
           (icicle-redefine-std-completion-fns)
           (icicle-redefine-standard-functions)
           (icicle-redefine-standard-options)
           (if icicle-menu-items-to-history-flag
               (add-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history)
             (remove-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history))
           (dolist (fn  icicle-inhibit-advice-functions)
             (when (and (fboundp fn) (ad-is-active fn))
               (push (cons fn (ad-copy-advice-info fn)) icicle-advice-info-list)
               (ad-deactivate fn)))
           (run-hooks 'icicle-mode-hook)
           (message "<span class="quote">Icicle mode is now ON</span>"))
          (t
           (makunbound 'icicle-mode-map)
           (icicle-restore-other-keymap-keys)
           (remove-hook 'minibuffer-setup-hook    'icicle-minibuffer-setup)
           (remove-hook 'minibuffer-exit-hook     'icicle-cancel-Help-redirection)
           (remove-hook 'minibuffer-exit-hook     'icicle-restore-region-face)
           (remove-hook 'icicle-post-command-hook 'icicle-activate-mark)
           <span class="linecomment">;; The pre- and post-command hooks are local to the minibuffer,</span>
           <span class="linecomment">;; So they are added in `icicle-minibuffer-setup', not here.</span>
           <span class="linecomment">;; Nevertheless, they are removed here when Icicle mode is exited.</span>
           (remove-hook 'pre-command-hook         'icicle-top-level-prep)
           (remove-hook 'pre-command-hook         'icicle-run-icicle-pre-command-hook t)
           (remove-hook 'post-command-hook        'icicle-run-icicle-post-command-hook t)
           (remove-hook 'completion-setup-hook    'icicle-set-calling-cmd)
           (remove-hook 'kill-emacs-hook          'icicle-command-abbrev-save)
           (remove-hook 'comint-mode-hook         'icicle-comint-hook-fn)
           (remove-hook 'compilation-mode-hook    'icicle-compilation-hook-fn)
           (remove-hook 'compilation-minor-mode-hook 'icicle-compilation-hook-fn)
           <span class="linecomment">;; $$$$$$ Do this only in `icicle-display-candidates-in-Completions' now.</span>
           <span class="linecomment">;; $$$$$$ (remove-hook 'temp-buffer-show-hook    'icicle-fit-completions-window)</span>
           (icicle-restore-std-completion-fns)
           (icicle-restore-standard-functions)
           (icicle-restore-standard-options)
           (unless (eq icicle-guess-commands-in-path 'load)
             (setq icicle-shell-command-candidates-cache  ())) <span class="linecomment">; Reset - toggle Icy to update.</span>
           (remove-hook 'pre-command-hook 'icicle-add-menu-item-to-cmd-history)
           (dolist (fn  icicle-inhibit-advice-functions)
             (let ((info  (memq fn icicle-advice-info-list)))
               (when (and (fboundp fn) info)
                 (ad-set-advice-info fn info)
                 (when (ad-is-active fn) (ad-activate fn)))))
           (run-hooks 'icicle-mode-hook)
           (message "<span class="quote">Icicle mode is now OFF</span>")))

    (add-to-list 'minor-mode-alist '(icicle-mode "<span class="quote"> Icy</span>"))))

(defun icicle-add-menu-item-to-cmd-history ()
  "<span class="quote">Add `this-command' to command history, if it is a menu item.
Menu items that are not associated with a command symbol are ignored.
Used on `pre-command-hook'.</span>"
  (condition-case nil                   <span class="linecomment">; Just in case, since this is on `pre-command-hook'.</span>
      (when (and (&gt; (length (this-command-keys-vector)) 0)
                 (equal '(menu-bar) (elt (this-command-keys-vector) 0))
                 <span class="linecomment">;; Exclude uninterned symbols such as `menu-function-356'.</span>
                 (symbolp this-command) (or (&lt; emacs-major-version 21) (intern-soft this-command)))
        (pushnew (symbol-name this-command) extended-command-history))
    (error nil)))

(defun icicle-top-level-prep ()
  "<span class="quote">Do top-level stuff.  Used in `pre-command-hook'.</span>"
  <span class="linecomment">;; Reset `icicle-current-TAB-method' and `icicle-apropos-complete-match-fn' if temporary.</span>
  <span class="linecomment">;; Save this top-level command as `icicle-last-top-level-command'</span>
  <span class="linecomment">;; Reset `icicle-candidates-alist' to ().</span>
  (when (= 0 (recursion-depth))
    (let ((TAB-method  (get 'icicle-last-top-level-command 'icicle-current-TAB-method))
          (apropos-fn  (get 'icicle-last-top-level-command 'icicle-apropos-complete-match-fn)))
      (when TAB-method (setq icicle-current-TAB-method  TAB-method))
      (when apropos-fn (setq icicle-apropos-complete-match-fn apropos-fn)))
    (setq icicle-last-top-level-command   this-command
          icicle-candidates-alist         ())))

(defun icicle-define-icicle-maps ()
  "<span class="quote">Define `icicle-mode-map' and `icicle-menu-map'.</span>"
  (setq icicle-mode-map  (make-sparse-keymap)) <span class="linecomment">; Recreate it each time, to capture latest bindings.</span>

  <span class="linecomment">;; Define `Icicles' menu-bar menu.  Create it only once: sacrifice any new bindings for speed.</span>
  (unless icicle-menu-map
    (setq icicle-menu-map  (make-sparse-keymap "<span class="quote">Icicles</span>"))
    (define-key icicle-menu-map [icicle-mode] '(menu-item "<span class="quote">Turn Off Icicle Mode</span>" icicle-mode))
    (define-key icicle-menu-map [icicle-abort]
      '(menu-item "<span class="quote">Cancel Minibuffer</span>" icicle-abort-recursive-edit
        :enable (active-minibuffer-window)))
    (define-key icicle-menu-map [icicle-report-bug]
      '(menu-item "<span class="quote">Send Bug Report</span>" icicle-send-bug-report))
    (define-key icicle-menu-map [icicle-customize-icicles-group]
      '(menu-item "<span class="quote">Customize Icicles</span>" icicle-customize-icicles-group))
    (define-key icicle-menu-map [icicle-help]
      '(menu-item "<span class="quote">Help</span>" icicle-minibuffer-help
        :help "<span class="quote">Display help for minibuffer input and completion</span>"
        :keys "<span class="quote">C-? in minibuf</span>"))
    (define-key icicle-menu-map [icicle-separator-last] '("<span class="quote">--</span>"))

    (when (and (not icicle-touche-pas-aux-menus-flag) <span class="linecomment">; `Bookmark+' menu.</span>
               (boundp 'bmkp-bmenu-menubar-menu)) <span class="linecomment">; In `bookmark+-bmu.el'.</span>
      (defvar icicle-bookmark+-menu-map (make-sparse-keymap)
        "<span class="quote">Icicles submenu for `Bookmark+' menu.</span>")
      (define-key bmkp-bmenu-menubar-menu [icicles]
        (list 'menu-item "<span class="quote">Icicles</span>" icicle-bookmark+-menu-map :visible 'icicle-mode))
      (define-key icicle-bookmark+-menu-map [icicle-search-bookmark-list-marked]
        '(menu-item "<span class="quote">Search & Replace in Marked Files...</span>" icicle-search-bookmark-list-marked
          :visible icicle-mode :enable (eq major-mode 'bookmark-bmenu-mode)))
      (define-key icicle-bookmark+-menu-map [icicle-bookmark-save-marked-files-more]
        '(menu-item "<span class="quote">Saved Marked Files as More Candidates...</span>" icicle-bookmark-save-marked-files-more
          :visible icicle-mode :enable (eq major-mode 'bookmark-bmenu-mode)))
      (define-key icicle-bookmark+-menu-map [icicle-bookmark-save-marked-files]
        '(menu-item "<span class="quote">Saved Marked Files as Candidates...</span>" icicle-bookmark-save-marked-files
          :visible icicle-mode :enable (eq major-mode 'bookmark-bmenu-mode)))
      (define-key icicle-bookmark+-menu-map [icicle-bookmark-save-marked-files-as-project]
        '(menu-item "<span class="quote">Save Marked Files as Project</span>" icicle-bookmark-save-marked-files-as-project
          :visible icicle-mode :enable (eq major-mode 'bookmark-bmenu-mode))))

    (unless icicle-touche-pas-aux-menus-flag <span class="linecomment">; Use Dired's `Multiple' or `Operate' menu.</span>
      (defvar icicle-dired-multiple-menu-map (make-sparse-keymap)
        "<span class="quote">Icicles submenu for Dired's `Multiple' (or `Operate') menu.</span>")
      (if (boundp 'diredp-menu-bar-operate-menu) <span class="linecomment">; In `dired+.el'.</span>
          (define-key diredp-menu-bar-operate-menu [icicles]
            (list 'menu-item "<span class="quote">Icicles</span>" icicle-dired-multiple-menu-map :visible 'icicle-mode))
        (define-key dired-mode-map [menu-bar operate icicles]
          (list 'menu-item "<span class="quote">Icicles</span>" icicle-dired-multiple-menu-map :visible 'icicle-mode)))
      (define-key icicle-dired-multiple-menu-map [icicle-search-dired-marked]
        '(menu-item "<span class="quote">Search (and Replace)...</span>" icicle-search-dired-marked
          :visible icicle-mode :enable (eq major-mode 'dired-mode)))
      (define-key icicle-dired-multiple-menu-map [icicle-dired-save-marked-more]
        '(menu-item "<span class="quote">Save as More Completion Candidates</span>" icicle-dired-save-marked-more
          :visible icicle-mode :enable (eq major-mode 'dired-mode)))
      (define-key icicle-dired-multiple-menu-map [icicle-dired-save-marked]
        '(menu-item "<span class="quote">Save as Completion Candidates</span>" icicle-dired-save-marked
          :visible icicle-mode :enable (eq major-mode 'dired-mode)))
      (define-key icicle-dired-multiple-menu-map [icicle-dired-save-marked-as-project]
        '(menu-item "<span class="quote">Save as Project</span>" icicle-dired-save-marked-as-project
          :visible icicle-mode :enable (eq major-mode 'dired-mode))))

    (unless icicle-touche-pas-aux-menus-flag <span class="linecomment">; Use Dired's `Dir' or `Subdir' menu.</span>
      (defvar icicle-dired-dir-menu-map (make-sparse-keymap)
        "<span class="quote">Icicles submenu for Dired's `Dir' (or `Subdir') menu.</span>")
      (if (boundp 'diredp-menu-bar-subdir-menu) <span class="linecomment">; In `dired+.el'.</span>
          (define-key diredp-menu-bar-subdir-menu [icicles]
            (list 'menu-item "<span class="quote">Icicles</span>" icicle-dired-dir-menu-map :visible 'icicle-mode))
        (define-key dired-mode-map [menu-bar subdir icicles]
          (list 'menu-item "<span class="quote">Icicles</span>" icicle-dired-dir-menu-map :visible 'icicle-mode)))
      (define-key icicle-dired-dir-menu-map [icicle-dired-saved-file-candidates-other-window]
        '(menu-item "<span class="quote">Open Dired for Chosen Files...</span>"
          icicle-dired-saved-file-candidates-other-window
          :visible icicle-mode
          :enable (and icicle-saved-completion-candidates (eq major-mode 'dired-mode))))
      (define-key icicle-dired-dir-menu-map [icicle-dired-project-other-window]
        '(menu-item "<span class="quote">Open Dired for Project...</span>" icicle-dired-project-other-window
          :visible icicle-mode
          :enable (and icicle-saved-completion-sets (eq major-mode 'dired-mode)))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'Info-mode-menu)) <span class="linecomment">; Use `Info' menu, if available.</span>
           (defvar icicle-info-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Info' menu.</span>")
           (define-key Info-mode-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-info-menu-map :visible 'icicle-mode))
           (when (fboundp 'icicle-Info-virtual-book)
             (define-key icicle-info-menu-map [icicle-Info-virtual-book]
               '(menu-item "<span class="quote">Virtual Book</span>" icicle-Info-virtual-book :visible icicle-mode
                 :enable (eq major-mode 'Info-mode))))
           (define-key icicle-info-menu-map [icicle-Info-goto-node]
             '(menu-item "<span class="quote">+ Go to Node...</span>" icicle-Info-goto-node :visible icicle-mode
               :enable (eq major-mode 'Info-mode) :keys "<span class="quote">g</span>"))
           (define-key icicle-info-menu-map [icicle-Info-menu]
             '(menu-item "<span class="quote">+ Go to Menu Node...</span>" icicle-Info-menu :visible icicle-mode
               :enable (eq major-mode 'Info-mode) :keys "<span class="quote">m</span>"))
           (define-key icicle-info-menu-map [icicle-Info-index]
             '(menu-item "<span class="quote">+ Look Up in Index...</span>" icicle-Info-index :visible icicle-mode
               :enable (eq major-mode 'Info-mode) :keys "<span class="quote">i</span>")))
          (t
           (when (fboundp 'icicle-Info-virtual-book)
             (define-key icicle-menu-map [icicle-Info-virtual-book]
               '(menu-item "<span class="quote">Virtual Book</span>" icicle-Info-virtual-book
                 :enable (eq major-mode 'Info-mode))))
           (define-key icicle-menu-map [icicle-Info-goto-node]
             '(menu-item "<span class="quote">+ Go to Node...</span>" icicle-Info-goto-node
               :enable (eq major-mode 'Info-mode)))
           (define-key icicle-menu-map [icicle-Info-menu]
             '(menu-item "<span class="quote">+ Go to Menu Node...</span>" icicle-Info-menu
               :enable (eq major-mode 'Info-mode)))
           (define-key icicle-menu-map [icicle-Info-index]
             '(menu-item "<span class="quote">+ Look Up in Index...</span>" icicle-Info-index
               :enable (eq major-mode 'Info-mode)))
           (define-key icicle-menu-map [icicle-separator-Info]
             '(menu-item "<span class="quote">--</span>" icicle-separator-Info :visible icicle-mode
               :enable (eq major-mode 'Info-mode)))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-frames-menu)) <span class="linecomment">; Use `Frames' menu, defined in `menu-bar+.el'.</span>
           (defvar icicle-frames-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Frames' menu.</span>")
           (define-key menu-bar-frames-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-frames-menu-map :visible 'icicle-mode))
           (define-key icicle-frames-menu-map [icicle-font]
             '(menu-item "<span class="quote">+ Change Font</span>" icicle-font :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
           (define-key icicle-frames-menu-map [icicle-frame-fg]
             '(menu-item "<span class="quote">+ Change Foreground...</span>" icicle-frame-fg :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
           (define-key icicle-frames-menu-map [icicle-frame-bg]
             '(menu-item "<span class="quote">+ Change Background...</span>" icicle-frame-bg :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))))
          (t
           (define-key icicle-menu-map [icicle-font]
             '(menu-item "<span class="quote">+ Change Font of Frame...</span>" icicle-font
               :enable (and icicle-mode
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))))
           (define-key icicle-menu-map [icicle-frame-fg]
             '(menu-item "<span class="quote">+ Change Foreground of Frame...</span>" icicle-frame-fg
               :enable (and icicle-mode
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))))
           (define-key icicle-menu-map [icicle-frame-bg]
             '(menu-item "<span class="quote">+ Change Background of Frame...</span>" icicle-frame-bg
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
           (define-key icicle-menu-map [icicle-separator-frame] '("<span class="quote">--</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-describe-menu)) <span class="linecomment">; Use `Describe' menu, if available.</span>
           (defvar icicle-describe-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Describe' menu.</span>")
           (define-key menu-bar-describe-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-describe-menu-map :visible 'icicle-mode))
           (define-key icicle-describe-menu-map [icicle-plist]
             '(menu-item "<span class="quote">+ Symbol with Property List...</span>" icicle-plist :visible icicle-mode))
           (define-key icicle-describe-menu-map [icicle-doc]
             '(menu-item "<span class="quote">+ Doc of Fun, Var, or Face...</span>" icicle-doc :visible icicle-mode))
           (define-key icicle-describe-menu-map [icicle-fundoc]
             '(menu-item "<span class="quote">+ Function with Name, Doc...</span>" icicle-fundoc :visible icicle-mode))
           (define-key icicle-describe-menu-map [icicle-vardoc]
             '(menu-item "<span class="quote">+ Variable with Name, Doc...</span>" icicle-vardoc :visible icicle-mode))
           (define-key icicle-describe-menu-map [icicle-describe-option-of-type]
             '(menu-item "<span class="quote">+ Option of Type...</span>" icicle-describe-option-of-type
               :visible icicle-mode))
           (define-key icicle-describe-menu-map [icicle-where-is]
             '(menu-item "<span class="quote">+ Where Is...</span>" icicle-where-is :visible icicle-mode)))
          (t
           (define-key icicle-menu-map [icicle-plist]
             '(menu-item "<span class="quote">+ Symbol with Property List...</span>" icicle-plist))
           (define-key icicle-menu-map [icicle-doc]
             '(menu-item "<span class="quote">+ Doc of Fun, Var, or Face...</span>" icicle-doc))
           (define-key icicle-menu-map [icicle-fundoc]
             '(menu-item "<span class="quote">+ Describe Function with Name, Doc...</span>" icicle-fundoc))
           (define-key icicle-menu-map [icicle-vardoc]
             '(menu-item "<span class="quote">+ Describe Variable with Name, Doc...</span>" icicle-vardoc))
           (define-key icicle-menu-map [icicle-describe-option-of-type]
             '(menu-item "<span class="quote">+ Option of Type...</span>" icicle-describe-option-of-type))
           (define-key icicle-menu-map [icicle-where-is]
             '(menu-item "<span class="quote">+ Where Is...</span>" icicle-where-is))
           (define-key icicle-menu-map [icicle-separator-doc] '("<span class="quote">--</span>"))))

    (define-key icicle-menu-map [icicle-apply]
      '(menu-item "<span class="quote">+ Apply Function to Alist Items...</span>" icicle-apply))
    (define-key icicle-menu-map [icicle-save-string-to-variable]
      '(menu-item "<span class="quote">Save String to Variable...</span>" icicle-save-string-to-variable))
    (define-key icicle-menu-map [icicle-color-theme]
      '(menu-item "<span class="quote">+ Choose Color Theme...</span>" icicle-color-theme
        :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (define-key icicle-menu-map [icicle-remove-saved-completion-set]
      '(menu-item "<span class="quote">+ Remove Saved Candidate Set...</span>" icicle-remove-saved-completion-set
        :enable icicle-saved-completion-sets))
    (define-key icicle-menu-map [icicle-add/update-saved-completion-set]
      '(menu-item "<span class="quote">Add/Update Saved Candidate Set...</span>" icicle-add/update-saved-completion-set))
    (when (fboundp 'icicle-kmacro)
      (define-key icicle-menu-map [icicle-kmacro]
        '(menu-item "<span class="quote">+ Execute Nth Keyboard Macro...</span>" icicle-kmacro
          :enable (or (kmacro-ring-head) kmacro-ring))))
    (define-key icicle-menu-map [icicle-execute-named-keyboard-macro]
      '(menu-item "<span class="quote">+ Execute Named Keyboard Macro...</span>" icicle-execute-named-keyboard-macro))
    (define-key icicle-menu-map [icicle-separator-misc] '("<span class="quote">--</span>"))
    (define-key icicle-menu-map [icicle-imenu]
      '(menu-item "<span class="quote">+ Imenu...</span>" icicle-imenu
        :enable imenu-generic-expression))
    (define-key icicle-menu-map [icicle-goto-global-marker]
      '(menu-item "<span class="quote">+ Go To Global Marker...</span>" icicle-goto-global-marker
        :enable (consp (icicle-markers global-mark-ring)) :keys "<span class="quote">C-- C-x C-SPC</span>"))
    (define-key icicle-menu-map [icicle-goto-marker]
      '(menu-item "<span class="quote">+ Go To Marker...</span>" icicle-goto-marker
        :enable (mark t) :keys "<span class="quote">C-- C-SPC</span>"))
    (define-key icicle-menu-map [icicle-separator-goto] '("<span class="quote">--</span>"))
    (define-key icicle-menu-map [icicle-search-bookmarks-together]
      '(menu-item "<span class="quote">+ Search Bookmarks Together...</span>" icicle-search-bookmarks-together
        :enable (featurep 'bookmark+) :keys "<span class="quote">C-u C-`</span>"))
    (define-key icicle-menu-map [icicle-search-bookmark]
      '(menu-item "<span class="quote">+ Search Bookmarks Separately...</span>" icicle-search-bookmark
        :enable (featurep 'bookmark+)))
    (define-key icicle-menu-map [icicle-select-bookmarked-region]
      '(menu-item "<span class="quote">+ Select Bookmarked Region...</span>" icicle-select-bookmarked-region
        :enable (featurep 'bookmark+) :keys "<span class="quote">C-u C-x C-x</span>"))
    (define-key icicle-menu-map [icicle-separator-region] '("<span class="quote">--</span>"))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-apropos-menu)) <span class="linecomment">; Use `Apropos' menu, if available.</span>
           (defvar icicle-apropos-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Apropos' menu.</span>")
           (define-key menu-bar-apropos-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-apropos-menu-map :visible 'icicle-mode))
           (define-key icicle-apropos-menu-map [icicle-apropos-zippy]
             '(menu-item "<span class="quote">Zippy...</span>" icicle-apropos-zippy :visible icicle-mode))
           (cond ((fboundp 'apropos-option)
                  (define-key icicle-apropos-menu-map [icicle-apropos]
                    '(menu-item "<span class="quote">Symbols...</span>" icicle-apropos :visible icicle-mode))
                  (define-key icicle-apropos-menu-map [icicle-apropos-function]
                    '(menu-item "<span class="quote">Functions...</span>" icicle-apropos-function :visible icicle-mode))
                  (define-key icicle-apropos-menu-map [icicle-apropos-variable]
                    '(menu-item "<span class="quote">Variables...</span>" icicle-apropos-variable :visible icicle-mode))
                  (define-key icicle-apropos-menu-map [icicle-apropos-option]
                    '(menu-item "<span class="quote">Options...</span>" icicle-apropos-option :visible icicle-mode))
                  (define-key icicle-apropos-menu-map [icicle-apropos-command]
                    '(menu-item "<span class="quote">Commands...</span>" icicle-apropos-command :visible icicle-mode)))
                 (t
                  (define-key icicle-apropos-menu-map [icicle-apropos-variable]
                    '(menu-item "<span class="quote">Variables...</span>" icicle-apropos-variable
                      :visible icicle-mode))))
           (define-key icicle-apropos-menu-map [icicle-apropos-command]
             '(menu-item "<span class="quote">Commands...</span>" icicle-apropos-command :visible icicle-mode)))
          (t
           (define-key icicle-menu-map [icicle-apropos-zippy]
             '(menu-item "<span class="quote">Apropos Zippy...</span>" icicle-apropos-zippy))
           (cond ((fboundp 'apropos-option)
                  (define-key icicle-menu-map [icicle-apropos]
                    '(menu-item "<span class="quote">Apropos...</span>" icicle-apropos))
                  (define-key icicle-menu-map [icicle-apropos-function]
                    '(menu-item "<span class="quote">Apropos Functions...</span>" icicle-apropos-function))
                  (define-key icicle-menu-map [icicle-apropos-variable]
                    '(menu-item "<span class="quote">Apropos Variables...</span>" icicle-apropos-variable))
                  (define-key icicle-menu-map [icicle-apropos-option]
                    '(menu-item "<span class="quote">Apropos Options...</span>" icicle-apropos-option))
                  (define-key icicle-menu-map [icicle-apropos-command]
                    '(menu-item "<span class="quote">Apropos Commands...</span>" icicle-apropos-command)))
                 (t
                  (define-key icicle-menu-map [icicle-apropos-variable]
                    '(menu-item "<span class="quote">Apropos Variables...</span>" icicle-apropos-variable))
                  (define-key icicle-menu-map [icicle-apropos-command]
                    '(menu-item "<span class="quote">Apropos Commands...</span>" icicle-apropos-command))))
           (define-key icicle-menu-map [icicle-separator-apropos] '("<span class="quote">--</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-options-menu)) <span class="linecomment">; Use `Options' menu, if available.</span>
           (defvar icicle-options-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Options' menu.</span>")
           (define-key menu-bar-options-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-options-menu-map :visible 'icicle-mode))
           (define-key icicle-options-menu-map [icicle-set-option-to-t]
             '(menu-item "<span class="quote">+ Turn On Any Option...</span>" icicle-set-option-to-t :visible icicle-mode
               :help "<span class="quote">Set boolean option to `t' (C-u: any user option, C--: any var)</span>"))
           (define-key icicle-options-menu-map [icicle-reset-option-to-nil]
             '(menu-item "<span class="quote">+ Turn Off Any Option...</span>" icicle-reset-option-to-nil :visible icicle-mode
               :help "<span class="quote">Reset an option to `nil' (C-u: reset any variable)</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-option]
             '(menu-item "<span class="quote">+ Toggle Any Option...</span>" icicle-toggle-option :visible icicle-mode
               :help "<span class="quote">Toggle boolean option (C-u: any user option, C--: any var)</span>"))
           (define-key icicle-options-menu-map [icicle-separator-options-general] '("<span class="quote">--</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-search-cleanup]
             '(menu-item "<span class="quote">Toggle Icicle-Search Highlighting Cleanup</span>" icicle-toggle-search-cleanup
               :visible icicle-mode :keys "<span class="quote">C-.</span>" :help "<span class="quote">Toggle option `icicle-search-cleanup-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-search-replace-common-match]
             '(menu-item "<span class="quote">Toggle Replacing Longest Common Match</span>"
               icicle-toggle-search-replace-common-match :visible icicle-mode
               :enable icicle-searching-p :keys "<span class="quote">M-;</span>"
               :help "<span class="quote">Toggle option `icicle-search-replace-common-match-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-search-replace-whole]
             '(menu-item "<span class="quote">Toggle Replacing Whole Search Hit</span>"
               icicle-toggle-search-replace-whole :visible icicle-mode
               :enable icicle-searching-p :keys "<span class="quote">M-_</span>"
               :help "<span class="quote">Toggle option `icicle-search-replace-whole-candidate-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-search-whole-word]
             '(menu-item "<span class="quote">Toggle Whole-Word Searching (Icicles Search)</span>"
               icicle-toggle-search-whole-word :visible icicle-mode
               :enable icicle-searching-p :keys "<span class="quote">M-q</span>"
               :help "<span class="quote">Toggle `icicle-search-whole-word-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-highlight-all-current]
             '(menu-item "<span class="quote">Toggle All-Current Icicle-Search Highlighting</span>"
               icicle-toggle-highlight-all-current :visible icicle-mode
               :enable icicle-searching-p :keys "<span class="quote">C-^</span>"
               :help "<span class="quote">Toggle option `icicle-search-highlight-all-current-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-separator-options-search] '("<span class="quote">--</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-regexp-quote]
             '(menu-item "<span class="quote">Toggle Escaping Special Chars</span>" icicle-toggle-regexp-quote
               :visible icicle-mode :keys "<span class="quote">C-`</span>"
               :help "<span class="quote">Toggle option `icicle-regexp-quote-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-dot]
             '(menu-item "<span class="quote">Toggle `.' Matching Newlines Too</span>" icicle-toggle-dot
               :visible icicle-mode :keys "<span class="quote">C-M-.</span>"
               :help "<span class="quote">Toggle `icicle-dot-string' between `.' and `icicle-anychar-regexp'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-incremental-completion]
             '(menu-item "<span class="quote">Toggle Incremental Completion</span>"
               icicle-toggle-incremental-completion :visible icicle-mode :keys "<span class="quote">C-#</span>"
               :help "<span class="quote">Toggle option `icicle-incremental-completion-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-show-multi-completion]
             '(menu-item "<span class="quote">Toggle Showing Multi-Completions</span>"
               icicle-toggle-show-multi-completion :visible icicle-mode
               :help "<span class="quote">Toggle option `icicle-show-multi-completion-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-hiding-common-match]
             '(menu-item "<span class="quote">Toggle Hiding Common Match</span>"
               icicle-toggle-hiding-common-match :visible icicle-mode :keys "<span class="quote">C-x .</span>"
               :help "<span class="quote">Toggle option `icicle-hide-common-match-in-Completions-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-expand-to-common-match]
             '(menu-item "<span class="quote">Toggle Longest Common Match</span>"
               icicle-toggle-expand-to-common-match :visible icicle-mode :keys "<span class="quote">C-;</span>"
               :help "<span class="quote">Toggle option `icicle-expand-input-to-common-match-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-ignoring-comments]
             '(menu-item "<span class="quote">Toggle Ignoring Comments</span>" icicle-toggle-ignoring-comments
               :visible icicle-mode :keys "<span class="quote">C-M-;</span>"
               :help "<span class="quote">Toggle option `icicle-ignore-comments-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-ignored-space-prefix]
             '(menu-item "<span class="quote">Toggle Ignoring Space Prefix</span>" icicle-toggle-ignored-space-prefix
               :visible icicle-mode :keys "<span class="quote">M-_</span>"
               :help "<span class="quote">Toggle option `icicle-ignore-space-prefix-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-ignored-extensions]
             '(menu-item "<span class="quote">Toggle Ignored File Extensions</span>" icicle-toggle-ignored-extensions
               :visible icicle-mode :keys "<span class="quote">C-.</span>"
               :help "<span class="quote">Toggle respect of `completion-ignored-extensions'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-remote-file-testing]
             '(menu-item "<span class="quote">Toggle Remote File Handling</span>" icicle-toggle-remote-file-testing
               :visible icicle-mode :enable (not icicle-searching-p) :keys "<span class="quote">C-^</span>"
               :help "<span class="quote">Toggle option `icicle-test-for-remote-files-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-angle-brackets]
             '(menu-item "<span class="quote">Toggle Angle Brackets</span>" icicle-toggle-angle-brackets
               :visible icicle-mode :help "<span class="quote">Toggle option `icicle-key-descriptions-use-&lt;&gt;-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-highlight-saved-candidates]
             '(menu-item "<span class="quote">Toggle Highlighting Saved Candidates</span>"
               icicle-toggle-highlight-saved-candidates :visible icicle-mode :keys "<span class="quote">S-pause</span>"
               :help "<span class="quote">Toggle option `icicle-highlight-saved-candidates-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-highlight-historical-candidates]
             '(menu-item "<span class="quote">Toggle Highlighting Past Inputs</span>"
               icicle-toggle-highlight-historical-candidates :visible icicle-mode :keys "<span class="quote">C-pause</span>"
               :help "<span class="quote">Toggle option `icicle-highlight-historical-candidates-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-case-sensitivity]
             '(menu-item "<span class="quote">Toggle Case Sensitivity</span>" icicle-toggle-case-sensitivity
               :visible icicle-mode :keys "<span class="quote">C-A</span>"
               :help "<span class="quote">Toggle `case-fold-search', `completion-ignore-case' (C-u: file & buffer too)</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-proxy-candidates]
             '(menu-item "<span class="quote">Toggle Including Proxy Candidates</span>" icicle-toggle-proxy-candidates
               :visible icicle-mode :keys "<span class="quote">C-M-_</span>"
               :help "<span class="quote">Toggle option `icicle-add-proxy-candidates-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-transforming]
             '(menu-item "<span class="quote">Toggle Duplicate Removal</span>" icicle-toggle-transforming
               :visible icicle-mode :keys "<span class="quote">C-$</span>"
               :help "<span class="quote">Toggle use of `icicle-transform-function' (default: remove dups)</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-C-for-actions]
             '(menu-item "<span class="quote">Toggle Using `C-' for Actions</span>" icicle-toggle-C-for-actions
               :visible icicle-mode :keys "<span class="quote">M-g</span>"
               :help "<span class="quote">Toggle option `icicle-use-C-for-actions-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-~-for-home-dir]
             '(menu-item "<span class="quote">Toggle Using `~' for $HOME</span>" icicle-toggle-~-for-home-dir
               :visible icicle-mode :keys "<span class="quote">M-~</span>"
               :help "<span class="quote">Toggle option `icicle-use-~-for-home-dir-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-WYSIWYG-Completions]
             '(menu-item "<span class="quote">Toggle WYSIWYG For `*Completions*'</span>" icicle-toggle-WYSIWYG-Completions
               :visible icicle-mode :help "<span class="quote">Toggle option `icicle-WYSIWYG-Completions-flag'</span>"))
           (define-key icicle-options-menu-map [icicle-next-TAB-completion-method]
             '(menu-item "<span class="quote">Next `TAB' Completion Method</span>"
               icicle-next-TAB-completion-method :visible icicle-mode :keys "<span class="quote">C-(</span>"
               :help "<span class="quote">Cycle to the next `TAB' completion method (C-u: ONE-OFF)</span>"))
           (define-key icicle-options-menu-map [icicle-next-S-TAB-completion-method]
             '(menu-item "<span class="quote">Next `S-TAB' Completion Method</span>" icicle-next-S-TAB-completion-method
               :visible icicle-mode :keys "<span class="quote">M-(</span>"
               :help "<span class="quote">Cycle to the next `S-TAB' completion method (C-u: ONE-OFF)</span>"))
           (define-key icicle-options-menu-map [icicle-separator-options-sort] '("<span class="quote">--</span>"))
           (define-key icicle-options-menu-map [icicle-toggle-alternative-sorting]
             '(menu-item "<span class="quote">Swap Alternative Sort</span>" icicle-toggle-alternative-sorting
               :visible icicle-mode :keys "<span class="quote">C-M-,</span>"
               :help "<span class="quote">Swap current sort order for current alternative sort order</span>"))
           (define-key icicle-options-menu-map [icicle-change-alternative-sort-order]
             '(menu-item "<span class="quote">Change Alternative Sort Order</span>"
               icicle-change-alternative-sort-order :visible icicle-mode :keys "<span class="quote">M-,</span>"
               :help "<span class="quote">Choose alt sort order (C-9: reverse, C-u: cyle/complete)</span>"))
           (define-key icicle-options-menu-map [icicle-change-sort-order]
             '(menu-item "<span class="quote">Change Sort Order</span>" icicle-change-sort-order :visible icicle-mode
               :enable (not icicle-inhibit-sort-p) :keys "<span class="quote">C-,</span>"
               :help "<span class="quote">Choose sort order (C-9: reverse, C-u: cyle/complete)</span>"))
           (when (fboundp 'doremi)
             (define-key icicle-options-menu-map [icicle-separator-options-doremi]
               '(menu-item "<span class="quote">--</span>" nil :visible (or (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)
                                              (eq (icicle-current-TAB-method) 'swank)
                                              (active-minibuffer-window))))
             (when (fboundp 'text-scale-increase) <span class="linecomment">; Emacs 23+.</span>
               (define-key icicle-options-menu-map [icicle-doremi-zoom-Completions+]
                 '(menu-item "<span class="quote">`*Completions*' Zoom Factor - Do Re Mi</span>"
                   icicle-doremi-zoom-Completions+
                   :visible (and icicle-mode (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
                   :keys "<span class="quote">C-x -</span>" :help "<span class="quote">Zoom text in `*Completions*' incrementally</span>")))
             (define-key icicle-options-menu-map [icicle-doremi-inter-candidates-min-spaces+]
               '(menu-item "<span class="quote">Inter-Candidate Spacing - Do Re Mi</span>"
                 icicle-doremi-inter-candidates-min-spaces+
                 :visible (and icicle-mode (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
                 :keys "<span class="quote">C-x |</span>" :help "<span class="quote">Change `icicle-inter-candidates-min-spaces' incrementally</span>"))
             (define-key icicle-options-menu-map [icicle-doremi-candidate-width-factor+]
               '(menu-item "<span class="quote">Candidate Column Width - Do Re Mi</span>"
                 icicle-doremi-candidate-width-factor+
                 :visible (and icicle-mode (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
                 :keys "<span class="quote">C-x w</span>" :help "<span class="quote">Change `icicle-candidate-width-factor' incrementally</span>"))
             (define-key icicle-options-menu-map [icicle-doremi-increment-swank-prefix-length+]
               '(menu-item "<span class="quote">Swank Min Match Chars - Do Re Mi</span>"
                 icicle-doremi-increment-swank-prefix-length+
                 :visible (and icicle-mode (eq (icicle-current-TAB-method) 'swank)) :keys "<span class="quote">C-x 2</span>"
                 :help "<span class="quote">Change `icicle-swank-prefix-length' incrementally</span>"))
             (define-key icicle-options-menu-map [icicle-doremi-increment-swank-timeout+]
               '(menu-item "<span class="quote">Swank Timeout - Do Re Mi</span>"
                 icicle-doremi-increment-swank-timeout+
                 :visible (and icicle-mode (eq (icicle-current-TAB-method) 'swank)) :keys "<span class="quote">C-x 1</span>"
                 :help "<span class="quote">Change `icicle-swank-timeout' incrementally</span>"))
             (define-key icicle-options-menu-map [icicle-doremi-increment-max-candidates+]
               '(menu-item "<span class="quote">Max # of Completions - Do Re Mi</span>"
                 icicle-doremi-increment-max-candidates+
                 :visible (and icicle-mode (active-minibuffer-window)) :keys "<span class="quote">C-x #</span>"
                 :help "<span class="quote">Change `icicle-max-candidates' incrementally</span>"))))
          (t
           (define-key icicle-menu-map [icicle-set-option-to-t]
             '(menu-item "<span class="quote">+ Turn On Any Option...</span>" icicle-set-option-to-t
               :help "<span class="quote">Set boolean option to `t' (C-u: any user option, C--: any var)</span>"))
           (define-key icicle-menu-map [icicle-reset-option-to-nil]
             '(menu-item "<span class="quote">+ Turn Off Any Option...</span>" icicle-reset-option-to-nil
               :help "<span class="quote">Reset an option to `nil' (C-u: reset any variable)</span>"))
           (define-key icicle-menu-map [icicle-toggle-option]
             '(menu-item "<span class="quote">+ Toggle Any Option...</span>" icicle-toggle-option
               :help "<span class="quote">Toggle boolean option (C-u: any user option, C--: any var)</span>"))
           (define-key icicle-menu-map [icicle-toggle-C-for-actions]
             '(menu-item "<span class="quote">Toggle Using `C-' for Actions</span>" icicle-toggle-C-for-actions :keys "<span class="quote">M-g</span>"
               :help "<span class="quote">Toggle option `icicle-use-C-for-actions-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-~-for-home-dir]
             '(menu-item "<span class="quote">Toggle Using `~' for $HOME</span>" icicle-toggle-~-for-home-dir :keys "<span class="quote">M-~</span>"
               :help "<span class="quote">Toggle option `icicle-use-~-for-home-dir-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-WYSIWYG-Completions]
             '(menu-item "<span class="quote">Toggle WYSIWYG For `*Completions*'</span>" icicle-toggle-WYSIWYG-Completions
               :help "<span class="quote">Toggle option `icicle-WYSIWYG-Completions-flag'</span>"))
           (define-key icicle-menu-map [icicle-next-TAB-completion-method]
             '(menu-item "<span class="quote">Next `TAB' Completion Method</span>" icicle-next-TAB-completion-method
               :keys "<span class="quote">C-(</span>" :help "<span class="quote">Cycle to the next `TAB' completion method (C-u: ONE-OFF)</span>"))
           (define-key icicle-menu-map [icicle-next-S-TAB-completion-method]
             '(menu-item "<span class="quote">Next `S-TAB' Completion Method</span>" icicle-next-S-TAB-completion-method
               :keys "<span class="quote">M-(</span>" :help "<span class="quote">Cycle to the next `S-TAB' completion method (C-u: ONE-OFF)</span>"))
           (define-key icicle-menu-map [icicle-toggle-search-cleanup]
             '(menu-item "<span class="quote">Toggle Icicle-Search Highlighting Cleanup</span>" icicle-toggle-search-cleanup
               :keys "<span class="quote">C-.</span>" :help "<span class="quote">Toggle option `icicle-search-cleanup-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-search-replace-common-match]
             '(menu-item "<span class="quote">Toggle Replacing Longest Common Match</span>"
               icicle-toggle-search-replace-common-match :enable icicle-searching-p :keys "<span class="quote">M-;</span>"
               :help "<span class="quote">Toggle option `icicle-search-replace-common-match-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-search-replace-whole]
             '(menu-item "<span class="quote">Toggle Replacing Whole Search Hit</span>" icicle-toggle-search-replace-whole
               :enable icicle-searching-p :keys "<span class="quote">M-_</span>"
               :help "<span class="quote">Toggle option `icicle-search-replace-whole-candidate-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-search-whole-word]
             '(menu-item "<span class="quote">Toggle Whole-Word Searching (Icicles Search)</span>"
               icicle-toggle-search-whole-word
               :enable icicle-searching-p :keys "<span class="quote">M-q</span>"
               :help "<span class="quote">Toggle `icicle-search-whole-word-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-regexp-quote]
             '(menu-item "<span class="quote">Toggle Escaping Special Chars</span>" icicle-toggle-regexp-quote :keys "<span class="quote">C-`</span>"
               :help "<span class="quote">Toggle option `icicle-regexp-quote-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-dot]
             '(menu-item "<span class="quote">Toggle `.' Matching Newlines Too</span>" icicle-toggle-dot :keys "<span class="quote">C-M-.</span>"
               :help "<span class="quote">Toggle `icicle-dot-string' between `.' and `icicle-anychar-regexp'</span>"))
           (define-key icicle-menu-map [icicle-toggle-incremental-completion]
             '(menu-item "<span class="quote">Toggle Incremental Completion</span>" icicle-toggle-incremental-completion
               :keys "<span class="quote">C-#</span>" :help "<span class="quote">Toggle option `icicle-incremental-completion-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-show-multi-completion]
             '(menu-item "<span class="quote">Toggle Showing Multi-Completions</span>" icicle-toggle-show-multi-completion
               :help "<span class="quote">Toggle option `icicle-show-multi-completion-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-hiding-common-match]
             '(menu-item "<span class="quote">Toggle Hiding Common Match</span>" icicle-toggle-hiding-common-match
               :keys "<span class="quote">C-x .</span>" :help "<span class="quote">Toggle option `icicle-hide-common-match-in-Completions-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-expand-to-common-match]
             '(menu-item "<span class="quote">Toggle Longest Common Match</span>" icicle-toggle-expand-to-common-match
               :keys "<span class="quote">C-;</span>" :help "<span class="quote">Toggle option `icicle-expand-input-to-common-match-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-ignoring-comments]
             '(menu-item "<span class="quote">Toggle Ignoring Comments</span>" icicle-toggle-ignoring-comments
               :keys "<span class="quote">C-M-;</span>" :help "<span class="quote">Toggle option `icicle-ignore-comments-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-ignored-space-prefix]
             '(menu-item "<span class="quote">Toggle Ignoring Space Prefix</span>" icicle-toggle-ignored-space-prefix
               :keys "<span class="quote">M-_</span>" :help "<span class="quote">Toggle option `icicle-ignore-space-prefix-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-ignored-extensions]
             '(menu-item "<span class="quote">Toggle Ignored File Extensions</span>" icicle-toggle-ignored-extensions
               :keys "<span class="quote">C-.</span>" :help "<span class="quote">Toggle respect of `completion-ignored-extensions'</span>"))
           (define-key icicle-menu-map [icicle-toggle-remote-file-testing]
             '(menu-item "<span class="quote">Toggle Remote File Handling</span>" icicle-toggle-remote-file-testing
               :enable (not icicle-searching-p) :keys "<span class="quote">C-^</span>"
               :help "<span class="quote">Toggle option `icicle-test-for-remote-files-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-angle-brackets]
             '(menu-item "<span class="quote">Toggle Angle Brackets</span>" icicle-toggle-angle-brackets
               :help "<span class="quote">Toggle option `icicle-key-descriptions-use-&lt;&gt;-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-highlight-saved-candidates]
             '(menu-item "<span class="quote">Toggle Highlighting Saved Candidates</span>"
               icicle-toggle-highlight-saved-candidates :keys "<span class="quote">S-pause</span>"
               :help "<span class="quote">Toggle option `icicle-highlight-saved-candidates-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-highlight-historical-candidates]
             '(menu-item "<span class="quote">Toggle Highlighting Past Inputs</span>"
               icicle-toggle-highlight-historical-candidates :keys "<span class="quote">C-pause</span>"
               :help "<span class="quote">Toggle option `icicle-highlight-historical-candidates-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-case-sensitivity]
             '(menu-item "<span class="quote">Toggle Case Sensitivity</span>" icicle-toggle-case-sensitivity :keys "<span class="quote">C-A</span>"
               :help "<span class="quote">Toggle `case-fold-search', `completion-ignore-case' (C-u: file & buffer too)</span>"))
           (define-key icicle-menu-map [icicle-toggle-proxy-candidates]
             '(menu-item "<span class="quote">Toggle Including Proxy Candidates</span>" icicle-toggle-proxy-candidates
               :keys "<span class="quote">C-M-_</span>" :help "<span class="quote">Toggle option `icicle-add-proxy-candidates-flag'</span>"))
           (define-key icicle-menu-map [icicle-toggle-transforming]
             '(menu-item "<span class="quote">Toggle Duplicate Removal</span>" icicle-toggle-transforming :keys "<span class="quote">C-$</span>"
               :help "<span class="quote">Toggle use of `icicle-transform-function' (default: remove dups)</span>"))
           (define-key icicle-menu-map [icicle-toggle-alternative-sorting]
             '(menu-item "<span class="quote">Swap Alternative Sort</span>" icicle-toggle-alternative-sorting :keys "<span class="quote">C-M-,</span>"
               :help "<span class="quote">Swap current sort order for current alternative sort order</span>"))
           (define-key icicle-menu-map [icicle-change-alternative-sort-order]
             '(menu-item "<span class="quote">Change Alternative Sort Order</span>" icicle-change-alternative-sort-order
               :keys "<span class="quote">M-,</span>" :help "<span class="quote">Choose alt sort order (C-9: reverse, C-u: cyle/complete)</span>"))
           (define-key icicle-menu-map [icicle-change-sort-order]
             '(menu-item "<span class="quote">Change Sort Order</span>" icicle-change-sort-order
               :enable (not icicle-inhibit-sort-p) :keys "<span class="quote">C-,</span>"
               :help "<span class="quote">Choose sort order (C-9: reverse, C-u: cyle/complete)</span>"))
           (when (fboundp 'doremi)
             (when (fboundp 'text-scale-increase) <span class="linecomment">; Emacs 23+.</span>
               (define-key icicle-menu-map [icicle-doremi-zoom-Completions+]
                 '(menu-item "<span class="quote">`*Completions*' Zoom Factor - Do Re Mi</span>"
                   icicle-doremi-zoom-Completions+
                   :visible (get-buffer-window "<span class="quote">*Completions*</span>" 'visible) :keys "<span class="quote">C-x -</span>"
                   :help "<span class="quote">Zoom text in `*Completions*' incrementally</span>")))
             (define-key icicle-menu-map [icicle-doremi-inter-candidates-min-spaces+]
               '(menu-item "<span class="quote">Inter-Candidate Spacing - Do Re Mi</span>"
                 icicle-doremi-inter-candidates-min-spaces+
                 :visible (get-buffer-window "<span class="quote">*Completions*</span>" 'visible) :keys "<span class="quote">C-x |</span>"
                  :help "<span class="quote">Change `icicle-inter-candidates-min-spaces' incrementally</span>"))
             (define-key icicle-menu-map [icicle-doremi-candidate-width-factor+]
               '(menu-item "<span class="quote">Candidate Column Width - Do Re Mi</span>"
                 icicle-doremi-candidate-width-factor+
                 :visible (get-buffer-window "<span class="quote">*Completions*</span>" 'visible) :keys "<span class="quote">C-x w</span>"
                 :help "<span class="quote">Change `icicle-candidate-width-factor' incrementally</span>"))
             (define-key icicle-menu-map [icicle-doremi-increment-swank-prefix-length+]
               '(menu-item "<span class="quote">Swank Min Match Chars - Do Re Mi</span>"
                 icicle-doremi-increment-swank-prefix-length+
                 :visible (eq (icicle-current-TAB-method) 'swank) :keys "<span class="quote">C-x 2</span>"
                 :help "<span class="quote">Change `icicle-swank-prefix-length' incrementally</span>"))
             (define-key icicle-menu-map [icicle-doremi-increment-swank-timeout+]
               '(menu-item "<span class="quote">Swank Timeout - Do Re Mi</span>"
                 icicle-doremi-increment-swank-timeout+
                 :visible  (eq (icicle-current-TAB-method) 'swank) :keys "<span class="quote">C-x 1</span>"
                 :help "<span class="quote">Change `icicle-swank-timeout' incrementally</span>"))
             (define-key icicle-menu-map [icicle-doremi-increment-max-candidates+]
               '(menu-item "<span class="quote">Max # of Completions - Do Re Mi</span>"
                 icicle-doremi-increment-max-candidates+
                 :visible (active-minibuffer-window) :keys "<span class="quote">C-x #</span>"
                 :help "<span class="quote">Change `icicle-max-candidates' incrementally</span>")))
           (define-key icicle-menu-map [icicle-separator-toggle] '("<span class="quote">--</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-custom-menu)) <span class="linecomment">; Use `Customize' menu, if available.</span>
           (defvar icicle-custom-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Customize' menu.</span>")
           (define-key menu-bar-custom-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-custom-menu-map :visible 'icicle-mode))
           (define-key icicle-custom-menu-map [icicle-customize-apropos-groups]
             '(menu-item "<span class="quote">Groups Matching Regexp...</span>" icicle-customize-apropos-groups
               :visible icicle-mode :help "<span class="quote">Customize all user groups matching a regexp</span>"))
           (define-key icicle-custom-menu-map [icicle-customize-apropos-faces]
             '(menu-item "<span class="quote">Faces Matching Regexp...</span>" icicle-customize-apropos-faces
               :visible icicle-mode :help "<span class="quote">Customize all user faces matching a regexp</span>"))
           (define-key icicle-custom-menu-map [icicle-customize-face]
             '(menu-item "<span class="quote">+ Face...</span>" icicle-customize-face :visible icicle-mode
                :help "<span class="quote">Customize a face</span>"))
           (define-key icicle-custom-menu-map [icicle-customize-apropos-options]
             '(menu-item "<span class="quote">Options Matching Regexp...</span>" icicle-customize-apropos-options
               :visible icicle-mode :help "<span class="quote">Customize all user options matching a regexp</span>"))
           (define-key icicle-custom-menu-map [icicle-customize-apropos]
             '(menu-item "<span class="quote">Settings Matching Regexp...</span>" icicle-customize-apropos
               :visible icicle-mode :help "<span class="quote">Customize all user settings matching a regexp</span>")))
          (t
           (define-key icicle-menu-map [icicle-separator-customize] '("<span class="quote">--</span>"))
           (define-key icicle-menu-map [icicle-customize-apropos-groups]
             '(menu-item "<span class="quote">Groups Matching Regexp...</span>" icicle-customize-apropos-groups
                :help "<span class="quote">Customize all customization groups matching a regexp</span>"))
           (define-key icicle-menu-map [icicle-customize-apropos-faces]
             '(menu-item "<span class="quote">Faces Matching Regexp...</span>" icicle-customize-apropos-faces
                :help "<span class="quote">Customize all faces matching a regexp</span>"))
           (define-key icicle-menu-map [icicle-customize-face]
             '(menu-item "<span class="quote">+ Face...</span>" icicle-customize-face :help "<span class="quote">Customize a face</span>"))
           (define-key icicle-menu-map [icicle-customize-apropos-options]
             '(menu-item "<span class="quote">Options Matching Regexp...</span>" icicle-customize-apropos-options
                :help "<span class="quote">Customize all user options matching a regexp</span>"))
           (define-key icicle-menu-map [icicle-customize-apropos]
             '(menu-item "<span class="quote">Settings Matching Regexp...</span>" icicle-customize-apropos
                :help "<span class="quote">Customize all user settings matching a regexp</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-edit-menu)) <span class="linecomment">; Use `Edit' menu, if available.</span>
           (defvar icicle-edit-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Edit' menu.</span>")
           (define-key menu-bar-edit-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-edit-menu-map :visible 'icicle-mode))
           (define-key icicle-edit-menu-map [icicle-complete-thesaurus-entry]
             '(menu-item "<span class="quote">Complete with Thesaurus...</span>" icicle-complete-thesaurus-entry
               :visible icicle-mode
               :enable (and (not buffer-read-only) (boundp 'synonyms-obarray))))
           (define-key icicle-edit-menu-map [icicle-insert-thesaurus-entry]
             '(menu-item "<span class="quote">+ Insert Thesaurus Entry...</span>" icicle-insert-thesaurus-entry
               :visible icicle-mode
               :enable (and (not buffer-read-only) (boundp 'synonyms-obarray))))
           (define-key icicle-edit-menu-map [icicle-completing-yank]
             '(menu-item "<span class="quote">+ Paste Copied Text...</span>" icicle-completing-yank :visible icicle-mode
               :enable (not buffer-read-only) :keys "<span class="quote">C-- C-y</span>")))
          (t
           (define-key icicle-menu-map [icicle-separator-edit] '("<span class="quote">--</span>"))
           (define-key icicle-menu-map [icicle-complete-thesaurus-entry]
             '(menu-item "<span class="quote">Complete with Thesaurus...</span>" icicle-complete-thesaurus-entry
               :enable (and (not buffer-read-only) (boundp 'synonyms-obarray))
               :help "<span class="quote">Complete a word to an entry from a thesaurus</span>"))
           (define-key icicle-menu-map [icicle-insert-thesaurus-entry]
             '(menu-item "<span class="quote">+ Insert Thesaurus Entry...</span>" icicle-insert-thesaurus-entry
               :enable (and (not buffer-read-only) (boundp 'synonyms-obarray))
               :help "<span class="quote">Insert an entry from a thesaurus</span>"))
           (define-key icicle-menu-map [icicle-completing-yank]
             '(menu-item "<span class="quote">+ Paste Copied Text...</span>" icicle-completing-yank
               :enable (not buffer-read-only) :keys "<span class="quote">C-- C-y</span>"
               :help "<span class="quote">Yank an entry from the `kill-ring', choosing it using completion</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-file-menu)) <span class="linecomment">; Use `File' menu, if available.</span>
           (defvar icicle-file-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `File' menu.</span>")
           (define-key menu-bar-file-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-file-menu-map :visible 'icicle-mode))
           (define-key icicle-file-menu-map [icicle-kill-buffer]
             '(menu-item "<span class="quote">+ Kill Buffer...</span>" icicle-kill-buffer :visible icicle-mode :keys "<span class="quote">C-x k</span>"
               :help "<span class="quote">Kill a buffer (C-0: same-mode, C-9: file, C-- this-frame</span>"))
           (define-key icicle-file-menu-map [icicle-delete-file]
             '(menu-item "<span class="quote">+ Delete File...</span>" icicle-delete-file :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Delete a file or directory</span>"))
           (when (featurep 'recentf)
             (define-key icicle-file-menu-map [icicle-remove-file-from-recentf-list]
               '(menu-item "<span class="quote">+ Remove from Recent Files List...</span>"
                 icicle-remove-file-from-recentf-list :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Remove file from `recentf-list' - the list of recently used files</span>"))
             (define-key icicle-file-menu-map [icicle-recent-file-other-window]
               '(menu-item "<span class="quote">+ Open Recent File (Other Window)...</span>"
                 icicle-recent-file-other-window :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Open a recently used file in another window</span>"))
             (define-key icicle-file-menu-map [icicle-recent-file]
               '(menu-item "<span class="quote">+ Open Recent File...</span>" icicle-recent-file :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Open a recently used file</span>")))
           (define-key icicle-file-menu-map [icicle-dired-saved-file-candidates-other-window]
             '(menu-item "<span class="quote">Open Dired for Chosen Files...</span>"
               icicle-dired-saved-file-candidates-other-window :visible icicle-mode
               :enable (and icicle-saved-completion-candidates
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Open Dired on a set of files & directories of your choice</span>"))
           (define-key icicle-file-menu-map [icicle-dired-project-other-window]
             '(menu-item "<span class="quote">Open Dired for Project...</span>" icicle-dired-project-other-window
               :visible icicle-mode
               :enable (and icicle-saved-completion-sets
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Open Dired on a saved project in another window</span>"))
           (define-key icicle-file-menu-map [icicle-locate-file-other-window]
             '(menu-item "<span class="quote">+ Open File Under Directory (Other Window)...</span>"
               icicle-locate-file-other-window :visible icicle-mode
               :help "<span class="quote">Visit a file within a directory or its subdirectories, in another window</span>"))
           (define-key icicle-file-menu-map [icicle-locate-file]
             '(menu-item "<span class="quote">+ Open File Under Directory...</span>" icicle-locate-file :visible icicle-mode
               :help "<span class="quote">Visit a file within a directory or its subdirectories</span>"))
           (define-key icicle-file-menu-map [icicle-file-other-window]
             '(menu-item "<span class="quote">+ Open File or Directory (Other Window)...</span>" icicle-file-other-window
               :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Visit a file or directory in another window</span>"))
           (define-key icicle-file-menu-map [icicle-file]
             '(menu-item "<span class="quote">+ Open File or Directory...</span>" icicle-file :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Visit a file or directory (C-u absolute, C-- absolute by date)</span>")))
          (t
           (define-key icicle-menu-map [icicle-kill-buffer]
             '(menu-item "<span class="quote">+ Kill Buffer...</span>" icicle-kill-buffer
               :help "<span class="quote">Kill a buffer (C-0: same-mode, C-9: file, C-- this-frame</span>"))
           (define-key icicle-menu-map [icicle-delete-file]
             '(menu-item "<span class="quote">+ Delete File...</span>" icicle-delete-file
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Delete a file or directory</span>"))
           (when (featurep 'recentf)
             (define-key icicle-menu-map [icicle-remove-file-from-recentf-list]
               '(menu-item "<span class="quote">+ Remove from Recent Files List...</span>"
                 icicle-remove-file-from-recentf-list
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Remove file from `recentf-list' - the list of recently used files</span>"))
             (define-key icicle-menu-map [icicle-recent-file-other-window]
               '(menu-item "<span class="quote">+ Open Recent File (Other Window)...</span>" icicle-recent-file-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Open a recently used file in another window</span>"))
             (define-key icicle-menu-map [icicle-recent-file]
               '(menu-item "<span class="quote">+ Open Recent File...</span>" icicle-recent-file
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Open a recently used file</span>")))
           (define-key icicle-menu-map [icicle-dired-saved-file-candidates-other-window]
             '(menu-item "<span class="quote">Open Dired for Chosen Files...</span>"
               icicle-dired-saved-file-candidates-other-window
               :enable (and icicle-saved-completion-candidates
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Open Dired on a set of files & directories of your choice</span>"))
           (define-key icicle-menu-map [icicle-dired-project-other-window]
             '(menu-item "<span class="quote">Open Dired for Project...</span>" icicle-dired-project-other-window
               :enable (and icicle-saved-completion-sets
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Open Dired on a saved project in another window</span>"))
           (define-key icicle-menu-map [icicle-locate-file-other-window]
             '(menu-item "<span class="quote">+ Open File Under Directory (Other Window)...</span>"
               icicle-locate-file-other-window
               :help "<span class="quote">Visit a file within a directory or its subdirectories, in another window</span>"))
           (define-key icicle-menu-map [icicle-locate-file]
             '(menu-item "<span class="quote">+ Open File Under Directory...</span>" icicle-locate-file
               :help "<span class="quote">Visit a file within a directory or its subdirectories</span>"))
           (define-key icicle-menu-map [icicle-file-other-window]
             '(menu-item "<span class="quote">+ Open File or Directory (Other Window)...</span>"
               icicle-file-other-window
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Visit a file or directory in another window</span>"))
           (define-key icicle-menu-map [icicle-file]
             '(menu-item "<span class="quote">+ Open File or Directory ...</span>" icicle-file
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Visit a file or directory (C-u absolute, C-- absolute by date)</span>"))))
    (define-key icicle-menu-map [icicle-buffer-list]
      '(menu-item "<span class="quote">+ Buffer List...</span>" icicle-buffer-list :help "<span class="quote">Choose a list of buffer names</span>"))
    (define-key icicle-menu-map [icicle-remove-buffer-config]
      '(menu-item "<span class="quote">+ Remove Buffer Configuration...</span>" icicle-remove-buffer-config
        :enable icicle-buffer-configs
        :help "<span class="quote">Remove buffer configuration from `icicle-buffer-configs'</span>"))
    (define-key icicle-menu-map [icicle-add-buffer-config]
      '(menu-item "<span class="quote">New Buffer Configuration...</span>" icicle-add-buffer-config
        :help "<span class="quote">Add buffer configuration to `icicle-buffer-configs'</span>"))
    (define-key icicle-menu-map [icicle-buffer-config]
      '(menu-item "<span class="quote">+ Choose Buffer Configuration...</span>" icicle-buffer-config
        :enable icicle-buffer-configs
        :help "<span class="quote">Choose a configuration of user options for `icicle-buffer'</span>"))
    (define-key icicle-menu-map [icicle-remove-buffer-candidate]
      '(menu-item "<span class="quote">+ Don't Always Include Buffer...</span>" icicle-remove-buffer-candidate
        :enable icicle-buffer-extras :help "<span class="quote">Remove buffer as an always-show completion candidate</span>"))
    (define-key icicle-menu-map [icicle-add-buffer-candidate]
      '(menu-item "<span class="quote">+ Always Include Buffer...</span>" icicle-add-buffer-candidate
        :help "<span class="quote">Add buffer as an always-show completion candidate</span>"))
    (define-key icicle-menu-map [icicle-kill-buffer]
      '(menu-item "<span class="quote">+ Kill Buffer...</span>" icicle-kill-buffer
        :help "<span class="quote">Kill a buffer (C-0: same-mode, C-9: file, C-- this-frame</span>"))
    (define-key icicle-menu-map [icicle-insert-buffer]
      '(menu-item "<span class="quote">+ Insert Buffer...</span>" icicle-insert-buffer
        :help "<span class="quote">Multi-command version of `insert-buffer'</span>"))
    (define-key icicle-menu-map [icicle-delete-windows]
      '(menu-item "<span class="quote">+ Delete Windows on Buffer...</span>" icicle-delete-windows :keys "<span class="quote">C-u C-x 0</span>"
        :help "<span class="quote">Delete windows showing a buffer, anywhere</span>"))
    (define-key icicle-menu-map [icicle-buffer-other-window]
      '(menu-item "<span class="quote">+ Switch to Buffer (Other Window)...</span>" icicle-buffer-other-window
        :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))
    (define-key icicle-menu-map [icicle-buffer]
      '(menu-item "<span class="quote">+ Switch to Buffer...</span>" icicle-buffer
        :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
        :help "<span class="quote">Switch to a buffer (C-0: same mode, C-9: file buffer, C--: same frame</span>"))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-bookmark-map)) <span class="linecomment">; Use `Bookmarks' menu, if available.</span>
           (require 'bookmark)          <span class="linecomment">; `bookmark-buffer-name' is not autoloaded.</span>
           (defvar icicle-bookmark-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Bookmarks' menu.</span>")
           (define-key menu-bar-bookmark-map [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-bookmark-menu-map :visible 'icicle-mode))
           (define-key icicle-bookmark-menu-map [icicle-goto-global-marker]
             '(menu-item "<span class="quote">+ Go To Global Marker...</span>" icicle-goto-global-marker :visible icicle-mode
               :enable (consp (icicle-markers global-mark-ring)) :keys "<span class="quote">C-- C-x C-SPC</span>"
               :help "<span class="quote">Go to a global marker, choosing it by its line</span>"))
           (define-key icicle-bookmark-menu-map [icicle-goto-marker]
             '(menu-item "<span class="quote">+ Go To Marker...</span>" icicle-goto-marker :visible icicle-mode
               :enable (consp (icicle-markers mark-ring)) :keys "<span class="quote">C-- C-SPC</span>"
               :help "<span class="quote">Go to a marker in this buffer, choosing it by its line</span>"))
           (define-key icicle-bookmark-menu-map [icicle-separator-goto] '("<span class="quote">--</span>"))
           (when (featurep 'bookmark+)
             (define-key icicle-bookmark-menu-map [icicle-bookmark-all-tags-regexp-other-window]
               '(menu-item "<span class="quote">All Tags Matching Regexp...</span>" icicle-bookmark-all-tags-regexp-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark that has each tag matching a regexp that you enter</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-some-tags-regexp-other-window]
               '(menu-item "<span class="quote">Any Tag Matching Regexp...</span>" icicle-bookmark-some-tags-regexp-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark with at least one tag matching a regexp</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-all-tags-other-window]
               '(menu-item "<span class="quote">All Tags in Set...</span>" icicle-bookmark-all-tags-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark that has all of a set of tags that you enter</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-some-tags-other-window]
               '(menu-item "<span class="quote">Any Tag in Set...</span>" icicle-bookmark-some-tags-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark that has some of a set of tags that you enter</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-file-all-tags-regexp-other-window]
               '(menu-item "<span class="quote">File, All Tags Matching Regexp...</span>"
                 icicle-bookmark-file-all-tags-regexp-other-window :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a file or dir bookmark where each tag matches a regexp</span>"))
             (define-key icicle-bookmark-menu-map
                 [icicle-bookmark-file-some-tags-regexp-other-window]
               '(menu-item "<span class="quote">File, Any Tag Matching Regexp...</span>"
                 icicle-bookmark-file-some-tags-regexp-other-window :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a file or dir bookmark where at least one tag matches a regexp</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-file-all-tags-other-window]
               '(menu-item "<span class="quote">File, All Tags in Set...</span>" icicle-bookmark-file-all-tags-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a file or dir bookmark that has all of a set of tags</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-file-some-tags-other-window]
               '(menu-item "<span class="quote">File, Any Tag in Set...</span>" icicle-bookmark-file-some-tags-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a file or dir bookmark that has some of a set of tags</span>"))
             (define-key icicle-bookmark-menu-map [icicle-separator-bookmark-tags] '("<span class="quote">--</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-non-file-other-window]
               '(menu-item "<span class="quote">+ Jump to Buffer (Non-File) Bookmark...</span>"
                 icicle-bookmark-non-file-other-window :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a buffer (i.e., a non-file) bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-region-other-window]
               '(menu-item "<span class="quote">+ Jump to Region Bookmark...</span>" icicle-bookmark-region-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark and activate its recorded region</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-url-other-window]
               '(menu-item "<span class="quote">+ Jump to URL Bookmark...</span>" icicle-bookmark-url-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a URL bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-gnus-other-window]
               '(menu-item "<span class="quote">+ Jump to Gnus Bookmark...</span>" icicle-bookmark-gnus-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a Gnus bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-man-other-window]
               '(menu-item "<span class="quote">+ Jump to `man' Bookmark...</span>" icicle-bookmark-man-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a `man'-page bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-info-other-window]
               '(menu-item "<span class="quote">+ Jump to Info Bookmark...</span>" icicle-bookmark-info-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to an Info bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-remote-file-other-window]
               '(menu-item "<span class="quote">+ Jump to Remote-File Bookmark...</span>"
                 icicle-bookmark-remote-file-other-window :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a remote-file bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-local-file-other-window]
               '(menu-item "<span class="quote">+ Jump to Local-File Bookmark...</span>"
                 icicle-bookmark-local-file-other-window :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a local-file bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-file-other-window]
               '(menu-item "<span class="quote">+ Jump to File Bookmark...</span>" icicle-bookmark-file-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a file bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-dired-other-window]
               '(menu-item "<span class="quote">+ Jump to Dired Bookmark...</span>" icicle-bookmark-dired-other-window
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a Dired bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-bookmark-list]
               '(menu-item "<span class="quote">+ Jump to Bookmark-List Bookmark...</span>"
                 icicle-bookmark-bookmark-list :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark-list bookmark</span>"))
             (define-key icicle-bookmark-menu-map [icicle-bookmark-desktop]
               '(menu-item "<span class="quote">+ Jump to Desktop Bookmark...</span>" icicle-bookmark-desktop
                 :visible icicle-mode
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to an Emacs desktop bookmark</span>"))
             )
           (define-key icicle-bookmark-menu-map [icicle-bookmark-other-window]
             '(menu-item "<span class="quote">+ Jump to Bookmark...</span>" icicle-bookmark-other-window :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Jump to a bookmark (C-u: reverse `icicle-bookmark-refresh-cache-flag')</span>"))
           (define-key icicle-bookmark-menu-map [icicle-bookmark]
             '(menu-item "<span class="quote">+ Jump to Bookmark (Same Window)...</span>" icicle-bookmark :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Jump to a bookmark (C-u: reverse `icicle-bookmark-refresh-cache-flag')</span>")))
          (t
           (when (featurep 'bookmark+)
             (define-key icicle-menu-map [icicle-bookmark-non-file-other-window]
               '(menu-item "<span class="quote">+ Jump to Buffer (Non-File) Bookmark...</span>"
                 icicle-bookmark-non-file-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a buffer (i.e., a non-file) bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-region-other-window]
               '(menu-item "<span class="quote">+ Jump to Region Bookmark...</span>" icicle-bookmark-region-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark and activate its recorded region</span>"))
             (define-key icicle-menu-map [icicle-bookmark-url-other-window]
               '(menu-item "<span class="quote">+ Jump to URL Bookmark...</span>" icicle-bookmark-url-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a URL bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-gnus-other-window]
               '(menu-item "<span class="quote">+ Jump to Gnus Bookmark...</span>" icicle-bookmark-gnus-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a Gnus bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-man-other-window]
               '(menu-item "<span class="quote">+ Jump to `man' Bookmark...</span>" icicle-bookmark-man-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a `man'-page bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-info-other-window]
               '(menu-item "<span class="quote">+ Jump to Info Bookmark...</span>" icicle-bookmark-info-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to an Info bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-remote-file-other-window]
               '(menu-item "<span class="quote">+ Jump to Remote-File Bookmark...</span>"
                 icicle-bookmark-remote-file-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a remote-file bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-local-file-other-window]
               '(menu-item "<span class="quote">+ Jump to Local-File Bookmark...</span>"
                 icicle-bookmark-local-file-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a local-file bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-file-other-window]
               '(menu-item "<span class="quote">+ Jump to File Bookmark...</span>" icicle-bookmark-file-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a file bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-dired-other-window]
               '(menu-item "<span class="quote">+ Jump to Dired Bookmark...</span>" icicle-bookmark-dired-other-window
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a Dired bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-bookmark-list]
               '(menu-item "<span class="quote">+ Jump to Bookmark-List Bookmark...</span>"
                 icicle-bookmark-bookmark-list
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to a bookmark-list bookmark</span>"))
             (define-key icicle-menu-map [icicle-bookmark-desktop]
               '(menu-item "<span class="quote">+ Jump to Desktop Bookmark...</span>" icicle-bookmark-desktop
                 :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                 :help "<span class="quote">Jump to an Emacs desktop bookmark</span>"))
             )
           (define-key icicle-menu-map [icicle-bookmark-other-window]
             '(menu-item "<span class="quote">+ Jump To Bookmark...</span>" icicle-bookmark-other-window
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Jump to a bookmark (C-u: reverse `icicle-bookmark-refresh-cache-flag')</span>"))
           (define-key icicle-menu-map [icicle-bookmark]
             '(menu-item "<span class="quote">+ Jump To Bookmark (Same Window)...</span>" icicle-bookmark
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Jump to a bookmark (C-u: reverse `icicle-bookmark-refresh-cache-flag')</span>"))
           (define-key icicle-menu-map [icicle-separator-bookmark] '("<span class="quote">--</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-search-tags-menu)) <span class="linecomment">; Use `Tags' menu, defined in `menu-bar+.el'.</span>
           (defvar icicle-search-tags-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Tags' submenu of `Search' menu.</span>")
           (define-key menu-bar-search-tags-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-search-tags-menu-map :visible 'icicle-mode))
           (define-key icicle-search-tags-menu-map [icicle-tags-search]
             '(menu-item "<span class="quote">+ Search Tagged Files ...</span>" icicle-tags-search :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Search all source files listed in tags tables for matches for a regexp</span>"))
           (define-key icicle-search-tags-menu-map [icicle-pop-tag-mark]
             '(menu-item "<span class="quote">+ Back (Pop Tag Mark)</span>" icicle-pop-tag-mark :visible icicle-mode
               :enable (and (boundp 'find-tag-marker-ring)
                        (not (ring-empty-p find-tag-marker-ring))
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Pop back to where `M-.' was last invoked</span>"))
           (define-key icicle-search-tags-menu-map [icicle-find-first-tag-other-window]
             '(menu-item "<span class="quote">+ Find First Tag ...</span>" icicle-find-first-tag-other-window
               :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Find first tag in current tags table whose name matches your input</span>"))
           (define-key icicle-search-tags-menu-map [icicle-find-tag]
             '(menu-item "<span class="quote">+ Find Tag ...</span>" icicle-find-tag :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Navigate among all tags that match a regexp</span>")))
          ((and (not icicle-touche-pas-aux-menus-flag) <span class="linecomment">; Use `Search' menu, if no `Tags' menu.</span>
                (boundp 'menu-bar-search-menu))
           (defvar icicle-search-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Search' menu.</span>")
           (define-key menu-bar-search-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-search-menu-map :visible 'icicle-mode))
           (defvar icicle-search-tags-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Tags' submenu of `Search' menu.</span>")
           (define-key icicle-search-menu-map [icicles-tags]
             (list 'menu-item "<span class="quote">Tags</span>" icicle-search-tags-menu-map :visible 'icicle-mode))
           (define-key icicle-search-tags-menu-map [icicle-tags-search]
             '(menu-item "<span class="quote">+ Search Tagged Files ...</span>" icicle-tags-search :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Search all source files listed in tags tables for matches for a regexp</span>"))
           (define-key icicle-search-tags-menu-map [icicle-pop-tag-mark]
             '(menu-item "<span class="quote">+ Back (Pop Tag Mark)</span>" icicle-pop-tag-mark :visible icicle-mode
               :enable (and (boundp 'find-tag-marker-ring)
                        (not (ring-empty-p find-tag-marker-ring))
                        (not (window-minibuffer-p (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Pop back to where `M-.' was last invoked</span>"))
           (define-key icicle-search-tags-menu-map [icicle-find-first-tag-other-window]
             '(menu-item "<span class="quote">+ Find First Tag ...</span>" icicle-find-first-tag-other-window
               :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Find first tag in current tags table whose name matches your input</span>"))
           (define-key icicle-search-tags-menu-map [icicle-find-tag]
             '(menu-item "<span class="quote">+ Find Tag ...</span>" icicle-find-tag :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Navigate among all tags that match a regexp</span>")))
          (t
           (define-key icicle-menu-map [icicle-tags-search]
             '(menu-item "<span class="quote">+ Search Tagged Files ...</span>" icicle-tags-search
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Search all source files listed in tags tables for matches for a regexp</span>"))
           (define-key icicle-menu-map [icicle-pop-tag-mark]
             '(menu-item "<span class="quote">+ Back (Pop Tag Mark)</span>" icicle-pop-tag-mark
               :enable (and (boundp 'find-tag-marker-ring)
                        (not (ring-empty-p find-tag-marker-ring))
                        (not (window-minibuffer-p
                              (frame-selected-window menu-updating-frame))))
               :help "<span class="quote">Pop back to where `M-.' was last invoked</span>"))
           (define-key icicle-menu-map [icicle-find-first-tag-other-window]
             '(menu-item "<span class="quote">Find First Tag ...</span>" icicle-find-first-tag-other-window
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Find first tag in current tags table whose name matches your input</span>"))
           (define-key icicle-menu-map [icicle-find-tag]
             '(menu-item "<span class="quote">Find Tag ...</span>" icicle-find-tag
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Navigate among all tags that match a regexp</span>"))))

    (cond ((and (not icicle-touche-pas-aux-menus-flag)
                (boundp 'menu-bar-search-menu)) <span class="linecomment">; Use `Search' menu, if available.</span>
           (defvar icicle-search-menu-map (make-sparse-keymap)
             "<span class="quote">Icicles submenu for `Search' menu.</span>")
           (define-key menu-bar-search-menu [icicles]
             (list 'menu-item "<span class="quote">Icicles</span>" icicle-search-menu-map :visible 'icicle-mode))
           (define-key icicle-search-menu-map [icicle-goto-global-marker]
             '(menu-item "<span class="quote">+ Go To Global Marker...</span>" icicle-goto-global-marker :visible icicle-mode
               :enable (consp (icicle-markers global-mark-ring)) :keys "<span class="quote">C-- C-x C-SPC</span>"
               :help "<span class="quote">Go to a global marker, choosing it by its line</span>"))
           (define-key icicle-search-menu-map [icicle-goto-marker]
             '(menu-item "<span class="quote">+ Go To Marker...</span>" icicle-goto-marker :visible icicle-mode
               :enable (consp (icicle-markers mark-ring)) :keys "<span class="quote">C-- C-SPC</span>"
               :help "<span class="quote">Go to a marker in this buffer, choosing it by its line</span>"))
           (define-key icicle-search-menu-map [icicle-separator-goto] '("<span class="quote">--</span>"))
           (define-key icicle-search-menu-map [icicle-search-highlight-cleanup]
             '(menu-item "<span class="quote">Remove Icicle-Search Highlighting...</span>" icicle-search-highlight-cleanup
               :visible icicle-mode
               :enable (or icicle-search-overlays (overlayp icicle-search-current-overlay)
                        (overlayp icicle-search-refined-overlays) icicle-search-refined-overlays)
               :help "<span class="quote">Remove all highlighting from the last use of `icicle-search'</span>"))
           (define-key icicle-search-menu-map [icicle-compilation-search]
             '(menu-item "<span class="quote">+ Search Compilation/Grep Hits (Regexp)...</span>"
               icicle-compilation-search :visible icicle-mode
               :enable (and (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                        (condition-case nil (eq (current-buffer) (compilation-find-buffer))
                          (error nil)))
               :keys "<span class="quote">C-`</span>" :help "<span class="quote">Icicles search, showing the matching compilation-buffer hit</span>"))
           (define-key icicle-search-menu-map [icicle-grep-saved-file-candidates]
             '(menu-item "<span class="quote">Grep Saved File-Name Candidates...</span>"
               icicle-grep-saved-file-candidates :visible icicle-mode
               :enable icicle-saved-completion-candidates
               :help "<span class="quote">Run `grep' on the set of completion candidates saved using `C-M-&gt;'</span>"))
           (define-key icicle-search-menu-map [icicle-imenu-non-interactive-function]
             '(menu-item "<span class="quote">+ Search Non-Command Fn Definition (Regexp)...</span>"
               icicle-imenu-non-interactive-function :visible icicle-mode
               :enable (eq major-mode 'emacs-lisp-mode)
               :help "<span class="quote">Go to an Emacs non-interactive function definition with `icicle-search'</span>"))
           (define-key icicle-search-menu-map [icicle-imenu-command]
             '(menu-item "<span class="quote">+ Search Command Definition (Regexp)...</span>" icicle-imenu-command
               :visible icicle-mode
               :enable (eq major-mode 'emacs-lisp-mode)
               :help "<span class="quote">Go to an Emacs command definition using `icicle-search'</span>"))
           (define-key icicle-search-menu-map [icicle-imenu]
             '(menu-item "<span class="quote">+ Search Definition (Regexp)...</span>" icicle-imenu :visible icicle-mode
               :enable imenu-generic-expression :help "<span class="quote">Go to an Imenu entry using `icicle-search'</span>"))
           (define-key icicle-search-menu-map [icicle-tags-search]
             '(menu-item "<span class="quote">+ Search Tagged Files ...</span>" icicle-tags-search :visible icicle-mode
               :help "<span class="quote">Search all source files listed in tags tables for matches for a regexp</span>"))
           (define-key icicle-search-menu-map [icicle-search-bookmarks-together]
             '(menu-item "<span class="quote">+ Search Bookmarks Together...</span>" icicle-search-bookmarks-together
               :visible (and icicle-mode (featurep 'bookmark+)) :keys "<span class="quote">C-u C-`</span>"
               :help "<span class="quote">Search bookmarked regions (together)</span>"))
           (define-key icicle-search-menu-map [icicle-search-bookmark]
             '(menu-item "<span class="quote">+ Search Bookmarks Separately...</span>" icicle-search-bookmark
               :visible (and icicle-mode (featurep 'bookmark+))
               :help "<span class="quote">Search bookmarked text</span>"))
           (define-key icicle-search-menu-map [icicle-search-file]
             '(menu-item "<span class="quote">+ Search Files (Regexp)...</span>" icicle-search-file :visible icicle-mode
               :help "<span class="quote">Search multiple files completely</span>"))
           (define-key icicle-search-menu-map [icicle-search-buffer]
             '(menu-item "<span class="quote">+ Search Buffers (Regexp)...</span>" icicle-search-buffer :visible icicle-mode
               :help "<span class="quote">Search multiple buffers completely</span>"))
           (define-key icicle-search-menu-map [icicle-search-text-property]
             '(menu-item "<span class="quote">+ Search Text Property...</span>" icicle-search-text-property
               :visible icicle-mode
               :help "<span class="quote">Search for text that has a property with a certain value</span>"))
           (define-key icicle-search-menu-map [icicle-search-word]
             '(menu-item "<span class="quote">+ Search for Word...</span>" icicle-search-word :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Whole-word Icicles search</span>"))
           (define-key icicle-search-menu-map [icicle-search-keywords]
             '(menu-item "<span class="quote">+ Search with Keywords (Regexps)...</span>" icicle-search-keywords
               :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Search with one or more keywords, which can each be a regexp</span>"))
           (define-key icicle-search-menu-map [icicle-search]
             '(menu-item "<span class="quote">+ Search (Regexp)...</span>" icicle-search :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :keys "<span class="quote">C-`</span>"
               :help "<span class="quote">Search for matches, with completion, cycling, and hit replacement</span>"))
           (define-key icicle-search-menu-map [icicle-occur]
             '(menu-item "<span class="quote">+ Occur (Regexp)...</span>" icicle-occur :visible icicle-mode
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">`icicle-search' with a regexp of \".*\".  An `occur' with icompletion</span>")))
          (t
           (define-key icicle-menu-map [icicle-search-highlight-cleanup]
             '(menu-item "<span class="quote">Remove Icicle-Search Highlighting...</span>" icicle-search-highlight-cleanup
               :enable (or icicle-search-overlays (overlayp icicle-search-current-overlay)
                        (overlayp icicle-search-refined-overlays)
                        icicle-search-refined-overlays)
               :help "<span class="quote">Remove all highlighting from the last use of `icicle-search'</span>"))
           (define-key icicle-menu-map [icicle-compilation-search]
             '(menu-item "<span class="quote">+ Search Compilation/Grep Hits (Regexp)...</span>" icicle-compilation-search
               :enable (and (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
                        (condition-case nil (eq (current-buffer) (compilation-find-buffer))
                          (error nil)))
               :help "<span class="quote">Icicles search, showing the matching compilation-buffer hit</span>"))
           (define-key icicle-menu-map [icicle-grep-saved-file-candidates]
             '(menu-item "<span class="quote">Grep Saved File-Name Candidates...</span>"
               icicle-grep-saved-file-candidates :enable icicle-saved-completion-candidates
               :help "<span class="quote">Run `grep' on the set of completion candidates saved using `C-M-&gt;'</span>"))
           (define-key icicle-menu-map [icicle-imenu-non-interactive-function]
             '(menu-item "<span class="quote">Search Non-Command Fn Definition (Regexp)...</span>"
               icicle-imenu-non-interactive-function :enable (eq major-mode 'emacs-lisp-mode)
               :help "<span class="quote">Go to an Emacs non-interactive function definition with `icicle-search'</span>"))
           (define-key icicle-menu-map [icicle-imenu-command]
             '(menu-item "<span class="quote">Search Command Definition (Regexp)...</span>" icicle-imenu-command
               :enable (eq major-mode 'emacs-lisp-mode)
               :help "<span class="quote">Go to an Emacs command definition using `icicle-search'</span>"))
           (define-key icicle-menu-map [icicle-imenu]
             '(menu-item "<span class="quote">+ Search Definition (Regexp)...</span>" icicle-imenu
               :enable imenu-generic-expression :help "<span class="quote">Go to an Imenu entry using `icicle-search'</span>"))
           (define-key icicle-menu-map [icicle-tags-search]
             '(menu-item "<span class="quote">+ Search Tagged Files ...</span>" icicle-tags-search
               :help "<span class="quote">Search all source files listed in tags tables for matches for a regexp</span>"))
           (define-key icicle-menu-map [icicle-search-bookmarks-together]
             '(menu-item "<span class="quote">+ Search Bookmarks Together...</span>" icicle-search-bookmarks-together
               :visible (featurep 'bookmark+) :keys "<span class="quote">C-u C-`</span>"
               :help "<span class="quote">Search bookmarked regions (together)</span>"))
           (define-key icicle-menu-map [icicle-search-bookmark]
             '(menu-item "<span class="quote">+ Search Bookmarks Separately...</span>" icicle-search-bookmark
               :visible (featurep 'bookmark+) :help "<span class="quote">Search bookmarked text</span>"))
           (define-key icicle-menu-map [icicle-search-file]
             '(menu-item "<span class="quote">+ Search Files (Regexp)...</span>" icicle-search-file
               :help "<span class="quote">Search multiple files completely</span>"))
           (define-key icicle-menu-map [icicle-search-buffer]
             '(menu-item "<span class="quote">+ Search Buffers (Regexp)...</span>" icicle-search-buffer
               :help "<span class="quote">Search multiple buffers completely</span>"))
           (define-key icicle-menu-map [icicle-search-text-property]
             '(menu-item "<span class="quote">+ Search Text Property...</span>" icicle-search-text-property
               :help "<span class="quote">Search for text that has a property with a certain value</span>"))
           (define-key icicle-menu-map [icicle-search-word]
             '(menu-item "<span class="quote">+ Search for Word...</span>" icicle-search-word
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Whole-word Icicles search</span>"))
           (define-key icicle-menu-map [icicle-search-keywords]
             '(menu-item "<span class="quote">+ Search with Keywords (Regexps)...</span>" icicle-search-keywords
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Search with one or more keywords, which can each be a regexp</span>"))
           (define-key icicle-menu-map [icicle-search]
             '(menu-item "<span class="quote">+ Search (Regexp)...</span>" icicle-search
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">Search for matches, with completion, cycling, and hit replacement</span>"))
           (define-key icicle-menu-map [icicle-occur]
             '(menu-item "<span class="quote">+ Occur (Regexp)...</span>" icicle-occur
               :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))
               :help "<span class="quote">`icicle-search' with a regexp of \".*\".  An `occur' with icompletion</span>")))))

  <span class="linecomment">;; Install `Icicles' menu-bar menu.</span>
  (define-key icicle-mode-map [menu-bar icicles] (cons "<span class="quote">Icicles</span>" icicle-menu-map))

  <span class="linecomment">;; Optional `icicle-mode-map' bindings - governed by `icicle-top-level-key-bindings'.</span>
  (icicle-bind-top-level-commands)

  <span class="linecomment">;; Install or update `icicle-mode-map'.</span>
  (if icicle-minor-mode-map-entry
      (setcdr icicle-minor-mode-map-entry icicle-mode-map)
    (setq icicle-minor-mode-map-entry  (cons 'icicle-mode icicle-mode-map))
    (add-to-list 'minor-mode-map-alist icicle-minor-mode-map-entry)))

(defun icicle-S-iso-lefttab-to-S-TAB (strg)
  "<span class="quote">Return string STRG, but with \"S-iso-lefttab\" replaced by \"S-TAB\".</span>"
  (replace-regexp-in-string "<span class="quote">S-iso-lefttab</span>" "<span class="quote">S-TAB</span>" strg))

(defun icicle-bind-other-keymap-keys ()
  "<span class="quote">Bind some keys in maps other than minibuffer maps and `icicle-mode-map'</span>"

  <span class="linecomment">;; Bind Isearch keys.</span>
  (icicle-bind-isearch-keys)

  <span class="linecomment">;; Bind keys in Comint mode.</span>
  (when (boundp 'comint-mode-map)
    (define-key comint-mode-map "<span class="quote">\C-c\C-i</span>"         'icicle-comint-command)
    (define-key comint-mode-map [(control ?c) tab] 'icicle-comint-command))

  <span class="linecomment">;; Bind keys in Shell mode.</span>
  (when (and (boundp 'shell-mode-map) icicle-functions-to-redefine)
    (define-key shell-mode-map "<span class="quote">\t</span>" 'icicle-comint-dynamic-complete))

  <span class="linecomment">;; Bind keys in Shell Script mode.</span>
  (when (and (boundp 'sh-mode-map) icicle-functions-to-redefine)
    (icicle-remap 'comint-dynamic-complete 'icicle-comint-dynamic-complete sh-mode-map))

  <span class="linecomment">;; Bind keys in Ielm mode.</span>
  (when (and (boundp 'ielm-map) icicle-functions-to-redefine)
    (define-key ielm-map "<span class="quote">\t</span>" 'icicle-comint-dynamic-complete))

  <span class="linecomment">;; Bind keys in Tcl mode.</span>
  (when (and (boundp 'inferior-tcl-mode-map) icicle-functions-to-redefine)
    (define-key inferior-tcl-mode-map "<span class="quote">\t</span>" 'icicle-comint-dynamic-complete))

  <span class="linecomment">;; Bind keys in GUD (Debugger) mode.</span>
  (when (and (boundp 'gud-minibuffer-local-map) icicle-functions-to-redefine)
    (define-key gud-minibuffer-local-map "<span class="quote">\t</span>" 'icicle-comint-dynamic-complete-filename))

  <span class="linecomment">;; Bind keys in Info mode.</span>
  (when (and (boundp 'Info-mode-map) icicle-functions-to-redefine)
    (icicle-remap 'Info-goto-node  'icicle-Info-goto-node-cmd  Info-mode-map) <span class="linecomment">; `g'</span>
    (icicle-remap 'Info-index      'icicle-Info-index-cmd      Info-mode-map) <span class="linecomment">; `i'</span>
    (icicle-remap 'Info-menu       'icicle-Info-menu-cmd       Info-mode-map)) <span class="linecomment">; `m'</span>

  <span class="linecomment">;; Bind some keys in `bookmark-bmenu-mode' mode (*Bookmark List*) - requires Bookmark+.</span>
  (when (and (featurep 'bookmark+) (boundp 'bookmark-bmenu-mode-map))
    (unless (lookup-key bookmark-bmenu-mode-map [(control meta ?&gt;)]) <span class="linecomment">; *Bookmark List* `C-M-&gt;'</span>
      (define-key bookmark-bmenu-mode-map [(control meta ?&gt;)] 'icicle-bookmark-save-marked-files))
    (unless (lookup-key bookmark-bmenu-mode-map [(control ?&gt;)]) <span class="linecomment">; *Bookmark List* `C-&gt;'</span>
      (define-key bookmark-bmenu-mode-map [(control ?&gt;)] 'icicle-bookmark-save-marked-files-more))
    (unless (lookup-key bookmark-bmenu-mode-map [(control meta ?})]) <span class="linecomment">; *Bookmark List* `C-M-}'</span>
      (define-key bookmark-bmenu-mode-map [(control meta ?})]
        'icicle-bookmark-save-marked-files-to-variable))
    (unless (lookup-key bookmark-bmenu-mode-map [(control ?})]) <span class="linecomment">; *Bookmark List* `C-}'</span>
      (define-key bookmark-bmenu-mode-map [(control ?})]
        'icicle-bookmark-save-marked-files-as-project))
    (let ((defn  (lookup-key bookmark-bmenu-mode-map "<span class="quote">\M-si</span>"))) <span class="linecomment">; *Bookmark List* `M-s i'</span>
      (unless (and defn  (not (integerp defn)))
        (define-key bookmark-bmenu-mode-map "<span class="quote">\M-si</span>" 'icicle-search-dired-marked))))    

  <span class="linecomment">;; Bind some keys in Dired mode.</span>
  (when (boundp 'dired-mode-map)
    (unless (lookup-key dired-mode-map [(control meta ?&lt;)]) <span class="linecomment">; Dired `C-M-&lt;'</span>
      (define-key dired-mode-map [(control meta ?&lt;)]
        'icicle-dired-saved-file-candidates-other-window))
    (unless (lookup-key dired-mode-map [(control ?{)]) <span class="linecomment">; Dired `C-{'</span>
      (define-key dired-mode-map [(control ?{)] 'icicle-dired-project-other-window))
    (unless (lookup-key dired-mode-map [(control meta ?&gt;)]) <span class="linecomment">; Dired `C-M-&gt;'</span>
      (define-key dired-mode-map [(control meta ?&gt;)] 'icicle-dired-save-marked))
    (unless (lookup-key dired-mode-map [(control ?&gt;)]) <span class="linecomment">; Dired `C-&gt;'</span>
      (define-key dired-mode-map [(control ?&gt;)] 'icicle-dired-save-marked-more))
    (unless (lookup-key dired-mode-map [(control meta ?})]) <span class="linecomment">; Dired `C-M-}'</span>
      (define-key dired-mode-map [(control meta ?})] 'icicle-dired-save-marked-to-variable))
    (unless (lookup-key dired-mode-map [(control ?})]) <span class="linecomment">; Dired `C-}'</span>
      (define-key dired-mode-map [(control ?})] 'icicle-dired-save-marked-as-project))
    (let ((defn  (lookup-key dired-mode-map "<span class="quote">\M-si</span>"))) <span class="linecomment">; Dired `M-s i'</span>
      (unless (and defn  (not (integerp defn)))
        (define-key dired-mode-map "<span class="quote">\M-si</span>" 'icicle-search-dired-marked))))

  <span class="linecomment">;; Bind keys in Ibuffer mode.</span>
  (when (boundp 'ibuffer-mode-map)
    (let ((defn  (lookup-key ibuffer-mode-map "<span class="quote">\M-si</span>"))) <span class="linecomment">; Ibuffer `M-s i'</span>
      (unless (and defn  (not (integerp defn)))
        (define-key ibuffer-mode-map "<span class="quote">\M-si</span>" 'icicle-search-ibuffer-marked))
      (unless icicle-touche-pas-aux-menus-flag <span class="linecomment">; Use Ibuffer's `Operate' menu.</span>
        (define-key ibuffer-mode-operate-map [icicle-search-ibuffer-marked]
          '(menu-item "<span class="quote">Icicles Search (and Replace)...</span>" icicle-search-ibuffer-marked
            :visible icicle-mode :enable (eq major-mode 'ibuffer-mode))))))

  <span class="linecomment">;; Bind keys in Buffer Menu mode.</span>
  (when (boundp 'Buffer-menu-mode-map)
    (let ((defn  (lookup-key Buffer-menu-mode-map "<span class="quote">\M-si</span>"))) <span class="linecomment">; Buffer-Menu `M-s i'</span>
      (unless (and defn  (not (integerp defn)))
        (define-key Buffer-menu-mode-map "<span class="quote">\M-si</span>" 'icicle-search-buff-menu-marked))))

  <span class="linecomment">;; Bind `S-TAB' in major maps, for key completion.</span>
  (when (fboundp 'map-keymap)           <span class="linecomment">; Emacs 22+.</span>
    (icicle-bind-key-completion-keys-in-keymaps-from (current-global-map))
    (mapcar #'icicle-bind-key-completion-keys-for-map-var icicle-keymaps-for-key-completion))

  <span class="linecomment">;; Prevent `this-command' from being set to `handle-switch-frame'.</span>
  (define-key global-map [handle-switch-frame] 'icicle-skip-this-command)
  (define-key global-map [switch-frame] 'icicle-handle-switch-frame))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bind-isearch-keys ()
  "<span class="quote">Bind Icicles Isearch commands.</span>"
  (dolist (key icicle-search-from-isearch-keys)
    (define-key isearch-mode-map key
      (lambda ()
        (interactive)
        (isearch-done)
        (icicle-search (point-min) (point-max) (icicle-isearch-complete-past-string) t))))
  (dolist (key icicle-isearch-complete-keys)
    (define-key isearch-mode-map key 'icicle-isearch-complete))
  (cond ((fboundp 'isearch-moccur)      <span class="linecomment">; In `moccur.el'.</span>
         (define-key isearch-mode-map (kbd "<span class="quote">C-o</span>") 'isearch-moccur))
        ((fboundp 'isearch-occur)       <span class="linecomment">; In `occur-schroeder.el'.</span>
         (define-key isearch-mode-map (kbd "<span class="quote">C-o</span>") 'isearch-occur))))

(defun icicle-bind-key-completion-keys-for-map-var (keymap-var)
  "<span class="quote">Bind `S-TAB' in keymaps accessible from keymap KEYMAP-VAR.
KEYMAP-VAR should be bound to a keymap that has at least one prefix
keymap.  If KEYMAP-VAR is not bound to a keymap, it is ignored.</span>"
  (let ((temp  keymap-var))
    (when (boundp temp)
      (setq temp  (symbol-value temp))
      (when (keymapp temp) (icicle-bind-key-completion-keys-in-keymaps-from temp)))))

(defun icicle-bind-key-completion-keys-in-keymaps-from (map)
  "<span class="quote">Bind keys in `icicle-key-complete-keys' to `icicle-complete-keys'.
Each key in `icicle-complete-keys' is bound in all keymaps accessible
from keymap MAP.</span>"
  (dolist (key+map  (accessible-keymaps map))
    (let ((map  (cdr key+map)))
      <span class="linecomment">;; We could try to exclude menu maps, by testing (not (keymap-prompt map)).</span>
      <span class="linecomment">;; But we want to include at least some menu maps - those, such as `facemenu-keymap',</span>
      <span class="linecomment">;; that are bound to keyboard keys. (when (and (keymapp map) (not (keymap-prompt map)))...)</span>
      (when (keymapp map)
        (dolist (key  icicle-key-complete-keys)
          (when (or icicle-complete-key-anyway-flag (not (lookup-key map key)))
            (condition-case nil (define-key map key 'icicle-complete-keys) (error nil))))))))

(defun icicle-restore-other-keymap-keys ()
  "<span class="quote">Restore some bindings changed by `icicle-bind-other-keymap-keys'.</span>"

  <span class="linecomment">;; Unbind Isearch keys.</span>
  (icicle-unbind-isearch-keys)

  <span class="linecomment">;; Unbind keys in Comint mode.</span>
  (when (boundp 'comint-mode-map)
    (define-key comint-mode-map "<span class="quote">\C-c\C-i</span>"         nil)
    (define-key comint-mode-map [(control ?c) tab] nil))

  <span class="linecomment">;; Unbind keys in Shell mode.</span>
  (when (and (boundp 'shell-mode-map) icicle-functions-to-redefine)
    (define-key shell-mode-map "<span class="quote">\t</span>" 'comint-dynamic-complete))

  <span class="linecomment">;; Unbind keys in Shell Script mode.</span>
  (when (and (boundp 'sh-mode-map) icicle-functions-to-redefine)
    (icicle-unmap 'comint-dynamic-complete sh-mode-map 'icicle-comint-dynamic-complete))

  <span class="linecomment">;; Unbind keys in Ielm mode.</span>
  (when (and (boundp 'ielm-map) icicle-functions-to-redefine)
    (define-key ielm-map "<span class="quote">\t</span>" 'comint-dynamic-complete))

  <span class="linecomment">;; Unbind keys in Tcl mode.</span>
  (when (and (boundp 'inferior-tcl-mode-map) icicle-functions-to-redefine)
    (define-key inferior-tcl-mode-map "<span class="quote">\t</span>" 'comint-dynamic-complete))

  <span class="linecomment">;; Bind keys in GUD (Debugger) mode.</span>
  (when (and (boundp 'gud-minibuffer-local-map) icicle-functions-to-redefine)
    (define-key gud-minibuffer-local-map "<span class="quote">\t</span>" 'comint-dynamic-complete-filename))

  <span class="linecomment">;; Unbind keys in Info mode.</span>
  (when (and (boundp 'Info-mode-map) icicle-functions-to-redefine)
    (icicle-unmap 'Info-goto-node Info-mode-map 'icicle-Info-goto-node-cmd)
    (icicle-unmap 'Info-index     Info-mode-map 'icicle-Info-index-cmd)
    (icicle-unmap 'Info-menu      Info-mode-map 'icicle-Info-menu-cmd))

  <span class="linecomment">;; Unbind keys in `bookmark-bmenu-mode' mode (*Bookmark List*) - requires Bookmark+.</span>
  (when (and (featurep 'bookmark+) (boundp 'bookmark-bmenu-mode-map))
    (define-key bookmark-bmenu-mode-map [(control meta ?&gt;)] nil)
    (define-key bookmark-bmenu-mode-map [(control ?&gt;)] nil)
    (define-key bookmark-bmenu-mode-map [(control meta ?})] nil)
    (define-key bookmark-bmenu-mode-map [(control ?})] nil)
    (define-key bookmark-bmenu-mode-map "<span class="quote">\M-si</span>" nil))

  <span class="linecomment">;; Unbind keys in Dired mode.</span>
  (when (boundp 'dired-mode-map)
    (define-key dired-mode-map [(control meta ?&lt;)] nil)
    (define-key dired-mode-map [(control ?{)]      nil)
    (define-key dired-mode-map [(control meta ?&gt;)] nil)
    (define-key dired-mode-map [(control ?&gt;)]      nil)
    (define-key dired-mode-map [(control meta ?})] nil)
    (define-key dired-mode-map [(control ?})]      nil)
    (define-key dired-mode-map "<span class="quote">\M-si</span>"             nil))

  <span class="linecomment">;; Unbind keys in Ibuffer mode.</span>
  (when (boundp 'ibuffer-mode-map)
    (define-key ibuffer-mode-map "<span class="quote">\M-si</span>" nil))

  <span class="linecomment">;; Unbind keys in Buffer Menu mode.</span>
  (when (boundp 'Buffer-menu-mode-map)
    (define-key Buffer-menu-mode-map "<span class="quote">\M-si</span>" nil))

  <span class="linecomment">;; Unbind `S-TAB' in major maps.</span>
  (when (fboundp 'map-keymap)           <span class="linecomment">; Emacs 22+.</span>
    (icicle-unbind-key-completion-keys-in-keymaps-from (current-global-map))
    (mapcar #'icicle-unbind-key-completion-keys-for-map-var icicle-keymaps-for-key-completion))

  <span class="linecomment">;; Restore prevention of `this-command' being `handle-switch-frame'.</span>
  (define-key global-map [handle-switch-frame] nil)
  (define-key global-map [switch-frame] 'handle-switch-frame))

(defun icicle-unbind-isearch-keys ()
  "<span class="quote">Unbind Icicles Isearch commands.</span>"
  (dolist (key icicle-search-from-isearch-keys) (define-key isearch-mode-map key nil))
  (dolist (key icicle-isearch-complete-keys) (define-key isearch-mode-map key nil))
  (define-key isearch-mode-map "<span class="quote">\M-\t</span>" 'isearch-complete)
  (when (fboundp 'isearch-moccur)       <span class="linecomment">; Restore `moccur.el' binding.</span>
    (define-key isearch-mode-map (kbd "<span class="quote">M-o</span>") 'isearch-moccur))
  (define-key isearch-mode-map (kbd "<span class="quote">C-o</span>") nil))

(defun icicle-unbind-key-completion-keys-for-map-var (keymap-var)
  "<span class="quote">Unbind `S-TAB' in keymaps accessible from keymap KEYMAP-VAR.
KEYMAP-VAR should be bound to a keymap that has at least one prefix
keymap.  If KEYMAP-VAR is not bound to a keymap, it is ignored.</span>"
  (let ((temp  keymap-var))
    (when (boundp temp)
      (setq temp  (symbol-value temp))
      (when (keymapp temp) (icicle-unbind-key-completion-keys-in-keymaps-from temp)))))

(defun icicle-unbind-key-completion-keys-in-keymaps-from (map)
  "<span class="quote">Unbind `icicle-key-complete-keys' in keymaps accessible from MAP.</span>"
  (dolist (key+map (accessible-keymaps map))
    (let ((map  (cdr key+map)))
      (when (and (keymapp map) (not (stringp (car-safe (last map))))) <span class="linecomment">; Try to exclude menu maps.</span>
        (dolist (key icicle-key-complete-keys)
          (when (eq (lookup-key map key) 'icicle-complete-keys)
            (condition-case nil (define-key map key nil) (error nil))))))))
 
<span class="linecomment">;;(@* "Other Icicles functions that define Icicle mode")</span>

<span class="linecomment">;;; Other Icicles functions that define Icicle mode ------------------</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-skip-this-command ()
  "<span class="quote">Prevent `handle-switch-frame' from being added to `this-command'.</span>"
  (interactive)
  (setq this-command  last-command))

<span class="linecomment">;;;###autoload</span>
(defun icicle-handle-switch-frame (event)
  "<span class="quote">Call `handle-switch-frame', but don't add it to `this-command'.</span>"
  (interactive "<span class="quote">e</span>")
  (handle-switch-frame event)
  (setq this-command  last-command))

(defun icicle-define-minibuffer-maps (turn-on-p)
  "<span class="quote">Define keymaps for the minibuffer and buffer `*Completions*'.</span>"
  (cond
    (turn-on-p                          <span class="linecomment">; TURN IT ON ********************************</span>

     <span class="linecomment">;; `minibuffer-local-map': default minibuffer map.</span>
     (let ((map  minibuffer-local-map))

       <span class="linecomment">;; Menu-bar `Minibuf' menu.</span>
       (define-key map [menu-bar minibuf quit] <span class="linecomment">; Replace `keyboard-escape-quit'</span>
         '(menu-item "<span class="quote">Quit</span>" icicle-abort-recursive-edit
           :help "<span class="quote">Cancel minibuffer input or recursive edit</span>"))
       (define-key map [menu-bar minibuf return]
         '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
           :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
       (define-key map [menu-bar minibuf separator-help] '("<span class="quote">--</span>"))
       (define-key map [menu-bar minibuf completion-help]
         '(menu-item "<span class="quote">Icicles Help</span>" icicle-minibuffer-help
           :help "<span class="quote">Display help for minibuffer input and completion</span>"))
       (define-key map [menu-bar minibuf separator-last] '("<span class="quote">--</span>"))
       (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current]
         '(menu-item "<span class="quote">Toggle All-Current Icicle-Search Highlighting</span>"
           icicle-toggle-highlight-all-current :enable icicle-searching-p
           :help "<span class="quote">Toggle `icicle-search-highlight-all-current-flag'</span>" :keys "<span class="quote">C-^</span>"))
       (define-key map [menu-bar minibuf icicle-regexp-quote-input]
         '(menu-item "<span class="quote">Regexp-Quote Input</span>" icicle-regexp-quote-input
           :enable (with-current-buffer (window-buffer (minibuffer-window))
                     (not (zerop (buffer-size))))
           :help "<span class="quote">Regexp-quote current input or its active region, then apropos-complete</span>"
           :keys "<span class="quote">M-%</span>"))
       (define-key map [menu-bar minibuf separator-set2] '("<span class="quote">--</span>"))
       (define-key map [menu-bar minibuf icicle-clear-current-history]
         '(menu-item "<span class="quote">Clear History Entries</span>" icicle-clear-current-history
           :help "<span class="quote">Clear current minibuffer history of selected entries</span>"))
       (define-key map [menu-bar minibuf icicle-erase-minibuffer]
         '(menu-item "<span class="quote">Delete from History</span>" icicle-erase-minibuffer-or-history-element
           :visible (memq last-command
                     '(previous-history-element next-history-element
                       icicle-erase-minibuffer-or-history-element
                       previous-matching-history-element next-matching-history-element))
           :help "<span class="quote">Delete current history element (in minibuffer now)</span>" :keys "<span class="quote">M-k</span>"))
       (define-key map [menu-bar minibuf icicle-delete-history-element]
         '(menu-item "<span class="quote">Clear (Erase) Minibuffer</span>" icicle-erase-minibuffer-or-history-element
           :visible (not (memq last-command
                          '(previous-history-element next-history-element
                            icicle-erase-minibuffer-or-history-element
                            previous-matching-history-element next-matching-history-element)))
           :help "<span class="quote">Erase the Minibuffer</span>" :keys "<span class="quote">M-k</span>"))
       (define-key map [menu-bar minibuf icicle-insert-list-join-string]
         '(menu-item "<span class="quote">Insert Join-String</span>" icicle-insert-list-join-string
           :help "<span class="quote">Insert `icicle-list-join-string' into the minibuffer</span>"))
       (define-key map [menu-bar minibuf icicle-insert-key-description]
         '(menu-item "<span class="quote">Insert Key Description</span>" icicle-insert-key-description
           :visible (not icicle-searching-p) :keys "<span class="quote">M-q</span>"
           :help "<span class="quote">Read key and insert its description - e.g., reading ^F inserts `C-f'</span>"))
       (define-key map [menu-bar minibuf icicle-insert-history-element]
         '(menu-item "<span class="quote">Insert Past Input using Completion</span>" icicle-insert-history-element
           :enable (consp (symbol-value minibuffer-history-variable))
           :help "<span class="quote">Use completion to insert a previous input into the minibuffer</span>"))
       (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]
         '(menu-item "<span class="quote">Insert String from a Variable...</span>" icicle-insert-string-from-variable
           :visible current-prefix-arg :keys "<span class="quote">C-=</span>"
           :help "<span class="quote">Read a variable name and insert its string value into the minibuffer</span>"))
       (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]
         '(menu-item "<span class="quote">Insert `icicle-input-string'</span>" icicle-insert-string-from-variable
           :visible (not current-prefix-arg) :keys "<span class="quote">C-=</span>"
           :help "<span class="quote">Insert text from variable `icicle-input-string' into the minibuffer</span>"))
       (define-key map [menu-bar minibuf icicle-insert-string-at-point]
         '(menu-item "<span class="quote">Insert Text from Point</span>" icicle-insert-string-at-point
           :help "<span class="quote">Insert text at or near the cursor into the minibuffer</span>"))
       (define-key map [menu-bar minibuf icicle-completing-read+insert]
         '(menu-item "<span class="quote">Insert On-Demand Completion</span>" icicle-completing-read+insert
           :visible (consp icicle-completing-read+insert-candidates)
           :help "<span class="quote">Read and insert something using (lax) completion</span>"))
       (define-key map [menu-bar minibuf icicle-read+insert-file-name]
         '(menu-item "<span class="quote">Insert File Name</span>" icicle-read+insert-file-name
           :help "<span class="quote">Read and insert a file name using (lax) completion</span>"))

       (define-key map [(control ??)]            'icicle-minibuffer-help) <span class="linecomment">; `C-?'</span>
       (define-key map [(control ?g)]            'icicle-abort-recursive-edit) <span class="linecomment">; `C-g'</span>
       (define-key map [M-S-backspace]           'icicle-erase-minibuffer) <span class="linecomment">; `M-S-backspace'</span>
       (define-key map [M-S-delete]              'icicle-erase-minibuffer) <span class="linecomment">; `M-S-delete'</span>
       (define-key map [(meta ?.)]               'icicle-insert-string-at-point) <span class="linecomment">; `M-.'</span>
       (define-key map [(control ?=)]            'icicle-insert-string-from-variable) <span class="linecomment">; `C-='</span>
       (define-key map [(meta ?o)]               'icicle-insert-history-element) <span class="linecomment">; `M-o'</span>
       (define-key map [(meta ?i)]               'icicle-clear-current-history) <span class="linecomment">; `M-i'</span>
       (define-key map [(meta ?k)]             'icicle-erase-minibuffer-or-history-element) <span class="linecomment">; `M-k'</span>
       (define-key map [(meta ?:)]               'icicle-pp-eval-expression-in-minibuffer) <span class="linecomment">; `M-:'</span>
       (define-key map [(control ?a)]            'icicle-beginning-of-line+) <span class="linecomment">; `C-a'</span>
       (define-key map [(control ?e)]            'icicle-end-of-line+) <span class="linecomment">; `C-e'</span>
       (define-key map [(control meta ?v)]       'icicle-scroll-forward) <span class="linecomment">; `C-M-v'</span>
       (define-key map [(control meta shift ?v)] 'icicle-scroll-backward) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
       (dolist (key  icicle-completing-read+insert-keys)
         (define-key map key 'icicle-completing-read+insert)) <span class="linecomment">; `C-M-S-c'</span>
       (dolist (key  icicle-read+insert-file-name-keys)
         (define-key map key 'icicle-read+insert-file-name)) <span class="linecomment">; `C-M-S-f'</span>
       (define-key map "<span class="quote">\n</span>"                      'icicle-insert-newline-in-minibuffer) <span class="linecomment">; `C-j'</span>
       (when (fboundp 'yank-secondary)  <span class="linecomment">; In `second-sel.el'.</span>
         (define-key map "<span class="quote">\C-\M-y</span>" 'icicle-yank-secondary))) <span class="linecomment">; `C-M-y'</span>

     <span class="linecomment">;; `minibuffer-local-ns-map': default minibuffer map when spaces are not allowed.</span>
     <span class="linecomment">;; In Emacs 22+, local is parent of local-ns.</span>
     (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-ns-map))
       (let ((map  minibuffer-local-ns-map))
         (define-key map [menu-bar minibuf quit] <span class="linecomment">; Replace `keyboard-escape-quit'</span>
           '(menu-item "<span class="quote">Quit</span>" icicle-abort-recursive-edit
             :help "<span class="quote">Cancel minibuffer input or recursive edit</span>"))
         (define-key map [menu-bar minibuf return]
           '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
             :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
         (define-key map [menu-bar minibuf separator-help] '("<span class="quote">--</span>"))
         (define-key map [menu-bar minibuf completion-help]
           '(menu-item "<span class="quote">Icicles Help</span>" icicle-minibuffer-help
             :help "<span class="quote">Display help for minibuffer input and completion</span>"))
         (define-key map [menu-bar minibuf separator-last] '("<span class="quote">--</span>"))
         (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current]
           '(menu-item "<span class="quote">Toggle All-Current Icicle-Search Highlighting</span>"
             icicle-toggle-highlight-all-current :enable icicle-searching-p
             :help "<span class="quote">Toggle `icicle-search-highlight-all-current-flag'</span>" :keys "<span class="quote">C-^</span>"))
         (define-key map [menu-bar minibuf icicle-regexp-quote-input]
           '(menu-item "<span class="quote">Regexp-Quote Input</span>" icicle-regexp-quote-input
             :enable (with-current-buffer (window-buffer (minibuffer-window))
                       (not (zerop (buffer-size))))
             :help "<span class="quote">Regexp-quote current input or its active region, then apropos-complete</span>"
             :keys "<span class="quote">M-%</span>"))
         (define-key map [menu-bar minibuf separator-set2] '("<span class="quote">--</span>"))
         (define-key map [menu-bar minibuf icicle-clear-current-history]
           '(menu-item "<span class="quote">Clear History Entries</span>" icicle-clear-current-history
             :help "<span class="quote">Clear current minibuffer history of selected entries</span>"))
         (define-key map [menu-bar minibuf icicle-erase-minibuffer]
           '(menu-item "<span class="quote">Delete from History</span>" icicle-erase-minibuffer-or-history-element
             :visible (memq last-command
                       '(previous-history-element next-history-element
                         icicle-erase-minibuffer-or-history-element
                         previous-matching-history-element next-matching-history-element))
             :help "<span class="quote">Delete current history element (in minibuffer now)</span>" :keys "<span class="quote">M-k</span>"))
         (define-key map [menu-bar minibuf icicle-delete-history-element]
           '(menu-item "<span class="quote">Clear (Erase) Minibuffer</span>" icicle-erase-minibuffer-or-history-element
             :visible (not (memq last-command
                            '(previous-history-element next-history-element
                              icicle-erase-minibuffer-or-history-element
                              previous-matching-history-element next-matching-history-element)))
             :help "<span class="quote">Erase the Minibuffer</span>" :keys "<span class="quote">M-k</span>"))
         (define-key map [menu-bar minibuf icicle-insert-list-join-string]
           '(menu-item "<span class="quote">Insert Join-String</span>" icicle-insert-list-join-string
             :help "<span class="quote">Insert `icicle-list-join-string' into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-key-description]
           '(menu-item "<span class="quote">Insert Key Description</span>" icicle-insert-key-description
             :visible (not icicle-searching-p) :keys "<span class="quote">M-q</span>"
             :help "<span class="quote">Read key and insert its description - e.g., reading ^F inserts `C-f'</span>"))
         (define-key map [menu-bar minibuf icicle-insert-history-element]
           '(menu-item "<span class="quote">Insert Past Input using Completion</span>" icicle-insert-history-element
             :enable (consp (symbol-value minibuffer-history-variable))
             :help "<span class="quote">Use completion to insert a previous input into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]
           '(menu-item "<span class="quote">Insert String from a Variable...</span>" icicle-insert-string-from-variable
             :visible current-prefix-arg :keys "<span class="quote">C-=</span>"
             :help "<span class="quote">Read a variable name and insert its string value into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]
           '(menu-item "<span class="quote">Insert `icicle-input-string'</span>" icicle-insert-string-from-variable
             :visible (not current-prefix-arg) :keys "<span class="quote">C-=</span>"
             :help "<span class="quote">Insert text from variable `icicle-input-string' into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-string-at-point]
           '(menu-item "<span class="quote">Insert Text from Point</span>" icicle-insert-string-at-point
             :help "<span class="quote">Insert text at or near the cursor into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-completing-read+insert]
           '(menu-item "<span class="quote">Insert On-Demand Completion</span>" icicle-completing-read+insert
             :visible (consp icicle-completing-read+insert-candidates)
             :help "<span class="quote">Read and insert something using (lax) completion</span>"))
         (define-key map [menu-bar minibuf icicle-read+insert-file-name]
           '(menu-item "<span class="quote">Insert File Name</span>" icicle-read+insert-file-name
             :help "<span class="quote">Read and insert a file name using (lax) completion</span>"))

         (define-key map [(control ??)]            'icicle-minibuffer-help) <span class="linecomment">; `C-?'</span>
         (define-key map [(control ?g)]            'icicle-abort-recursive-edit) <span class="linecomment">; `C-g'</span>
         (define-key map [M-S-backspace]           'icicle-erase-minibuffer) <span class="linecomment">; `M-S-backspace'</span>
         (define-key map [M-S-delete]              'icicle-erase-minibuffer) <span class="linecomment">; `M-S-delete'</span>
         (define-key map [(meta ?.)]               'icicle-insert-string-at-point) <span class="linecomment">; `M-.'</span>
         (define-key map [(control ?=)]            'icicle-insert-string-from-variable) <span class="linecomment">; `C-='</span>
         (define-key map [(meta ?o)]               'icicle-insert-history-element) <span class="linecomment">; `M-o'</span>
         (define-key map [(meta ?i)]               'icicle-clear-current-history) <span class="linecomment">; `M-i'</span>
         (define-key map [(meta ?k)]           'icicle-erase-minibuffer-or-history-element) <span class="linecomment">; `M-k'</span>
         (define-key map [(meta ?:)]              'icicle-pp-eval-expression-in-minibuffer) <span class="linecomment">; `M-:'</span>
         (define-key map [(control ?a)]            'icicle-beginning-of-line+) <span class="linecomment">; `C-a'</span>
         (define-key map [(control ?e)]            'icicle-end-of-line+) <span class="linecomment">; `C-e'</span>
         (define-key map [(control meta ?v)]       'icicle-scroll-forward) <span class="linecomment">; `C-M-v'</span>
         (define-key map [(control meta shift ?v)] 'icicle-scroll-backward) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
         (dolist (key  icicle-completing-read+insert-keys)
           (define-key map key 'icicle-completing-read+insert)) <span class="linecomment">; `C-M-S-c'</span>
         (dolist (key  icicle-read+insert-file-name-keys)
           (define-key map key 'icicle-read+insert-file-name)) <span class="linecomment">; `C-M-S-f'</span>
         (define-key map "<span class="quote">\n</span>"                      'icicle-insert-newline-in-minibuffer) <span class="linecomment">; `C-j'</span>
         (when (fboundp 'yank-secondary) <span class="linecomment">; In `second-sel.el'.</span>
           (define-key map "<span class="quote">\C-\M-y</span>" 'icicle-yank-secondary)))) <span class="linecomment">; `C-M-y'</span>

     <span class="linecomment">;; `minibuffer-local-isearch-map': minibuffer map for editing isearch strings.</span>
     <span class="linecomment">;; In Emacs 21+, local is parent of local-isearch.</span>
     (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-isearch-map))
       (let ((map  minibuffer-local-isearch-map))
         (define-key map [menu-bar minibuf quit] <span class="linecomment">; Replace `keyboard-escape-quit'</span>
           '(menu-item "<span class="quote">Quit</span>" icicle-abort-recursive-edit
             :help "<span class="quote">Cancel minibuffer input or recursive edit</span>"))
         (define-key map [menu-bar minibuf return]
           '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
             :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
         (define-key map [menu-bar minibuf separator-help] '("<span class="quote">--</span>"))
         (define-key map [menu-bar minibuf completion-help]
           '(menu-item "<span class="quote">Icicles Help</span>" icicle-minibuffer-help
             :help "<span class="quote">Display help for minibuffer input and completion</span>"))
         (define-key map [menu-bar minibuf separator-last] '("<span class="quote">--</span>"))
         (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current]
           '(menu-item "<span class="quote">Toggle All-Current Icicle-Search Highlighting</span>"
             icicle-toggle-highlight-all-current :enable icicle-searching-p
             :help "<span class="quote">Toggle `icicle-search-highlight-all-current-flag'</span>" :keys "<span class="quote">C-^</span>"))
         (define-key map [menu-bar minibuf icicle-regexp-quote-input]
           '(menu-item "<span class="quote">Regexp-Quote Input</span>" icicle-regexp-quote-input
             :enable (with-current-buffer (window-buffer (minibuffer-window))
                       (not (zerop (buffer-size))))
             :help "<span class="quote">Regexp-quote current input or its active region, then apropos-complete</span>"
             :keys "<span class="quote">M-%</span>"))
         (define-key map [menu-bar minibuf separator-set2] '("<span class="quote">--</span>"))
         (define-key map [menu-bar minibuf icicle-clear-current-history]
           '(menu-item "<span class="quote">Clear History Entries</span>" icicle-clear-current-history
             :help "<span class="quote">Clear current minibuffer history of selected entries</span>"))
         (define-key map [menu-bar minibuf icicle-erase-minibuffer]
           '(menu-item "<span class="quote">Delete from History</span>" icicle-erase-minibuffer-or-history-element
             :visible (memq last-command
                       '(previous-history-element next-history-element
                         icicle-erase-minibuffer-or-history-element
                         previous-matching-history-element next-matching-history-element))
             :help "<span class="quote">Delete current history element (in minibuffer now)</span>" :keys "<span class="quote">M-k</span>"))
         (define-key map [menu-bar minibuf icicle-delete-history-element]
           '(menu-item "<span class="quote">Clear (Erase) Minibuffer</span>" icicle-erase-minibuffer-or-history-element
             :visible (not (memq last-command
                            '(previous-history-element next-history-element
                              icicle-erase-minibuffer-or-history-element
                              previous-matching-history-element next-matching-history-element)))
             :help "<span class="quote">Erase the Minibuffer</span>" :keys "<span class="quote">M-k</span>"))
         (define-key map [menu-bar minibuf icicle-insert-list-join-string]
           '(menu-item "<span class="quote">Insert Join-String</span>" icicle-insert-list-join-string
             :help "<span class="quote">Insert `icicle-list-join-string' into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-key-description]
           '(menu-item "<span class="quote">Insert Key Description</span>" icicle-insert-key-description
             :visible (not icicle-searching-p) :keys "<span class="quote">M-q</span>"
             :help "<span class="quote">Read key and insert its description - e.g., reading ^F inserts `C-f'</span>"))
         (define-key map [menu-bar minibuf icicle-insert-history-element]
           '(menu-item "<span class="quote">Insert Past Input using Completion</span>" icicle-insert-history-element
             :enable (consp (symbol-value minibuffer-history-variable))
             :help "<span class="quote">Use completion to insert a previous input into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]
           '(menu-item "<span class="quote">Insert String from a Variable...</span>" icicle-insert-string-from-variable
             :visible current-prefix-arg :keys "<span class="quote">C-=</span>"
             :help "<span class="quote">Read a variable name and insert its string value into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]
           '(menu-item "<span class="quote">Insert `icicle-input-string'</span>" icicle-insert-string-from-variable
             :visible (not current-prefix-arg) :keys "<span class="quote">C-=</span>"
             :help "<span class="quote">Insert text from variable `icicle-input-string' into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-insert-string-at-point]
           '(menu-item "<span class="quote">Insert Text from Point</span>" icicle-insert-string-at-point
             :help "<span class="quote">Insert text at or near the cursor into the minibuffer</span>"))
         (define-key map [menu-bar minibuf icicle-completing-read+insert]
           '(menu-item "<span class="quote">Insert On-Demand Completion</span>" icicle-completing-read+insert
             :visible (consp icicle-completing-read+insert-candidates)
             :help "<span class="quote">Read and insert something using (lax) completion</span>"))
         (define-key map [menu-bar minibuf icicle-read+insert-file-name]
           '(menu-item "<span class="quote">Insert File Name</span>" icicle-read+insert-file-name
             :help "<span class="quote">Read and insert a file name using (lax) completion</span>"))

         (define-key map [(control ??)]            'icicle-minibuffer-help) <span class="linecomment">; `C-?'</span>
         (define-key map [(control ?g)]            'icicle-abort-recursive-edit) <span class="linecomment">; `C-g'</span>
         (define-key map [M-S-backspace]           'icicle-erase-minibuffer) <span class="linecomment">; `M-S-backspace'</span>
         (define-key map [M-S-delete]              'icicle-erase-minibuffer) <span class="linecomment">; `M-S-delete'</span>
         (define-key map [(meta ?.)]               'icicle-insert-string-at-point) <span class="linecomment">; `M-.'</span>
         (define-key map [(control ?=)]            'icicle-insert-string-from-variable) <span class="linecomment">; `C-='</span>
         (define-key map [(meta ?o)]               'icicle-insert-history-element) <span class="linecomment">; `M-o'</span>
         (define-key map [(meta ?i)]               'icicle-clear-current-history) <span class="linecomment">; `M-i'</span>
         (define-key map [(meta ?k)]           'icicle-erase-minibuffer-or-history-element) <span class="linecomment">; `M-k'</span>
         (define-key map [(meta ?:)]              'icicle-pp-eval-expression-in-minibuffer) <span class="linecomment">; `M-:'</span>
         (define-key map [(control ?a)]            'icicle-beginning-of-line+) <span class="linecomment">; `C-a'</span>
         (define-key map [(control ?e)]            'icicle-end-of-line+) <span class="linecomment">; `C-e'</span>
         (define-key map [(control meta ?v)]       'icicle-scroll-forward) <span class="linecomment">; `C-M-v'</span>
         (define-key map [(control meta shift ?v)] 'icicle-scroll-backward) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
         (dolist (key  icicle-completing-read+insert-keys)
           (define-key map key 'icicle-completing-read+insert)) <span class="linecomment">; `C-M-S-c'</span>
         (dolist (key  icicle-read+insert-file-name-keys)
           (define-key map key 'icicle-read+insert-file-name)) <span class="linecomment">; `C-M-S-f'</span>
         (define-key map "<span class="quote">\n</span>"                      'icicle-insert-newline-in-minibuffer) <span class="linecomment">; `C-j'</span>
         (when (fboundp 'yank-secondary) <span class="linecomment">; In `second-sel.el'.</span>
           (define-key map "<span class="quote">\C-\M-y</span>" 'icicle-yank-secondary)))) <span class="linecomment">; `C-M-y'</span>

     <span class="linecomment">;; `minibuffer-local-completion-map': completion map.</span>
     (icicle-bind-completion-keys minibuffer-local-completion-map)

     <span class="linecomment">;; `minibuffer-local-must-match-map': must-match map.</span>
     <span class="linecomment">;; In Emacs 22+, local-completion is parent of local-must-match</span>
     (if (not (eq minibuffer-local-completion-map (keymap-parent minibuffer-local-must-match-map)))
         (icicle-bind-completion-keys minibuffer-local-must-match-map)
       (define-key minibuffer-local-must-match-map [(control ?g)]
         'icicle-abort-recursive-edit)  <span class="linecomment">; `C-g' - need it anyway, even if inherit completion map.</span>
       (dolist (key  icicle-completing-read+insert-keys)
         (define-key minibuffer-local-must-match-map key 'icicle-completing-read+insert)) <span class="linecomment">; `C-M-S-c'</span>
       (dolist (key  icicle-read+insert-file-name-keys)
         (define-key minibuffer-local-must-match-map key 'icicle-read+insert-file-name)) <span class="linecomment">; `C-M-S-f'</span>
       <span class="linecomment">;; Override the binding of `C-j' to `minibuffer-complete-and-exit'.</span>
       (define-key minibuffer-local-must-match-map "<span class="quote">\n</span>"
         'icicle-insert-newline-in-minibuffer)) <span class="linecomment">; `C-j' (newline)</span>
     (define-key minibuffer-local-must-match-map [S-return] <span class="linecomment">; `S-RET'</span>
       'icicle-apropos-complete-and-exit)

     <span class="linecomment">;; `minibuffer-local-filename-completion-map' and `minibuffer-local-must-match-filename-map'</span>
     <span class="linecomment">;; were introduced in Emacs 22, and they inherit from `minibuffer-local-completion' and</span>
     <span class="linecomment">;; `minibuffer-local-must-match-map', respectively.  For Emacs 23.1,</span>
     <span class="linecomment">;; `minibuffer-local-must-match-filename-map' is an alias for</span>
     <span class="linecomment">;; `minibuffer-local-filename-must-match-map'.  But for Emacs 23.2, there is no such alias!</span>
     (when (boundp 'minibuffer-local-filename-completion-map)
       (when (and (featurep 'bookmark+) (fboundp 'icicle-bookmark-file-other-window))
         (define-key minibuffer-local-filename-completion-map
             "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window))
       (define-key minibuffer-local-filename-completion-map
         [(control backspace)] 'icicle-up-directory)
       (define-key minibuffer-local-filename-completion-map "<span class="quote">\C-c+</span>" 'icicle-make-directory))
     <span class="linecomment">;; Use the old map name, for Emacs 22-23.1.</span>
     (when (boundp 'minibuffer-local-must-match-filename-map)
       (when (and (featurep 'bookmark+) (fboundp 'icicle-bookmark-file-other-window))
         (define-key minibuffer-local-must-match-filename-map
             "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window))
       (define-key minibuffer-local-must-match-filename-map
         [(control backspace)] 'icicle-up-directory)
       (define-key minibuffer-local-must-match-filename-map "<span class="quote">\C-c+</span>" 'icicle-make-directory))
     <span class="linecomment">;; Use the new name, for Emacs 23.2+.</span>
     (when (boundp 'minibuffer-local-filename-must-match-map)
       (when (and (featurep 'bookmark+) (fboundp 'icicle-bookmark-file-other-window))
         (define-key minibuffer-local-filename-must-match-map
             "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window))
       (define-key minibuffer-local-filename-must-match-map
         [(control backspace)] 'icicle-up-directory)
       (define-key minibuffer-local-filename-must-match-map "<span class="quote">\C-c+</span>" 'icicle-make-directory))

     <span class="linecomment">;; `completion-list-mode-map': map for `*Completions*' buffer.</span>
     <span class="linecomment">;; Abort on `C-g' or `q'.  Switch to minibuffer on `C-insert'.  Do not allow normal input.</span>
     (let ((map  completion-list-mode-map))
       (define-key map [(control ??)]     'icicle-minibuffer-help) <span class="linecomment">; `C-?'</span>
       (define-key map [(control ?g)]     'icicle-abort-recursive-edit) <span class="linecomment">; `C-g'</span>
       (define-key map "<span class="quote">q</span>"                'icicle-abort-recursive-edit) <span class="linecomment">; `q'</span>
       (define-key map [(control insert)] 'icicle-insert-completion) <span class="linecomment">; `C-insert'</span>
       (define-key map [down]             'icicle-next-line) <span class="linecomment">; `down'</span>
       (define-key map [up]               'icicle-previous-line) <span class="linecomment">; `up'</span>
       (define-key map [right]            'icicle-move-to-next-completion) <span class="linecomment">; `right'</span>
       (define-key map [left]             'icicle-move-to-previous-completion) <span class="linecomment">; `left'</span>
       (dolist (key icicle-previous-candidate-keys)
         (define-key map key 'icicle-move-to-previous-completion)) <span class="linecomment">; `S-TAB'</span>
       (define-key map [(control ?i)]     'icicle-move-to-next-completion) <span class="linecomment">; `TAB'</span>
       (define-key map [tab]              'icicle-move-to-next-completion) <span class="linecomment">; `TAB'</span>
       (when (boundp 'mouse-wheel-down-event) <span class="linecomment">; Emacs 22+ -  `wheel-down', `wheel-up'</span>
         (define-key map (vector mouse-wheel-down-event) 'icicle-scroll-Completions-backward)
         (define-key map (vector mouse-wheel-up-event) 'icicle-scroll-Completions-forward))
       (define-key map [S-down-mouse-2]   'icicle-mouse-remove-candidate) <span class="linecomment">; `S-mouse-2'</span>
       (define-key map [S-mouse-2]        'ignore)
       (define-key map [C-S-down-mouse-2] 'icicle-mouse-candidate-alt-action) <span class="linecomment">; `C-S-mouse-2'</span>
       (define-key map [C-S-mouse-2]      'ignore)
       (define-key map [C-down-mouse-2]   'icicle-mouse-candidate-action) <span class="linecomment">; `C-mouse-2'</span>
       (define-key map [C-mouse-2]        'ignore)
       (define-key map [C-M-return]       'icicle-help-on-candidate) <span class="linecomment">; `C-M-RET'</span>
       (define-key map [C-M-down-mouse-2] 'icicle-mouse-help-on-candidate) <span class="linecomment">; `C-M-mouse-2'</span>
       (define-key map [C-M-mouse-2]      'ignore)
       (define-key map [M-S-down-mouse-2] 'icicle-mouse-save/unsave-candidate) <span class="linecomment">; `M-S-mouse-2'</span>
       (define-key map [M-S-mouse-2]      'ignore)
       (define-key map [M-down-mouse-2]   'icicle-mouse-candidate-read-fn-invoke) <span class="linecomment">; `M-mouse-2'</span>
       (define-key map [M-mouse-2]        'ignore)
       (define-key map [C-down-mouse-3]   'icicle-Completions-mouse-3-menu) <span class="linecomment">; `C-mouse-3'</span>
       (define-key map [C-mouse-3]        'ignore)
       (define-key map [M-down-mouse-3]   'icicle-mouse-candidate-set-save-more) <span class="linecomment">; `M-mouse-3'</span>
       (define-key map [M-mouse-3]        'ignore)
       (define-key map [M-S-down-mouse-3] 'icicle-mouse-candidate-set-save) <span class="linecomment">; `M-S-mouse-3'</span>
       (define-key map [M-S-mouse-3]      'ignore)
       (define-key map [mouse-3]          'icicle-mouse-save-then-kill) <span class="linecomment">; `mouse-3'</span>
       (define-key map [(control ?&gt;)]     'icicle-candidate-set-save-more) <span class="linecomment">; `C-&gt;'</span>
       (define-key map [(control meta ?&gt;)] 'icicle-candidate-set-save) <span class="linecomment">; `C-M-&gt;'</span>
       (define-key map [(control ?\))]    'icicle-candidate-set-save-more-selected) <span class="linecomment">; `C-)'</span>
       (define-key map [(control meta ?\))] 'icicle-candidate-set-save-selected) <span class="linecomment">; `C-M-)'</span>
       (define-key map [(control meta ?&lt;)] 'icicle-candidate-set-retrieve) <span class="linecomment">; `C-M-&lt;'</span>
       (define-key map [(control ?l)]      'icicle-retrieve-previous-input) <span class="linecomment">; `C-l'</span>
       (define-key map [(control ?a)]      'icicle-beginning-of-line+) <span class="linecomment">; `C-a'</span>
       (define-key map [(control ?e)]      'icicle-end-of-line+) <span class="linecomment">; `C-e'</span>
       <span class="linecomment">;; (suppress-keymap map) ; Inhibit character self-insertion.</span>
       ))

    (t                                  <span class="linecomment">; TURN IT OFF *******************************</span>

     <span class="linecomment">;; `minibuffer-local-map': default minibuffer map.</span>
     (let ((map  minibuffer-local-map))

       <span class="linecomment">;; Menu-bar `Minibuf' menu.</span>
       (define-key map [menu-bar minibuf quit]
         '(menu-item "<span class="quote">Quit</span>" keyboard-escape-quit :help "<span class="quote">Abort input and exit minibuffer</span>"))
       (define-key map [menu-bar minibuf return]
         '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
           :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
       (define-key map [menu-bar minibuf separator-help]                      nil)
       (define-key map [menu-bar minibuf completion-help]                     nil)
       (define-key map [menu-bar minibuf separator-last]                      nil)
       (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current] nil)
       (define-key map [menu-bar minibuf icicle-regexp-quote-input]           nil)
       (define-key map [menu-bar minibuf separator-set2]                      nil)
       (define-key map [menu-bar minibuf icicle-clear-current-history]        nil)
       (define-key map [menu-bar minibuf icicle-erase-minibuffer]             nil)
       (define-key map [menu-bar minibuf icicle-delete-history-element]       nil)
       (define-key map [menu-bar minibuf icicle-insert-list-join-string]      nil)
       (define-key map [menu-bar minibuf icicle-insert-key-description]       nil)
       (define-key map [menu-bar minibuf icicle-insert-history-element]       nil)
       (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]     nil)
       (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]   nil)
       (define-key map [menu-bar minibuf icicle-insert-string-at-point]       nil)
       (define-key map [menu-bar minibuf icicle-completing-read+insert]       nil)
       (define-key map [menu-bar minibuf icicle-read+insert-file-name]        nil)

       (define-key map [(control ??)]            nil) <span class="linecomment">; `C-?'</span>
       (define-key map [(control ?g)]            (if (and (fboundp 'minibuffer-keyboard-quit)
                                                          delete-selection-mode)
                                                     'minibuffer-keyboard-quit
                                                   'abort-recursive-edit)) <span class="linecomment">; `C-g'</span>
       (define-key map [M-S-backspace]           nil) <span class="linecomment">; `M-S-DEL'</span>
       (define-key map [M-S-delete]              nil) <span class="linecomment">; `M-S-delete'</span>
       (define-key map [(meta ?.)]               nil) <span class="linecomment">; `M-.'</span>
       (define-key map [(control ?=)]            nil) <span class="linecomment">; `C-='</span>
       (define-key map [(meta ?o)]               nil) <span class="linecomment">; `M-o'</span>
       (define-key map [(meta ?i)]               nil) <span class="linecomment">; `M-i'</span>
       (define-key map [(meta ?k)]               nil) <span class="linecomment">; `M-k'</span>
       (define-key map [(meta ?:)]               nil) <span class="linecomment">; `M-:'</span>
       (define-key map [(control ?a)]            nil) <span class="linecomment">; `C-a'</span>
       (define-key map [(control ?e)]            nil) <span class="linecomment">; `C-e'</span>
       (define-key map [(control meta ?v)]       nil) <span class="linecomment">; `C-M-v'</span>
       (define-key map [(control meta shift ?v)] nil) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
       (dolist (key  icicle-completing-read+insert-keys) (define-key map key nil)) <span class="linecomment">; `C-M-S-c'</span>
       (dolist (key  icicle-read+insert-file-name-keys) (define-key map key nil)) <span class="linecomment">; `C-M-S-f'</span>
       (define-key map "<span class="quote">\n</span>"                      'exit-minibuffer) <span class="linecomment">; `C-j'</span>
       (define-key map "<span class="quote">\C-\M-y</span>"                 nil)) <span class="linecomment">; `C-M-y'</span>

     <span class="linecomment">;; `minibuffer-local-ns-map': default minibuffer map when spaces are not allowed.</span>
     <span class="linecomment">;; In Emacs 22+, local is parent of local-ns.</span>
     (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-ns-map))
       (let ((map  minibuffer-local-ns-map))
         (define-key map [menu-bar minibuf quit]
           '(menu-item "<span class="quote">Quit</span>" keyboard-escape-quit :help "<span class="quote">Abort input and exit minibuffer</span>"))
         (define-key map [menu-bar minibuf return]
           '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
             :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
         (define-key map [menu-bar minibuf separator-help]                      nil)
         (define-key map [menu-bar minibuf completion-help]                     nil)
         (define-key map [menu-bar minibuf separator-last]                      nil)
         (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current] nil)
         (define-key map [menu-bar minibuf icicle-regexp-quote-input]           nil)
         (define-key map [menu-bar minibuf separator-set2]                      nil)
         (define-key map [menu-bar minibuf icicle-clear-current-history]        nil)
         (define-key map [menu-bar minibuf icicle-erase-minibuffer]             nil)
         (define-key map [menu-bar minibuf icicle-delete-history-element]       nil)
         (define-key map [menu-bar minibuf icicle-insert-list-join-string]      nil)
         (define-key map [menu-bar minibuf icicle-insert-key-description]       nil)
         (define-key map [menu-bar minibuf icicle-insert-history-element]       nil)
         (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]     nil)
         (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]   nil)
         (define-key map [menu-bar minibuf icicle-insert-string-at-point]       nil)
         (define-key map [menu-bar minibuf icicle-completing-read+insert]       nil)
         (define-key map [menu-bar minibuf icicle-read+insert-file-name]        nil)

         (define-key map [(control ??)]            nil) <span class="linecomment">; `C-?'</span>
         (define-key map [(control ?g)]            (if (and (fboundp 'minibuffer-keyboard-quit)
                                                            delete-selection-mode)
                                                       'minibuffer-keyboard-quit
                                                     'abort-recursive-edit)) <span class="linecomment">; `C-g'</span>
         (define-key map [M-S-backspace]           nil) <span class="linecomment">; `M-S-DEL'</span>
         (define-key map [M-S-delete]              nil) <span class="linecomment">; `M-S-delete'</span>
         (define-key map [(meta ?.)]               nil) <span class="linecomment">; `M-.'</span>
         (define-key map [(control ?=)]            nil) <span class="linecomment">; `C-='</span>
         (define-key map [(meta ?o)]               nil) <span class="linecomment">; `M-o'</span>
         (define-key map [(meta ?i)]               nil) <span class="linecomment">; `M-i'</span>
         (define-key map [(meta ?k)]               nil) <span class="linecomment">; `M-k'</span>
         (define-key map [(meta ?:)]               nil) <span class="linecomment">; `M-:'</span>
         (define-key map [(control ?a)]            nil) <span class="linecomment">; `C-a'</span>
         (define-key map [(control ?e)]            nil) <span class="linecomment">; `C-e'</span>
         (define-key map [(control meta ?v)]       nil) <span class="linecomment">; `C-M-v'</span>
         (define-key map [(control meta shift ?v)] nil) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
         (dolist (key  icicle-completing-read+insert-keys) (define-key map key nil)) <span class="linecomment">; `C-M-S-c'</span>
         (dolist (key  icicle-read+insert-file-name-keys) (define-key map key nil)) <span class="linecomment">; `C-M-S-f'</span>
         (define-key map "<span class="quote">\n</span>"                      'exit-minibuffer) <span class="linecomment">; `C-j'</span>
         (define-key map "<span class="quote">\C-\M-y</span>"                 nil))) <span class="linecomment">; `C-M-y'</span>

     <span class="linecomment">;; `minibuffer-local-isearch-map': minibuffer map for editing isearch strings.</span>
     <span class="linecomment">;; In Emacs 21+, local is parent of local-isearch</span>
     (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-isearch-map))
       (let ((map  minibuffer-local-isearch-map))
         (define-key map [menu-bar minibuf quit]
           '(menu-item "<span class="quote">Quit</span>" keyboard-escape-quit :help "<span class="quote">Abort input and exit minibuffer</span>"))
         (define-key map [menu-bar minibuf return]
           '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
             :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
         (define-key map [menu-bar minibuf separator-help]                      nil)
         (define-key map [menu-bar minibuf completion-help]                     nil)
         (define-key map [menu-bar minibuf separator-last]                      nil)
         (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current] nil)
         (define-key map [menu-bar minibuf icicle-regexp-quote-input]           nil)
         (define-key map [menu-bar minibuf separator-set2]                      nil)
         (define-key map [menu-bar minibuf icicle-clear-current-history]        nil)
         (define-key map [menu-bar minibuf icicle-erase-minibuffer]             nil)
         (define-key map [menu-bar minibuf icicle-delete-history-element]       nil)
         (define-key map [menu-bar minibuf icicle-insert-list-join-string]      nil)
         (define-key map [menu-bar minibuf icicle-insert-key-description]       nil)
         (define-key map [menu-bar minibuf icicle-insert-history-element]       nil)
         (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]     nil)
         (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]   nil)
         (define-key map [menu-bar minibuf icicle-insert-string-at-point]       nil)
         (define-key map [menu-bar minibuf icicle-completing-read+insert]       nil)
         (define-key map [menu-bar minibuf icicle-read+insert-file-name]        nil)

         (define-key map [(control ??)]            nil) <span class="linecomment">; `C-?'</span>
         (define-key map [(control ?g)]            (if (and (fboundp 'minibuffer-keyboard-quit)
                                                            delete-selection-mode)
                                                       'minibuffer-keyboard-quit
                                                     'abort-recursive-edit)) <span class="linecomment">; `C-g'</span>
         (define-key map [M-S-backspace]           nil) <span class="linecomment">; `M-S-DEL'</span>
         (define-key map [M-S-delete]              nil) <span class="linecomment">; `M-S-delete'</span>
         (define-key map [(meta ?.)]               nil) <span class="linecomment">; `M-.'</span>
         (define-key map [(control ?=)]            nil) <span class="linecomment">; `C-='</span>
         (define-key map [(meta ?o)]               nil) <span class="linecomment">; `M-o'</span>
         (define-key map [(meta ?i)]               nil) <span class="linecomment">; `M-i'</span>
         (define-key map [(meta ?k)]               nil) <span class="linecomment">; `M-k'</span>
         (define-key map [(meta ?:)]               nil) <span class="linecomment">; `M-:'</span>
         (define-key map [(control ?a)]            nil) <span class="linecomment">; `C-a'</span>
         (define-key map [(control ?e)]            nil) <span class="linecomment">; `C-e'</span>
         (define-key map [(control meta ?v)]       nil) <span class="linecomment">; `C-M-v'</span>
         (define-key map [(control meta shift ?v)] nil) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
         (dolist (key  icicle-completing-read+insert-keys) (define-key map key nil)) <span class="linecomment">; `C-M-S-c'</span>
         (dolist (key  icicle-read+insert-file-name-keys) (define-key map key nil)) <span class="linecomment">; `C-M-S-f'</span>
         (define-key map "<span class="quote">\n</span>"                      'exit-minibuffer))) <span class="linecomment">; `C-j'</span>

     <span class="linecomment">;; `minibuffer-local-completion-map': completion map.</span>
     (icicle-restore-completion-keys minibuffer-local-completion-map)

     <span class="linecomment">;; `minibuffer-local-must-match-map': must-match map.</span>
     <span class="linecomment">;; In Emacs 22+, local-completion is parent of local-must-match</span>
     (if (not (eq minibuffer-local-completion-map (keymap-parent minibuffer-local-must-match-map)))
         (icicle-restore-completion-keys minibuffer-local-must-match-map)
       (define-key minibuffer-local-must-match-map [(control ?g)]
         (if (and (fboundp 'minibuffer-keyboard-quit)
                  delete-selection-mode)
             'minibuffer-keyboard-quit
           'abort-recursive-edit))  <span class="linecomment">; `C-g' - need it anyway, even if inherit completion map.</span>
       (dolist (key  icicle-completing-read+insert-keys)
         (define-key minibuffer-local-must-match-map key nil))
       (dolist (key  icicle-read+insert-file-name-keys)
         (define-key minibuffer-local-must-match-map key nil))
       (define-key minibuffer-local-must-match-map "<span class="quote">\n</span>" 'minibuffer-complete-and-exit)) <span class="linecomment">; `C-j'</span>
     (define-key minibuffer-local-must-match-map [S-return] nil)

     <span class="linecomment">;; `minibuffer-local-filename-completion-map' and `minibuffer-local-must-match-filename-map'</span>
     <span class="linecomment">;; were introduced in Emacs 22, and they inherit from `minibuffer-local-completion' and</span>
     <span class="linecomment">;; `minibuffer-local-must-match-map', respectively.  For Emacs 23.1,</span>
     <span class="linecomment">;; `minibuffer-local-must-match-filename-map' is an alias for</span>
     <span class="linecomment">;; `minibuffer-local-filename-must-match-map'.  But for Emacs 23.2, there is no such alias!</span>
     (when (boundp 'minibuffer-local-filename-completion-map)
       (define-key minibuffer-local-filename-completion-map "<span class="quote">\C-xm</span>"               nil)
       (define-key minibuffer-local-filename-completion-map [(control backspace)] nil)
       (define-key minibuffer-local-filename-completion-map "<span class="quote">\C-c+</span>"               nil))
     <span class="linecomment">;; Use the old name, for Emacs 22-23.1.</span>
     (when (boundp 'minibuffer-local-must-match-filename-map)
       (define-key minibuffer-local-must-match-filename-map "<span class="quote">\C-xm</span>"               nil)
       (define-key minibuffer-local-must-match-filename-map [(control backspace)] nil))
     <span class="linecomment">;; Use the new name, for Emacs 23.2+.</span>
     (when (boundp 'minibuffer-local-filename-must-match-map)
       (define-key minibuffer-local-filename-must-match-map "<span class="quote">\C-xm</span>"               nil)
       (define-key minibuffer-local-filename-must-match-map [(control backspace)] nil)
       (define-key minibuffer-local-filename-must-match-map "<span class="quote">\C-c+</span>"               nil))

     <span class="linecomment">;; `completion-list-mode-map': map for `*Completions*' buffer.</span>
     (let ((map  completion-list-mode-map))
       (define-key map [(control ?g)]       nil)
       (define-key map "<span class="quote">q</span>"                  nil)
       (define-key map [(control insert)]   nil)
       (dolist (key icicle-prefix-cycle-next-keys)     (define-key map key nil))
       (dolist (key icicle-prefix-cycle-previous-keys) (define-key map key nil))
       (dolist (key icicle-previous-candidate-keys)   (define-key map key nil))
       (define-key map [(control ?i)]       nil)
       (define-key map [tab]                nil)
       (define-key map [S-down-mouse-2]     nil)
       (define-key map [S-mouse-2]          nil)
       (define-key map [C-S-down-mouse-2]   nil)
       (define-key map [C-S-mouse-2]        nil)
       (define-key map [C-down-mouse-2]     nil)
       (define-key map [C-mouse-2]          nil)
       (define-key map [C-M-return]         nil)
       (define-key map [C-M-down-mouse-2]   nil)
       (define-key map [C-M-mouse-2]        nil)
       (define-key map [M-S-down-mouse-2]   nil)
       (define-key map [M-S-mouse-2]        nil)
       (define-key map [M-down-mouse-2]     nil)
       (define-key map [M-mouse-2]          nil)
       (define-key map [C-down-mouse-3]     nil)
       (define-key map [M-down-mouse-3]     nil)
       (define-key map [M-mouse-3]          nil)
       (define-key map [M-S-down-mouse-3]   nil)
       (define-key map [M-S-mouse-3]        nil)
       (define-key map [mouse-3]            nil)
       (define-key map [C-mouse-3]          nil)
       (define-key map [(control ?&gt;)]       nil)
       (define-key map [(control meta ?&gt;)]  nil)
       (define-key map [(control ?\))]      nil)
       (define-key map [(control meta ?\))] nil)
       (define-key map [(control meta ?&lt;)]  nil)
       (define-key map [(control ?l)]       nil)
       (define-key map [(control ?a)]       nil)
       (define-key map [(control ?e)]       nil)
       (define-key map [down]               nil)
       (define-key map [up]                 nil)
       <span class="linecomment">;; Do these last:</span>
       (define-key map [right]              'next-completion)
       (define-key map [left]               'previous-completion))))
  (when (and (interactive-p) turn-on-p)
    (message (substitute-command-keys
              "<span class="quote">Use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-minibuffer-help]' in minibuffer for help.</span>"))))

(defun icicle-unmap (command map current)
  "<span class="quote">In MAP, unbind any keys that are bound to COMMAND.
If command remapping is available, remap COMMAND to nil in MAP,
unbinding it.
Otherwise, bind COMMAND to whatever CURRENT is bound to in MAP.</span>"
  (if (fboundp 'command-remapping)
      (define-key map (vector 'remap command) nil)
    (substitute-key-definition current command map)))

(defun icicle-rebind-global (old new map)
  "<span class="quote">Bind command NEW in MAP to all keys currently bound globally to OLD.</span>"
  (substitute-key-definition old new map (current-global-map)))

(defun icicle-bind-completion-keys (map)
  "<span class="quote">Bind keys for minibuffer completion map MAP.
MAP is `minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', or
`minibuffer-local-must-match-map'.</span>"

  <span class="linecomment">;; Menu-bar `Minibuf' menu.</span>

  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map [menu-bar minibuf quit] <span class="linecomment">; Replace `keyboard-escape-quit'</span>
      '(menu-item "<span class="quote">Quit</span>" icicle-abort-recursive-edit
        :help "<span class="quote">Cancel minibuffer input or recursive edit</span>"))
    (define-key map [menu-bar minibuf return]
      '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
        :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
    (define-key map [menu-bar minibuf separator-help] '("<span class="quote">--</span>"))
    (define-key map [menu-bar minibuf completion-help]
      '(menu-item "<span class="quote">Icicles Help</span>" icicle-minibuffer-help
        :help "<span class="quote">Display help for minibuffer input and completion</span>"))
    (define-key map [menu-bar minibuf separator-last] '("<span class="quote">--</span>"))
    (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current]
      '(menu-item "<span class="quote">Toggle All-Current Icicle-Search Highlighting</span>"
        icicle-toggle-highlight-all-current :enable icicle-searching-p
        :help "<span class="quote">Toggle `icicle-search-highlight-all-current-flag'</span>" :keys "<span class="quote">C-^</span>"))
    (define-key map [menu-bar minibuf icicle-regexp-quote-input]
      '(menu-item "<span class="quote">Regexp-Quote Input</span>" icicle-regexp-quote-input
        :enable (with-current-buffer (window-buffer (minibuffer-window)) (not (zerop (buffer-size))))
        :help "<span class="quote">Regexp-quote current input or its active region, then apropos-complete</span>"
        :keys "<span class="quote">M-%</span>"))
    (define-key map [menu-bar minibuf separator-set2] '("<span class="quote">--</span>"))
    (define-key map [menu-bar minibuf icicle-clear-current-history]
      '(menu-item "<span class="quote">Clear History Entries</span>" icicle-clear-current-history
        :help "<span class="quote">Clear current minibuffer history of selected entries</span>"))
    (define-key map [menu-bar minibuf icicle-erase-minibuffer]
      '(menu-item "<span class="quote">Delete from History</span>" icicle-erase-minibuffer-or-history-element
        :visible (memq last-command
                  '(previous-history-element next-history-element
                    icicle-erase-minibuffer-or-history-element
                    previous-matching-history-element next-matching-history-element))
        :help "<span class="quote">Delete current history element (in minibuffer now)</span>" :keys "<span class="quote">M-k</span>"))
    (define-key map [menu-bar minibuf icicle-delete-history-element]
      '(menu-item "<span class="quote">Clear (Erase) Minibuffer</span>" icicle-erase-minibuffer-or-history-element
        :visible (not (memq last-command
                       '(previous-history-element next-history-element
                         icicle-erase-minibuffer-or-history-element
                         previous-matching-history-element next-matching-history-element)))
        :help "<span class="quote">Erase the Minibuffer</span>" :keys "<span class="quote">M-k</span>"))
    (define-key map [menu-bar minibuf icicle-insert-list-join-string]
      '(menu-item "<span class="quote">Insert Join-String</span>" icicle-insert-list-join-string
        :help "<span class="quote">Insert `icicle-list-join-string' into the minibuffer</span>"))
    (define-key map [menu-bar minibuf icicle-insert-key-description]
      '(menu-item "<span class="quote">Insert Key Description</span>" icicle-insert-key-description
        :visible (not icicle-searching-p) :keys "<span class="quote">M-q</span>"
        :help "<span class="quote">Read key and insert its description - e.g., reading ^F inserts `C-f'</span>"))
    (define-key map [menu-bar minibuf icicle-insert-history-element]
      '(menu-item "<span class="quote">Insert Past Input using Completion</span>" icicle-insert-history-element
        :help "<span class="quote">Use completion to insert a previous input into the minibuffer</span>"))
    (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]
      '(menu-item "<span class="quote">Insert String from a Variable...</span>" icicle-insert-string-from-variable
        :visible current-prefix-arg :keys "<span class="quote">C-=</span>"
        :help "<span class="quote">Read a variable name and insert its string value into the minibuffer</span>"))
    (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]
      '(menu-item "<span class="quote">Insert `icicle-input-string'</span>" icicle-insert-string-from-variable
        :visible (not current-prefix-arg) :keys "<span class="quote">C-=</span>"
        :help "<span class="quote">Insert text from variable `icicle-input-string' into the minibuffer</span>"))
    (define-key map [menu-bar minibuf icicle-insert-string-at-point]
      '(menu-item "<span class="quote">Insert Text from Point</span>" icicle-insert-string-at-point
        :help "<span class="quote">Insert text at or near the cursor into the minibuffer</span>"))
    (define-key map [menu-bar minibuf icicle-completing-read+insert]
      '(menu-item "<span class="quote">Insert On-Demand Completion</span>" icicle-completing-read+insert
        :visible (consp icicle-completing-read+insert-candidates)
        :help "<span class="quote">Read and insert something using (lax) completion</span>"))
    (define-key map [menu-bar minibuf icicle-read+insert-file-name]
      '(menu-item "<span class="quote">Insert File Name</span>" icicle-read+insert-file-name
        :help "<span class="quote">Read and insert a file name using (lax) completion</span>"))
    )
  (define-key map [menu-bar minibuf icicle-goto/kill-failed-input]
    '(menu-item "<span class="quote">Cursor to Mismatch (Repeat: Kill)</span>" icicle-goto/kill-failed-input
      :enable (and (overlayp icicle-input-completion-fail-overlay)
               (overlay-start icicle-input-completion-fail-overlay))
      :help "<span class="quote">Put cursor where input fails to complete - repeat to kill mismatch</span>"))
  (define-key map [menu-bar minibuf icicle-retrieve-next-input]
    '(menu-item "<span class="quote">Restore Next Completion Input</span>" icicle-retrieve-next-input
      :enable (consp (symbol-value (if (icicle-file-name-input-p)
                                       'icicle-previous-raw-file-name-inputs
                                     'icicle-previous-raw-non-file-name-inputs)))
      :help "<span class="quote">Cycle forward to insert a previous completion input in the minibuffer (`C-u': \
complete)</span>"))
  (define-key map [menu-bar minibuf icicle-retrieve-previous-input]
    '(menu-item "<span class="quote">Restore Previous Completion Input</span>" icicle-retrieve-previous-input
      :enable (consp (symbol-value (if (icicle-file-name-input-p)
                                       'icicle-previous-raw-file-name-inputs
                                     'icicle-previous-raw-non-file-name-inputs)))
      :help "<span class="quote">Cycle backward to insert a previous completion input in the minibuffer (`C-u': \
complete)</span>"))
  (define-key map [menu-bar minibuf separator-C-l] '("<span class="quote">--</span>"))
  (define-key map [menu-bar minibuf ?\?] nil)
  (define-key map [menu-bar minibuf space] nil)
  (define-key map [menu-bar minibuf tab] nil)
  (define-key map [menu-bar minibuf alt-action-list-all]
    '(menu-item "<span class="quote">Alt Act on List of Candidates</span>" icicle-all-candidates-list-alt-action
      :help "<span class="quote">Apply the alternative action to the list of matching completion candidates</span>"
      :enable icicle-all-candidates-list-alt-action-fn))
  (define-key map [menu-bar minibuf alt-action-all]
    '(menu-item "<span class="quote">Alt Act on Each Candidate</span>" icicle-all-candidates-alt-action
      :help "<span class="quote">Apply the alternative action to each matching completion candidates</span>"
      :enable icicle-candidate-alt-action-fn))
  (define-key map [menu-bar minibuf action-list-all]
    '(menu-item "<span class="quote">Act on List of Candidates</span>" icicle-all-candidates-list-action
      :help "<span class="quote">Apply the command action to the list of matching completion candidates</span>"
      :enable icicle-all-candidates-list-action-fn))
  (define-key map [menu-bar minibuf action-all]
    '(menu-item "<span class="quote">Act on Each Candidate</span>" icicle-all-candidates-action
      :help "<span class="quote">Apply the command action to each matching completion candidates</span>"
      :enable icicle-candidate-action-fn))
  (define-key map [menu-bar minibuf separator-actions] '("<span class="quote">--</span>"))
  (define-key map [menu-bar minibuf set-define]
    '(menu-item "<span class="quote">Define Candidates by Lisp Sexp</span>" icicle-candidate-set-define
      :help "<span class="quote">Define the set of current completion candidates by evaluating a sexp</span>"))
  (define-key map [menu-bar minibuf icicle-keep-only-past-inputs]
    '(menu-item "<span class="quote">Keep Only Previously Entered</span>" icicle-keep-only-past-inputs
      :enable (and icicle-completion-candidates (consp (symbol-value minibuffer-history-variable)))
      :help "<span class="quote">Removed candidates that you have not previously chosen and entered</span>"))
  (define-key map [menu-bar minibuf set-union]
    '(menu-item "<span class="quote">Add (Union) Saved Candidate Set</span>" icicle-candidate-set-union
      :enable icicle-saved-completion-candidates
      :help "<span class="quote">Set union between the current and saved completion candidates</span>"))
  (define-key map [menu-bar minibuf set-difference]
    '(menu-item "<span class="quote">Subtract Saved Candidate Set</span>" icicle-candidate-set-difference
      :enable icicle-saved-completion-candidates
      :help "<span class="quote">Set difference between the current and saved completion candidates</span>"))
  (define-key map [menu-bar minibuf set-intersection]
    '(menu-item "<span class="quote">Intersect Saved Candidate Set</span>" icicle-candidate-set-intersection
      :enable icicle-saved-completion-candidates
      :help "<span class="quote">Set intersection between the current and saved candidates</span>"))
  (define-key map [menu-bar minibuf icicle-save-predicate-to-variable]
    '(menu-item "<span class="quote">Save Predicate to Variable</span>" icicle-save-predicate-to-variable
      :help "<span class="quote">Save the current completion predicate to a variable</span>"))
  (define-key map [menu-bar minibuf icicle-narrow-candidates-with-predicate]
    '(menu-item "<span class="quote">Satisfy Also Predicate...</span>" icicle-narrow-candidates-with-predicate
      :help "<span class="quote">Match another input pattern (narrow completions set)</span>"
      :enable icicle-completion-candidates))
  (define-key map [menu-bar minibuf icicle-narrow-candidates]
    '(menu-item "<span class="quote">Match Also Regexp...</span>" icicle-narrow-candidates
      :enable icicle-completion-candidates
      :help "<span class="quote">Match another input pattern (narrow completions set)</span>"))
  (define-key map [menu-bar minibuf icicle-widen-candidates]
    '(menu-item "<span class="quote">Match Alternative...</span>" icicle-widen-candidates
      :enable icicle-completion-candidates
      :help "<span class="quote">Match alternative input pattern (widen completions set)</span>"))
  (define-key map [menu-bar minibuf set-complement]
    '(menu-item "<span class="quote">Complement Candidates</span>" icicle-candidate-set-complement
      :help "<span class="quote">Complement the set of current completion candidates</span>"))
  (define-key map [menu-bar minibuf separator-set1] '("<span class="quote">--</span>"))
  (define-key map [menu-bar minibuf set-swap]
    '(menu-item "<span class="quote">Swap Saved and Current Sets</span>" icicle-candidate-set-swap
      :enable icicle-saved-completion-candidates
      :help "<span class="quote">Swap the saved and current sets of completion candidates</span>"))
  (define-key map [menu-bar minibuf icicle-candidate-set-save-more-selected]
    '(menu-item "<span class="quote">Save More Selected (Region) Candidates</span>"
      icicle-candidate-set-save-more-selected
      :help "<span class="quote">Add the candidates in the region to the saved candidates</span>"))
  (define-key map [menu-bar minibuf icicle-candidate-set-save-selected]
    '(menu-item "<span class="quote">Save Selected (Region) Candidates</span>"
      icicle-candidate-set-save-selected
      :help "<span class="quote">Save the candidates in the region, for later recall</span>"))
  (define-key map [menu-bar minibuf icicle-candidate-set-save-more]
    '(menu-item "<span class="quote">Save More Candidates</span>" icicle-candidate-set-save-more
      :help "<span class="quote">Add current completion candidates to saved candidates set</span>"))
  (define-key map [menu-bar minibuf set-save-to-cache-file]
    '(menu-item "<span class="quote">    to Cache File...</span>" icicle-candidate-set-save-persistently
      :help "<span class="quote">Save current completion candidates to a cache file, for later recall</span>"))
  (define-key map [menu-bar minibuf set-save-to-variable]
    '(menu-item "<span class="quote">    to Variable...</span>" icicle-candidate-set-save-to-variable
      :help "<span class="quote">Save current completion candidates to a variable, for later recall</span>"))
  (define-key map [menu-bar minibuf set-save]
    '(menu-item "<span class="quote">Save Candidates</span>" icicle-candidate-set-save
      :help "<span class="quote">Save the set of current completion candidates, for later recall</span>"))
  (define-key map [menu-bar minibuf icicle-candidate-set-retrieve-more]
    '(menu-item "<span class="quote">Retrieve More Saved Candidates</span>"
      icicle-candidate-set-retrieve-more
      :help "<span class="quote">Add saved candidates to current completion candidates</span>"))
  (define-key map [menu-bar minibuf set-retrieve-from-cache-file]
    '(menu-item "<span class="quote">    from Cache File...</span>"
      icicle-candidate-set-retrieve-persistent
      :help "<span class="quote">Retrieve saved completion candidates from a cache file, making them current</span>"))
  (define-key map [menu-bar minibuf set-retrieve-from-variable]
    '(menu-item "<span class="quote">    from Variable...</span>" icicle-candidate-set-retrieve-from-variable
      :help "<span class="quote">Retrieve saved completion candidates from variable, making them current</span>"))
  (define-key map [menu-bar minibuf set-retrieve]
    '(menu-item "<span class="quote">Retrieve Saved Candidates</span>" icicle-candidate-set-retrieve
      :enable icicle-saved-completion-candidates
      :help "<span class="quote">Retrieve the saved set of completion candidates, making it current</span>"))
  (define-key map [menu-bar minibuf separator-complete] '("<span class="quote">--</span>"))
  (define-key map [menu-bar minibuf word-complete]
    '(menu-item "<span class="quote">Word-Complete</span>" icicle-prefix-word-complete
      :help "<span class="quote">Complete at most one word of prefix</span>"))
  (define-key map [menu-bar minibuf prefix-complete]
    '(menu-item "<span class="quote">Prefix-Complete</span>" icicle-prefix-complete
      :help "<span class="quote">Complete prefix as far as possible</span>"))
  (define-key map [menu-bar minibuf apropos-complete]
    '(menu-item "<span class="quote">Apropos-Complete</span>" icicle-apropos-complete :keys "<span class="quote">S-TAB</span>"
      :help "<span class="quote">Complete regular expression as far as possible and list completions</span>"))

  <span class="linecomment">;; Remap some commands for completion.</span>
  (icicle-remap 'self-insert-command           'icicle-self-insert map (current-global-map))
  (icicle-remap 'universal-argument            'icicle-universal-argument <span class="linecomment">; `C-u'</span>
                map (current-global-map))
  (icicle-remap 'negative-argument             'icicle-negative-argument <span class="linecomment">; `M--'</span>
                map (current-global-map))
  (icicle-remap 'digit-argument                'icicle-digit-argument <span class="linecomment">; `C-9'</span>
                map (current-global-map))
  (icicle-remap 'backward-delete-char-untabify 'icicle-backward-delete-char-untabify <span class="linecomment">; `DEL'</span>
                map (current-global-map))
  (icicle-remap 'delete-backward-char          'icicle-delete-backward-char <span class="linecomment">; `DEL'</span>
                map (current-global-map))
  (icicle-remap 'delete-char                   'icicle-delete-char <span class="linecomment">; `C-d', `deletechar'</span>
                map (current-global-map))
  (icicle-remap 'backward-kill-word            'icicle-backward-kill-word <span class="linecomment">; `M-DEL'</span>
                map (current-global-map))
  (icicle-remap 'kill-word                     'icicle-kill-word <span class="linecomment">; `M-d'</span>
                map (current-global-map))
  (icicle-remap 'backward-kill-sexp            'icicle-backward-kill-sexp <span class="linecomment">; `C-M-backspace'</span>
                map (current-global-map))
  (icicle-remap 'kill-sexp                     'icicle-kill-sexp <span class="linecomment">; `C-M-k', `C-M-delete'</span>
                map (current-global-map))
  (icicle-remap 'backward-kill-sentence        'icicle-backward-kill-sentence <span class="linecomment">; `C-x DEL'</span>
                map (current-global-map))
  (icicle-remap 'backward-kill-paragraph       'icicle-backward-kill-paragraph <span class="linecomment">; `C-backspace'</span>
                map (current-global-map))
  (icicle-remap 'kill-paragraph                'icicle-kill-paragraph <span class="linecomment">; `C-delete'</span>
                map (current-global-map))
  (icicle-remap 'kill-line                     'icicle-kill-line <span class="linecomment">; `C-k', `deleteline'</span>
                map (current-global-map))
  (icicle-remap 'reposition-window             'icicle-goto/kill-failed-input <span class="linecomment">; `C-M-l'</span>
                map (current-global-map))
  (icicle-remap 'transpose-chars               'icicle-transpose-chars <span class="linecomment">; `C-t'</span>
                map (current-global-map))
  (icicle-remap 'transpose-words               'icicle-transpose-words <span class="linecomment">; `M-t'</span>
                map (current-global-map))
  (icicle-remap 'transpose-sexps               'icicle-transpose-sexps <span class="linecomment">; `C-M-t'</span>
                map (current-global-map))
  (icicle-remap 'yank-pop                      'icicle-yank-pop <span class="linecomment">; `M-y', `M-insert'</span>
                map (current-global-map))
  (icicle-remap 'mouse-yank-secondary          'icicle-mouse-yank-secondary <span class="linecomment">; `M-mouse-2'</span>
                map (current-global-map))

  <span class="linecomment">;; Bind additional keys.</span>
  (dolist (key icicle-word-completion-keys)
    (define-key map key 'icicle-prefix-word-complete)) <span class="linecomment">; `M-SPC'</span>
  (dolist (key icicle-apropos-complete-keys)
    (define-key map key 'icicle-apropos-complete)) <span class="linecomment">; `S-TAB'</span>
  (dolist (key icicle-prefix-complete-keys) (define-key map key 'icicle-prefix-complete)) <span class="linecomment">; `TAB'</span>
  (dolist (key icicle-apropos-complete-no-display-keys)
    (define-key map key 'icicle-apropos-complete-no-display)) <span class="linecomment">; `C-M-S-TAB'</span>
  (dolist (key icicle-prefix-complete-no-display-keys)
    (define-key map key 'icicle-prefix-complete-no-display)) <span class="linecomment">; `C-M-TAB'</span>

  (icicle-define-cycling-keys map)      <span class="linecomment">;     `up',     `down',     `prior',     `next',</span>
                                        <span class="linecomment">;   `C-up',   `C-down',   `C-prior',   `C-next',</span>
                                        <span class="linecomment">; `C-M-up', `C-M-down', `C-M-prior', `C-M-next',</span>
                                        <span class="linecomment">; `C-S-up', `C-S-down', `C-S-prior', `C-S-next',</span>
  (define-key map [(control help)]           'icicle-help-on-candidate) <span class="linecomment">; `C-help'</span>
  (define-key map [(control meta help)]      'icicle-help-on-candidate) <span class="linecomment">; `C-M-help'</span>
  (define-key map [(control f1)]             'icicle-help-on-candidate) <span class="linecomment">; `C-f1'</span>
  (define-key map [(control meta f1)]        'icicle-help-on-candidate) <span class="linecomment">; `C-M-f1'</span>
  (define-key map [(control meta return)]    'icicle-help-on-candidate) <span class="linecomment">; `C-M-RET'</span>
  (define-key map [(meta return)]            'icicle-candidate-read-fn-invoke) <span class="linecomment">;`M-RET' as `M-return'</span>
  (define-key map "<span class="quote">\C-\M-m</span>"                  'icicle-candidate-read-fn-invoke) <span class="linecomment">;`M-RET' as `ESC RET'</span>
  (define-key map [(control shift return)]   'icicle-candidate-alt-action) <span class="linecomment">; `C-S-RET'</span>
  (define-key map [delete]                   'icicle-remove-candidate) <span class="linecomment">; `delete'</span>
  (define-key map [(shift delete)]           'icicle-delete-candidate-object) <span class="linecomment">; `S-delete'</span>
  (define-key map [(control ?w)]             'icicle-kill-region) <span class="linecomment">; `C-w'</span>
  (define-key map [(control return)]         'icicle-candidate-action) <span class="linecomment">; `C-RET'</span>
  (define-key map [(control ?!)]             'icicle-all-candidates-action) <span class="linecomment">; `C-!'</span>
  (define-key map [(control ?|)]             'icicle-all-candidates-alt-action) <span class="linecomment">; `C-|'</span>
  (define-key map [(meta ?!)]                'icicle-all-candidates-list-action) <span class="linecomment">; `M-!'</span>
  (define-key map [(meta ?|)]                'icicle-all-candidates-list-alt-action) <span class="linecomment">; `M-|'</span>
  (define-key map [(control meta ?/)]        'icicle-prefix-complete) <span class="linecomment">; `C-M-/', for `dabbrev.el'.</span>
  (define-key map [(meta ?h)]                'icicle-history) <span class="linecomment">; `M-h'</span>
  (define-key map [(meta pause)]             'icicle-keep-only-past-inputs) <span class="linecomment">; `M-pause'</span>
  (define-key map [(control pause)]     'icicle-toggle-highlight-historical-candidates) <span class="linecomment">; `C-pause'</span>
  (define-key map [(shift pause)]            'icicle-toggle-highlight-saved-candidates) <span class="linecomment">; `S-pause'</span>
  (define-key map [(control meta pause)]     'icicle-other-history) <span class="linecomment">; `C-M-pause'</span>
  (define-key map [(control insert)]         'icicle-switch-to-Completions-buf) <span class="linecomment">; `C-insert'</span>
  (define-key map [insert]                   'icicle-save/unsave-candidate) <span class="linecomment">; `insert'</span>

  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    <span class="linecomment">;; Note: `setup-keys.el' binds `C-o' to `1on1-fit-minibuffer-frame' if defined.</span>
    (define-key map [(control ?a)]           'icicle-beginning-of-line+) <span class="linecomment">; `C-a'</span>
    (define-key map [(control ?e)]           'icicle-end-of-line+) <span class="linecomment">; `C-e'</span>
    (define-key map [(control meta ?v)]      'icicle-scroll-forward) <span class="linecomment">; `C-M-v'</span>
    (define-key map [(control meta shift ?v)] 'icicle-scroll-backward) <span class="linecomment">; `C-M-S-v' (aka `C-M-V')</span>
    (define-key map [(control ?=)]           'icicle-insert-string-from-variable) <span class="linecomment">; `C-='</span>
    <span class="linecomment">;; Replaces `tab-to-tab-stop':</span>
    (define-key map [(meta ?i)]              'icicle-clear-current-history) <span class="linecomment">; `M-i'</span>
    <span class="linecomment">;; Replaces `kill-sentence':</span>
    (define-key map [(meta ?k)]              'icicle-erase-minibuffer-or-history-element) <span class="linecomment">; `M-k'</span>
    (define-key map [(meta ?o)]              'icicle-insert-history-element) <span class="linecomment">; `M-o'</span>
    (define-key map [(meta ?.)]              'icicle-insert-string-at-point) <span class="linecomment">; `M-.'</span>
    (define-key map [(meta ?:)]              'icicle-pp-eval-expression-in-minibuffer) <span class="linecomment">; `M-:'</span>
    (when (fboundp 'yank-secondary)     <span class="linecomment">; In `second-sel.el'.</span>
      (define-key map "<span class="quote">\C-\M-y</span>"              'icicle-yank-secondary)) <span class="linecomment">; `C-M-y'</span>
    (define-key map [M-S-backspace]          'icicle-erase-minibuffer) <span class="linecomment">; `M-S-backspace'</span>
    (define-key map [M-S-delete]             'icicle-erase-minibuffer) <span class="linecomment">; `M-S-delete'</span>
    (dolist (key  icicle-completing-read+insert-keys)
      (define-key map key 'icicle-completing-read+insert)) <span class="linecomment">; `C-M-S-c'</span>
    (dolist (key  icicle-read+insert-file-name-keys)
      (define-key map key 'icicle-read+insert-file-name)) <span class="linecomment">; `C-M-S-f'</span>
    )

  <span class="linecomment">;; Need `C-g', even if `minibuffer-local-completion-map' inherits from `minibuffer-local-map'.</span>
  (define-key map [(control ?g)]             'icicle-abort-recursive-edit) <span class="linecomment">; `C-g'</span>
  (define-key map [(meta ?q)]                'icicle-dispatch-M-q) <span class="linecomment">; `M-q'</span>
  (define-key map [(control ?l)]             'icicle-retrieve-previous-input) <span class="linecomment">; `C-l'</span>
  (define-key map [(control shift ?l)]       'icicle-retrieve-next-input) <span class="linecomment">; `C-L' (`C-S-l')</span>
  (define-key map [(meta ?$)]                'icicle-candidate-set-truncate) <span class="linecomment">; `M-$'</span>
  (define-key map [(control ?~)]             'icicle-candidate-set-complement) <span class="linecomment">; `C-~'</span>
  (define-key map [(control ?-)]             'icicle-candidate-set-difference) <span class="linecomment">; `C--'</span>
  (define-key map [(control ?+)]             'icicle-candidate-set-union) <span class="linecomment">; `C-+'</span>
  (define-key map [(control ?*)]             'icicle-candidate-set-intersection) <span class="linecomment">; `C-*'</span>
  (define-key map [(control ?&gt;)]             'icicle-candidate-set-save-more) <span class="linecomment">; `C-&gt;'</span>
  (define-key map [(control meta ?&gt;)]        'icicle-candidate-set-save) <span class="linecomment">; `C-M-&gt;'</span>
  (define-key map [(control ?\()]            'icicle-next-TAB-completion-method) <span class="linecomment">; `C-('</span>
  (define-key map [(meta ?\()]               'icicle-next-S-TAB-completion-method) <span class="linecomment">; `M-('</span>
  (define-key map [(control ?\))]            'icicle-candidate-set-save-more-selected) <span class="linecomment">; `C-)'</span>
  (define-key map [(control meta ?\))]       'icicle-candidate-set-save-selected) <span class="linecomment">; `C-M-)'</span>
  (define-key map [(control meta ?&lt;)]        'icicle-candidate-set-retrieve) <span class="linecomment">; `C-M-&lt;'</span>
  (define-key map [(control meta ?})]        'icicle-candidate-set-save-to-variable) <span class="linecomment">; `C-M-}'</span>
  (define-key map [(control meta ?{)]        'icicle-candidate-set-retrieve-from-variable) <span class="linecomment">; `C-M-{'</span>
  (define-key map [(control ?})]             'icicle-candidate-set-save-persistently) <span class="linecomment">; `C-}'</span>
  (define-key map [(control ?{)]             'icicle-candidate-set-retrieve-persistent) <span class="linecomment">; `C-{'</span>
  (define-key map [(control ?%)]             'icicle-candidate-set-swap) <span class="linecomment">; `C-%'</span>
  (define-key map [(meta ?%)]                'icicle-regexp-quote-input) <span class="linecomment">; `M-%'</span>
  (define-key map [(control ?:)]             'icicle-candidate-set-define) <span class="linecomment">; `C-:'</span>
  (define-key map [(control meta ?j)]        'icicle-insert-list-join-string) <span class="linecomment">; `C-M-j'</span>
  (define-key map [(control ?,)]             'icicle-change-sort-order) <span class="linecomment">; `C-,'</span>
  (define-key map [(control meta ?\<span class="linecomment">;)]       'icicle-toggle-ignoring-comments) ; `C-M-;'</span>
  (define-key map [(control ?`)]             'icicle-toggle-regexp-quote) <span class="linecomment">; `C-`'</span>
  (define-key map [(control meta ?\.)]       'icicle-toggle-dot) <span class="linecomment">; `C-M-.'</span>
  (define-key map [(control meta ?`)]        'icicle-toggle-literal-replacement) <span class="linecomment">; `C-M-`'</span>
  (define-key map [(control ?&lt;)]             'icicle-candidate-set-retrieve-more) <span class="linecomment">; `C-&lt;'</span>
  (define-key map [(control meta ?_)]        'icicle-toggle-proxy-candidates) <span class="linecomment">; `C-M-_'</span>
  (define-key map [(control ?$)]             'icicle-toggle-transforming) <span class="linecomment">; `C-$'</span>
  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map [(control ??)]           'icicle-minibuffer-help)) <span class="linecomment">; `C-?'</span>
  (define-key map [(control ?.)]             'icicle-dispatch-C-.) <span class="linecomment">; `C-.'</span>
  (define-key map [(control ?#)]             'icicle-toggle-incremental-completion) <span class="linecomment">; `C-#'</span>
  (define-key map [(control ?\<span class="linecomment">;)]            'icicle-toggle-expand-to-common-match) ; `C-;'</span>
  (define-key map [(meta ?\<span class="linecomment">;)]               'icicle-toggle-search-replace-common-match) ; `M-;'</span>
  (define-key map [(control ?^)]             'icicle-dispatch-C-^) <span class="linecomment">; `C-^'</span>
  (define-key map [(control shift ?a)]       'icicle-toggle-case-sensitivity) <span class="linecomment">; `C-S-a' (`C-A')</span>
  (define-key map [(meta ?~)]                'icicle-toggle-~-for-home-dir) <span class="linecomment">; `M-~'</span>
  (define-key map [(meta ?g)]                'icicle-toggle-C-for-actions) <span class="linecomment">; `M-g'</span>
  (define-key map [(meta ?,)]                'icicle-dispatch-M-comma) <span class="linecomment">; `M-,'</span>
  (define-key map [(control meta ?,)]        'icicle-toggle-alternative-sorting) <span class="linecomment">; `C-M-,'</span>
  (define-key map [(control meta ?+)]        'icicle-plus-saved-sort) <span class="linecomment">; `C-M-+'</span>
  (define-key map [(meta ?+)]                'icicle-widen-candidates) <span class="linecomment">; `M-+'</span>
  (define-key map [(meta ?*)]                'icicle-narrow-candidates) <span class="linecomment">; `M-*'</span>
  (define-key map [(meta ?&)]                'icicle-narrow-candidates-with-predicate) <span class="linecomment">; `M-&'</span>
  (define-key map [(meta ?_)]                'icicle-dispatch-M-_) <span class="linecomment">; `M-_'</span>
  (define-key map [(control meta ?&)]        'icicle-save-predicate-to-variable) <span class="linecomment">; `C-M-&'</span>
  (define-key map [(shift ?\ )]              'icicle-apropos-complete-and-narrow) <span class="linecomment">; `S-SPC'</span>
  (define-key map [(shift backspace)]        'icicle-apropos-complete-and-widen) <span class="linecomment">; `S-DEL'</span>
  (define-key map "<span class="quote">\C-v</span>"                     'icicle-scroll-Completions-forward) <span class="linecomment">; `C-v'</span>
  (define-key map "<span class="quote">\M-v</span>"                     'icicle-scroll-Completions-backward) <span class="linecomment">; `M-v'</span>
  (define-key map "<span class="quote">.</span>"                        'icicle-insert-dot-command) <span class="linecomment">; `.'</span>
  (define-key map "<span class="quote">\M-m</span>"                     'icicle-toggle-show-multi-completion) <span class="linecomment">; `M-m'</span>
  (define-key map "<span class="quote">\C-x.</span>"                    'icicle-toggle-hiding-common-match) <span class="linecomment">; `C-x .'</span>
  (when (fboundp 'icicle-cycle-image-file-thumbnail) <span class="linecomment">; Emacs 23+</span>
    (define-key map "<span class="quote">\C-xt</span>"                  'icicle-cycle-image-file-thumbnail)) <span class="linecomment">; `C-x t'</span>
  (when (fboundp 'doremi)
    (define-key map "<span class="quote">\C-xw</span>"                  'icicle-doremi-candidate-width-factor+) <span class="linecomment">; `C-x w'</span>
    (define-key map "<span class="quote">\C-x|</span>"                  'icicle-doremi-inter-candidates-min-spaces+) <span class="linecomment">; `C-x |'</span>
    (define-key map "<span class="quote">\C-x#</span>"                  'icicle-doremi-increment-max-candidates+) <span class="linecomment">; `C-x #'</span>
    (when (fboundp 'text-scale-increase) <span class="linecomment">; Emacs 23+.</span>
      (define-key map "<span class="quote">\C-x-</span>"                'icicle-doremi-zoom-Completions+)) <span class="linecomment">; `C-x -'</span>
    (when (eq (icicle-current-TAB-method) 'swank)
      (define-key map "<span class="quote">\C-x1</span>"                'icicle-doremi-increment-swank-timeout+)
      (define-key map "<span class="quote">\C-x2</span>"                'icicle-doremi-increment-swank-prefix-length+)))
  <span class="linecomment">;; `minibuffer-completion-help' got wiped out by remap for self-insert.</span>
  (define-key map "<span class="quote">?</span>"                        'icicle-self-insert) <span class="linecomment">; `?'</span>
  (define-key map "<span class="quote"> </span>"                        'icicle-self-insert) <span class="linecomment">; " "</span>
  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map "<span class="quote">\n</span>"                     'icicle-insert-newline-in-minibuffer))) <span class="linecomment">; `C-j'</span>

(defun icicle-restore-completion-keys (map)
  "<span class="quote">Restore standard keys for minibuffer completion map MAP.
MAP is `minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', or
`minibuffer-local-must-match-map'.</span>"

  <span class="linecomment">;; Menu-bar `Minibuf' menu.</span>
  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map [menu-bar minibuf quit]
      '(menu-item "<span class="quote">Quit</span>" keyboard-escape-quit :help "<span class="quote">Abort input and exit minibuffer</span>"))
    (define-key map [menu-bar minibuf return]
      '(menu-item "<span class="quote">Enter</span>" exit-minibuffer
        :help "<span class="quote">Terminate input and exit minibuffer</span>" :keys "<span class="quote">RET</span>"))
    (define-key map [menu-bar minibuf separator-help]                        nil)
    (define-key map [menu-bar minibuf completion-help]                       nil)
    (define-key map [menu-bar minibuf separator-last]                        nil)
    (define-key map [menu-bar minibuf icicle-clear-current-history]          nil)
    (define-key map [menu-bar minibuf icicle-toggle-highlight-all-current]   nil)
    (define-key map [menu-bar minibuf icicle-regexp-quote-input]             nil)
    (define-key map [menu-bar minibuf separator-set2]                        nil)
    (define-key map [menu-bar minibuf icicle-clear-current-history]          nil)
    (define-key map [menu-bar minibuf icicle-erase-minibuffer]               nil)
    (define-key map [menu-bar minibuf icicle-delete-history-element]         nil)
    (define-key map [menu-bar minibuf icicle-insert-list-join-string]        nil)
    (define-key map [menu-bar minibuf icicle-insert-key-description]         nil)
    (define-key map [menu-bar minibuf icicle-insert-history-element]         nil)
    (define-key map [menu-bar minibuf icicle-insert-string-from-a-var]       nil)
    (define-key map [menu-bar minibuf icicle-insert-string-from-std-var]     nil)
    (define-key map [menu-bar minibuf icicle-insert-string-at-point]         nil)
    (define-key map [menu-bar minibuf icicle-completing-read+insert]         nil)
    (define-key map [menu-bar minibuf icicle-read+insert-file-name]          nil)
    )
  (define-key map [menu-bar minibuf icicle-goto/kill-failed-input]           nil)
  (define-key map [menu-bar minibuf icicle-retrieve-next-input]              nil)
  (define-key map [menu-bar minibuf icicle-retrieve-previous-input]          nil)
  (define-key map [menu-bar minibuf separator-C-l]                           nil)
  (define-key map [menu-bar minibuf alt-action-list-all]                     nil)
  (define-key map [menu-bar minibuf alt-action-all]                          nil)
  (define-key map [menu-bar minibuf action-list-all]                         nil)
  (define-key map [menu-bar minibuf action-all]                              nil)
  (define-key map [menu-bar minibuf separator-actions]                       nil)
  (define-key map [menu-bar minibuf set-define]                              nil)
  (define-key map [menu-bar minibuf icicle-keep-only-past-inputs]            nil)
  (define-key map [menu-bar minibuf set-union]                               nil)
  (define-key map [menu-bar minibuf set-difference]                          nil)
  (define-key map [menu-bar minibuf set-intersection]                        nil)
  (define-key map [menu-bar minibuf icicle-save-predicate-to-variable]       nil)
  (define-key map [menu-bar minibuf icicle-narrow-candidates-with-predicate] nil)
  (define-key map [menu-bar minibuf icicle-narrow-candidates]                nil)
  (define-key map [menu-bar minibuf icicle-widen-candidates]                 nil)
  (define-key map [menu-bar minibuf set-complement]                          nil)
  (define-key map [menu-bar minibuf separator-set1]                          nil)
  (define-key map [menu-bar minibuf set-swap]                                nil)
  (define-key map [menu-bar minibuf icicle-candidate-set-save-more-selected] nil)
  (define-key map [menu-bar minibuf icicle-candidate-set-save-selected]      nil)
  (define-key map [menu-bar minibuf icicle-candidate-set-save-more]          nil)
  (define-key map [menu-bar minibuf set-retrieve-from-cache-file]            nil)
  (define-key map [menu-bar minibuf set-retrieve-from-variable]              nil)
  (define-key map [menu-bar minibuf set-retrieve]                            nil)
  (define-key map [menu-bar minibuf set-save-to-cache-file]                  nil)
  (define-key map [menu-bar minibuf set-save-to-variable]                    nil)
  (define-key map [menu-bar minibuf set-save]                                nil)
  (define-key map [menu-bar minibuf separator-set2]                          nil)
  (define-key map [menu-bar minibuf word-complete]                           nil)
  (define-key map [menu-bar minibuf prefix-complete]                         nil)
  (define-key map [menu-bar minibuf apropos-complete]                        nil)
  (define-key map [menu-bar minibuf ?\?]
    '(menu-item "<span class="quote">List Completions</span>" minibuffer-completion-help
      :help "<span class="quote">Display all possible completions</span>"))
  (define-key map [menu-bar minibuf space]
    '(menu-item "<span class="quote">Complete Word</span>" minibuffer-complete-word :help "<span class="quote">Complete at most one word</span>"))
  (define-key map [menu-bar minibuf tab]
    '(menu-item "<span class="quote">Complete</span>" minibuffer-complete :help "<span class="quote">Complete as far as possible</span>"))

  <span class="linecomment">;; Unmap commands that were bound for completion.</span>
  (icicle-unmap 'self-insert-command           map 'icicle-self-insert)
  (icicle-unmap 'universal-argument            map 'icicle-universal-argument)
  (icicle-unmap 'negative-argument             map 'icicle-negative-argument)
  (icicle-unmap 'digit-argument                map 'icicle-digit-argument)
  (icicle-unmap 'backward-delete-char-untabify map 'icicle-backward-delete-char-untabify)
  (icicle-unmap 'delete-backward-char          map 'icicle-delete-backward-char)
  (icicle-unmap 'delete-char                   map 'icicle-delete-char)
  (icicle-unmap 'backward-kill-word            map 'icicle-backward-kill-word)
  (icicle-unmap 'kill-word                     map 'icicle-kill-word)
  (icicle-unmap 'backward-kill-sexp            map 'icicle-backward-kill-sexp)
  (icicle-unmap 'kill-sexp                     map 'icicle-kill-sexp)
  (icicle-unmap 'backward-kill-sentence        map 'icicle-backward-kill-sentence)
  (icicle-unmap 'backward-kill-paragraph       map 'icicle-backward-kill-paragraph)
  (icicle-unmap 'kill-paragraph                map 'icicle-kill-paragraph)
  (icicle-unmap 'kill-line                     map 'icicle-kill-line)
  (icicle-unmap 'reposition-window             map 'icicle-goto/kill-failed-input)
  (icicle-unmap 'transpose-chars               map 'icicle-transpose-chars)
  (icicle-unmap 'transpose-words               map 'icicle-transpose-words)
  (icicle-unmap 'transpose-sexps               map 'icicle-transpose-sexps)
  (icicle-unmap 'yank-pop                      map 'icicle-yank-pop)
  (icicle-unmap 'mouse-yank-secondary          map 'icicle-mouse-yank-secondary)

  <span class="linecomment">;; Restore additional bindings.</span>
  <span class="linecomment">;; Do the option keys first, so they can be rebound as needed.</span>
  (dolist (key icicle-word-completion-keys)                   (define-key map key nil))
  (dolist (key icicle-apropos-complete-keys)                  (define-key map key nil))
  (dolist (key icicle-prefix-complete-keys)                   (define-key map key nil))
  (dolist (key icicle-apropos-complete-no-display-keys)       (define-key map key nil))
  (dolist (key icicle-prefix-complete-no-display-keys)        (define-key map key nil))

  (dolist (key icicle-prefix-cycle-previous-keys)             (define-key map key nil))
  (dolist (key icicle-prefix-cycle-next-keys)                 (define-key map key nil))
  (dolist (key icicle-apropos-cycle-previous-keys)            (define-key map key nil))
  (dolist (key icicle-apropos-cycle-next-keys)                (define-key map key nil))
  (dolist (key icicle-prefix-cycle-previous-action-keys)      (define-key map key nil))
  (dolist (key icicle-prefix-cycle-previous-alt-action-keys)  (define-key map key nil))
  (dolist (key icicle-prefix-cycle-next-action-keys)          (define-key map key nil))
  (dolist (key icicle-prefix-cycle-next-alt-action-keys)      (define-key map key nil))
  (dolist (key icicle-apropos-cycle-previous-action-keys)     (define-key map key nil))
  (dolist (key icicle-apropos-cycle-previous-alt-action-keys) (define-key map key nil))
  (dolist (key icicle-apropos-cycle-next-action-keys)         (define-key map key nil))
  (dolist (key icicle-apropos-cycle-next-alt-action-keys)     (define-key map key nil))
  (dolist (key icicle-modal-cycle-up-keys)                    (define-key map key nil))
  (dolist (key icicle-modal-cycle-down-keys)                  (define-key map key nil))
  (dolist (key icicle-modal-cycle-up-action-keys)             (define-key map key nil))
  (dolist (key icicle-modal-cycle-up-alt-action-keys)         (define-key map key nil))
  (dolist (key icicle-modal-cycle-down-action-keys)           (define-key map key nil))
  (dolist (key icicle-modal-cycle-down-alt-action-keys)       (define-key map key nil))
  (dolist (key icicle-modal-cycle-up-help-keys)               (define-key map key nil))
  (dolist (key icicle-modal-cycle-down-help-keys)             (define-key map key nil))
  (dolist (key icicle-prefix-cycle-previous-help-keys)        (define-key map key nil))
  (dolist (key icicle-prefix-cycle-next-help-keys)            (define-key map key nil))
  (dolist (key icicle-apropos-cycle-previous-help-keys)       (define-key map key nil))
  (dolist (key icicle-apropos-cycle-next-help-keys)           (define-key map key nil))

  (define-key map [(control help)]           nil)
  (define-key map [(control meta help)]      nil)
  (define-key map [(control f1)]             nil)
  (define-key map [(control meta f1)]        nil)
  (define-key map [(control meta return)]    nil)
  (define-key map [(meta return)]            nil)
  (define-key map "<span class="quote">\C-\M-m</span>"                  nil)
  (define-key map [(control shift return)]   nil)
  (define-key map [delete]                   nil)
  (define-key map [(shift delete)]           nil)
  (define-key map [(control ?w)]             nil)
  (define-key map [(control return)]         nil)
  (define-key map [(control ?!)]             nil)
  (define-key map [(control ?!)]             nil)
  (define-key map [(control ?|)]             nil)
  (define-key map [(meta ?!)]                nil)
  (define-key map [(meta ?|)]                nil)
  (define-key map [(control meta ?/)]        nil)
  (define-key map [(meta ?h)]                nil)
  (define-key map [(meta pause)]             nil)
  (define-key map [(control pause)]          nil)
  (define-key map [(shift pause)]            nil)
  (define-key map [(control meta pause)]     nil)
  (define-key map [(control insert)]         nil)
  (define-key map [insert]                   nil)

  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map [(control ?a)]           nil)
    (define-key map [(control ?e)]           nil)
    (define-key map [(control ?=)]           nil)
    (define-key map [(meta ?i)]              nil)
    (define-key map [(meta ?k)]              nil)
    (define-key map [(meta ?o)]              nil)
    (define-key map [(meta ?.)]              nil)
    (define-key map [(meta ?:)]              nil)
    (define-key map "<span class="quote">\C-\M-y</span>"                nil)
    (define-key map [M-S-backspace]          nil)
    (define-key map [M-S-delete]             nil)
    (dolist (key  icicle-completing-read+insert-keys)
      (define-key minibuffer-local-must-match-map key nil))
    (dolist (key  icicle-read+insert-file-name-keys)
      (define-key minibuffer-local-must-match-map key nil))
    )

  (define-key map [(meta ?q)]                nil)
  (define-key map [(control ?l)]             nil)
  (define-key map [(control shift ?l)]       nil)
  (define-key map [(meta ?$)]                nil)
  (define-key map [(control ?~)]             nil)
  (define-key map [(control ?-)]             nil)
  (define-key map [(control ?+)]             nil)
  (define-key map [(control ?*)]             nil)
  (define-key map [(control ?&gt;)]             nil)
  (define-key map [(control meta ?&gt;)]        nil)
  (define-key map [(control ?\()]            nil)
  (define-key map [(meta ?\()]               nil)
  (define-key map [(control ?\))]            nil)
  (define-key map [(control meta ?\))]       nil)
  (define-key map [(control meta ?&lt;)]        nil)
  (define-key map [(control meta ?})]        nil)
  (define-key map [(control meta ?{)]        nil)
  (define-key map [(control ?})]             nil)
  (define-key map [(control ?{)]             nil)
  (define-key map [(control ?%)]             nil)
  (define-key map [(meta ?%)]                nil)
  (define-key map [(control ?:)]             nil)
  (define-key map [(control meta ?j)]        nil)
  (define-key map [(control ?,)]             nil)
  (define-key map [(control ? )]             nil)
  (define-key map [(control meta ?\<span class="linecomment">;)]       nil)</span>
  (define-key map [(control ?`)]             nil)
  (define-key map [(control meta ?`)]        nil)
  (define-key map [(control ?&lt;)]             nil)
  (define-key map [(control meta ?_)]        nil)
  (define-key map [(control ?$)]             nil)
  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map [(control ??)]           nil))
  (define-key map [(control ?.)]             nil)
  (define-key map [(control ?#)]             nil)
  (define-key map [(control ?\<span class="linecomment">;)]            nil)</span>
  (define-key map [(control meta ?\.)]       nil)
  (define-key map [(meta ?\<span class="linecomment">;)]               nil)</span>
  (define-key map [(control ?^)]             nil)
  (define-key map [(control shift ?a)]       nil)
  (define-key map [(meta ?~)]                nil)
  (define-key map [(meta ?g)]                nil)
  (define-key map [(meta ?,)]                nil)
  (define-key map [(control meta ?,)]        nil)
  (define-key map [(control meta ?+)]        nil)
  (define-key map [(meta ?+)]                nil)
  (define-key map [(meta ?*)]                nil)
  (define-key map [(meta ?&)]                nil)
  (define-key map [(meta ?_)]                nil)
  (define-key map [(control meta ?&)]        nil)
  (define-key map [(shift ?\ )]              nil)
  (define-key map [(shift backspace)]        nil)
  (define-key map "<span class="quote">\C-v</span>"                     nil)
  (define-key map "<span class="quote">\M-v</span>"                     nil)
  (define-key map "<span class="quote">.</span>"                        nil)
  (define-key map "<span class="quote">\M-m</span>"                     nil)
  (define-key map "<span class="quote">\C-x.</span>"                    nil)
  (when (fboundp 'icicle-cycle-image-file-thumbnail) <span class="linecomment">; Emacs 23+</span>
    (define-key map "<span class="quote">\C-xt</span>"                  nil))
  (when (fboundp 'doremi)
    (define-key map "<span class="quote">\C-xw</span>"                  nil)
    (define-key map "<span class="quote">\C-x|</span>"                  nil)
    (define-key map "<span class="quote">\C-x#</span>"                  nil)
    (when (fboundp 'text-scale-increase)
      (define-key map "<span class="quote">\C-x-</span>"                nil))
    (define-key map "<span class="quote">\C-x1</span>"                  nil)
    (define-key map "<span class="quote">\C-x2</span>"                  nil))
  <span class="linecomment">;; Do these last. -----------------</span>
  (define-key map [(control ?i)]             'minibuffer-complete)
  (define-key map [tab]                      'minibuffer-complete)
  (define-key map "<span class="quote">?</span>"                        'minibuffer-completion-help)
  (define-key map "<span class="quote"> </span>"                        'minibuffer-complete-word)
  (define-key map [(control ?g)]             (if (and (fboundp 'minibuffer-keyboard-quit)
                                                      delete-selection-mode)
                                                 'minibuffer-keyboard-quit
                                               'abort-recursive-edit))
  <span class="linecomment">;; In Emacs 22+, local is parent of local-completion</span>
  (unless (eq minibuffer-local-map (keymap-parent minibuffer-local-completion-map))
    (define-key map "<span class="quote">\n</span>"                     'exit-minibuffer))
  (define-key map [(meta ?p)]                'previous-history-element)
  (define-key map [(meta ?n)]                'next-history-element)
  (define-key map [up]                       'previous-history-element)
  (define-key map [down]                     'next-history-element)
  (define-key map [(meta ?v)]                'switch-to-completions)
  (define-key map [prior]                    'switch-to-completions)
  (define-key map [next]                     'next-history-element))

(defun icicle-minibuffer-setup ()
  "<span class="quote">Run in minibuffer on activation, to enable completion cycling.
Usually run by inclusion in `minibuffer-setup-hook'.</span>"
  (when (and icicle-mode (window-minibuffer-p (selected-window)) (not executing-kbd-macro))
    <span class="linecomment">;; The pre- and post-command hooks are local to the</span>
    <span class="linecomment">;; minibuffer, so they are added here, not in `icicle-mode'.</span>
    <span class="linecomment">;; They are removed in `icicle-mode' when mode is exited.</span>
    (unless (fboundp 'define-minor-mode) (make-local-hook 'pre-command-hook))
    (add-hook 'pre-command-hook  'icicle-top-level-prep) <span class="linecomment">; This must not be LOCAL (nil LOCAL arg).</span>
    (add-hook 'pre-command-hook  'icicle-run-icicle-pre-command-hook nil t)
    (unless (fboundp 'define-minor-mode) (make-local-hook 'post-command-hook))
    (add-hook 'post-command-hook 'icicle-run-icicle-post-command-hook nil t)
    <span class="linecomment">;; Change the region background here dynamically.  It would be better to</span>
    <span class="linecomment">;; just use a buffer-local face, but those don't yet exist.</span>
    (when (= 1 (recursion-depth))
      (setq icicle-saved-region-background  (face-background 'region))
      (when icicle-change-region-background-flag
        (set-face-background 'region icicle-region-background)))
    <span class="linecomment">;; Reset prompt, because some commands (e.g. `find-file') don't use `read-file-name'</span>
    <span class="linecomment">;; or `completing-read'.  Reset other stuff too.</span>
    (setq icicle-candidate-nb                    nil
          icicle-completion-candidates           nil
          <span class="linecomment">;; This is so that cycling works right initially, without first hitting `TAB' or `S-TAB'.</span>
          icicle-current-completion-mode         (and (&lt; (minibuffer-depth) 2)
                                                      (case icicle-default-cycling-mode
                                                        ((nil)      nil)
                                                        (apropos    'apropos)
                                                        (prefix     'prefix)
                                                        (otherwise  nil)))
          icicle-next-apropos-complete-cycles-p  nil
          icicle-next-prefix-complete-cycles-p   nil
          icicle-default-directory               default-directory
          icicle-incremental-completion-p        icicle-incremental-completion-flag
          icicle-initial-value                   nil
          icicle-cmd-reading-input               this-command
          icicle-last-completion-command         nil
          icicle-last-completion-candidate       nil
          icicle-last-input                      nil
          icicle-input-fail-pos                  nil
          icicle-saved-proxy-candidates          nil
          <span class="linecomment">;; `other-buffer' doesn't work, because it looks for a buffer only from the same frame.</span>
          icicle-pre-minibuffer-buffer           (cadr (buffer-list)) <span class="linecomment">; $$$$$$ (other-buffer nil t)</span>
          )
    (when (and (icicle-completing-p) (&gt; emacs-major-version 20))
      (let ((prompt-prefix   (if icicle-candidate-action-fn "<span class="quote">+ </span>" "<span class="quote">. </span>")))
        (put-text-property 0 1 'face
                           (cond ((and icicle-candidate-action-fn (icicle-require-match-p))
                                  '(icicle-multi-command-completion icicle-mustmatch-completion))
                                 (icicle-candidate-action-fn 'icicle-multi-command-completion)
                                 ((icicle-require-match-p)
                                  '(icicle-completion icicle-mustmatch-completion))
                                 (t 'icicle-completion))
                           prompt-prefix)
        (if (overlayp icicle-completion-prompt-overlay)
            (move-overlay icicle-completion-prompt-overlay (point-min) (point-min))
          (setq icicle-completion-prompt-overlay  (make-overlay (point-min) (point-min))))
        (overlay-put icicle-completion-prompt-overlay 'before-string prompt-prefix)))
    (unless icicle-add-proxy-candidates-flag
      (setq icicle-saved-proxy-candidates  (prog1 icicle-proxy-candidates
                                             (setq icicle-proxy-candidates
                                                   icicle-saved-proxy-candidates))))
    (while icicle-saved-candidate-overlays
      (delete-overlay (car icicle-saved-candidate-overlays))
      (setq icicle-saved-candidate-overlays  (cdr icicle-saved-candidate-overlays)))
    (icicle-update-ignored-extensions-regexp)
    (when (memq icicle-default-value '(preselect-start preselect-end))
      (icicle-select-minibuffer-contents))
    (when (and icicle-show-Completions-initially-flag
               (not icicle-progressive-completing-p) <span class="linecomment">; If narrowed, then we have already completed.</span>
               (icicle-completing-p)    <span class="linecomment">; Function initializes variable `icicle-completing-p'.</span>
               (sit-for icicle-incremental-completion-delay)) <span class="linecomment">; Let user interrupt.</span>
      (case icicle-default-cycling-mode
        (apropos    (icicle-apropos-complete))
        (otherwise  (icicle-prefix-complete)))) <span class="linecomment">; Prefix completion, by default.</span>
    (run-hooks 'icicle-minibuffer-setup-hook)))

(defun icicle-define-cycling-keys (map)
  "<span class="quote">Define keys for cycling candidates.
The modal keys are defined first, then the non-modal keys.
That means that in case of conflict mode-specific cyling wins.
For example, if you define both `icicle-modal-cycle-up-keys' and
`icicle-prefix-cycle-previous-keys' as ([up]), the latter gets the
binding.</span>"
  (cond (icicle-use-C-for-actions-flag  <span class="linecomment">; Use `C-' for actions, no `C-' for plain cycling.</span>
         <span class="linecomment">;; Modal cycling keys.</span>
         (dolist (key icicle-modal-cycle-up-keys)
           (define-key map key 'icicle-previous-candidate-per-mode)) <span class="linecomment">; `up'</span>
         (dolist (key icicle-modal-cycle-down-keys)
           (define-key map key 'icicle-next-candidate-per-mode)) <span class="linecomment">; `down'</span>
         (dolist (key icicle-modal-cycle-up-action-keys)
           (define-key map key 'icicle-previous-candidate-per-mode-action)) <span class="linecomment">; `C-up'</span>
         (dolist (key icicle-modal-cycle-down-action-keys)
           (define-key map key 'icicle-next-candidate-per-mode-action)) <span class="linecomment">; `C-down'</span>
         <span class="linecomment">;; Non-modal cycling keys.  In case of conflict, these will prevail over modal keys.</span>
         (dolist (key icicle-prefix-cycle-previous-keys)
           (define-key map key 'icicle-previous-prefix-candidate)) <span class="linecomment">; `home'</span>
         (dolist (key icicle-prefix-cycle-next-keys)
           (define-key map key 'icicle-next-prefix-candidate)) <span class="linecomment">; `end'</span>
         (dolist (key icicle-apropos-cycle-previous-keys)
           (define-key map key 'icicle-previous-apropos-candidate)) <span class="linecomment">; `prior'</span>
         (dolist (key icicle-apropos-cycle-next-keys)
           (define-key map key 'icicle-next-apropos-candidate)) <span class="linecomment">; `next'</span>
         (dolist (key icicle-prefix-cycle-previous-action-keys)
           (define-key map key 'icicle-previous-prefix-candidate-action)) <span class="linecomment">; `C-home'</span>
         (dolist (key icicle-prefix-cycle-next-action-keys)
           (define-key map key 'icicle-next-prefix-candidate-action)) <span class="linecomment">; `C-end'</span>
         (dolist (key icicle-apropos-cycle-previous-action-keys)
           (define-key map key 'icicle-previous-apropos-candidate-action)) <span class="linecomment">; `C-prior'</span>
         (dolist (key icicle-apropos-cycle-next-action-keys)
           (define-key map key 'icicle-next-apropos-candidate-action))) <span class="linecomment">; `C-next'</span>

        (t                              <span class="linecomment">; Use `C-' for plain cycling, NO `C-' for action.</span>
         <span class="linecomment">;; Modal cycling keys.  At least some of these will overwrite non-modal keys.</span>
         (dolist (key icicle-modal-cycle-up-keys)
           (define-key map key 'icicle-previous-candidate-per-mode-action)) <span class="linecomment">; `up'</span>
         (dolist (key icicle-modal-cycle-down-keys)
           (define-key map key 'icicle-next-candidate-per-mode-action)) <span class="linecomment">; `down'</span>
         (dolist (key icicle-modal-cycle-up-action-keys)
           (define-key map key 'icicle-previous-candidate-per-mode)) <span class="linecomment">; `C-up'</span>
         (dolist (key icicle-modal-cycle-down-action-keys)
           (define-key map key 'icicle-next-candidate-per-mode)) <span class="linecomment">; `C-down'</span>
         <span class="linecomment">;; Non-modal cycling keys.  In case of conflict, these will prevail over modal keys.</span>
         (dolist (key icicle-prefix-cycle-previous-keys)
           (define-key map key 'icicle-previous-prefix-candidate-action)) <span class="linecomment">; `home'</span>
         (dolist (key icicle-prefix-cycle-next-keys)
           (define-key map key 'icicle-next-prefix-candidate-action)) <span class="linecomment">; `end'</span>
         (dolist (key icicle-apropos-cycle-previous-keys)
           (define-key map key 'icicle-previous-apropos-candidate-action)) <span class="linecomment">; `prior'</span>
         (dolist (key icicle-apropos-cycle-next-keys)
           (define-key map key 'icicle-next-apropos-candidate-action)) <span class="linecomment">; `next'</span>
         (dolist (key icicle-prefix-cycle-previous-action-keys)
           (define-key map key 'icicle-previous-prefix-candidate)) <span class="linecomment">; `C-home'</span>
         (dolist (key icicle-prefix-cycle-next-action-keys)
           (define-key map key 'icicle-next-prefix-candidate)) <span class="linecomment">; `C-end'</span>
         (dolist (key icicle-apropos-cycle-previous-action-keys)
           (define-key map key 'icicle-previous-apropos-candidate)) <span class="linecomment">; `C-prior'</span>
         (dolist (key icicle-apropos-cycle-next-action-keys)
           (define-key map key 'icicle-next-apropos-candidate))))

  <span class="linecomment">;; Help and alternative-action keys are NOT controlled by `icicle-use-C-for-actions-flag'.</span>
  <span class="linecomment">;;</span>
  <span class="linecomment">;; Define modal cycling help and alternative action keys.</span>
  (dolist (key icicle-modal-cycle-up-help-keys)
    (define-key map key 'icicle-previous-candidate-per-mode-help)) <span class="linecomment">; `C-M-up'</span>
  (dolist (key icicle-modal-cycle-down-help-keys)
    (define-key map key 'icicle-next-candidate-per-mode-help)) <span class="linecomment">; `C-M-down'</span>
  (dolist (key icicle-modal-cycle-up-alt-action-keys)
    (define-key map key 'icicle-previous-candidate-per-mode-alt-action)) <span class="linecomment">; `C-S-up'</span>
  (dolist (key icicle-modal-cycle-down-alt-action-keys)
    (define-key map key 'icicle-next-candidate-per-mode-alt-action)) <span class="linecomment">; `C-S-down'</span>
  <span class="linecomment">;; Define non-modal cycling help and alternative action keys.</span>
  (dolist (key icicle-prefix-cycle-previous-help-keys)
    (define-key map key 'icicle-help-on-previous-prefix-candidate)) <span class="linecomment">; `C-M-home'</span>
  (dolist (key icicle-prefix-cycle-next-help-keys)
    (define-key map key 'icicle-help-on-next-prefix-candidate)) <span class="linecomment">; `C-M-end'</span>
  (dolist (key icicle-apropos-cycle-previous-help-keys)
    (define-key map key 'icicle-help-on-previous-apropos-candidate)) <span class="linecomment">; `C-M-prior'</span>
  (dolist (key icicle-apropos-cycle-next-help-keys)
    (define-key map key 'icicle-help-on-next-apropos-candidate)) <span class="linecomment">; `C-M-next'</span>
  (dolist (key icicle-prefix-cycle-previous-alt-action-keys)
    (define-key map key 'icicle-previous-prefix-candidate-alt-action)) <span class="linecomment">; `C-S-home'</span>
  (dolist (key icicle-prefix-cycle-next-alt-action-keys)
    (define-key map key 'icicle-next-prefix-candidate-alt-action)) <span class="linecomment">; `C-S-end'</span>
  (dolist (key icicle-apropos-cycle-previous-alt-action-keys)
    (define-key map key 'icicle-previous-apropos-candidate-alt-action)) <span class="linecomment">; `C-S-prior'</span>
  (dolist (key icicle-apropos-cycle-next-alt-action-keys)
    (define-key map key 'icicle-next-apropos-candidate-alt-action))) <span class="linecomment">; `C-S-next'</span>

(defun icicle-select-minibuffer-contents ()
  "<span class="quote">Select minibuffer contents and leave point at its beginning.</span>"
  (let ((min  (icicle-minibuffer-prompt-end)))
    (set-mark (if (eq 'preselect-start icicle-default-value) (point-max) min))
    (goto-char (if (eq 'preselect-start icicle-default-value) min (point-max)))))

<span class="linecomment">;; $$$ (defadvice next-history-element (after icicle-select-minibuffer-contents activate)</span>
<span class="linecomment">;;   "Select minibuffer contents and leave point at its beginning."</span>
<span class="linecomment">;;   (when (and icicle-mode (memq icicle-default-value '(preselect-start preselect-end)))</span>
<span class="linecomment">;;     (icicle-select-minibuffer-contents)</span>
<span class="linecomment">;;     (setq deactivate-mark  nil)))</span>

(defun icicle-cancel-Help-redirection ()
  "<span class="quote">Cancel redirection of focus from *Help* buffer to minibuffer.
Focus was redirected during `icicle-help-on-candidate'.</span>"
  (let* ((help-window  (get-buffer-window "<span class="quote">*Help*</span>" 0))
         (help-frame   (and help-window (window-frame help-window))))
    (when help-frame (redirect-frame-focus help-frame))))

(defun icicle-run-icicle-pre-command-hook ()
  "<span class="quote">Run `icicle-pre-command-hook' functions.
Used in `pre-command-hook'.</span>"
  (run-hooks 'icicle-pre-command-hook))

(defun icicle-run-icicle-post-command-hook ()
  "<span class="quote">Run `icicle-post-command-hook' functions.
Used in `post-command-hook'.</span>"
  (run-hooks 'icicle-post-command-hook))

(defun icicle-set-calling-cmd ()
  "<span class="quote">Remember last command that called for completion.
Used in `completion-setup-hook'.</span>"
  (setq icicle-cmd-calling-for-completion  this-command))

(defun icicle-update-ignored-extensions-regexp ()
  "<span class="quote">Update ignored extensions if `completion-ignored-extensions' changed.</span>"
  (when (and (icicle-file-name-input-p) <span class="linecomment">; In `icicles-fn.el'.</span>
             (not (equal icicle-ignored-extensions completion-ignored-extensions)))
    (setq icicle-ignored-extensions-regexp <span class="linecomment">; Make regexp for ignored file extensions.</span>
          (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">\\|</span>") "<span class="quote">\\)\\'</span>")

          <span class="linecomment">;; Flag to prevent updating `icicle-ignored-extensions-regexp' unless</span>
          <span class="linecomment">;; `completion-ignored-extensions' changes.</span>
          icicle-ignored-extensions  completion-ignored-extensions)))

<span class="linecomment">;; We change the region background here dynamically.</span>
<span class="linecomment">;; It would be better to just use a buffer-local face, but those don't yet exist.</span>
(defun icicle-restore-region-face ()
  "<span class="quote">Restore region face.  It was changed during minibuffer activity
if `icicle-change-region-background-flag' is non-nil.</span>"
  (when (and icicle-change-region-background-flag (= 1 (recursion-depth)))
    (set-face-background 'region icicle-saved-region-background)))

(defun icicle-activate-mark ()
  "<span class="quote">Prevent region from being deactivated.  Use in `icicle-post-command-hook'.</span>"
  (when (and (window-minibuffer-p (selected-window))
             icicle-completing-p
             (not executing-kbd-macro))
    (setq deactivate-mark  nil)))

(defun icicle-redefine-standard-functions ()
  "<span class="quote">Alias the functions in `icicle-functions-to-redefine' to Icicles versions.</span>"
  (when (fboundp 'icicle-completing-read)
    (dolist (fn  icicle-functions-to-redefine)
      (when (fboundp (intern (concat "<span class="quote">old-</span>" (symbol-name fn))))
        (defalias fn (intern (concat "<span class="quote">icicle-</span>" (symbol-name fn))))))))

(defun icicle-restore-standard-functions ()
  "<span class="quote">Restore original versions of functions in `icicle-functions-to-redefine'.</span>"
  (when (fboundp 'old-completing-read)
    (let (old-fn)
      (dolist (fn  icicle-functions-to-redefine)
        (when (fboundp (setq old-fn  (intern (concat "<span class="quote">old-</span>" (symbol-name fn)))))
          (defalias fn old-fn))))))

<span class="linecomment">;;; In Emacs versions before 22:</span>
<span class="linecomment">;;; Save original `read-file-name'.  We redefine it as `icicle-read-file-name' (which calls it).</span>
<span class="linecomment">;;; Then we restore it when you quit Icicle mode.  (In Emacs 22+, no redefinition is needed.)</span>
(unless (or (boundp 'read-file-name-function) (fboundp 'orig-read-file-name))
  (defalias 'orig-read-file-name (symbol-function 'read-file-name)))

(defun icicle-redefine-std-completion-fns ()
  "<span class="quote">Replace some standard functions with versions for Icicle mode.</span>"
  (when (fboundp 'icicle-completing-read)
    (defalias 'choose-completion            'icicle-choose-completion)
    (defalias 'choose-completion-string     'icicle-choose-completion-string)
    (defalias 'completing-read              'icicle-completing-read)
    (defalias 'completion-setup-function    'icicle-completion-setup-function)
    (unless (&gt; emacs-major-version 22)
      (defalias 'dired-smart-shell-command  'icicle-dired-smart-shell-command))
    (defalias 'display-completion-list      'icicle-display-completion-list)
    (defalias 'exit-minibuffer              'icicle-exit-minibuffer)
    (when (fboundp 'face-valid-attribute-values)
      (defalias 'face-valid-attribute-values 'icicle-face-valid-attribute-values))
    (defalias 'minibuffer-complete-and-exit 'icicle-minibuffer-complete-and-exit)
    (defalias 'mouse-choose-completion      'icicle-mouse-choose-completion)
    (defalias 'next-history-element         'icicle-next-history-element)
    (defalias 'read-face-name               'icicle-read-face-name)
    (if (boundp 'read-file-name-function) <span class="linecomment">; Emacs 22+</span>
        (setq icicle-old-read-file-name-fn  (prog1 (and (not (eq read-file-name-function
                                                                 'icicle-read-file-name))
                                                        read-file-name-function)
                                              (setq read-file-name-function
                                                    'icicle-read-file-name)))
      (defalias 'read-file-name             'icicle-read-file-name)) <span class="linecomment">; Emacs 20, 21</span>
    (when (fboundp 'icicle-read-number)
      (defalias 'read-number                'icicle-read-number))
    (unless (&gt; emacs-major-version 22)
      (defalias 'shell-command              'icicle-shell-command))
    (unless (&gt; emacs-major-version 22)
      (defalias 'shell-command-on-region    'icicle-shell-command-on-region))
    (defalias 'switch-to-completions        'icicle-switch-to-completions)
    (when (fboundp 'icicle-completing-read-multiple)
      (defalias 'completing-read-multiple   'icicle-completing-read-multiple)
      (setq crm-local-completion-map  icicle-crm-local-completion-map
            crm-local-must-match-map  icicle-crm-local-must-match-map))
    (when (&gt; emacs-major-version 22)
      (defalias 'sit-for                    'icicle-sit-for))
    ))

(defun icicle-restore-std-completion-fns ()
  "<span class="quote">Restore some standard functions that were replaced in Icicle mode.</span>"
  (when (fboundp 'old-completing-read)
    (defalias 'choose-completion            'old-choose-completion)
    (defalias 'choose-completion-string     'old-choose-completion-string)
    (defalias 'completing-read              'old-completing-read)
    (defalias 'completion-setup-function    'old-completion-setup-function)
    (when (fboundp 'old-dired-smart-shell-command) <span class="linecomment">; Emacs 23</span>
      (defalias 'dired-smart-shell-command  'old-dired-smart-shell-command))
    (defalias 'display-completion-list      'old-display-completion-list)
    (defalias 'exit-minibuffer              'old-exit-minibuffer)
    (when (fboundp 'old-face-valid-attribute-values)
      (defalias 'face-valid-attribute-values 'old-face-valid-attribute-values))
    (defalias 'minibuffer-complete-and-exit 'old-minibuffer-complete-and-exit)
    (defalias 'mouse-choose-completion      'old-mouse-choose-completion)
    (defalias 'next-history-element         'old-next-history-element)
    (defalias 'read-face-name               'old-read-face-name)
    (if (boundp 'read-file-name-function) <span class="linecomment">; Emacs 22+</span>
        (setq read-file-name-function  (and (not (eq icicle-old-read-file-name-fn
                                                     'icicle-read-file-name))
                                            icicle-old-read-file-name-fn))
      (defalias 'read-file-name             'orig-read-file-name)) <span class="linecomment">; Emacs 20, 21</span>
    (when (fboundp 'old-read-number)
      (defalias 'read-number                'old-read-number))
    (when (fboundp 'old-shell-command) <span class="linecomment">; Emacs 23</span>
      (defalias 'shell-command              'old-shell-command))
    (when (fboundp 'old-shell-command-on-region) <span class="linecomment">; Emacs 23</span>
      (defalias 'shell-command-on-region    'old-shell-command-on-region))
    (defalias 'switch-to-completions        'old-switch-to-completions)
    (when (fboundp 'old-completing-read-multiple)
      (defalias 'completing-read-multiple   'old-completing-read-multiple)
      (setq crm-local-completion-map  old-crm-local-completion-map
            crm-local-must-match-map  old-crm-local-must-match-map))
    (when (&gt; emacs-major-version 22)
      (defalias 'sit-for                    'old-sit-for))
    ))

<span class="linecomment">;; Free vars here: `icicle-saved-kmacro-ring-max' is bound in `icicles-var.el'.</span>
(defun icicle-redefine-standard-options ()
  "<span class="quote">Replace certain standard Emacs options with Icicles versions.</span>"
  (when (boundp 'icicle-search-ring-max)
    (setq icicle-saved-search-ring-max         search-ring-max <span class="linecomment">; Save it.</span>
          search-ring-max                      icicle-search-ring-max
          icicle-saved-regexp-search-ring-max  regexp-search-ring-max <span class="linecomment">; Save it.</span>
          regexp-search-ring-max               icicle-regexp-search-ring-max))
  (when (boundp 'icicle-kmacro-ring-max)
    (setq icicle-saved-kmacro-ring-max  kmacro-ring-max <span class="linecomment">; Save it.</span>
          kmacro-ring-max               icicle-kmacro-ring-max)))

(defun icicle-restore-standard-options ()
  "<span class="quote">Restore standard Emacs options replaced in Icicle mode.</span>"
  (when (boundp 'icicle-saved-search-ring-max)
    (setq search-ring-max         icicle-saved-search-ring-max
          regexp-search-ring-max  icicle-saved-regexp-search-ring-max)))

<span class="linecomment">;; This is used only in Emacs 22+, but we define it always anyway.</span>
(defun icicle-undo-std-completion-faces ()
  "<span class="quote">Get rid of standard completion-root highlighting in `*Completions*'.</span>"
  <span class="linecomment">;; Do this because the standard Emacs 22 highlighting can interfere with</span>
  <span class="linecomment">;; apropos-completion highlighting.</span>
  (when (fboundp 'face-spec-reset-face)
    (when (facep 'completions-common-part)
      (face-spec-reset-face 'completions-common-part)
      (set-face-attribute 'completions-common-part nil :inherit nil))
    (when (facep 'completions-first-difference)
      (face-spec-reset-face 'completions-first-difference)
      (set-face-attribute 'completions-first-difference nil :inherit nil))))


<span class="linecomment">;;; Save original functions, so they can be restored when leave Icicle mode.</span>
<span class="linecomment">;;; Toggle Icicle mode after loading the library (and `icicles-mode.el'),</span>
<span class="linecomment">;;; to pick up the original definition.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Note: The `boundp' test for `icicle-mode' is just in case the form gets evaluated while</span>
<span class="linecomment">;;; loading `icicles-mode.el' (e.g. the library gets loaded while loading `icicles-mode.el').</span>

<span class="linecomment">;;; `comint.el' - `comint-dynamic-complete', `comint-replace-by-expanded-filename'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'comint-dynamic-complete)
                          (not (fboundp 'old-comint-dynamic-complete)))
                 (defalias 'old-comint-dynamic-complete (symbol-function 'comint-dynamic-complete)))
               (when (and (fboundp 'comint-dynamic-complete-filename)
                          (not (fboundp 'old-comint-dynamic-complete-filename)))
                 (defalias 'old-comint-dynamic-complete-filename
                     (symbol-function 'comint-dynamic-complete-filename)))
               (when (and (fboundp 'comint-replace-by-expanded-filename)
                          (not (fboundp 'old-comint-replace-by-expanded-filename)))
                 (defalias 'old-comint-replace-by-expanded-filename
                     (symbol-function 'comint-replace-by-expanded-filename)))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'comint) (eval-after-load "<span class="quote">icicles-mode</span>" form) (eval-after-load "<span class="quote">comint</span>" form)))

<span class="linecomment">;;; `ess-site.el' - `ess-complete-object-name'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'ess-complete-object-name)
                          (not (fboundp 'old-ess-complete-object-name)))
                 (defalias 'old-ess-complete-object-name (symbol-function
                                                          'ess-complete-object-name)))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'ess-site) (eval-after-load "<span class="quote">icicles-mode</span>" form) (eval-after-load "<span class="quote">ess-site</span>" form)))

<span class="linecomment">;;; `gud.el' - `gud-gdb-complete-command'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'gud-gdb-complete-command)
                          (not (fboundp 'old-gud-gdb-complete-command)))
                 (defalias 'old-gud-gdb-complete-command (symbol-function
                                                          'gud-gdb-complete-command)))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'gud) (eval-after-load "<span class="quote">icicles-mode</span>" form) (eval-after-load "<span class="quote">gud</span>" form)))

<span class="linecomment">;;; `bbdb-com.el' -  `bbdb-complete-name'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'bbdb-complete-name) (not (fboundp 'old-bbdb-complete-name)))
                 (defalias 'old-bbdb-complete-name (symbol-function 'bbdb-complete-name)))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'bbdb-com) (eval-after-load "<span class="quote">icicles-mode</span>" form) (eval-after-load "<span class="quote">bbdb-com</span>" form)))

<span class="linecomment">;;; `dired-aux.el' - `dired-read-shell-command'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'dired-read-shell-command)
                          (not (fboundp 'old-dired-read-shell-command)))
                 (defalias 'old-dired-read-shell-command (symbol-function
                                                          'dired-read-shell-command)))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'dired-aux)
      (eval-after-load "<span class="quote">icicles-mode</span>" form)
    (eval-after-load "<span class="quote">dired-aux</span>" form)))

<span class="linecomment">;;; `dired-x.el' - `dired-read-shell-command', `dired-smart-shell-command'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'dired-read-shell-command)
                          (not (fboundp 'old-dired-read-shell-command)))
                 (defalias 'old-dired-read-shell-command (symbol-function
                                                          'dired-read-shell-command)))
               (unless (fboundp 'read-shell-command) <span class="linecomment">; `dired-smart-shell-command' in Emacs &lt; 23.</span>
                 (when (and (fboundp 'dired-smart-shell-command)
                            (not (fboundp 'old-dired-smart-shell-command)))
                   (defalias 'old-dired-smart-shell-command (symbol-function
                                                             'dired-smart-shell-command))))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'dired-x) (eval-after-load "<span class="quote">icicles-mode</span>" form) (eval-after-load "<span class="quote">dired-x</span>" form)))

<span class="linecomment">;;; `simple.el' - `read-shell-command' - Emacs 23+.</span>
(when (&gt; emacs-major-version 22)
  <span class="linecomment">;; `simple.el' is preloaded for Emacs 23+, so just do it now.</span>
  (let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
    (when icyp (icicle-mode -1))
    (when (and (fboundp 'read-shell-command) (not (fboundp 'old-read-shell-command)))
      (defalias 'old-read-shell-command (symbol-function 'read-shell-command)))
    (when icyp (icicle-mode 1))))

<span class="linecomment">;;; `recentf.el' - `recentf-make-menu-items'.</span>
(let ((form  '(let ((icyp  (and (boundp 'icicle-mode) icicle-mode)))
               (when icyp (icicle-mode -1))
               (when (and (fboundp 'recentf-make-menu-items)
                          (not (fboundp 'old-recentf-make-menu-items)))
                 (defalias 'old-recentf-make-menu-items (symbol-function 'recentf-make-menu-items)))
               (when icyp (icicle-mode 1)))))
  (if (featurep 'recentf) (eval-after-load "<span class="quote">icicles-mode</span>" form) (eval-after-load "<span class="quote">recentf</span>" form)))

      
<span class="linecomment">;; Do this last.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; When these libraries are first loaded, toggle Icicle mode to pick up the definitions</span>
(dolist (library '("<span class="quote">bookmark+</span>" "<span class="quote">buff-menu</span>" "<span class="quote">comint</span>" "<span class="quote">dired</span>" "<span class="quote">ess-site</span>" "<span class="quote">gud</span>" "<span class="quote">ibuffer</span>"
                   "<span class="quote">idlw-shell</span>"         <span class="linecomment">; (untested - I don't have an `idl' program)</span>
                   "<span class="quote">ielm</span>" "<span class="quote">info</span>" "<span class="quote">net-utils</span>" "<span class="quote">rlogin</span>" "<span class="quote">shell</span>" "<span class="quote">sh-script</span>" "<span class="quote">tcl</span>"))
  (unless (if (fboundp 'load-history-regexp) <span class="linecomment">; Emacs 22+</span>
              (load-history-filename-element (load-history-regexp library))
            (assoc library load-history))
    (eval-after-load library '(icicle-toggle-icicle-mode-twice))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-mode)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-mode.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-mode.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mode.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-mode.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-mode.el">Administration</a></span><span class="time"><br /> Last edited 2011-05-22 20:32 UTC by <a class="author" title="from 148.87.67.196" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-mode.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
