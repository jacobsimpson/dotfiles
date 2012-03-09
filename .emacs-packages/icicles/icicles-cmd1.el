<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-cmd1.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-cmd1.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-cmd1.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-cmd1.el" />
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
      title="Changes for icicles-cmd1.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-cmd1.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-cmd1.el%22">icicles-cmd1.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/icicles-cmd1.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-cmd1.el --- Top-level commands for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-cmd1.el</span>
<span class="linecomment">;; Description: Top-level commands for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:04 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sun May 22 12:36:48 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 21941</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-cmd1.el</span>
<span class="linecomment">;; Keywords: extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `avoid', `cl', `cus-edit',</span>
<span class="linecomment">;;   `cus-face', `cus-load', `cus-start', `doremi', `easymenu',</span>
<span class="linecomment">;;   `el-swank-fuzzy', `ffap', `ffap-', `frame-cmds', `frame-fns',</span>
<span class="linecomment">;;   `fuzzy', `fuzzy-match', `hexrgb', `icicles-face', `icicles-fn',</span>
<span class="linecomment">;;   `icicles-mcmd', `icicles-opt', `icicles-var', `image-dired',</span>
<span class="linecomment">;;   `kmacro', `levenshtein', `misc-fns', `mouse3', `mwheel', `pp',</span>
<span class="linecomment">;;   `pp+', `regexp-opt', `ring', `ring+', `strings', `thingatpt',</span>
<span class="linecomment">;;   `thingatpt+', `wid-edit', `wid-edit+', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  top-level commands (and a few non-interactive functions used in</span>
<span class="linecomment">;;  those commands).  Library `icicles-cmd2.el' is a continuation of</span>
<span class="linecomment">;;  this file (a single file for all top-level commands would be too</span>
<span class="linecomment">;;  large to upload to Emacs Wiki).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For commands to be used mainly in the minibuffer or buffer</span>
<span class="linecomment">;;  `*Completions*', see `icicles-mcmd.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For Icicles documentation, see `icicles-doc1.el' and</span>
<span class="linecomment">;;  `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you use the byte-compiled version of this library,</span>
<span class="linecomment">;;  `icicles-cmd1.elc', in Emacs 23, then it must be byte-compiled</span>
<span class="linecomment">;;  using Emacs 23.  Otherwise, Icicles key completion (and perhaps</span>
<span class="linecomment">;;  other things?) will not work correctly.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Macros defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-define-bookmark-command',</span>
<span class="linecomment">;;    `icicle-define-bookmark-command-1',</span>
<span class="linecomment">;;    `icicle-define-bookmark-other-window-command'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here - (+) means a multi-command:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (+)`clear-option', (+)`icicle-add-buffer-candidate',</span>
<span class="linecomment">;;    (+)`icicle-add-buffer-config',</span>
<span class="linecomment">;;    `icicle-add-entry-to-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-bbdb-complete-name', (+)`icicle-bookmark',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-bookmark-list',</span>
<span class="linecomment">;;    `icicle-bookmark-bookmark-list-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-cmd', (+)`icicle-bookmark-desktop',</span>
<span class="linecomment">;;    `icicle-bookmark-desktop-narrow', (+)`icicle-bookmark-dired',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-dired-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-dired-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmarked-buffer-list',</span>
<span class="linecomment">;;    (+)`icicle-bookmarked-file-list', (+)`icicle-bookmark-file',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-gnus',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-gnus-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-gnus-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-info-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-info-narrow', `icicle-bookmark-jump',</span>
<span class="linecomment">;;    `icicle-bookmark-jump-other-window', (+)`icicle-bookmark-list',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-local-file',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-local-file-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-local-file-narrow', (+)`icicle-bookmark-man',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-man-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-man-narrow', (+)`icicle-bookmark-non-file',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-non-file-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-non-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-other-window', (+)`icicle-bookmark-region',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-region-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-region-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-remote-file',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-remote-file-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-remote-file-narrow',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-as-project',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-more',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-persistently',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-to-variable',</span>
<span class="linecomment">;;    `icicle-bookmark-set', (+)`icicle-bookmark-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-buffers',</span>
<span class="linecomment">;;    `icicle-bookmark-specific-buffers-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-buffers-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-files',</span>
<span class="linecomment">;;    `icicle-bookmark-specific-files-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-files-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-this-buffer',</span>
<span class="linecomment">;;    `icicle-bookmark-this-buffer-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-this-buffer-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-url', `icicle-bookmark-url-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-url-other-window', (+)`icicle-bookmark-w3m',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-w3m-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-w3m-narrow', (+)`icicle-buffer',</span>
<span class="linecomment">;;    (+)`icicle-buffer-config', (+)`icicle-buffer-list',</span>
<span class="linecomment">;;    (+)`icicle-buffer-other-window', `icicle-cd-for-abs-files',</span>
<span class="linecomment">;;    `icicle-cd-for-loc-files', (+)`icicle-clear-history',</span>
<span class="linecomment">;;    (+)`icicle-clear-current-history', (+)`icicle-color-theme',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-filename',</span>
<span class="linecomment">;;    `icicle-comint-replace-by-expanded-filename',</span>
<span class="linecomment">;;    (+)`icicle-command-abbrev', (+)`icicle-command-abbrev-command',</span>
<span class="linecomment">;;    (+)`icicle-completing-yank', `icicle-customize-apropos',</span>
<span class="linecomment">;;    `icicle-customize-apropos-faces',</span>
<span class="linecomment">;;    `icicle-customize-apropos-groups',</span>
<span class="linecomment">;;    `icicle-customize-apropos-options',</span>
<span class="linecomment">;;    `icicle-customize-apropos-options-of-type',</span>
<span class="linecomment">;;    (+)`icicle-customize-face',</span>
<span class="linecomment">;;    (+)`icicle-customize-face-other-window',</span>
<span class="linecomment">;;    `icicle-customize-icicles-group', `icicle-dabbrev-completion',</span>
<span class="linecomment">;;    (+)`icicle-delete-file', (+)`icicle-delete-window',</span>
<span class="linecomment">;;    (+)`icicle-delete-windows', (+)`icicle-directory-list',</span>
<span class="linecomment">;;    (+)`icicle-dired', `icicle-dired-chosen-files',</span>
<span class="linecomment">;;    `icicle-dired-chosen-files-other-window',</span>
<span class="linecomment">;;    (+)`icicle-dired-other-window', `icicle-dired-project',</span>
<span class="linecomment">;;    `icicle-dired-project-other-window',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates-other-window',</span>
<span class="linecomment">;;    `icicle-dired-save-marked',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-as-project',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-more',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-persistently',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-variable',</span>
<span class="linecomment">;;    `icicle-doremi-increment-variable+',</span>
<span class="linecomment">;;    `icicle-ess-complete-filename',</span>
<span class="linecomment">;;    `icicle-ess-complete-object-name',</span>
<span class="linecomment">;;    `icicle-ess-internal-complete-object-name',</span>
<span class="linecomment">;;    `icicle-ess-R-complete-object-name',</span>
<span class="linecomment">;;    (+)`icicle-execute-extended-command',</span>
<span class="linecomment">;;    (+)`icicle-execute-named-keyboard-macro', (+)`icicle-face-list',</span>
<span class="linecomment">;;    (+)`icicle-file', (+)`icicle-file-list',</span>
<span class="linecomment">;;    (+)`icicle-file-other-window', (+)`icicle-find-file',</span>
<span class="linecomment">;;    (+)`icicle-find-file-absolute',</span>
<span class="linecomment">;;    (+)`icicle-find-file-absolute-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-find-file-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-find-file-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-in-tags-table',</span>
<span class="linecomment">;;    (+)`icicle-find-file-in-tags-table-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-read-only',</span>
<span class="linecomment">;;    (+)`icicle-find-file-read-only-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-find-file-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-find-file-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-first-tag',</span>
<span class="linecomment">;;    (+)`icicle-find-first-tag-other-window', (+)`icicle-find-tag',</span>
<span class="linecomment">;;    `icicle-grep-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-gud-gdb-complete-command', (+)`icicle-increment-option',</span>
<span class="linecomment">;;    (+)`icicle-increment-variable', (+)`icicle-insert-buffer',</span>
<span class="linecomment">;;    (+)`icicle-kill-buffer', (+)`icicle-kmacro',</span>
<span class="linecomment">;;    `icicle-lisp-complete-symbol', (+)`icicle-locate-file',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-no-symlinks',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-no-symlinks-other-window',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-other-window',</span>
<span class="linecomment">;;    (+)`icicle-other-window-or-frame', `icicle-pop-tag-mark',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression', (+)`icicle-recent-file',</span>
<span class="linecomment">;;    (+)`icicle-recent-file-other-window',</span>
<span class="linecomment">;;    `icicle-recompute-shell-command-candidates',</span>
<span class="linecomment">;;    (+)`icicle-remove-buffer-candidate',</span>
<span class="linecomment">;;    (+)`icicle-remove-buffer-config',</span>
<span class="linecomment">;;    `icicle-remove-entry-from-saved-completion-set',</span>
<span class="linecomment">;;    (+)`icicle-remove-file-from-recentf-list',</span>
<span class="linecomment">;;    (+)`icicle-remove-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-repeat-complex-command',</span>
<span class="linecomment">;;    (+)`icicle-reset-option-to-nil',</span>
<span class="linecomment">;;    (+)`icicle-select-bookmarked-region', (+)`icicle-select-frame',</span>
<span class="linecomment">;;    `icicle-select-frame-by-name', (+)`icicle-select-window',</span>
<span class="linecomment">;;    `icicle-select-window-by-name', `icicle-send-bug-report',</span>
<span class="linecomment">;;    (+)`icicle-set-option-to-t',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-command',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-environment-variable',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-filename',</span>
<span class="linecomment">;;    (+)`icicle-tag-a-file', (+)`icicle-toggle-option',</span>
<span class="linecomment">;;    (+)`icicle-untag-a-file', (+)`icicle-yank-maybe-completing',</span>
<span class="linecomment">;;    (+)`toggle'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `custom-variable-p', `icicle-binary-option-p',</span>
<span class="linecomment">;;    `icicle-bookmark-cleanup', `icicle-bookmark-cleanup-on-quit',</span>
<span class="linecomment">;;    `icicle-bookmark-delete-action', `icicle-bookmark-help-string',</span>
<span class="linecomment">;;    `icicle-bookmark-jump-1', `icicle-clear-history-1',</span>
<span class="linecomment">;;    `icicle-clear-history-entry',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-as-filename',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-simple-complete',</span>
<span class="linecomment">;;    `icicle-comint-replace-orig-completion-fns',</span>
<span class="linecomment">;;    `icicle-command-abbrev-action',</span>
<span class="linecomment">;;    `icicle-command-abbrev-matching-commands',</span>
<span class="linecomment">;;    `icicle-command-abbrev-record', `icicle-command-abbrev-regexp',</span>
<span class="linecomment">;;    `icicle-customize-faces', `icicle-dabbrev--abbrev-at-point',</span>
<span class="linecomment">;;    `icicle-default-buffer-names',</span>
<span class="linecomment">;;    `icicle-delete-file-or-directory',</span>
<span class="linecomment">;;    `icicle-execute-extended-command-1', `icicle-explore',</span>
<span class="linecomment">;;    `icicle-find-first-tag-action',</span>
<span class="linecomment">;;    `icicle-find-first-tag-other-window-action',</span>
<span class="linecomment">;;    `icicle-find-tag-action', `icicle-find-tag-define-candidates',</span>
<span class="linecomment">;;    `icicle-find-tag-define-candidates-1',</span>
<span class="linecomment">;;    `icicle-find-tag-final-act', `icicle-find-tag-help',</span>
<span class="linecomment">;;    `icicle-find-tag-quit-or-error', `icicle-insert-for-yank',</span>
<span class="linecomment">;;    `icicle-kill-a-buffer-and-update-completions',</span>
<span class="linecomment">;;    `icicle-kmacro-action', `icicle-lisp-completion-at-point',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-1', `icicle-locate-file-action',</span>
<span class="linecomment">;;    `icicle-locate-file-other-window-action',</span>
<span class="linecomment">;;    `icicle-make-file+date-candidate', `icicle-make-frame-alist',</span>
<span class="linecomment">;;    `icicle-make-window-alist',</span>
<span class="linecomment">;;    `icicle-bookmark-propertize-candidate',</span>
<span class="linecomment">;;    `icicle-pp-display-expression',</span>
<span class="linecomment">;;    `icicle-remove-buffer-candidate-action',</span>
<span class="linecomment">;;    `icicle-remove-buffer-config-action',</span>
<span class="linecomment">;;    `icicle-remove-from-recentf-candidate-action',</span>
<span class="linecomment">;;    `icicle-remove-saved-set-action',</span>
<span class="linecomment">;;    `icicle-shell-command-on-file',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-as-command',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-as-environment-variable'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-locate-file-action-fn',</span>
<span class="linecomment">;;    `icicle-locate-file-no-symlinks-p'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dabbrev.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dabbrev-completion' - Use Icicles minibuffer completion when there</span>
<span class="linecomment">;;                         are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `bbdb-com.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;              (BBDB is available here: http://bbdb.sourceforge.net/.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `bbdb-complete-name' - Use Icicles minibuffer completion when there</span>
<span class="linecomment">;;                         are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `lisp.el' have</span>
<span class="linecomment">;;              been REDEFINED in Icicles:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `lisp-complete-symbol' - Selects `*Completions*' window even if on</span>
<span class="linecomment">;;                           another frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `simple.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `repeat-complex-command' - Use `completing-read' to read command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `cus-edit.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `customize-apropos', `customize-apropos-faces',</span>
<span class="linecomment">;;  `customize-apropos-groups', `customize-apropos-options' -</span>
<span class="linecomment">;;     Use `completing-read' to read the regexp.</span>
<span class="linecomment">;;  `customize-face', `customize-face-other-window' - Multi-commands.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Key bindings made by Icicles: See "Key Bindings" in</span>
<span class="linecomment">;;  `icicles-doc2.el'.</span>
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
<span class="linecomment">;;  (@&gt; "Icicles Top-Level Commands, Part 1")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 3, or</span>
<span class="linecomment">;; (at your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="linecomment">;; General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; pushnew</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: dolist, push</span>
(eval-when-compile (when (&gt;= emacs-major-version 21) (require 'recentf))) <span class="linecomment">;; recentf-mode</span>
(eval-when-compile (require 'dabbrev))
  <span class="linecomment">;; dabbrev-case-fold-search, dabbrev-upcase-means-case-search, dabbrev--last-obarray,</span>
  <span class="linecomment">;; dabbrev--last-completion-buffer, dabbrev--last-abbreviation, dabbrev--check-other-buffers,</span>
  <span class="linecomment">;; dabbrev-case-replace, dabbrev--reset-global-variables, dabbrev--minibuffer-origin,</span>
  <span class="linecomment">;; dabbrev--find-all-expansions, dabbrev--substitute-expansion</span>
(eval-when-compile (require 'bookmark))
  <span class="linecomment">;; bookmark-all-names, bookmark-buffer-name, bookmark-current-bookmark</span>
(eval-when-compile (require 'comint))
  <span class="linecomment">;; comint-completion-addsuffix, comint-completion-autolist, comint-completion-fignore,</span>
  <span class="linecomment">;; comint-completion-recexact, comint-directory, comint-dynamic-complete-filename,</span>
  <span class="linecomment">;; comint-dynamic-complete-functions, comint-line-beginning-position,</span>
  <span class="linecomment">;; comint-match-partial-filename, comint-quote-filename</span>
(eval-when-compile (require 'shell)) <span class="linecomment">;; shell-backward-command, shell-completion-execonly,</span>
  <span class="linecomment">;; shell-dynamic-complete-command, shell-dynamic-complete-environment-variable,</span>
  <span class="linecomment">;; shell-dynamic-complete-filename, shell-match-partial-variable</span>
(eval-when-compile (require 'etags))
  <span class="linecomment">;; file-of-tag, find-tag, find-tag-default, find-tag-default-function,</span>
  <span class="linecomment">;; find-tag-marker-ring, find-tag-other-window, goto-tag-location-function, snarf-tag-function,</span>
  <span class="linecomment">;; tag-find-file-of-tag-noselect, tags-case-fold-search,</span>
  <span class="linecomment">;; tags-lazy-completion-table, tags-table-files, visit-tags-table-buffer</span>

<span class="linecomment">;; Commented out because `synonyms.el' soft-requires Icicles.</span>
<span class="linecomment">;; (eval-when-compile (require 'synonyms nil t)) ;; (no error if not found):</span>
  <span class="linecomment">;; synonyms-ensure-synonyms-read-from-cache, synonyms-obarray</span>
(eval-when-compile (require 'misc-cmds nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; kill-buffer-and-its-windows</span>
(eval-when-compile (require 'bbdb nil t) (require 'bbdb-com nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; bbdb-auto-fill-function, bbdb-complete-name, bbdb-complete-name-allow-cycling,</span>
  <span class="linecomment">;; bbdb-complete-name-cleanup, bbdb-complete-name-hooks, bbdb-completion-display-record,</span>
  <span class="linecomment">;; bbdb-completion-predicate, bbdb-completion-type, bbdb-display-records-1,</span>
  <span class="linecomment">;; bbdb-dwim-net-address, bbdb-expand-mail-aliases, bbdb-extract-address-components-func,</span>
  <span class="linecomment">;; bbdb-gag-messages, bbdb-hashtable, bbdb-mapc, bbdb-pop-up-bbdb-buffer, bbdb-record-aka,</span>
  <span class="linecomment">;; bbdb-record-name, bbdb-record-net, bbdb-search-intertwingle, bbdb-string-trim</span>
(require 'cus-edit)
  <span class="linecomment">;; customize-apropos, customize-apropos-faces, customize-apropos-groups,</span>
  <span class="linecomment">;; customize-apropos-options, custom-buffer-create, custom-buffer-order-groups, customize-face,</span>
  <span class="linecomment">;; customize-face-other-window, custom-sort-items</span>
(require 'misc-fns nil t)   <span class="linecomment">;; (no error if not found): another-buffer</span>
(require 'frame-cmds nil t) <span class="linecomment">;; (no error if not found): delete-windows-on (my version)</span>

(eval-when-compile
 (or (condition-case nil
         (load-library "<span class="quote">icicles-mac</span>")   <span class="linecomment">; Use load-library to ensure latest .elc.</span>
       (error nil))
     (require 'icicles-mac)))           <span class="linecomment">; Require, so can load separately if not on `load-path'.</span>
  <span class="linecomment">;; icicle-assoc-delete-all, icicle-define-command, icicle-define-file-command,</span>
  <span class="linecomment">;; icicle-define-add-to-alist-command</span>
(require 'icicles-mcmd)
  <span class="linecomment">;; icicle-yank</span>
(require 'icicles-opt)                  <span class="linecomment">; (This is required anyway by `icicles-var.el'.)</span>
  <span class="linecomment">;; icicle-add-proxy-candidates-flag, icicle-buffer-configs, icicle-buffer-extras,</span>
  <span class="linecomment">;; icicle-buffer-ignore-space-prefix-flag, icicle-buffer-match-regexp,</span>
  <span class="linecomment">;; icicle-buffer-no-match-regexp, icicle-buffer-predicate, icicle-buffer-require-match-flag,</span>
  <span class="linecomment">;; icicle-buffer-sort, icicle-color-themes, icicle-saved-completion-sets,</span>
  <span class="linecomment">;; icicle-sort-comparer, icicle-transform-function</span>
(require 'icicles-var)                  <span class="linecomment">; (This is required anyway by `icicles-fn.el'.)</span>
  <span class="linecomment">;; icicle-candidate-action-fn, icicle-candidate-nb, icicle-candidates-alist,</span>
  <span class="linecomment">;; icicle-completion-candidates, icicle-current-input, icicle-extra-candidates,</span>
  <span class="linecomment">;; icicle-get-alist-candidate-function, icicle-incremental-completion-p, icicle-kmacro-alist,</span>
  <span class="linecomment">;; icicle-must-match-regexp, icicle-must-not-match-regexp, icicle-must-pass-after-match-predicate,</span>
  <span class="linecomment">;; icicle-re-no-dot, icicle-saved-completion-candidates</span>
(require 'icicles-fn)                   <span class="linecomment">; (This is required anyway by `icicles-mcmd.el'.)</span>
  <span class="linecomment">;; icicle-highlight-lighter, icicle-read-from-minibuf-nil-default</span>



<span class="linecomment">;; Byte-compiling this file, you will likely get some byte-compiler warning messages.</span>
<span class="linecomment">;; These are probably benign - ignore them.  Icicles is designed to work with multiple</span>
<span class="linecomment">;; versions of Emacs, and that fact provokes compiler warnings.  If you get byte-compiler</span>
<span class="linecomment">;; errors (not warnings), then please report a bug, using `M-x icicle-send-bug-report'.</span>

<span class="linecomment">;;; Some defvars to quiet byte-compiler a bit:</span>

(when (&lt; emacs-major-version 21)
  (defvar eval-expression-debug-on-error))

(when (&lt; emacs-major-version 22)
  (defvar icicle-kmacro-alist)          <span class="linecomment">; In `icicles-var.el'</span>
  (defvar kmacro-ring)                  <span class="linecomment">; In `kmacro.el'</span>
  (defvar read-file-name-completion-ignore-case) <span class="linecomment">;  In `minibuffer.el'</span>
  (defvar recentf-list)                 <span class="linecomment">; In `recentf.el'</span>
  (defvar tags-case-fold-search))       <span class="linecomment">; In `etags.el'</span>

(when (&lt; emacs-major-version 23)
  (defvar read-buffer-completion-ignore-case))

(defvar bbdb-complete-name-allow-cycling) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-extract-address-components-func) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-expand-mail-aliases)       <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-complete-name-hooks)       <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-completion-display-record) <span class="linecomment">; In `bbdb.el'</span>
(defvar bbdb-completion-type)           <span class="linecomment">; In `bbdb.el'</span>
(defvar bbdb-hashtable)                 <span class="linecomment">; In `bbdb.el'</span>
(defvar bmkp-bookmark-name-length-max)  <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bmkp-non-file-filename)         <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bmkp-prompt-for-tags-flag)      <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bmkp-sorted-alist)              <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bookmark-current-point)         <span class="linecomment">; In `bookmark.el' for Emacs &lt; </span>
(defvar color-theme)                    <span class="linecomment">; In `color-theme.el'</span>
(defvar color-themes)                   <span class="linecomment">; In `color-theme.el'</span>
(defvar color-theme-initialized)        <span class="linecomment">; In `color-theme.el'</span>
(defvar ess-current-process-name)       <span class="linecomment">; In `ess-inf.el'</span>
(defvar ess-mode-syntax-table)          <span class="linecomment">; In `ess-cust.el'</span>
(defvar ess-use-R-completion)           <span class="linecomment">; In `ess-cust.el'</span>
(defvar filesets-data)                  <span class="linecomment">; In `filesets.el'</span>
(defvar find-tag-default-function)      <span class="linecomment">; In `etags.el'</span>
(defvar find-tag-marker-ring)           <span class="linecomment">; In `etags.el'</span>
(defvar goto-tag-location-function)     <span class="linecomment">; In `etags.el'</span>
(defvar icicle-clear-history-hist)      <span class="linecomment">; In `icicle-clear-history-1',`icicle-clear-current-history'</span>
(defvar icicle-window-alist)            <span class="linecomment">; In `icicle-select-window'</span>
(defvar shell-completion-execonly)      <span class="linecomment">; In `shell.el'</span>
(defvar snarf-tag-function)             <span class="linecomment">; In `etags.el'</span>
(defvar w3m-current-title)              <span class="linecomment">; In `w3m.el'.</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Icicles Top-Level Commands, Part 1")</span>
<span class="linecomment">;;; Icicles Top-Level Commands, Part 1 .   .   .   .   .   .   .   .   .</span>


<span class="linecomment">;; REPLACE ORIGINAL `pp-eval-expression' defined in `pp.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This is essentially the same as `pp-eval-expression' defined in `pp+.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Read with completion, using `icicle-read-expression-map'.</span>
<span class="linecomment">;; 2. Progress message added.</span>
<span class="linecomment">;; 3. Added optional arg and insertion behavior.</span>
<span class="linecomment">;; 4. Respect `icicle-pp-eval-expression-print-length', `icicle-pp-eval-expression-print-level',</span>
<span class="linecomment">;;    and `eval-expression-debug-on-error'.</span>
<span class="linecomment">;; 5. Adjusted to work in different Emacs releases.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-pp-eval-expression (expression <span class="linecomment">; Bound to `M-:' in Icicle mode.</span>
                                  &optional insert-value)
  "<span class="quote">Evaluate Emacs-Lisp sexp EXPRESSION, and pretty-print its value.
Add the value to the front of the variable `values'.
With a prefix arg, insert the value into the current buffer at point.
 With a negative prefix arg, if the value is a string, then insert it
 into the buffer without double-quotes (`\"').
With no prefix arg:
 If the value fits on one line (frame width) show it in the echo area.
 Otherwise, show the value in buffer `*Pp Eval Output*'.

This command respects user options
`icicle-pp-eval-expression-print-length',
`icicle-pp-eval-expression-print-level', and
`eval-expression-debug-on-error'.

Emacs-Lisp mode completion and indentation bindings are in effect.

By default, Icicle mode remaps all key sequences that are normally
bound to `eval-expression' or `pp-eval-expression' to
`icicle-pp-eval-expression'.  If you do not want this remapping, then
customize option `icicle-top-level-key-bindings'.</span>"
  (interactive
   (list (read-from-minibuffer "<span class="quote">Eval: </span>" nil icicle-read-expression-map t 'read-expression-history)
         current-prefix-arg))
  (message "<span class="quote">Evaluating...</span>")
  (if (or (not (boundp 'eval-expression-debug-on-error))
          (null eval-expression-debug-on-error))
      (setq values  (cons (eval expression) values))
    (let ((old-value  (make-symbol "<span class="quote">t</span>"))
          new-value)
      <span class="linecomment">;; Bind debug-on-error to something unique so that we can</span>
      <span class="linecomment">;; detect when evaled code changes it.</span>
      (let ((debug-on-error  old-value))
        (setq values     (cons (eval expression) values)
              new-value  debug-on-error))
      <span class="linecomment">;; If evaled code has changed the value of debug-on-error,</span>
      <span class="linecomment">;; propagate that change to the global binding.</span>
      (unless (eq old-value new-value)
        (setq debug-on-error  new-value))))
  (let ((print-length  icicle-pp-eval-expression-print-length)
        (print-level   icicle-pp-eval-expression-print-level))
    (cond (insert-value
           (message "<span class="quote">Evaluating...done. Value inserted.</span>")
           (setq insert-value  (prefix-numeric-value insert-value))
           (if (or (not (stringp (car values))) (wholenump insert-value))
               (pp (car values) (current-buffer))
             (princ (car values) (current-buffer))))
          (t (icicle-pp-display-expression (car values) "<span class="quote">*Pp Eval Output*</span>")))))


<span class="linecomment">;; REPLACE ORIGINAL in `pp.el':</span>
<span class="linecomment">;; 1. Use no `emacs-lisp-mode-hook' or `change-major-mode-hook'.</span>
<span class="linecomment">;; 2. Call `font-lock-fontify-buffer'.</span>
<span class="linecomment">;;</span>
(defun icicle-pp-display-expression (expression out-buffer-name)
  "<span class="quote">Prettify and show EXPRESSION in a way appropriate to its length.
If a temporary buffer is needed for representation, it is named
OUT-BUFFER-NAME.</span>"
  (let* ((old-show-function  temp-buffer-show-function)
         <span class="linecomment">;; Use this function to display the buffer.</span>
         <span class="linecomment">;; This function either decides not to display it at all</span>
         <span class="linecomment">;; or displays it in the usual way.</span>
         (temp-buffer-show-function
          #'(lambda (buf)
              (with-current-buffer buf
                (goto-char (point-min))
                (end-of-line 1)
                (if (or (&lt; (1+ (point)) (point-max))
                        (&gt;= (- (point) (point-min)) (frame-width)))
                    (let ((temp-buffer-show-function  old-show-function)
                          (old-selected               (selected-window))
                          (window                     (display-buffer buf)))
                      (goto-char (point-min)) <span class="linecomment">; expected by some hooks ...</span>
                      (make-frame-visible (window-frame window))
                      (unwind-protect
                           (progn (select-window window)
                                  (run-hooks 'temp-buffer-show-hook))
                        (select-window old-selected)
                        (message "<span class="quote">Evaluating...done. See buffer `%s'.</span>"
                                 out-buffer-name)))
                  (message "<span class="quote">%s</span>" (buffer-substring (point-min) (point))))))))
    (with-output-to-temp-buffer out-buffer-name
      (pp expression)
      (with-current-buffer standard-output
        (setq buffer-read-only  nil)
        <span class="linecomment">;; Avoid `let'-binding because `change-major-mode-hook' is local.</span>
        <span class="linecomment">;; IOW, avoid this runtime message:</span>
        <span class="linecomment">;; "Making change-major-mode-hook buffer-local while locally let-bound!"</span>
        <span class="linecomment">;; Suggestion from Stefan M.: Can just set these hooks instead of binding,</span>
        <span class="linecomment">;; because they are not permanent-local.  They'll be emptied and</span>
        <span class="linecomment">;; repopulated as needed by the call to emacs-lisp-mode.</span>
        (set (make-local-variable 'emacs-lisp-mode-hook) nil)
        (set (make-local-variable 'change-major-mode-hook) nil)
        (emacs-lisp-mode)
        (set (make-local-variable 'font-lock-verbose) nil)
        (font-lock-fontify-buffer)))))

(defun icicle-shell-command-on-file (file)
  "<span class="quote">Read a shell command and invoke it, passing FILE as an argument.</span>"
  (dired-run-shell-command
   (dired-shell-stuff-it (icicle-read-shell-command (format "<span class="quote">! on `%s': </span>" file)) (list file) nil)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-recompute-shell-command-candidates (&optional savep)
  "<span class="quote">Update option `icicle-shell-command-candidates-cache'.
Recompute the available shell commands using your search path.
Return the new option value.
With a prefix argument, the updated option is saved persistently.

If the value of option `icicle-guess-commands-in-path' is not `load',
then turning on Icicle mode (again) resets the cache value to ().
If the value of `icicle-guess-commands-in-path' is `first-use', then
the cache is updated when you next use it, but it is not saved.</span>"
  (interactive "<span class="quote">P</span>")
  (setq icicle-shell-command-candidates-cache  (icicle-compute-shell-command-candidates))
  (when savep (funcall icicle-customize-save-variable-function
                       'icicle-shell-command-candidates-cache
                       icicle-shell-command-candidates-cache))
  icicle-shell-command-candidates-cache)


<span class="linecomment">;; REPLACE ORIGINAL `comint-dynamic-complete' defined in `comint.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-dynamic-complete () <span class="linecomment">; Bound to `TAB' in Comint (and Shell) mode.</span>
  "<span class="quote">Dynamically perform completion at point.
Calls the functions in `comint-dynamic-complete-functions', but with
Icicles functions substituted, to perform completion until a function
returns non-nil, at which point completion is assumed to have
occurred.

Uses Icicles completion.</span>"
  (interactive)
  <span class="linecomment">;; Need a symbol for `run-hook-with-args-until-success', so bind one.</span>
  (let ((hook  (icicle-comint-replace-orig-completion-fns)))
    (run-hook-with-args-until-success 'hook)))

(defun icicle-comint-replace-orig-completion-fns ()
  "<span class="quote">Return `comint-dynamic-complete-functions', but with Icicles functions.</span>"
  (let ((old  comint-dynamic-complete-functions)
        (new  ())
        pair)
    (dolist (fn  old)
      (if (setq pair  (assoc fn icicle-comint-dynamic-complete-replacements))
          (push (eval (cadr pair)) new)
        (push fn new)))
    (nreverse new)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-dynamic-complete-filename ()
  "<span class="quote">Dynamically complete the filename at point.
Completes if after a filename.  See `comint-match-partial-filename' and
`icicle-comint-dynamic-complete-as-filename'.
This function is similar to `comint-replace-by-expanded-filename', except that
it won't change parts of the filename already entered in the buffer; it just
adds completion characters to the end of the filename.  A completions listing
may be shown in a help buffer if completion is ambiguous.

Completion is dependent on the value of `comint-completion-addsuffix',
`comint-completion-recexact' and `comint-completion-fignore', and the timing of
completions listing is dependent on the value of `comint-completion-autolist'.

Returns t if successful.

Uses Icicles completion.</span>"
  (interactive)
  (when (comint-match-partial-filename)
    (unless (window-minibuffer-p (selected-window)) (message "<span class="quote">Completing file name...</span>"))
    (icicle-comint-dynamic-complete-as-filename)))

(defun icicle-comint-dynamic-complete-as-filename ()
  "<span class="quote">Dynamically complete at point as a filename.
See `icicle-comint-dynamic-complete-filename'.
Returns t if successful.</span>"
  (let* ((completion-ignore-case         (if (boundp 'read-file-name-completion-ignore-case)
                                             read-file-name-completion-ignore-case
                                           (memq system-type '(ms-dos windows-nt cygwin))))
         (completion-ignored-extensions  comint-completion-fignore)
         (minibuffer-p                   (window-minibuffer-p (selected-window)))
         (success                        t)
         (dirsuffix                      (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                               ((not (consp comint-completion-addsuffix)) "<span class="quote">/</span>")
                                               (t  (car comint-completion-addsuffix))))
         (filesuffix                     (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                               ((not (consp comint-completion-addsuffix)) "<span class="quote"> </span>")
                                               (t  (cdr comint-completion-addsuffix))))
         (filename                       (comint-match-partial-filename))
         (filename-beg                   (if filename (match-beginning 0) (point)))
         (filename-end                   (if filename (match-end 0) (point)))
         (filename                       (or filename "<span class="quote"></span>"))
         (filedir                        (file-name-directory filename))
         (filenondir                     (file-name-nondirectory filename))
         (directory                      (if filedir (comint-directory filedir) default-directory))
         (completion                     (file-name-completion filenondir directory)))
    (cond ((null completion)
           (if minibuffer-p
               (minibuffer-message (format "<span class="quote"> [No completions of `%s']</span>" filename))
             (message "<span class="quote">No completions of `%s'</span>" filename))
           (setq success  nil))
          ((eq completion t)            <span class="linecomment">; Already completed: "the-file".</span>
           (insert filesuffix)
           (unless minibuffer-p (message "<span class="quote">Sole completion</span>")))
          ((string-equal completion "<span class="quote"></span>") <span class="linecomment">; A directory: "dir/" - complete it.</span>
           (condition-case nil
               (let* ((icicle-show-Completions-initially-flag      t)
                      (icicle-incremental-completion-p             'display)
                      (icicle-top-level-when-sole-completion-flag  t)
                      (choice
                       (save-excursion
                         (save-window-excursion (read-file-name "<span class="quote">Complete: </span>" directory nil t)))))
                 (when (and choice (not (string= choice directory)))
                   (insert (comint-quote-filename
                            (file-name-nondirectory (directory-file-name choice))))
                   (insert (if (file-directory-p choice) dirsuffix filesuffix))))
             (error nil)))
          (t                            <span class="linecomment">; COMPLETION is the common prefix string.</span>
           (let ((file            (concat (file-name-as-directory directory) completion))
                 (use-dialog-box  nil)) <span class="linecomment">; Inhibit use of open-file dialog box if called from menu.</span>
             <span class="linecomment">;; Insert completion.  The completion string might have a different case from</span>
             <span class="linecomment">;; what's in the prompt, if `read-file-name-completion-ignore-case' is non-nil.</span>
             (delete-region filename-beg filename-end)
             (if filedir (insert (comint-quote-filename filedir)))
             (insert (comint-quote-filename (directory-file-name completion)))
             (cond ((symbolp (file-name-completion completion directory))
                    <span class="linecomment">;; We inserted a unique completion.  Add suffix.</span>
                    (insert (if (file-directory-p file) dirsuffix filesuffix))
                    (unless minibuffer-p (message "<span class="quote">Completed</span>")))
                   ((and comint-completion-recexact comint-completion-addsuffix
                         (string-equal filenondir completion)
                         (file-exists-p file))
                    <span class="linecomment">;; It's not unique, but user wants shortest match.</span>
                    (insert (if (file-directory-p file) dirsuffix filesuffix))
                    (unless minibuffer-p (message "<span class="quote">Completed shortest</span>")))
                   ((or comint-completion-autolist (string-equal filenondir completion))
                    (condition-case nil <span class="linecomment">; It's not unique.  Let user choose a completion.</span>
                        (let* ((icicle-show-Completions-initially-flag      t)
                               (icicle-incremental-completion-p             'display)
                               (icicle-top-level-when-sole-completion-flag  t)
                               (choice
                                (save-excursion
                                  (save-window-excursion
                                    (read-file-name
                                     "<span class="quote">Complete: </span>" directory completion nil completion
                                     (and (&gt; emacs-major-version 21)
                                          #'(lambda (f) (string-match completion f))))))))
                          (when choice
                            (delete-backward-char (length completion))
                            (insert (comint-quote-filename
                                     (file-name-nondirectory (directory-file-name choice))))
                            (insert (if (file-directory-p choice) dirsuffix filesuffix))))
                      (error nil)))
                   (t (unless minibuffer-p (message "<span class="quote">Partially completed</span>")))))))
    success))

<span class="linecomment">;;;###autoload</span>
(defun icicle-shell-dynamic-complete-command ()
  "<span class="quote">Dynamically complete the command at point.
Similar to `icicle-comint-dynamic-complete-filename', but this
searches `exec-path' (minus the trailing Emacs library path) for
completion candidates.  Note that this may not be the same as the
shell's idea of the path.

Completion is dependent on the value of `shell-completion-execonly',
plus those that effect file completion.
See `icicle-shell-dynamic-complete-as-command'.

Returns t if successful.

Uses Icicles completion.</span>"
  (interactive)
  (let ((filename  (comint-match-partial-filename)))
    (if (and filename
             (save-match-data (not (string-match "<span class="quote">[~/]</span>" filename)))
             (eq (match-beginning 0) (save-excursion (shell-backward-command 1) (point))))
        (prog2 (unless (window-minibuffer-p (selected-window))
                 (message "<span class="quote">Completing command name...</span>"))
            (icicle-shell-dynamic-complete-as-command)))))

(defun icicle-shell-dynamic-complete-as-command ()
  "<span class="quote">Dynamically complete text at point as a command.
See `icicle-shell-dynamic-complete-filename'.
Return t if successful.</span>"
  (let* ((filename       (or (comint-match-partial-filename) "<span class="quote"></span>"))
         (filenondir     (file-name-nondirectory filename))
         (path-dirs      (cdr (reverse exec-path)))
         (cwd            (file-name-as-directory (expand-file-name default-directory)))
         (ignored-extensions
          (and comint-completion-fignore
               (mapconcat #'(lambda (x) (concat (regexp-quote x) "<span class="quote">$</span>"))
                          comint-completion-fignore "<span class="quote">\\|</span>")))
         (dir            "<span class="quote"></span>")
         (comps-in-dir   ())
         (file           "<span class="quote"></span>")
         (abs-file-name  "<span class="quote"></span>")
         (completions    ()))
    (while path-dirs                    <span class="linecomment">; Go thru each dir in the search path, finding completions.</span>
      (setq dir           (file-name-as-directory (comint-directory (or (car path-dirs) "<span class="quote">.</span>")))
            comps-in-dir  (and (file-accessible-directory-p dir)
                               (file-name-all-completions filenondir dir)))
      (while comps-in-dir               <span class="linecomment">; Go thru each completion, to see whether it should be used.</span>
        (setq file           (car comps-in-dir)
              abs-file-name  (concat dir file))
        (when (and (not (member file completions))
                   (not (and ignored-extensions (string-match ignored-extensions file)))
                   (or (string-equal dir cwd) (not (file-directory-p abs-file-name)))
                   (or (null shell-completion-execonly) (file-executable-p abs-file-name)))
          (setq completions  (cons file completions)))
        (setq comps-in-dir  (cdr comps-in-dir)))
      (setq path-dirs  (cdr path-dirs)))
    (let ((success  (let ((comint-completion-addsuffix  nil)
                          (icicle-candidate-help-fn
                           #'(lambda (cand)
                               (shell-command (concat "<span class="quote">apropos </span>" (shell-quote-argument cand))
                                              "<span class="quote">*Help*</span>"))))
                      (icicle-comint-dynamic-simple-complete filenondir completions))))
      (when (and (memq success '(sole shortest)) comint-completion-addsuffix
                 (not (file-directory-p (comint-match-partial-filename))))
        (insert "<span class="quote"> </span>"))
      success)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-replace-by-expanded-filename ()
  "<span class="quote">`comint-replace-by-expanded-filename', but uses Icicles completion.
Dynamically complete, expand, and canonicalize the filename at point.</span>"
  (interactive)
  (let ((filename  (comint-match-partial-filename)))
    (when filename
      (replace-match (expand-file-name filename) t t)
      (icicle-comint-dynamic-complete-filename))))

(defun icicle-comint-dynamic-simple-complete (stub candidates)
  "<span class="quote">Dynamically complete STUB from CANDIDATES list.
Inserts completion characters at point by completing STUB from the
strings in CANDIDATES.  Uses Icicles completion if completion is
ambiguous.

Returns nil if no completion was inserted.
Returns `sole' if completed with the only completion match.
Returns `shortest' if completed with the shortest of the completion matches.
Returns `partial' if completed as far as possible with the completion matches.
Returns `listed' if a completion listing was shown.

See also `icicle-comint-dynamic-complete-filename'.</span>"
  (let* ((completion-ignore-case  (memq system-type '(ms-dos windows-nt cygwin)))
         (minibuffer-p            (window-minibuffer-p (selected-window)))
         (suffix                  (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                        ((not (consp comint-completion-addsuffix)) "<span class="quote"> </span>")
                                        (t  (cdr comint-completion-addsuffix))))
         (candidates              (mapcar #'list candidates))
         (completions             (all-completions stub candidates)))
    (cond ((null completions)
           (if minibuffer-p
               (minibuffer-message (format "<span class="quote"> [No completions of `%s']</span>" stub))
             (message "<span class="quote">No completions of `%s'</span>" stub))
           nil)
          ((= 1 (length completions))
           (let ((completion  (car completions)))
             (if (string-equal completion stub)
                 (unless minibuffer-p (message "<span class="quote">Sole completion</span>"))
               (insert (substring completion (length stub)))
               (unless minibuffer-p (message "<span class="quote">Completed</span>")))
             (insert suffix)
             'sole))
          (t                            <span class="linecomment">; There's no unique completion.</span>
           (let ((completion  (try-completion stub candidates)))
             <span class="linecomment">;; Insert the longest substring.</span>
             (insert (substring completion (length stub)))
             (cond ((and comint-completion-recexact comint-completion-addsuffix
                         (string-equal stub completion)
                         (member completion completions))
                    (insert suffix)     <span class="linecomment">; User wants shortest match.</span>
                    (unless minibuffer-p (message "<span class="quote">Completed shortest</span>"))
                    'shortest)
                   ((or comint-completion-autolist (string-equal stub completion))
                    (condition-case nil <span class="linecomment">;  Let user choose a completion.</span>
                        (let* ((icicle-show-Completions-initially-flag      t)
                               (icicle-incremental-completion-p             'display)
                               (icicle-top-level-when-sole-completion-flag  t)
                               (choice (save-excursion
                                         (completing-read "<span class="quote">Complete: </span>" (mapcar #'list completions)
                                                          nil t nil nil completion))))
                          (when choice
                            (delete-backward-char (length completion))
                            (insert choice suffix)))
                      (error nil))
                    'listed)
                   (t
                    (unless minibuffer-p (message "<span class="quote">Partially completed</span>"))
                    'partial)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-shell-dynamic-complete-filename ()
  "<span class="quote">Dynamically complete the filename at point.
Completes only if point is at a suitable position for a filename
argument.</span>"
  (interactive)
  (let ((opoint  (point))
        (beg     (comint-line-beginning-position)))
    (when (save-excursion
            (goto-char (if (re-search-backward "<span class="quote">[;|&]</span>" beg t) (match-end 0) beg))
            (re-search-forward "<span class="quote">[^ \t][ \t]</span>" opoint t))
      (icicle-comint-dynamic-complete-as-filename))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-shell-dynamic-complete-environment-variable ()
  "<span class="quote">`shell-dynamic-complete-environment-variable' but uses Icicles completion.</span>"
  (interactive)
  (require 'shell)
  (let ((variable  (shell-match-partial-variable)))
    (if (and variable (string-match "<span class="quote">^\\$</span>" variable))
        (prog2 (unless (window-minibuffer-p (selected-window))
                 (message "<span class="quote">Completing variable name...</span>"))
            (icicle-shell-dynamic-complete-as-environment-variable)))))

(defun icicle-shell-dynamic-complete-as-environment-variable ()
  "<span class="quote">`shell-dynamic-complete-as-environment-variable' but uses Icicles completion.</span>"
  (require 'shell)
  (let* ((var                          (or (shell-match-partial-variable) "<span class="quote"></span>"))
         (variable                     (substring var (or (string-match "<span class="quote">[^$({]\\|$</span>" var) 0)))
         (variables                    (mapcar #'(lambda (x) (substring x 0 (string-match "<span class="quote">=</span>" x)))
                                               process-environment))
         (addsuffix                    comint-completion-addsuffix)
         (comint-completion-addsuffix  nil)
         (success                      (icicle-comint-dynamic-simple-complete variable variables)))
    (if (memq success '(sole shortest))
        (let* ((var           (shell-match-partial-variable))
               (variable      (substring var (string-match "<span class="quote">[^$({]</span>" var)))
               (protection    (cond ((string-match "<span class="quote">{</span>" var) "<span class="quote">}</span>")
                                    ((string-match "<span class="quote">(</span>" var) "<span class="quote">)</span>")
                                    (t "<span class="quote"></span>")))
               (suffix        (cond ((null addsuffix) "<span class="quote"></span>")
                                    ((file-directory-p
                                      (comint-directory (getenv variable))) "<span class="quote">/</span>")
                                    (t "<span class="quote"> </span>"))))
          (insert protection  suffix)))
    success))

<span class="linecomment">;;;###autoload</span>
(defun icicle-ess-complete-object-name (&optional listcomp)
  "<span class="quote">`ess-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.
This is `icicle-ess-R-complete-object-name' if `ess-use-R-completion',
and `icicle-ess-internal-complete-object-name' otherwise.</span>"
  (interactive "<span class="quote">P</span>")
  (if ess-use-R-completion
      (icicle-ess-R-complete-object-name)
    (icicle-ess-internal-complete-object-name listcomp)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-ess-internal-complete-object-name (&optional listcomp)
  "<span class="quote">`ess-internal-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.</span>"
  (interactive "<span class="quote">P</span>")
  (ess-make-buffer-current)
  (if (memq (char-syntax (preceding-char)) '(?w ?_))
      (let* ((comint-completion-addsuffix  nil)
             (end                          (point))
             (buffer-syntax                (syntax-table))
             (beg                          (unwind-protect
                                                (save-excursion
                                                  (set-syntax-table ess-mode-syntax-table)
                                                  (backward-sexp 1)
                                                  (point))
                                             (set-syntax-table buffer-syntax)))
             (full-prefix                  (buffer-substring beg end))
             (pattern                      full-prefix)
             (listname                  <span class="linecomment">; See if we're indexing a list with `$'</span>
              (and (string-match "<span class="quote">\\(.+\\)\\$\\(\\(\\sw\\|\\s_\\)*\\)$</span>" full-prefix)
                   (setq pattern  (if (not (match-beginning 2))
                                      "<span class="quote"></span>"
                                    (substring full-prefix (match-beginning 2) (match-end 2))))
                   (substring full-prefix (match-beginning 1) (match-end 1))))
             (classname                 <span class="linecomment">; Are we trying to get a slot via `@' ?</span>
              (and (string-match "<span class="quote">\\(.+\\)@\\(\\(\\sw\\|\\s_\\)*\\)$</span>" full-prefix)
                   (setq pattern  (if (not (match-beginning 2))
                                      "<span class="quote"></span>"
                                    (substring full-prefix (match-beginning 2) (match-end 2))))
                   (progn (ess-write-to-dribble-buffer (format "<span class="quote">(ess-C-O-Name : slots..) : patt=%s</span>"
                                                               pattern))
                          (substring full-prefix (match-beginning 1) (match-end 1)))))
             (components
              (if listname
                  (ess-object-names listname)
                (if classname
                    (ess-slot-names classname)
                  <span class="linecomment">;; Default case: It hangs here when options (error=recoves):</span>
                  (ess-get-object-list ess-current-process-name)))))
        <span class="linecomment">;; Return non-nil to prevent history expansions</span>
        (or (icicle-comint-dynamic-simple-complete  pattern components) 'none))))

(defun icicle-ess-complete-filename ()
  "<span class="quote">`ess-complete-filename', but uses Icicles completion.
Do file completion only within strings, or when `!' call is used.</span>"
  (if (comint-within-quotes
       (1- (process-mark (get-buffer-process (current-buffer)))) (point))
      (progn (if (featurep 'xemacs)
                 (icicle-comint-dynamic-complete-filename) <span class="linecomment">; Work around XEmacs bug.  GNU Emacs and</span>
               (icicle-comint-replace-by-expanded-filename)) <span class="linecomment">; a working XEmacs return t in a string</span>
             t)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-ess-R-complete-object-name ()
  "<span class="quote">`ess-R-complete-object-name', but uses Icicles completion.
Completion in R.</span>"
  (interactive)
  (ess-make-buffer-current)
  (let* ((comint-completion-addsuffix  nil)
         (beg-of-line                  (save-excursion (comint-bol nil) (point)))
         (end-of-line                  (point-at-eol))
         (line-buffer                  (buffer-substring beg-of-line end-of-line))
         (NS                           (if (ess-current-R-at-least '2.7.0)
                                           "<span class="quote">utils:::</span>"
                                         "<span class="quote">rcompgen:::</span>"))
         (token-string                  <span class="linecomment">; Setup, including computation of the token</span>
          (progn
            (ess-command (format (concat NS "<span class="quote">.assignLinebuffer('%s')\n</span>") line-buffer))
            (ess-command (format (concat NS "<span class="quote">.assignEnd(%d)\n</span>") (- (point) beg-of-line)))
            (car (ess-get-words-from-vector (concat NS "<span class="quote">.guessTokenFromLine()\n</span>")))))
         (possible-completions          <span class="linecomment">; Compute and retrieve possible completions</span>
          (progn
            (ess-command (concat NS "<span class="quote">.completeToken()\n</span>"))
            (ess-get-words-from-vector (concat NS "<span class="quote">.retrieveCompletions()\n</span>")))))
    (or (icicle-comint-dynamic-simple-complete token-string possible-completions) 'none)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-gud-gdb-complete-command (&optional command a b)
  "<span class="quote">`gud-gdb-complete-command', but uses Icicles completion.
Perform completion on the GDB command preceding point.</span>"
  (interactive)
  (if command
      (setq command  (concat "<span class="quote">p </span>" command)) <span class="linecomment">; Used by gud-watch in mini-buffer.</span>
    (let ((end  (point)))               <span class="linecomment">; Used in GUD buffer.</span>
      (setq command  (buffer-substring (comint-line-beginning-position) end))))
  (let* ((command-word
          <span class="linecomment">;; Find the word break.  This match will always succeed.</span>
          (and (string-match "<span class="quote">\\(\\`\\| \\)\\([^ ]*\\)\\'</span>" command)
               (substring command (match-beginning 2))))
         (complete-list
          (gud-gdb-run-command-fetch-lines (concat "<span class="quote">complete </span>" command)
                                           (current-buffer)
                                           <span class="linecomment">;; From string-match above.</span>
                                           (match-beginning 2))))
    <span class="linecomment">;; Protect against old versions of GDB.</span>
    (and complete-list
         (string-match "<span class="quote">^Undefined command: \"complete\"</span>" (car complete-list))
         (error "<span class="quote">This version of GDB doesn't support the `complete' command</span>"))
    <span class="linecomment">;; Sort the list like readline.</span>
    (setq complete-list  (sort complete-list (function string-lessp)))
    <span class="linecomment">;; Remove duplicates.</span>
    (let ((first   complete-list)
          (second  (cdr complete-list)))
      (while second
        (if (string-equal (car first) (car second))
            (setcdr first (setq second  (cdr second)))
          (setq first   second
                second  (cdr second)))))
    <span class="linecomment">;; Add a trailing single quote if there is a unique completion</span>
    <span class="linecomment">;; and it contains an odd number of unquoted single quotes.</span>
    (and (= (length complete-list) 1)
         (let ((str    (car complete-list))
               (pos    0)
               (count  0))
           (while (string-match "<span class="quote">\\([^'\\]\\|\\\\'\\)*'</span>" str pos)
             (setq count  (1+ count)
                   pos    (match-end 0)))
           (and (= (mod count 2) 1)
                (setq complete-list  (list (concat str "<span class="quote">'</span>"))))))
    <span class="linecomment">;; Let comint handle the rest.</span>
    (icicle-comint-dynamic-simple-complete command-word complete-list)))


<span class="linecomment">;; REPLACE ORIGINAL `dabbrev-completion' defined in `dabbrev.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can complete from an empty abbrev also.</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
(when (and (fboundp 'dabbrev-completion) (not (fboundp 'old-dabbrev-completion)))
  (defalias 'old-dabbrev-completion (symbol-function 'dabbrev-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dabbrev-completion (&optional arg) <span class="linecomment">; Bound to `C-M-/' globally.</span>
  "<span class="quote">Completion on current word.
Like \\[dabbrev-expand], but finds all expansions in the current buffer
and presents suggestions for completion.

With a prefix argument, it searches all buffers accepted by
`dabbrev-friend-buffer-function', to find the completions.

If the prefix argument is 16 (which comes from `C-u C-u'), then it
searches *ALL* buffers.

With no prefix argument, it reuses an old completion list
if there is a suitable one already.</span>"
  (interactive "<span class="quote">*P</span>")
  (unless (featurep 'dabbrev)
    (unless (require 'dabbrev nil t) (error "<span class="quote">Library `dabbrev' not found</span>"))
    (icicle-mode 1))                    <span class="linecomment">; Redefine `dabbrev-completion' to Icicles version.</span>
  (dabbrev--reset-global-variables)
  (let* ((dabbrev-check-other-buffers  (and arg t)) <span class="linecomment">; Must be t</span>
         (dabbrev-check-all-buffers    (and arg (= (prefix-numeric-value arg) 16)))
         (abbrev                       (icicle-dabbrev--abbrev-at-point))
         (ignore-case-p                (and (if (eq dabbrev-case-fold-search 'case-fold-search)
                                                case-fold-search
                                              dabbrev-case-fold-search)
                                            (or (not dabbrev-upcase-means-case-search)
                                                (string= abbrev (downcase abbrev)))))
         (my-obarray                   dabbrev--last-obarray)
         init)
    <span class="linecomment">;; If new abbreviation to expand, then expand it.</span>
    (save-excursion
      (unless (and (null arg)
                   my-obarray
                   (or (eq dabbrev--last-completion-buffer (current-buffer))
                       (and (window-minibuffer-p (selected-window))
                            (eq dabbrev--last-completion-buffer (dabbrev--minibuffer-origin))))
                   dabbrev--last-abbreviation
                   (&gt;= (length abbrev) (length dabbrev--last-abbreviation))
                   (string= dabbrev--last-abbreviation
                            (substring abbrev 0 (length dabbrev--last-abbreviation)))
                   (setq init  (try-completion abbrev my-obarray)))
        (setq dabbrev--last-abbreviation  abbrev)
        (let ((completion-list         (dabbrev--find-all-expansions abbrev ignore-case-p))
              (completion-ignore-case  ignore-case-p))
          <span class="linecomment">;; Make an obarray with all expansions</span>
          (setq my-obarray  (make-vector (length completion-list) 0))
          (unless (&gt; (length my-obarray) 0)
            (error "<span class="quote">No dynamic expansion for \"%s\" found%s</span>" abbrev
                   (if dabbrev--check-other-buffers "<span class="quote"></span>" "<span class="quote"> in this-buffer</span>")))
          (dolist (string  completion-list)
            (cond ((or (not ignore-case-p) (not dabbrev-case-replace))
                   (intern string my-obarray))
                  ((string= abbrev (icicle-upcase abbrev))
                   (intern (icicle-upcase string) my-obarray))
                  ((string= (substring abbrev 0 1) (icicle-upcase (substring abbrev 0 1)))
                   (intern (capitalize string) my-obarray))
                  (t (intern (downcase string) my-obarray))))
          (setq dabbrev--last-obarray            my-obarray
                dabbrev--last-completion-buffer  (current-buffer)
                <span class="linecomment">;; Find the expanded common string.</span>
                init                             (try-completion abbrev my-obarray)))))
    <span class="linecomment">;; Let the user choose between the expansions</span>
    (unless (stringp init) (setq init  abbrev))
    (cond
      ((and (not (string-equal init "<span class="quote"></span>"))
            (not (string-equal (downcase init) (downcase abbrev)))
            (&lt;= (length (all-completions init my-obarray)) 1))
       (message "<span class="quote">Completed (no other completions)</span>")
       (if (&lt; emacs-major-version 21)
           (dabbrev--substitute-expansion nil abbrev init)
         (dabbrev--substitute-expansion nil abbrev init nil))
       (when (window-minibuffer-p (selected-window)) (message nil)))
<span class="linecomment">;;$$       ;; Complete text only up through the common root. NOT USED.</span>
<span class="linecomment">;;       ((and icicle-dabbrev-stop-at-common-root-p</span>
<span class="linecomment">;;             (not (string-equal init ""))</span>
<span class="linecomment">;;             (not (string-equal (downcase init) (downcase abbrev))))</span>
<span class="linecomment">;;        (message "Use `%s' again to complete further"</span>
<span class="linecomment">;;                 (icicle-key-description (this-command-keys)</span>
<span class="linecomment">;;                                         (not icicle-key-descriptions-use-&lt;&gt;-flag)))</span>
<span class="linecomment">;;        (if (&lt; emacs-major-version 21)</span>
<span class="linecomment">;;            (dabbrev--substitute-expansion nil abbrev init)</span>
<span class="linecomment">;;          (dabbrev--substitute-expansion nil abbrev init nil))</span>
<span class="linecomment">;;        (when (window-minibuffer-p (selected-window)) (message nil))) ; $$ NEEDED?</span>
      (t
       <span class="linecomment">;; String is a common root already.  Use Icicles completion.</span>
       (icicle-highlight-lighter)
       (message "<span class="quote">Making completion list...</span>")
       (search-backward abbrev)
       (replace-match "<span class="quote"></span>")
       (condition-case nil
           (let* ((icicle-show-Completions-initially-flag  t)
                  (icicle-incremental-completion-p         'display)
                  (minibuffer-completion-table             my-obarray)
                  (choice
                   (completing-read "<span class="quote">Complete: </span>" my-obarray nil nil init nil init)))
             (when choice (insert choice)))
         (quit (insert abbrev)))))))

(defun icicle-dabbrev--abbrev-at-point ()
  "<span class="quote">Like `dabbrev--abbrev-at-point', but returns \"\" if there is no match.
Vanilla `dabbrev--abbrev-at-point' raises an error if no match.</span>"
  (let ((abv "<span class="quote"></span>"))
    (setq dabbrev--last-abbrev-location  (point)) <span class="linecomment">; Record the end of the abbreviation.</span>
    (unless (bobp)
      (save-excursion                   <span class="linecomment">; Return abbrev at point</span>
        <span class="linecomment">;; If we aren't right after an abbreviation, move point back to just after one.</span>
        <span class="linecomment">;; This is so the user can get successive words by typing the punctuation followed by M-/.</span>
        (save-match-data
          (when (and (save-excursion
                       (forward-char -1)
                       (not (looking-at
                             (concat "<span class="quote">\\(</span>" (or dabbrev-abbrev-char-regexp "<span class="quote">\\sw\\|\\s_</span>") "<span class="quote">\\)+</span>"))))
                     (re-search-backward (or dabbrev-abbrev-char-regexp "<span class="quote">\\sw\\|\\s_</span>") nil t))
            (forward-char 1)))
        (dabbrev--goto-start-of-abbrev) <span class="linecomment">; Now find the beginning of that one.</span>
        (setq abv  (buffer-substring-no-properties dabbrev--last-abbrev-location (point)))))
    abv))


<span class="linecomment">;; REPLACE ORIGINAL `bbdb-complete-name' defined in `bbdb-com.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Note: BBDB, the Insidious Big Brother Database, is available here:</span>
<span class="linecomment">;;       http://bbdb.sourceforge.net/.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Free vars here: `bbdb-*' are bound in `bbdb-com.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-bbdb-complete-name (&optional start-pos)
  "<span class="quote">Complete the user full-name or net-address before point.
Completes only up to the preceding newline, colon, or comma, or the
value of START-POS.

If what has been typed is unique, insert an entry of the form \"User
Name &lt;net-addr&gt;\" (but see `bbdb-dwim-net-address-allow-redundancy').
If it is a valid completion but not unique, you can choose from the
list of completions using Icicles completion.

If your input is completed and `bbdb-complete-name-allow-cycling' is
true, then you can repeat to cycle through the nets for the matching
record.

When called with a prefix arg, display a list of all nets.  You can
control completion behaviour using `bbdb-completion-type'.</span>"
  (interactive)
  (unless (and (require 'bbdb nil t) (require 'bbdb-com nil t))
    (error "<span class="quote">`icicle-bbdb-complete-name' requires BBDB</span>"))
  (let* ((end                  (point))
         (beg                  (or start-pos (save-excursion (re-search-backward
                                                              "<span class="quote">\\(\\`\\|[\n:,]\\)[ \t]*</span>")
                                                             (goto-char (match-end 0)) (point))))
         (orig                 (buffer-substring beg end))
         (typed                (downcase orig))
         (pattern              (bbdb-string-trim typed))
         <span class="linecomment">;; DADAMS -</span>
         <span class="linecomment">;; Replaced `(bbdb-hashtable)' by its expansion (bbdb-with-db-buffer ... bbdb-hashtable),</span>
         <span class="linecomment">;; to avoid the silly macro altogether and simplify user byte-compiling a little.</span>
         (ht                   (bbdb-with-db-buffer (bbdb-records nil t) bbdb-hashtable))
         <span class="linecomment">;; Make a list of possible completion strings (all-the-completions), and a flag to</span>
         <span class="linecomment">;; indicate if there's a single matching record or not (only-one-p).</span>
         (only-one-p           t)
         (all-the-completions  ())
         (pred
          #'(lambda (sym)
              (and (bbdb-completion-predicate sym)
                   (progn
                     (when (and only-one-p all-the-completions
                                (or
                                 <span class="linecomment">;; Not sure about this. More than one record attached to the symbol?</span>
                                 <span class="linecomment">;; Does that happen?</span>
                                 (&gt; (length (symbol-value sym)) 1)
                                 <span class="linecomment">;; This is the doozy. Multiple syms which all match the same record.</span>
                                 (delete t (mapcar #'(lambda (x)
                                                       (equal (symbol-value x) (symbol-value sym)))
                                                   all-the-completions))))
                       (setq only-one-p  nil))
                     (if (memq sym all-the-completions)
                         nil
                       (setq all-the-completions  (cons sym all-the-completions)))))))
         (completion           (progn (all-completions pattern ht pred)
                                      (try-completion pattern ht)))
         (exact-match          (eq completion t)))
    (cond
      <span class="linecomment">;; No matches found OR you're trying completion on an already-completed record.</span>
      <span class="linecomment">;; In the latter case, we might have to cycle through the nets for that record.</span>
      ((or (null completion)
           (and bbdb-complete-name-allow-cycling
                exact-match             <span class="linecomment">; Which is a net of the record</span>
                (member orig (bbdb-record-net (car (symbol-value (intern-soft pattern ht)))))))
       (bbdb-complete-name-cleanup)     <span class="linecomment">; Clean up the completion buffer, if it exists</span>
       (unless (catch 'bbdb-cycling-exit <span class="linecomment">; Check for cycling</span>
                 <span class="linecomment">;; Jump straight out if we're not cycling</span>
                 (unless bbdb-complete-name-allow-cycling (throw 'bbdb-cycling-exit nil))
                 <span class="linecomment">;; Find the record we're working on.</span>
                 (let* ((addr  (funcall bbdb-extract-address-components-func orig))
                        (rec  (and (listp addr)
                                   <span class="linecomment">;; For now, we ignore the case where this returns more than</span>
                                   <span class="linecomment">;; one record.  Ideally, the last expansion would be stored</span>
                                   <span class="linecomment">;; in a buffer-local variable, perhaps.</span>
                                   (car (bbdb-search-intertwingle (caar addr)
                                                                  (car (cdar addr)))))))
                   (unless rec (throw 'bbdb-cycling-exit nil))
                   (if current-prefix-arg
                       <span class="linecomment">;; Use completion buffer</span>
                       (let ((standard-output  (get-buffer-create "<span class="quote">*Completions*</span>")))
                         <span class="linecomment">;; A previously existing buffer has to be cleaned first</span>
                         (with-current-buffer standard-output
                           (setq buffer-read-only  nil)
                           (erase-buffer))
                         (display-completion-list
                          (mapcar #'(lambda (n) (bbdb-dwim-net-address rec n))
                                  (bbdb-record-net rec)))
                         (delete-region beg end)
                         (switch-to-buffer standard-output))
                     <span class="linecomment">;; Use next address</span>
                     (let* ((addrs      (bbdb-record-net rec))
                            (this-addr  (or (cadr (member (car (cdar addr)) addrs))
                                            (nth 0 addrs))))
                       (if (= (length addrs) 1)
                           (throw 'bbdb-cycling-exit t) <span class="linecomment">; No alternatives. don't signal an error.</span>
                         <span class="linecomment">;; Replace with new mail address</span>
                         (delete-region beg end)
                         (insert (bbdb-dwim-net-address rec this-addr))
                         (run-hooks 'bbdb-complete-name-hooks)
                         (throw 'bbdb-cycling-exit t))))))
         <span class="linecomment">;; FALL THROUGH.  Check mail aliases</span>
         (when (and (or (not bbdb-expand-mail-aliases) (not (expand-abbrev)))
                    bbdb-complete-name-hooks)
           (message "<span class="quote">No completion for `%s'</span>" pattern) (icicle-ding)))) <span class="linecomment">; no matches</span>

      <span class="linecomment">;; Match for a single record. If cycling is enabled then we don't</span>
      <span class="linecomment">;; care too much about the exact-match part.</span>
      ((and only-one-p (or exact-match bbdb-complete-name-allow-cycling))
       (let* ((sym   (if exact-match (intern-soft pattern ht) (car all-the-completions)))
              (recs  (symbol-value sym))
              the-net match-recs lst primary matched)
         (while recs
           (when (bbdb-record-net (car recs))
             <span class="linecomment">;; Did we match on name?</span>
             (let ((b-r-name  (or (bbdb-record-name (car recs)) "<span class="quote"></span>")))
               (if (string= pattern (substring (downcase b-r-name) 0
                                               (min (length b-r-name) (length pattern))))
                   (setq match-recs  (cons (car recs) match-recs)
                         matched     t)))
             <span class="linecomment">;; Did we match on aka?</span>
             (unless matched
               (setq lst  (bbdb-record-aka (car recs)))
               (while lst
                 (if (string= pattern (substring (downcase (car lst)) 0
                                                 (min (length (downcase (car lst)))
                                                      (length pattern))))
                     (setq match-recs  (append match-recs (list (car recs)))
                           matched     t
                           lst         ())
                   (setq lst  (cdr lst)))))
             <span class="linecomment">;; Name didn't match name so check net matching</span>
             (unless matched
               (setq lst      (bbdb-record-net (car recs))
                     primary  t)        <span class="linecomment">; primary wins over secondary...</span>
               (while lst
                 (if (string= pattern (substring (downcase (car lst)) 0
                                                 (min (length (downcase (car lst)))
                                                      (length pattern))))
                     (setq the-net     (car lst)
                           lst         ()
                           match-recs  (if primary
                                           (cons (car recs) match-recs)
                                         (append match-recs (list (car recs))))))
                 (setq lst      (cdr lst)
                       primary  nil))))
           (setq recs     (cdr recs)    <span class="linecomment">; Next rec for loop.</span>
                 matched  nil))
         (unless match-recs (error "<span class="quote">Only exact matching record has net field</span>"))
         <span class="linecomment">;; Replace the text with the expansion</span>
         (delete-region beg end)
         (insert (bbdb-dwim-net-address (car match-recs) the-net))
         <span class="linecomment">;; If we're past fill-column, wrap at the previous comma.</span>
         (when (and (bbdb-auto-fill-function) (&gt;= (current-column) fill-column))
           (let ((p  (point))
                 bol)
             (save-excursion
               (beginning-of-line)
               (setq bol  (point))
               (goto-char p)
               (when (search-backward "<span class="quote">,</span>" bol t) (forward-char 1) (insert "<span class="quote">\n   </span>")))))
         <span class="linecomment">;; Update the *BBDB* buffer if desired.</span>
         (when bbdb-completion-display-record
           (let ((bbdb-gag-messages  t))
             (bbdb-pop-up-bbdb-buffer)
             (bbdb-display-records-1 match-recs t)))
         (bbdb-complete-name-cleanup)
         <span class="linecomment">;; Call the exact-completion hook</span>
         (run-hooks 'bbdb-complete-name-hooks)))

      <span class="linecomment">;; Partial match.  Note: we can't use the trimmed version of the pattern here or</span>
      <span class="linecomment">;; we'll recurse infinitely on e.g. common first names.</span>
      ((and (stringp completion) (not (string= typed completion)))
       (delete-region beg end)
       (insert completion)
       (setq end  (point))
       (let ((last                              "<span class="quote"></span>")
             (bbdb-complete-name-allow-cycling  nil))
         (while (and (stringp completion) (not (string= completion last))
                     (setq last        completion
                           pattern     (downcase orig)
                           completion  (progn (all-completions pattern ht pred)
                                              (try-completion pattern ht))))
           (when (stringp completion) (delete-region beg end) (insert completion)))
         (bbdb-complete-name beg)))     <span class="linecomment">; RECURSE &lt;================</span>

      <span class="linecomment">;; Exact match, but more than one record</span>
      (t
       (unless (eq (selected-window) (minibuffer-window)) (message "<span class="quote">Making completion list...</span>"))
       (let (dwim-completions uniq nets net name akas)
         <span class="linecomment">;; Collect all the dwim-addresses for each completion, but only once for each record.</span>
         <span class="linecomment">;; Add if the net is part of the completions.</span>
         (bbdb-mapc #'(lambda (sym)
                        (bbdb-mapc
                         #'(lambda (rec)
                             (unless (member rec uniq)
                               (setq uniq  (cons rec uniq)
                                     nets  (bbdb-record-net rec)
                                     name  (downcase (or (bbdb-record-name rec) "<span class="quote"></span>"))
                                     akas  (mapcar 'downcase (bbdb-record-aka rec)))
                               (while nets
                                 (setq net  (car nets))
                                 (when (cond
                                         ((and (member bbdb-completion-type <span class="linecomment">; Primary</span>
                                                       '(primary primary-or-name))
                                               (member (intern-soft (downcase net) ht)
                                                       all-the-completions))
                                          (setq nets  ())
                                          t)
                                         ((and name (member bbdb-completion-type <span class="linecomment">; Name</span>
                                                            '(nil name primary-or-name))
                                               (let ((cname  (symbol-name sym)))
                                                 (or (string= cname name)
                                                     (member cname akas))))
                                          (setq name  nil)
                                          t)
                                         ((and (member bbdb-completion-type '(nil net)) <span class="linecomment">; Net</span>
                                               (member (intern-soft (downcase net) ht)
                                                       all-the-completions)))
                                         <span class="linecomment">;; (name-or-)primary</span>
                                         ((and (member bbdb-completion-type
                                                       '(name-or-primary))
                                               (let ((cname  (symbol-name sym)))
                                                 (or (string= cname name)
                                                     (member cname akas))))
                                          (setq nets  ())
                                          t))
                                   (setq dwim-completions
                                         (cons (bbdb-dwim-net-address rec net)
                                               dwim-completions))
                                   (when exact-match (setq nets  ())))
                                 (setq nets  (cdr nets)))))
                         (symbol-value sym)))
                    all-the-completions)
         (cond ((and dwim-completions (null (cdr dwim-completions))) <span class="linecomment">; Insert the unique match.</span>
                (delete-region beg end) (insert (car dwim-completions)) (message "<span class="quote"></span>"))
               (t                       <span class="linecomment">; More than one match.  Use Icicles minibuffer completion.</span>
                (condition-case nil
                    (let* ((icicle-show-Completions-initially-flag      t)
                           (icicle-incremental-completion-p             'display)
                           (icicle-top-level-when-sole-completion-flag  t)
                           (completion-ignore-case                      t)
                           (choice
                            (save-excursion
                              (completing-read "<span class="quote">Complete: </span>" (mapcar #'list dwim-completions)
                                               nil t pattern nil pattern))))
                      (when choice
                        (delete-region beg end)
                        (insert choice)))
                  (error nil))
                (unless (eq (selected-window) (minibuffer-window))
                  (message "<span class="quote">Making completion list...done</span>")))))))))


<span class="linecomment">;; REPLACE ORIGINAL `lisp-complete-symbol' (&lt; Emacs 23.2),</span>
<span class="linecomment">;; defined in `lisp.el', saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Select `*Completions*' window even if on another frame.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-lisp-complete-symbol)
  (defalias 'old-lisp-complete-symbol (symbol-function 'lisp-complete-symbol)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-lisp-complete-symbol (&optional predicate) <span class="linecomment">; `M-TAB' (`C-M-i', `ESC-TAB'), globally.</span>
  "<span class="quote">Complete the Lisp symbol preceding point against known Lisp symbols.
If there is more than one completion, use the minibuffer to complete.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered, e.g. `commandp'.

If PREDICATE is nil, the context determines which symbols are
considered.  If the symbol starts just after an open-parenthesis, only
symbols with function definitions are considered.  Otherwise, all
symbols with function definitions, values or properties are
considered.</span>"
  (interactive)
  (let* ((end            (point))
         (buffer-syntax  (syntax-table))
         (beg            (unwind-protect
                              (save-excursion
                                (set-syntax-table emacs-lisp-mode-syntax-table)
                                (backward-sexp 1)
                                (while (= (char-syntax (following-char)) ?\') (forward-char 1))
                                (point))
                           (set-syntax-table buffer-syntax)))
         (pattern       (buffer-substring beg end))
         (new           (try-completion pattern obarray)))
    (unless (stringp new) (setq new  pattern))
    (delete-region beg end)
    (insert new)
    (setq end  (+ beg (length new)))
    (if (and (not (string= new "<span class="quote"></span>")) (not (string= (downcase new) (downcase pattern)))
             (&lt; (length (all-completions new obarray)) 2))
        (message "<span class="quote">Completed (no other completions)</span>")
      <span class="linecomment">;; Use minibuffer to choose a completion.</span>
      (let* ((enable-recursive-minibuffers                (active-minibuffer-window))
             (icicle-top-level-when-sole-completion-flag  t)
             (icicle-orig-window                          (selected-window)) <span class="linecomment">; For alt actions.</span>
             (alt-fn                                      nil)
             (icicle-show-Completions-initially-flag      t)
             (icicle-candidate-alt-action-fn
              (or icicle-candidate-alt-action-fn
                  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">symbol</span>"))))
             (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
              (or icicle-all-candidates-list-alt-action-fn alt-fn
                  (icicle-alt-act-fn-for-type "<span class="quote">symbol</span>")))
             (predicate
              (or predicate
                  (save-excursion
                    (goto-char beg)
                    (if (not (eq (char-before) ?\( ))
                        #'(lambda (sym) <span class="linecomment">;why not just nil ?   -sm</span>
                            (or (boundp sym) (fboundp sym) (symbol-plist sym)))
                      <span class="linecomment">;; If first element of parent list is not an open paren, assume that this is a</span>
                      <span class="linecomment">;; funcall position: use `fboundp'.  If not, then maybe this is a variable in</span>
                      <span class="linecomment">;; a `let' binding, so no predicate: use nil.</span>
                      (and (not (condition-case nil
                                    (progn (up-list -2) (forward-char 1) (eq (char-after) ?\( ))
                                  (error nil)))
                           'fboundp))))))
        <span class="linecomment">;; $$$$$ Could bind `icicle-must-pass-after-match-predicate' to a predicate on interned</span>
        <span class="linecomment">;;       candidate and pass nil as PRED to `completing-read'.  Don't bother for now.</span>
        (setq new  (save-excursion (completing-read "<span class="quote">Complete Lisp symbol: </span>"
                                                    obarray predicate t new)))))
    (delete-region beg end)
    (insert new)))


<span class="linecomment">;; REPLACE ORIGINAL `lisp-completion-at-point' (&gt;= Emacs 23.2),</span>
<span class="linecomment">;; defined in `lisp.el', saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Select `*Completions*' window even if on another frame.</span>
<span class="linecomment">;;</span>
(when (fboundp 'completion-at-point)    <span class="linecomment">; Emacs 23.2+.</span>
  (unless (fboundp 'old-lisp-completion-at-point)
    (defalias 'old-lisp-completion-at-point (symbol-function 'lisp-completion-at-point))
    <span class="linecomment">;; Return a function that does all of the completion.</span>
    (defun icicle-lisp-completion-at-point () #'icicle-lisp-complete-symbol)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-icicles-group ()
  "<span class="quote">Customize Icicles options and faces.  View their documentation.</span>"
  (interactive)
  (customize-group-other-window 'Icicles))

<span class="linecomment">;;;###autoload</span>
(defun icicle-send-bug-report ()
  "<span class="quote">Send a bug report about an Icicles problem.</span>"
  (interactive)
  (browse-url (format (concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
Icicles bug: \
&body=Describe bug below, using a precise recipe that starts with `emacs -Q' or `emacs -q'.  \
Each Icicles file has a header `Update #' that you can use to identify it.\
%%0A%%0AEmacs version: %s.</span>")
                      (emacs-version))))


<span class="linecomment">;; REPLACE ORIGINAL `customize-face' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Multi-command version.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-customize-face)
  (defalias 'old-customize-face (symbol-function 'customize-face)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-face (face)
  "<span class="quote">Customize face FACE.
Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down'  - Move to next completion candidate and act
`C-up'    - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`M-!'     - Act on *all* candidates (or all that are saved):
            Customize all in the same buffer.
`C-!'     - Act on *all* candidates (or all that are saved):
            Customize each in a separate buffer.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
or `C-g' to quit.

With a prefix argument, you can enter multiple faces at the same time
with `RET' (in Emacs 22 or later).  This gives you the completion
behavior of `customize-face' in vanilla Emacs.  The advantage is that
the default value is the list of all faces under the cursor.  The
disadvantage is that face candidates are not WYSIWYG in buffer
`*Completions*'.

This is an Icicles command - see command `icicle-mode'.</span>"
  (interactive
   (list (let* ((icicle-list-use-nth-parts             '(1))
                (icicle-candidate-action-fn
                 #'(lambda (x)
                     (old-customize-face (intern (icicle-transform-multi-completion x)))
                     (select-window (minibuffer-window))
                     (select-frame-set-input-focus (selected-frame))))
                (icicle-all-candidates-list-action-fn  'icicle-customize-faces)
                (icicle-orig-window                    (selected-window)) <span class="linecomment">; For alt actions.</span>
                (alt-fn                                nil)
                (icicle-candidate-alt-action-fn
                 (or icicle-candidate-alt-action-fn
                     (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
                (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
                 (or icicle-all-candidates-list-alt-action-fn
                     alt-fn (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
           (if (and (&gt; emacs-major-version 21) current-prefix-arg)
               (read-face-name "<span class="quote">Customize face: </span>" "<span class="quote">all faces</span>" t)
             (read-face-name "<span class="quote">Customize face: </span>")))))
  (old-customize-face face))


<span class="linecomment">;; REPLACE ORIGINAL `customize-face-other-window' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Multi-command version.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-customize-face-other-window)
  (defalias 'old-customize-face-other-window (symbol-function 'customize-face-other-window)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-face-other-window (face)
  "<span class="quote">Customize face FACE in another window.
Same as `icicle-customize-face' except it uses a different window.</span>"
  (interactive
   (list (let* ((icicle-list-use-nth-parts             '(1))
                (icicle-candidate-action-fn
                 #'(lambda (x)
                     (old-customize-face-other-window (intern (icicle-transform-multi-completion x)))
                     (select-window (minibuffer-window))
                     (select-frame-set-input-focus (selected-frame))))
                (icicle-all-candidates-list-action-fn  'icicle-customize-faces)
                (icicle-orig-window                    (selected-window)) <span class="linecomment">; For alt actions.</span>
                (alt-fn                                nil)
                (icicle-candidate-alt-action-fn
                 (or icicle-candidate-alt-action-fn
                     (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
                (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
                 (or icicle-all-candidates-list-alt-action-fn
                     alt-fn (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
           (if (and (&gt; emacs-major-version 21) current-prefix-arg)
               (read-face-name "<span class="quote">Customize face: </span>" "<span class="quote">all faces</span>" t)
             (read-face-name "<span class="quote">Customize face: </span>")))))
  (old-customize-face-other-window face))

(defun icicle-customize-faces (faces)
  "<span class="quote">Open Customize buffer on all faces in list FACES.</span>"
  (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
        (icicle-list-join-string            "<span class="quote">: </span>")
        (icicle-list-end-string             "<span class="quote"></span>")
        (icicle-list-use-nth-parts          '(1)))
    (custom-buffer-create
     (custom-sort-items
      (mapcar #'(lambda (f) (list (intern (icicle-transform-multi-completion f)) 'custom-face))
              faces)
      t custom-buffer-order-groups)
     "<span class="quote">*Customize Apropos*</span>")))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-customize-apropos)
  (defalias 'old-customize-apropos (symbol-function 'customize-apropos)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos (regexp &optional all)
  "<span class="quote">Customize all user options matching REGEXP.
If ALL is `options', include only options.
If ALL is `faces', include only faces.
If ALL is `groups', include only groups.
If ALL is t (interactively, with prefix arg), include options which
  are not user-settable, as well as faces and groups.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let* ((pref-arg  current-prefix-arg)
          (icicle-must-pass-after-match-predicate
           #'(lambda (s)
               (setq s  (intern s))
               (or (get s 'custom-group)
                   (custom-facep s)
                   (and (boundp s) (or (get s 'saved-value)
                                       (custom-variable-p s)
                                       (if (null pref-arg)
                                           (user-variable-p s)
                                         (get s 'variable-documentation))))))))
     (list (completing-read "<span class="quote">Customize (regexp): </span>" obarray nil nil nil 'regexp-history)
           pref-arg)))
  (let ((found  nil))
    (mapatoms #'(lambda (symbol)
                  (when (string-match regexp (symbol-name symbol))
                    (when (and (not (memq all '(faces options))) <span class="linecomment">; groups or t</span>
                               (get symbol 'custom-group))
                      (push (list symbol 'custom-group) found))
                    (when (and (not (memq all '(options groups))) <span class="linecomment">; faces or t</span>
                               (custom-facep symbol))
                      (push (list symbol 'custom-face) found))
                    (when (and (not (memq all '(groups faces))) <span class="linecomment">; options or t</span>
                               (boundp symbol)
                               (or (get symbol 'saved-value)
                                   (custom-variable-p symbol)
                                   (if (memq all '(nil options))
                                       (user-variable-p symbol)
                                     (get symbol 'variable-documentation))))
                      (push (list symbol 'custom-variable) found)))))
    (if (not found)
        (error "<span class="quote">No matches</span>")
      (custom-buffer-create (custom-sort-items found t custom-buffer-order-groups)
                            "<span class="quote">*Customize Apropos*</span>"))))

<span class="linecomment">;; Define this for Emacs 20 and 21</span>
(unless (fboundp 'custom-variable-p)
  (defun custom-variable-p (variable)
    "<span class="quote">Return non-nil if VARIABLE is a custom variable.</span>"
    (or (get variable 'standard-value) (get variable 'custom-autoload))))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-faces' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-customize-apropos-faces)
  (defalias 'old-customize-apropos-faces (symbol-function 'customize-apropos-faces)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-faces (regexp)
  "<span class="quote">Customize all user faces matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let ((icicle-must-pass-after-match-predicate #'(lambda (s) (custom-facep (intern s)))))
     (list (completing-read "<span class="quote">Customize faces (regexp): </span>" obarray nil nil nil 'regexp-history))))
  (customize-apropos regexp 'faces))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-groups' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-customize-apropos-groups)
  (defalias 'old-customize-apropos-groups (symbol-function 'customize-apropos-groups)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-groups (regexp)
  "<span class="quote">Customize all user groups matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let ((icicle-must-pass-after-match-predicate  #'(lambda (s) (get (intern s) 'custom-group))))
     (list (completing-read "<span class="quote">Customize groups (regexp): </span>" obarray nil nil nil 'regexp-history))))
  (customize-apropos regexp 'groups))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-options' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-customize-apropos-options)
  (defalias 'old-customize-apropos-options (symbol-function 'customize-apropos-options)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-options (regexp &optional arg)
  "<span class="quote">Customize all user options matching REGEXP.
With prefix argument, include options which are not user-settable.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let* ((pref-arg  current-prefix-arg)
          (icicle-must-pass-after-match-predicate
           #'(lambda (s)
               (setq s  (intern s))
               (and (boundp s) (or (get s 'saved-value)
                                   (custom-variable-p s)
                                   (if (null pref-arg)
                                       (user-variable-p s)
                                     (get s 'variable-documentation)))))))
     (list (completing-read "<span class="quote">Customize options (regexp): </span>" obarray nil nil nil 'regexp-history)
           pref-arg)))
  (customize-apropos regexp (or arg 'options)))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-options-of-type' defined in `cus-edit+.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(when (and (fboundp 'customize-apropos-options-of-type)
           (not (fboundp 'old-customize-apropos-options-of-type)))
  (defalias 'old-customize-apropos-options-of-type
      (symbol-function 'customize-apropos-options-of-type)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-options-of-type (type regexp)
  "<span class="quote">Customize all loaded customizable options of type TYPE that match REGEXP.
With no prefix arg, each option is defined with `defcustom' type TYPE.
With a prefix arg, either each option is defined with `defcustom' type
 TYPE or its current value is compatible with TYPE.

If TYPE is nil (the default value) then all `defcustom' variables are
potential candidates.

Use `S-TAB', `next', and `prior', to match regexp input - this lets
you see which options will be available in the customize buffer.</span>"
  (interactive
   (let ((typ       (car (condition-case err
                             (read-from-string
                              (let ((types ()))
                                (mapatoms
                                 #'(lambda (cand)
                                     (when (custom-variable-p cand)
                                       (push (list (format "<span class="quote">%s</span>"
                                                           (format "<span class="quote">%S</span>" (get cand 'custom-type))))
                                             types))))
                                (completing-read "<span class="quote">Customize all options of type: </span>"
                                                 (icicle-remove-duplicates types)
                                                 nil nil nil nil "<span class="quote">nil</span>")))
                           (end-of-file (error "<span class="quote">No such custom type</span>")))))
         (pref-arg  current-prefix-arg))
     (list typ  (let ((icicle-must-pass-after-match-predicate
                       #'(lambda (s)
                           (setq s  (intern s))
                           (and (boundp s)
                                (or (not (fboundp 'indirect-variable)) (eq (indirect-variable s) s))
                                (or (get s 'saved-value) (custom-variable-p s))
                                (or (not typ) <span class="linecomment">; `typ' = nil means use all types.</span>
                                    (if pref-arg
                                        (condition-case nil
                                            (icicle-var-is-of-type-p s (list typ))
                                          (error nil))
                                      (equal (get s 'custom-type) typ)))))))
                  (completing-read "<span class="quote">Customize options matching (regexp): </span>"
                                   obarray nil nil nil 'regexp-history)))))
  (custom-buffer-create (custom-sort-items
                         (mapcar #'(lambda (s) (list (intern s) 'custom-variable))
                                 icicle-completion-candidates)
                         t "<span class="quote">*Customize Apropos*</span>")))


<span class="linecomment">;; REPLACE ORIGINAL `repeat-complex-command' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the command to repeat, letting you use `S-TAB' and</span>
<span class="linecomment">;; `TAB' to see the history list and `C-,' to toggle sorting that display.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-repeat-complex-command)
  (defalias 'old-repeat-complex-command (symbol-function 'repeat-complex-command)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-repeat-complex-command (arg) <span class="linecomment">; Bound to `C-x ESC ESC', `C-x M-:' in Icicle mode.</span>
  "<span class="quote">Edit and re-evaluate the last complex command, or ARGth from last.
A complex command is one that used the minibuffer.
ARG is the prefix argument numeric value.

You can edit the past command you choose before executing it.  The
Lisp form of the command is used.  If the command you enter differs
from the previous complex command, then it is added to the front of
the command history.

Icicles completion is available for choosing a past command.  You can
still use the vanilla Emacs bindings `\\&lt;minibuffer-local-map&gt;\\[next-history-element]' and \
`\\[previous-history-element]' to cycle inputs,
and `\\[repeat-matching-complex-command]' to match regexp input, but Icicles input cycling (`up',
`down', `next', `prior', `home', `end') and apropos completion
\(`S-TAB') are superior and more convenient.</span>"
  (interactive "<span class="quote">p</span>")
  (let ((elt  (nth (1- arg) command-history))
        newcmd)
    (if elt
        (progn
          (setq newcmd
                (let ((print-level                   nil)
                      (minibuffer-history-position   arg)
                      (minibuffer-history-sexp-flag  (1+ (minibuffer-depth))))
                  (unwind-protect
                       (let ((icicle-transform-function  'icicle-remove-duplicates))
                         (read (completing-read
                                "<span class="quote">Redo: </span>" (mapcar #'(lambda (entry) (list (prin1-to-string entry)))
                                                 command-history)
                                nil nil (prin1-to-string elt) (cons 'command-history arg)
                                (prin1-to-string elt))))
                    <span class="linecomment">;; If command was added to command-history as a string, get rid of that.</span>
                    <span class="linecomment">;; We want only evaluable expressions there.</span>
                    (if (stringp (car command-history))
                        (setq command-history  (cdr command-history))))))
          <span class="linecomment">;; If command to be redone does not match front of history, add it to the history.</span>
          (or (equal newcmd (car command-history))
              (setq command-history  (cons newcmd command-history)))
          (eval newcmd))
      (if command-history
          (error "<span class="quote">Argument %d is beyond length of command history</span>" arg)
        (error "<span class="quote">There are no previous complex commands to repeat</span>")))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-add-entry-to-saved-completion-set (set-name entry type)
  "<span class="quote">Add ENTRY to saved completion-candidates set SET-NAME.
ENTRY is normally a single candidate (a string).
 With a prefix arg, however, and if option
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, then
 ENTRY is the name of an Emacs fileset (Emacs 22 or later).
TYPE is the type of entry to add: `Fileset' or `Candidate'.</span>"
  (interactive
   (let ((typ (if (and current-prefix-arg icicle-filesets-as-saved-completion-sets-flag
                       (prog1 (or (require 'filesets nil t)
                                  (error "<span class="quote">Feature `filesets' not provided</span>"))
                         (filesets-init))
                       filesets-data)
                  'Fileset
                'Candidate)))
     (list
      (save-selected-window
        (completing-read "<span class="quote">Saved completion set: </span>" icicle-saved-completion-sets nil t nil
                         'icicle-completion-set-history))
      (if (eq typ 'Fileset)
          (list ':fileset               <span class="linecomment">; Just save the fileset name, not the data.</span>
                (car (assoc (completing-read "<span class="quote">Fileset to add: </span>" filesets-data nil t)
                            filesets-data)))
        (completing-read "<span class="quote">Candidate to add: </span>" (mapcar #'list icicle-saved-completion-candidates)))
      typ)))
  (let ((file-name  (cdr (assoc set-name icicle-saved-completion-sets))))
    (unless (icicle-file-readable-p file-name) (error "<span class="quote">Cannot read cache file `%s'</span>" file-name))
    (let ((list-buf  (find-file-noselect file-name 'nowarn 'raw))
          candidates newcands entry-type)
      (unwind-protect
           (condition-case icicle-add-entry-to-saved-completion-set
               (when (listp (setq newcands  (setq candidates  (read list-buf))))
                 (message "<span class="quote">Set `%s' read from file `%s'</span>" set-name file-name))
             (error (error "<span class="quote">Bad cache file.  %s</span>"
                           (error-message-string icicle-add-entry-to-saved-completion-set))))
        (kill-buffer list-buf))
      (unless (consp newcands) (error "<span class="quote">Bad data in cache file `%s'</span>" file-name))
      (pushnew entry newcands :test #'equal)
      (setq entry  (if (eq type 'Fileset) (caar entry) entry))
      (if (= (length candidates) (length newcands))
          (message "<span class="quote">%s `%s' is already in saved set `%s', file `%s'</span>" type entry set-name file-name)
        (with-temp-message (format "<span class="quote">Writing entry to cache file `%s'...</span>" file-name)
          (with-temp-file file-name (prin1 newcands (current-buffer))))
        (message "<span class="quote">%s `%s' added to saved set `%s', file `%s'</span>" type entry set-name file-name)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-remove-entry-from-saved-completion-set (set-name)
  "<span class="quote">Remove an entry from saved completion-candidates set SET-NAME.
SET-NAME can be an Icicles saved completions set (cache file) or the
name of an Emacs fileset.

The entry to remove can be a single completion candidate (a string) or
an Emacs fileset.  You can thus remove a file name from a fileset or
remove a fileset from an Icicles saved completion set.  (You can also
remove a file name from a saved completion set.)  If a saved set has
both a file and a fileset of the same name, then both are removed.

To use filesets here, use Emacs 22 or later, load library `filesets',
use `(filesets-init)', and ensure that option
`icicle-filesets-as-saved-completion-sets-flag' is non-nil.</span>"
  (interactive
   (list (completing-read "<span class="quote">Saved completion set: </span>"
                          (if (and icicle-filesets-as-saved-completion-sets-flag
                                   (featurep 'filesets) filesets-data)
                              (append filesets-data icicle-saved-completion-sets)
                            icicle-saved-completion-sets)
                          nil t nil 'icicle-completion-set-history)))
  (let* ((file-name                              (cdr (assoc set-name icicle-saved-completion-sets)))
         (candidates                             (icicle-get-candidates-from-saved-set
                                                  set-name 'dont-expand))
         (icicle-whole-candidate-as-text-prop-p  t)
         (entry
          (funcall icicle-get-alist-candidate-function
                   (completing-read
                    "<span class="quote">Candidate to remove: </span>"
                    (mapcar #'(lambda (e)
                                (cond ((icicle-saved-fileset-p e) <span class="linecomment">; Swap `:fileset' with fileset name</span>
                                       `(,(cadr e) ,(car e) ,@(cddr e)))
                                      ((consp e) e)
                                      (t (list e)))) <span class="linecomment">; Listify naked string.</span>
                            candidates)
                    nil t))))
    (when (and (consp entry) (eq (cadr entry) ':fileset)) <span class="linecomment">; Swap back again: `:fileset' and name.</span>
      (setq entry  `(,(cadr entry) ,(car entry) ,@(cddr entry))))
    (when (and (consp entry) (null (cdr entry))) (setq entry  (car entry))) <span class="linecomment">; Use just the string.</span>
    <span class="linecomment">;; Delete any such candidate, then remove text properties used for completion.</span>
    (setq candidates  (mapcar #'icicle-unpropertize (delete entry candidates)))
    (cond (file-name
           (with-temp-message           <span class="linecomment">; Remove from cache file.</span>
               (format "<span class="quote">Writing remaining candidates to cache file `%s'...</span>" file-name)
             (with-temp-file file-name (prin1 candidates (current-buffer)))))
          ((icicle-saved-fileset-p (list ':fileset set-name)) <span class="linecomment">; Remove from fileset.</span>
           (unless (require 'filesets nil t) (error "<span class="quote">Feature `filesets' not provided</span>"))
           (filesets-init)
           (let ((fst  (and filesets-data (assoc set-name filesets-data)))) <span class="linecomment">; The fileset itself.</span>
             (unless fst (error "<span class="quote">No such fileset: `%s'</span>" set-name))
             (let ((fst-files  (filesets-entry-get-files fst)))
               (if (car (filesets-member entry fst-files :test 'filesets-files-equalp))
                   (if fst-files        <span class="linecomment">; Similar to code in `filesets-remove-buffer'.</span>
                       (let ((new-fst  (list (cons ':files (delete entry fst-files)))))
                         (setcdr fst new-fst)
                         (filesets-set-config set-name 'filesets-data filesets-data))
                     (message "<span class="quote">Cannot remove `%s' from fileset `%s'</span>" entry set-name))
                 (message "<span class="quote">`%s' not in fileset `%s'</span>" entry set-name))))))
    (icicle-msg-maybe-in-minibuffer
     (concat (format "<span class="quote">`%s' removed from %s `%s'</span>"
                     (if (icicle-saved-fileset-p entry) (cadr entry) entry)
                     (if (icicle-saved-fileset-p entry) "<span class="quote">fileset</span>" "<span class="quote">saved set</span>")
                     set-name)
             (and file-name (format "<span class="quote">, file `%s'</span>" file-name))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-saved-completion-set "icicles-cmd1.el")</span>
(icicle-define-command icicle-remove-saved-completion-set <span class="linecomment">; Command name</span>
  "<span class="quote">Remove an entry from `icicle-saved-completion-sets'.
Save the updated option.
You are prompted to also delete the associated cache file.
You can add entries to `icicle-saved-completion-sets' using command
`icicle-add/update-saved-completion-set'.</span>" <span class="linecomment">; Doc string</span>
  icicle-remove-saved-set-action
  "<span class="quote">Remove set of completion candidates named: </span>" <span class="linecomment">; `completing-read' args</span>
  icicle-saved-completion-sets nil t nil 'icicle-completion-set-history nil nil
  ((icicle-whole-candidate-as-text-prop-p  t) <span class="linecomment">; Additional bindings</span>
   (icicle-use-candidates-only-once-flag   t))
  nil nil (icicle-remove-Completions-window)) <span class="linecomment">; First code, undo code, last code</span>

(defun icicle-remove-saved-set-action (set-name)
  "<span class="quote">Remove saved set SET-NAME from `icicle-saved-completion-sets'.</span>"
  (let ((enable-recursive-minibuffers  t)
        (sets                          icicle-saved-completion-sets)
        set cache)
    (save-selected-window
      (select-window (minibuffer-window))
      (while (setq set    (assoc set-name sets)
                   cache  (cdr set))
        (when (file-exists-p cache)
          (if (y-or-n-p (format "<span class="quote">Delete cache file `%s'? </span>" cache))
              (when (condition-case err
                        (progn (delete-file cache) t)
                      (error (progn (message (error-message-string err)) nil)))
                (message "<span class="quote">DELETED `%s'</span>" cache) (sit-for 1))
            (message "<span class="quote">OK, file NOT deleted</span>") (sit-for 1)))
        (setq sets  (delete set sets)))))
  (setq icicle-saved-completion-sets
        (icicle-assoc-delete-all set-name icicle-saved-completion-sets))
  (funcall icicle-customize-save-variable-function
           'icicle-saved-completion-sets
           icicle-saved-completion-sets)
  (message "<span class="quote">Candidate set `%s' removed</span>" set-name))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-save-marked-files (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in *Bookmark List*.</span>
  "<span class="quote">Save file names of marked bookmarks as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.  Marked bookmarks that have no associated file are ignored.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">Command `icicle-bookmark-save-marked-files' requires library Bookmark+</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-save-marked-files-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in *Bookmark List*.</span>
  "<span class="quote">Add the file names of the marked bookmarks to the saved candidates set.
Marked bookmarks that have no associated file are ignored.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates remain saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-&lt;'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">Command `icicle-bookmark-save-marked-files-more' requires library Bookmark+</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-save-marked-files-to-variable () <span class="linecomment">; Bound to `C-M-}' in *Bookmark List*.</span>
  "<span class="quote">Save the file names of the marked bookmarks to a variable.
Marked bookmarks that have no associated file are ignored.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive)
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">Command `icicle-bookmark-save-marked-files-to-variable' requires library Bookmark+</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) 99))

<span class="linecomment">;;;###autoload</span>
(defalias 'icicle-bookmark-save-marked-files-as-project <span class="linecomment">; Bound to `C-}' in *Bookmark List*.</span>
    'icicle-bookmark-save-marked-files-persistently)
<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-save-marked-files-persistently (filesetp)
  "<span class="quote">Save the file names of the marked bookmarks as a persistent set.
Marked bookmarks that have no associated file are ignored.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">This command requires library Bookmark+</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) (if filesetp 0 '(1))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in Dired.</span>
  "<span class="quote">Save the marked file names in Dired as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">Command `icicle-dired-save-marked' must be called from a Dired buffer</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in Dired.</span>
  "<span class="quote">Add the marked file names in Dired to the saved candidates set.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates are still saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-&lt;'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">`icicle-dired-save-marked-more' must be called from a Dired buffer</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked-to-variable () <span class="linecomment">; Bound to `C-M-}' in Dired.</span>
  "<span class="quote">Save the marked file names in Dired to a variable as a candidate set.
You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive)
  (icicle-candidate-set-save-1 (dired-get-marked-files) 99))

<span class="linecomment">;;;###autoload</span>
(defalias 'icicle-dired-save-marked-as-project <span class="linecomment">; Bound to `C-}' in Dired.</span>
    'icicle-dired-save-marked-persistently)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked-persistently (filesetp)
  "<span class="quote">Save the marked file names in Dired as a persistent set.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save-1 (dired-get-marked-files) (if filesetp 0 '(1))))


(put 'icicle-dired-saved-file-candidates 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defalias 'icicle-dired-chosen-files 'icicle-dired-saved-file-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-saved-file-candidates (prompt-for-dir-p)
  "<span class="quote">Open Dired on a set of files and directories of your choice.
If you have saved a set of file names using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix argument, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
  (unless icicle-saved-completion-candidates
    (error (substitute-command-keys "<span class="quote">No saved completion candidates.  \
Use \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-set-save]' to save candidates</span>")))
  (let* ((default-directory           (if prompt-for-dir-p
                                          (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                                        default-directory))
         (icicle-list-use-nth-parts   '(1))
         (file-names                  (icicle-remove-if
                                       #'(lambda (fil) (or (null fil) (not (file-exists-p fil))))
                                       (or (and icicle-saved-completion-candidates
                                                (mapcar #'icicle-transform-multi-completion
                                                        icicle-saved-completion-candidates))
                                           (icicle-file-list)))))
    (dired (cons (generate-new-buffer-name "<span class="quote">Icy File Set</span>") (nreverse file-names)))))

<span class="linecomment">;;;###autoload</span>
(defalias 'icicle-dired-chosen-files-other-window 'icicle-dired-saved-file-candidates-other-window)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-saved-file-candidates-other-window (prompt-for-dir-p) <span class="linecomment">; Bound `C-M-&lt;' in Dired.</span>
  "<span class="quote">Open Dired in other window on set of files & directories of your choice.
If you have saved a set of file names using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix arg, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
  (let* ((default-directory           (if prompt-for-dir-p
                                          (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                                        default-directory))
         (icicle-list-use-nth-parts   '(1))
         (file-names                  (icicle-remove-if
                                       #'(lambda (fil) (or (null fil) (not (file-exists-p fil))))
                                       (or (and icicle-saved-completion-candidates
                                                (mapcar #'icicle-transform-multi-completion
                                                        icicle-saved-completion-candidates))
                                           (icicle-file-list)))))
    (dired-other-window (cons (generate-new-buffer-name "<span class="quote">Icy File Set</span>") (nreverse file-names)))))

(put 'icicle-dired-project 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-project (prompt-for-dir-p)
  "<span class="quote">Open Dired on a saved project.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `bookmark+.el'.</span>"
  (interactive "<span class="quote">P</span>")
  (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-dired-other-window))
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-dired-other-window))
  (unwind-protect
       <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
       (let ((set-name  (completing-read "<span class="quote">Project (saved file names): </span>"
                                         (if (and icicle-filesets-as-saved-completion-sets-flag
                                                  (featurep 'filesets) filesets-data)
                                             (append filesets-data icicle-saved-completion-sets)
                                           icicle-saved-completion-sets)
                                         nil nil nil 'icicle-completion-set-history)))
         (icicle-retrieve-candidates-from-set set-name)
         (let* ((default-directory  (if prompt-for-dir-p
                                        (read-file-name "<span class="quote">Dired directory: </span>" nil
                                                        default-directory nil)
                                      default-directory))
                (file-names         ()))
           (dolist (f  icicle-saved-completion-candidates)
             (when (file-exists-p f) (push f file-names)))
           (unless file-names (error "<span class="quote">No files in project `%s' actually exist</span>" set-name))
           (dired (cons (generate-new-buffer-name set-name)
                        (nreverse (mapcar #'(lambda (file)
                                              (if (file-name-absolute-p file)
                                                  (expand-file-name file)
                                                file))
                                          file-names))))))
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-project-other-window (prompt-for-dir-p) <span class="linecomment">; Bound to `C-{' in Dired.</span>
  "<span class="quote">Open Dired on a saved project in another window.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `bookmark+.el'.</span>"
  (interactive "<span class="quote">P</span>")
  (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-dired-other-window))
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-dired-other-window))
  (unwind-protect
       <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
       (let ((set-name  (completing-read "<span class="quote">Project (saved file names): </span>"
                                         (if (and icicle-filesets-as-saved-completion-sets-flag
                                                  (featurep 'filesets) filesets-data)
                                             (append filesets-data icicle-saved-completion-sets)
                                           icicle-saved-completion-sets)
                                         nil nil nil 'icicle-completion-set-history)))
         (icicle-retrieve-candidates-from-set set-name)
         (let* ((default-directory  (if prompt-for-dir-p
                                        (read-file-name "<span class="quote">Dired directory: </span>" nil
                                                        default-directory nil)
                                      default-directory))
                (file-names         ()))
           (dolist (f  icicle-saved-completion-candidates)
             (when (file-exists-p f) (push f file-names)))
           (unless file-names (error "<span class="quote">No files in project `%s' actually exist</span>" set-name))
           (dired-other-window (cons (generate-new-buffer-name set-name)
                                     (nreverse (mapcar #'(lambda (file)
                                                           (if (file-name-absolute-p file)
                                                               (expand-file-name file)
                                                             file))
                                                       file-names))))))
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-grep-saved-file-candidates (command-args)
  "<span class="quote">Run `grep' on the set of completion candidates saved with \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]'.
Saved names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the default
directory.</span>"
  (interactive
   (list
    (let ((file-names  ()))
      (unless icicle-saved-completion-candidates
        (error (substitute-command-keys "<span class="quote">No saved completion candidates.  \
Use \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-set-save]' to save candidates</span>")))
      (unless grep-command (grep-compute-defaults))
      (dolist (f  icicle-saved-completion-candidates) (when (file-exists-p f) (push f file-names)))
      (let ((default  (and (fboundp 'grep-default-command) (grep-default-command))))
        (read-from-minibuffer
         "<span class="quote">grep &lt;pattern&gt; &lt;files&gt; :  </span>"
         (let ((up-to-files  (concat grep-command "<span class="quote">   </span>")))
           (cons (concat up-to-files (mapconcat #'identity icicle-saved-completion-candidates "<span class="quote"> </span>"))
                 (- (length up-to-files) 2)))
         nil nil 'grep-history default)))))
  (grep command-args))

<span class="linecomment">;; Utility function.  Use it to define multi-commands that navigate.</span>
(defun icicle-explore (define-candidates-fn final-action-fn quit-fn error-fn cleanup-fn prompt
                       &rest compl-read-args)
  "<span class="quote">Icicle explorer: explore complex completion candidates.
Navigate among locations or other entities represented by a set of
completion candidates.  See `icicle-search' for a typical example.

Arguments:
 DEFINE-CANDIDATES-FN:
   Function of no args called to fill `icicle-candidates-alist' with
   the candidates.
 FINAL-ACTION-FN:
   Function of no args called after the final choice of candidate
   (after both `icicle-explore-final-choice' and
   `icicle-explore-final-choice-full' have been set).  Typically uses
   `icicle-explore-final-choice-full', the full candidate.
 QUIT-FN: Function of no args called if user uses `C-g'.
 ERROR-FN: Function of no args called if an error is raised.
 CLEANUP-FN: Function of no args called after exploring.
 PROMPT: Prompt string for `completing-read'.
 COMPL-READ-ARGS: `completing-read' args other than PROMPT and
   COLLECTION.

If there is only one candidate, then FINAL-ACTION-FN is called
immediately.  The candidate is not available to act on (e.g. using
``C-S-RET').

Returns:
 The result of executing FINAL-ACTION-FN, if that arg is non-nil.
 Otherwise, `icicle-explore-final-choice-full'.

To use `icicle-explore' to define a multi-command, you must also bind
`icicle-candidate-action-fn'.

Though `icicle-explore' is typically used to define navigation
commands, it need not be.  It can be useful anytime you need to use
`completing-read' and also provide specific behavior for quitting
\(`C-g'), completion errors, and final actions.</span>"
  (let ((icicle-incremental-completion-flag     'always)
        (icicle-whole-candidate-as-text-prop-p  t)
        (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
        (icicle-act-before-cycle-flag           icicle-act-before-cycle-flag)
        (icicle-orig-pt-explore                 (point-marker))
        (icicle-orig-win-explore                (selected-window))
        result)
    (setq icicle-act-before-cycle-flag      nil
          icicle-candidates-alist           nil
          icicle-explore-final-choice       nil
          icicle-explore-final-choice-full  nil)
    (icicle-highlight-lighter)
    (message "<span class="quote">Finding candidates...</span>")
    (when define-candidates-fn (funcall define-candidates-fn))
    (unless icicle-candidates-alist (error "<span class="quote">No candidates defined</span>"))
    (when (= (length icicle-candidates-alist) 1)
      (setq icicle-explore-final-choice  (icicle-display-cand-from-full-cand
                                          (car icicle-candidates-alist))))
    (unwind-protect
         (condition-case failure
             (progn
               (unless icicle-explore-final-choice
                 (setq icicle-explore-final-choice
                       (let ((icicle-remove-icicles-props-p  nil)) <span class="linecomment">; Keep Icicles text properties.</span>
                         (apply #'completing-read prompt icicle-candidates-alist compl-read-args))))
               (setq icicle-explore-final-choice-full
                     (funcall icicle-get-alist-candidate-function
                              icicle-explore-final-choice 'no-error-p))
               (unless icicle-explore-final-choice-full (error "<span class="quote">No such occurrence</span>"))
               (setq result  (if final-action-fn
                                 (funcall final-action-fn)
                               icicle-explore-final-choice-full)))
           (quit (if quit-fn (funcall quit-fn) (keyboard-quit)))
           (error (when error-fn (funcall error-fn))
                  (error "<span class="quote">%s</span>" (error-message-string failure))))
      (setq result  (icicle-unpropertize result)) <span class="linecomment">; Finally remove any Icicles text properties.</span>
      (when cleanup-fn (funcall cleanup-fn)))
    result))

<span class="linecomment">;;;###autoload (autoload 'icicle-execute-extended-command "icicles-cmd1.el")</span>
(icicle-define-command icicle-execute-extended-command <span class="linecomment">; Bound to `M-x' in Icicle mode.</span>
  "<span class="quote">Read command name, then read its arguments and call it.
This is `execute-extended-command', turned into a multi-command.

By default, Icicle mode remaps all key sequences that are normally
bound to `execute-extended-command' to
`icicle-execute-extended-command'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>" <span class="linecomment">; Doc string</span>
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Execute command%s: </span>"         <span class="linecomment">; `completing-read' args</span>
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  obarray nil t nil 'extended-command-history nil nil
  (<span class="linecomment">;; Bindings</span>
   (last-command                            last-command) <span class="linecomment">; Save and restore the last command.</span>
   (use-file-dialog                         nil) <span class="linecomment">; `mouse-2' in `*Completions*' won't use dialog box.</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (icicle-must-pass-after-match-predicate  #'(lambda (c) (commandp (intern c))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))
   icicle-new-last-cmd)                 <span class="linecomment">; Set in `icicle-execute-extended-command-1'.</span>
  nil  nil
  (setq this-command  icicle-new-last-cmd)) <span class="linecomment">; Final code: this will update `last-command'.</span>

<span class="linecomment">;; Free vars here: `icicle-orig-buff' and `icicle-orig-window' are bound by `icicle-define-command'.</span>
<span class="linecomment">;;                 `icicle-new-last-cmd' and `icicle-orig-must-pass-after-match-pred' are bound in</span>
<span class="linecomment">;;                 `icicle-execute-extended-command'.</span>
(defun icicle-execute-extended-command-1 (cmd-name)
  "<span class="quote">Action function to execute command or named keyboard macro CMD-NAME.</span>"
  (when (get-buffer icicle-orig-buff) (set-buffer icicle-orig-buff))
  (when (window-live-p icicle-orig-window) (select-window icicle-orig-window))
  (when (string= "<span class="quote"></span>" cmd-name) (error "<span class="quote">No command name</span>"))

  (let* ((cmd                                       (intern cmd-name))
         <span class="linecomment">;; Rebind `icicle-candidate-action-fn' to a function that calls the</span>
         <span class="linecomment">;; candidate CMD-NAME on a single argument that it reads.  This is</span>
         <span class="linecomment">;; used only if CMD-NAME is a command that, itself, reads an input</span>
         <span class="linecomment">;; argument with completion.  When that is the case, you can use</span>
         <span class="linecomment">;; completion on that input, and if you do that, you can use `C-RET'</span>
         <span class="linecomment">;; to use command CMD-NAME as a multi-command.  In other words, this</span>
         <span class="linecomment">;; binding allows for two levels of multi-commands.</span>
         (icicle-candidate-action-fn
          (and icicle-candidate-action-fn <span class="linecomment">; This is nil after the command name is read.</span>
               #'(lambda (arg)
                   (setq arg  (icicle-transform-multi-completion arg))
                   (condition-case nil
                       (funcall cmd arg) <span class="linecomment">; Try to use string candidate `arg'.</span>
                     <span class="linecomment">;; If that didn't work, use a symbol or number candidate.</span>
                     (wrong-type-argument (funcall cmd (car (read-from-string arg))))
                     (wrong-number-of-arguments <span class="linecomment">; Punt - show help.</span>
                      (funcall #'icicle-help-on-candidate)))
                   (select-window (minibuffer-window))
                   (select-frame-set-input-focus (selected-frame)))))
         (fn                                        (symbol-function cmd))
         (count                                     (prefix-numeric-value current-prefix-arg))
         <span class="linecomment">;; Rebind alternative action functions to nil, so we don't override the command we call.</span>
         (icicle-candidate-alt-action-fn            nil)
         (icicle-all-candidates-list-alt-action-fn  nil))
    <span class="linecomment">;; Message showing what `cmd' is bound to.  This is pretty much a transcription of C code in</span>
    <span class="linecomment">;; `keyboard.c'.  Not sure it DTRT when there is already a msg in the echo area.</span>
    (when (and suggest-key-bindings (not executing-kbd-macro))
      (let* ((bindings   (where-is-internal cmd overriding-local-map t))
             (curr-msg   (current-message))
             (wait-time  (if curr-msg
                             (or (and (numberp suggest-key-bindings) suggest-key-bindings) 2)
                           0)))
        (when (and bindings (not (and (vectorp bindings) (eq (aref bindings 0) 'mouse-movement))))
          (when (and (sit-for wait-time) (atom unread-command-events))
            (let ((message-log-max  nil)) <span class="linecomment">; Don't log this message.</span>
              (message "<span class="quote">You can run the command `%s' with `%s'</span>"
                       (symbol-name cmd)
                       (key-description bindings)))
            (when (and (sit-for wait-time) curr-msg) (message curr-msg))))))
    (cond ((arrayp fn)
           (let ((this-command  cmd)) (execute-kbd-macro fn count))
           (when (&gt; count 1) (message "<span class="quote">(%d times)</span>" count)))
          (t
           (run-hooks 'post-command-hook)
           (run-hooks 'pre-command-hook)
           (let ((enable-recursive-minibuffers            t)
                 <span class="linecomment">;; Restore this before we invoke command, since it might use completion.</span>
                 (icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred)
                 <span class="linecomment">;; Bind, don't set `this-command'.  When you use `C-next', `this-command' needs</span>
                 <span class="linecomment">;; to be `cmd' during the `C-RET' part, but `last-command' must not be `cmd'</span>
                 <span class="linecomment">;; during the `next' part.</span>
                 (this-command                            cmd))
             (call-interactively cmd 'record-it))))
    <span class="linecomment">;; After `M-x' `last-command' must be the command finally entered with `RET' or, if you end</span>
    <span class="linecomment">;; with `C-g', the last command entered with `C-RET'.</span>
    (setq icicle-new-last-cmd  cmd)))

<span class="linecomment">;; Inspired by Emacs partial completion and by library `exec-abbrev-cmd.el' (Tassilo Horn</span>
<span class="linecomment">;; &lt;tassilo@member.fsf.org&gt;).  The idea of command abbreviation is combined here with normal</span>
<span class="linecomment">;; command invocation, in an Icicles multi-command.</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-command-abbrev "icicles-cmd1.el")</span>
(icicle-define-command icicle-command-abbrev <span class="linecomment">; Bound to `C-x SPC' in Icicle mode.</span>
  "<span class="quote">Read command name or its abbreviation, read command args, call command.
Read input, then call `icicle-command-abbrev-action' to act on it.

If `icicle-add-proxy-candidates-flag' is non-nil, then command
abbreviations, as well as commands, are available as completion
candidates.  Otherwise, only commands are available.  You can toggle
this user option using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-proxy-candidates]'\
in the minibuffer.

When an abbreviation is available, you can treat it just like a
command.  The rest of this description covers the behavior of choosing
an abbreviation.

If an abbreviation matches a single command name, then that command is
invoked.  If it matches more than one, then you can use completion to
choose one.

Hyphens (`-') in command names divide them into parts.  For example,
`find-file' has two parts: `find' and `file'.  Each character of a
command abbreviation corresponds to one part of each of the commands
that match the abbreviation.  For example, abbreviation `ff' matches
commands `find-file' and `focus-frame', and abbreviation `fg' matches
`find-grep'.

User option `icicle-command-abbrev-match-all-parts-flag' = nil means
that an abbreviation need not match all parts of a command name; it
need match only a prefix.  For example, nil means that abbreviation
`ff' also matches `find-file-other-window' and `fg' also matches
`find-grep-dired'.</span>"                     <span class="linecomment">; Doc string</span>
  icicle-command-abbrev-action          <span class="linecomment">; Function to perform the action</span>
  prompt obarray nil nil nil 'icicle-command-abbrev-history nil nil <span class="linecomment">; `completing-read' args</span>
  ((prompt                                  "<span class="quote">Command or abbrev: </span>")
   (last-command                            last-command) <span class="linecomment">; Save and restore the last command.</span>
   (icicle-sort-comparer                    'icicle-command-abbrev-used-more-p) <span class="linecomment">; Bindings.</span>
   (icicle-proxy-candidates                 (let ((ipc  ())
                                                  abv)
                                              (dolist (entry  icicle-command-abbrev-alist  ipc)
                                                (setq abv  (symbol-name (cadr entry)))
                                                (unless (member abv ipc) (push abv ipc)))))
   (use-file-dialog                         nil) <span class="linecomment">; `mouse-2' in `*Completions*' won't use dialog box.</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (icicle-must-pass-after-match-predicate  #'(lambda (c) (commandp (intern c))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
  (when icicle-proxy-candidates         <span class="linecomment">; First code</span>
    (put-text-property 0 1 'icicle-fancy-candidates t prompt))
  nil (setq icicle-proxy-candidates  nil)) <span class="linecomment">; Undo code, last code</span>

(defun icicle-command-abbrev-action (abbrev-or-cmd)
  "<span class="quote">Action function for `icicle-command-abbrev'.
If ABBREV-OR-CMD is a command, call it.
If ABBREV-OR-CMD is an abbreviation for a single command, invoke it.
If ABBREV-OR-CMD is an abbreviation for multiple commands, call
`icicle-command-abbrev-command', to let user choose commands.
If ABBREV-OR-CMD is not an abbreviation or a command, raise an error.</span>"
  (setq abbrev-or-cmd  (intern abbrev-or-cmd))
  (let* ((not-cmdp                                  (not (commandp abbrev-or-cmd)))
         (regexp                                    (and (or not-cmdp
                                                             icicle-command-abbrev-priority-flag)
                                                         (icicle-command-abbrev-regexp
                                                          abbrev-or-cmd)))
         (icicle-commands-for-abbrev                (and (or not-cmdp
                                                             icicle-command-abbrev-priority-flag)
                                                         (icicle-command-abbrev-matching-commands
                                                          regexp)))
         (icicle-add-proxy-candidates-flag          icicle-add-proxy-candidates-flag)
         (icicle-proxy-candidates                   icicle-proxy-candidates)
         <span class="linecomment">;; Restore this before we invoke command, since it might use completion.</span>
         <span class="linecomment">;; Free var `orig-must-pass...' is bound in `icicle-command-abbrev'.</span>
         (icicle-must-pass-after-match-predicate    icicle-orig-must-pass-after-match-pred)
         <span class="linecomment">;; Rebind alternative action functions to nil, so we don't override command we call.</span>
         (icicle-candidate-alt-action-fn            nil)
         (icicle-all-candidates-list-alt-action-fn  nil))
    (cond ((and not-cmdp (null icicle-commands-for-abbrev))
           (error "<span class="quote">No such command or abbreviation `%s'</span>" abbrev-or-cmd))
          (icicle-commands-for-abbrev
           (let* ((icicle-sort-comparer  'icicle-command-abbrev-used-more-p)
                  (cmd
                   (if (null (cdr icicle-commands-for-abbrev))
                       (prog1 (intern (caar icicle-commands-for-abbrev))
                         (push (caar icicle-commands-for-abbrev) extended-command-history)
                         (call-interactively (intern (caar icicle-commands-for-abbrev)) t))
                     (let ((enable-recursive-minibuffers  t))
                       (icicle-remove-Completions-window)
                       (icicle-command-abbrev-command)))))
             (icicle-command-abbrev-record abbrev-or-cmd cmd)))
          ((not not-cmdp) (call-interactively abbrev-or-cmd)))))

(defun icicle-command-abbrev-regexp (abbrev)
  "<span class="quote">Return the command-matching regexp for ABBREV.</span>"
  (let ((char-list  (append (symbol-name abbrev) ()))
        (str        "<span class="quote">^</span>"))
    (dolist (c  char-list) (setq str  (concat str (list c) "<span class="quote">[^-]*-</span>")))
    (concat (substring str 0 (1- (length str)))
            (if icicle-command-abbrev-match-all-parts-flag "<span class="quote">$</span>" "<span class="quote">.*$</span>"))))

(defun icicle-command-abbrev-matching-commands (regexp)
  "<span class="quote">Return a completion alist of commands that match REGEXP.</span>"
  (mapcar #'list (icicle-remove-if-not
                  #'(lambda (strg) (string-match regexp strg))
                  (let ((cmds  ()))
                    (mapatoms #'(lambda (symb)
                                  (when (commandp symb) (push (symbol-name symb) cmds))))
                    cmds))))

<span class="linecomment">;;;###autoload (autoload 'icicle-command-abbrev-command "icicles-cmd1.el")</span>
(icicle-define-command icicle-command-abbrev-command
  "<span class="quote">Read command name, then read its arguments and call command.</span>" <span class="linecomment">; Doc string</span>
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Command abbreviated%s%s: </span>"   <span class="linecomment">; `completing-read' arguments</span>
          (cond ((and icicle-current-input (not (string= "<span class="quote"></span>" icicle-current-input)))
                 (format "<span class="quote"> `%s'</span>" icicle-current-input))
                (icicle-candidate-nb
                 (format "<span class="quote"> `%s'</span>" (elt icicle-completion-candidates icicle-candidate-nb)))
                (t "<span class="quote"></span>"))
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  icicle-commands-for-abbrev nil t nil 'extended-command-history nil nil
  (<span class="linecomment">;; Bindings</span>
   (use-file-dialog                   nil) <span class="linecomment">; `mouse-2' in `*Completions*' shouldn't use file dialog.</span>
   (alt-fn                            nil)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))
   (icicle-add-proxy-candidates-flag  nil) <span class="linecomment">; No abbrevs - just commands here.</span>
   (last-command                      last-command) <span class="linecomment">; Save and restore the last command.</span>
   icicle-new-last-cmd)                 <span class="linecomment">; Set in `icicle-execute-extended-command-1'.</span>
  nil nil
  (setq this-command  icicle-new-last-cmd) <span class="linecomment">; Final code: this will update `last-command'.</span>
  'NON-INTERACTIVE)                     <span class="linecomment">; This is not a real command.</span>

(defun icicle-command-abbrev-record (abbrev command)
  "<span class="quote">Record ABBREV and COMMAND in `icicle-command-abbrev-alist'.</span>"
  (let ((entry  (assq command icicle-command-abbrev-alist)))
    (when (and abbrev command)
      (if entry
          (setq icicle-command-abbrev-alist  (cons (list command abbrev (1+ (car (cddr entry))))
                                                   (delete entry icicle-command-abbrev-alist)))
        (push (list command abbrev 1) icicle-command-abbrev-alist)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-execute-named-keyboard-macro "icicles-cmd1.el")</span>
(icicle-define-command icicle-execute-named-keyboard-macro <span class="linecomment">; Bound to `C-x M-e' in Icicle mode.</span>
  "<span class="quote">Read the name of a keyboard macro, then execute it.</span>"
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Execute keyboard macro%s: </span>"  <span class="linecomment">; `completing-read' args</span>
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  obarray nil t nil 'icicle-kmacro-history nil nil
  ((last-command                            last-command) <span class="linecomment">; Save and restore the last command.</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (icicle-must-pass-after-match-predicate
    #'(lambda (fn) (setq fn  (intern fn)) (and (commandp fn) (arrayp (symbol-function fn)))))
   (icicle-candidate-alt-action-fn      <span class="linecomment">; Bindings</span>
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-kmacro "icicles-cmd1.el")</span>
(when (require 'kmacro nil t)
  (icicle-define-command icicle-kmacro  <span class="linecomment">; Bound to `S-f4' in Icicle mode (Emacs 22+).</span>
    "<span class="quote">Execute a keyboard macro according to its position in `kmacro-ring'.
Macros in the keyboard macro ring are given names `1', `2', and so on,
for use as completion candidates.

With prefix argument, repeat macro that many times (but see below).
If a macro is still being defined, end it first, then execute it.

Since this is a multi-command, you can execute any number of macros
any number of times in a single invocation.  In particular, you can
execute a given macro repeatedly using `C-RET' (be sure you use `TAB'
first, to make it the current candidate).

If you use a prefix arg for `icicle-kmacro', then each multi-command
action (e.g. `C-RET') repeats the macro that number of times.  However
if you use a prefix arg for an individual action, then the action
repeats the macro that number of times.  Without its own prefix arg,
an action uses the base prefix arg you used for `icicle-kmacro'.</span>"
    icicle-kmacro-action                <span class="linecomment">; Function to perform the action</span>
    (format "<span class="quote">Execute keyboard macro%s: </span>" <span class="linecomment">; `completing-read' args</span>
            (if current-prefix-arg
                (format "<span class="quote"> (prefix %s)</span>" (prefix-numeric-value current-prefix-arg))
              "<span class="quote"></span>"))
    (let ((count  0))
      (setq icicle-kmacro-alist
            (mapcar #'(lambda (x) (cons (format "<span class="quote">%d</span>" (setq count  (1+ count))) x))
                    (reverse (if nil kmacro-ring (cons (kmacro-ring-head) kmacro-ring))))))
    nil 'NO-EXIT-WO-MATCH nil 'icicle-kmacro-history
    (and (kmacro-ring-head) (null kmacro-ring) "<span class="quote">1</span>") nil
    ((icicle-pref-arg  current-prefix-arg))    <span class="linecomment">; Additional bindings</span>
    (progn                              <span class="linecomment">; First code</span>
      (when defining-kbd-macro (kmacro-end-or-call-macro current-prefix-arg) (error "<span class="quote">Done</span>"))
      (unless (or (kmacro-ring-head) kmacro-ring) (error "<span class="quote">No keyboard macro defined</span>"))))

  <span class="linecomment">;; Free vars here: `icicle-orig-buff' & `icicle-orig-window' are bound by `icicle-define-command'.</span>
  <span class="linecomment">;;                 `icicle-pref-arg' is bound in `icicle-kmacro'.</span>
  (defun icicle-kmacro-action (cand)
    "<span class="quote">Action function for `icicle-kmacro'.</span>"
    (when (get-buffer icicle-orig-buff) (set-buffer icicle-orig-buff))
    (when (window-live-p icicle-orig-window) (select-window icicle-orig-window))
    (let* ((count  (if current-prefix-arg (prefix-numeric-value current-prefix-arg) icicle-pref-arg))
           (macro  (cadr (assoc cand icicle-kmacro-alist))))
      (unless macro (error "<span class="quote">No such macro: `%s'</span>" cand))
      (execute-kbd-macro macro count #'kmacro-loop-setup-function)
      (when (&gt; count 1) (message "<span class="quote">(%d times)</span>" count)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-set-option-to-t "icicles-cmd1.el")</span>
(icicle-define-command icicle-set-option-to-t <span class="linecomment">; Command name</span>
  "<span class="quote">Set option to t.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \"binary\" options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt) (set (intern opt) t) (message "<span class="quote">`%s' is now t</span>" opt)) <span class="linecomment">; Action function</span>
  "<span class="quote">Set option to t: </span>" obarray nil 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers          t) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag  t)
   (alt-fn                                nil)
   (icicle-must-pass-after-match-predicate
    (cond ((and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg)))
           #'(lambda (x)
               (setq x  (intern x)) (and (boundp x) (user-variable-p x) (eq nil (symbol-value x)))))
          (current-prefix-arg
           #'(lambda (x)
               (setq x  (intern x)) (and (boundp x) (eq nil (symbol-value x)))))
          (t
           #'(lambda (x)
               (setq x  (intern x))
               (and (boundp x) (icicle-binary-option-p x) (eq nil (symbol-value x)))))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-clear-history "icicles-cmd1.el")</span>
(icicle-define-command icicle-clear-history
  "<span class="quote">Clear a minibuffer history of selected entries.
You are prompted for the history to clear, then you are prompted for
the entries to delete from it.  You can use multi-command completion
for both inputs.  That is, you can act on multiple histories and
delete multiple entries from each.

For convenience, you can use `S-delete' the same way as `C-RET': Each
of them deletes the current entry candidate from the history.

With a prefix argument, empty the chosen history completely
\(you are not prompted to choose history entries to delete).

`icicle-act-before-cycle-flag' is bound to t here during completion of
history entries, so `C-next' and so on act on the current candidate.</span>"
  icicle-clear-history-1                <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">History to clear: </span>" icicle-clear-history-hist-vars <span class="linecomment">; `completing-read' args</span>
  nil t nil nil (symbol-name minibuffer-history-variable) nil
  ((icicle-pref-arg                 current-prefix-arg) <span class="linecomment">; Bindings</span>
   (enable-recursive-minibuffers    t)
   (icicle-transform-function       'icicle-remove-duplicates)
   (icicle-clear-history-hist-vars  `((,(symbol-name minibuffer-history-variable))
                                      (,(symbol-name 'icicle-previous-raw-file-name-inputs))
                                      (,(symbol-name 'icicle-previous-raw-non-file-name-inputs))))
   (icicle-delete-candidate-object  'icicle-clear-history-entry))
  (mapatoms #'(lambda (x) (when (and (boundp x) (consp (symbol-value x)) <span class="linecomment">; First code</span>
                                     (stringp (car (symbol-value x)))
                                     (string-match "<span class="quote">-\\(history\\|ring\\)\\'</span>" (symbol-name x)))
                            (push (list (symbol-name x)) icicle-clear-history-hist-vars)))))

<span class="linecomment">;; Free vars here: `icicle-pref-arg' is bound in `icicle-clear-history'.</span>
(defun icicle-clear-history-1 (hist)
  "<span class="quote">Action function for `icicle-clear-history' history-variable candidates.</span>"
  (setq hist  (intern hist))
  (if (not icicle-pref-arg)
      (let* ((icicle-candidate-action-fn              'icicle-clear-history-entry)
             (icicle-transform-function               'icicle-remove-duplicates)
             (icicle-clear-history-hist               hist)
             (icicle-use-candidates-only-once-flag    t)
             (icicle-show-Completions-initially-flag  t)
             (icicle-act-before-cycle-flag            t))
        (when hist                      <span class="linecomment">; Maybe there are no more, due to deletion actions.</span>
          (funcall icicle-candidate-action-fn
                   (completing-read "<span class="quote">Clear input: </span>" (mapcar #'list (symbol-value hist)) nil t))))
    (set hist nil))
  (unless hist (message "<span class="quote">History `%s' is now empty</span>" hist))
  nil)

<span class="linecomment">;; Free vars here: `icicle-clear-history-hist' is bound in `icicle-clear-history-1'</span>
<span class="linecomment">;; and in `icicle-clear-current-history'.</span>
(defun icicle-clear-history-entry (cand)
  "<span class="quote">Action function for history entry candidates in `icicle-clear-history'.</span>"
  (unless (string= "<span class="quote"></span>" cand)
    (set icicle-clear-history-hist
         (icicle-remove-if
          #'(lambda (x)
              (string= (icicle-substring-no-properties cand) (icicle-substring-no-properties x)))
          (symbol-value icicle-clear-history-hist)))
    <span class="linecomment">;; We assume here that CAND was in fact present in the history originally.</span>
    (message "<span class="quote">`%s' deleted from history `%s'</span>" cand icicle-clear-history-hist))
  nil)

<span class="linecomment">;;;###autoload (autoload 'icicle-clear-current-history "icicles-cmd1.el")</span>
(icicle-define-command icicle-clear-current-history <span class="linecomment">; Bound to `M-i' in minibuffer.</span>
  "<span class="quote">Clear current minibuffer history of selected entries.
You are prompted for the history entries to delete.

With a prefix argument, however, empty the history completely
\(you are not prompted to choose history entries to delete).

`icicle-act-before-cycle-flag' is bound to t here during completion of
history entries, so `C-next' and so on act on the current candidate.</span>"
  icicle-clear-history-entry            <span class="linecomment">; Action function</span>
  "<span class="quote">Clear input: </span>" (mapcar #'list (symbol-value icicle-clear-history-hist)) <span class="linecomment">; `completing-read' args</span>
  nil t nil nil nil nil
  ((icicle-pref-arg                         current-prefix-arg) <span class="linecomment">; Bindings</span>
   (enable-recursive-minibuffers            t)
   (icicle-transform-function               'icicle-remove-duplicates)
   (icicle-use-candidates-only-once-flag    t)
   (icicle-show-Completions-initially-flag  t)
   (icicle-clear-history-hist               minibuffer-history-variable))
  (when icicle-pref-arg                 <span class="linecomment">; Use `error' just to exit and make sure message is seen.</span>
    (icicle-ding)
    (if (not (yes-or-no-p (format "<span class="quote">Are you sure you want to empty `%s' completely? </span>"
                                  minibuffer-history-variable)))
        (error "<span class="quote"></span>")
      (set minibuffer-history-variable nil)
      (error "<span class="quote">History `%s' is now empty</span>" minibuffer-history-variable))))

(when (and icicle-define-alias-commands-flag (not (fboundp 'clear-option)))
  (defalias 'clear-option 'icicle-reset-option-to-nil))

<span class="linecomment">;;;###autoload (autoload 'icicle-reset-option-to-nil "icicles-cmd1.el")</span>
(icicle-define-command icicle-reset-option-to-nil <span class="linecomment">; Command name</span>
  "<span class="quote">Set option to nil.  This makes sense for binary and list options.
By default, the set of completion candidates is limited to user
options.  Note: it is *not* limited to binary and list options.
With a prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt) (set (intern opt) nil) (message "<span class="quote">`%s' is now nil</span>" opt)) <span class="linecomment">; Action function</span>
  "<span class="quote">Clear option (set it to nil): </span>" obarray nil t nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history)
  nil nil
  ((enable-recursive-minibuffers          t) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag  t)
   (alt-fn                                nil)
   (icicle-must-pass-after-match-predicate
    (if current-prefix-arg
        #'(lambda (x) (setq x  (intern x)) (and (boundp x) (symbol-value x)))
      #'(lambda (x) (setq x  (intern x)) (and (boundp x) (user-variable-p x) (symbol-value x)))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))))

(when (and icicle-define-alias-commands-flag (not (fboundp 'toggle)))
  (defalias 'toggle 'icicle-toggle-option))

<span class="linecomment">;;;###autoload (autoload 'icicle-toggle-option "icicles-cmd1.el")</span>
(icicle-define-command icicle-toggle-option <span class="linecomment">; Command name</span>
  "<span class="quote">Toggle option's value.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \"binary\" options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt)                         <span class="linecomment">; Action function</span>
    (let ((sym  (intern opt)))
      (set sym (not (eval sym))) (message "<span class="quote">`%s' is now %s</span>" opt (eval sym))))
  "<span class="quote">Toggle value of option: </span>" obarray nil 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers  t)    <span class="linecomment">; Bindings</span>
   (alt-fn                        nil)
   (icicle-must-pass-after-match-predicate
    (cond ((and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg)))
           #'(lambda (c) (user-variable-p (intern c))))
          (current-prefix-arg #'(lambda (c) (boundp (intern c))))
          (t                  #'(lambda (c) (icicle-binary-option-p (intern c))))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))))

(defun icicle-binary-option-p (symbol)
  "<span class="quote">Non-nil if SYMBOL is a user option that has custom-type `boolean'.</span>"
  (eq (get symbol 'custom-type) 'boolean))

<span class="linecomment">;;;###autoload (autoload 'icicle-increment-option "icicles-cmd1.el")</span>
(icicle-define-command icicle-increment-option <span class="linecomment">; Command name</span>
  "<span class="quote">Increment option's value using the arrow keys (`up', `down').
Completion candidates are limited to options that have `integer',
`float', and `number' custom types.
This command needs library `doremi.el'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt)                         <span class="linecomment">; Action function</span>
    (let ((sym                                     (intern opt))
          <span class="linecomment">;; Restore this before we read number, since that might use completion.</span>
          (icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred))
      (icicle-doremi-increment-variable+ sym (icicle-read-number "<span class="quote">Increment (amount): </span>") t)
      (message "<span class="quote">`%s' is now %s</span>" opt (eval sym))))
  "<span class="quote">Increment value of option: </span>" obarray nil 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (icicle-must-pass-after-match-predicate
    #'(lambda (s) (memq (get (intern s) 'custom-type) '(number integer float))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))) <span class="linecomment">; First code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-increment-variable "icicles-cmd1.el")</span>
(icicle-define-command icicle-increment-variable <span class="linecomment">; Command name</span>
  "<span class="quote">Increment variable's value using the arrow keys (`up', `down').
With a prefix arg, only numeric user options are candidates.
With no prefix arg, all variables are candidates, even those that are
 not numeric. 
This command needs library `doremi.el'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (var)                         <span class="linecomment">; Action function</span>
    (let ((sym                                     (intern var))
          <span class="linecomment">;; Restore this before we read number, since that might use completion.</span>
          (icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred))
      (icicle-doremi-increment-variable+ sym (icicle-read-number "<span class="quote">Increment (amount): </span>") prefix-arg)
      (message "<span class="quote">`%s' is now %s</span>" var (eval sym))))
  "<span class="quote">Increment value of variable: </span>" obarray nil 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (prefix-arg                              current-prefix-arg)
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (icicle-must-pass-after-match-predicate
    (if prefix-arg
        #'(lambda (s) (memq (get (intern s) 'custom-type) '(number integer float)))
      #'(lambda (s) (boundp (intern s)))))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn
        (setq alt-fn  (icicle-alt-act-fn-for-type (if prefix-arg "<span class="quote">option</span>" "<span class="quote">variable</span>")))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn
        (icicle-alt-act-fn-for-type (if prefix-arg "<span class="quote">option</span>" "<span class="quote">variable</span>")))))
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))) <span class="linecomment">; First code</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-doremi-increment-variable+ (variable &optional increment optionp)
  "<span class="quote">Increment VARIABLE by INCREMENT (default 1).
Use arrow key `up' or `down' or mouse wheel to increase or decrease.
You can use the `Meta' key (e.g. `M-up') to increment in larger steps.

Interactively, you can choose VARIABLE using completion.
With a prefix arg, only user options are available to choose from.
Raises an error if VARIABLE's value is not a number.</span>"
  (interactive
   (let ((symb                                      (or (and (fboundp 'symbol-nearest-point)
                                                             (symbol-nearest-point))
                                                        (and (symbolp (variable-at-point))
                                                             (variable-at-point))))
         (enable-recursive-minibuffers              t)
         (icicle-orig-must-pass-after-match-pred    icicle-must-pass-after-match-predicate)
         (icicle-must-pass-after-match-predicate    (if current-prefix-arg
                                                        #'(lambda (s) (user-variable-p (intern s)))
                                                      #'(lambda (s) (boundp (intern s))))))
     (list (intern (completing-read "<span class="quote">Increment variable: </span>" obarray nil t nil nil
                                    (and symb (symbol-name symb)) t))
           <span class="linecomment">;; Restore this before we read number, since that might use completion.</span>
           (let ((icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred))
             (icicle-read-number "<span class="quote">Increment (amount): </span>"))
           current-prefix-arg)))
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
  (unless increment (setq increment 1))
  (unless (numberp (symbol-value variable))
    (error "<span class="quote">Variable's value is not a number: %S</span>" (symbol-value variable)))
  (doremi (lambda (new-val)
            (set variable  new-val)
            new-val)
          (symbol-value variable)
          increment))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-list "icicles-cmd1.el")</span>
(icicle-define-command icicle-bookmark-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of bookmark names.
If `icicle-bookmark-types' is non-nil, then it is a list of bookmark
types and only bookmarks of those types are candidates.

You can use `S-delete' during completion to delete a candidate bookmark.
The list of bookmark names (strings) is returned.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name) (push (icicle-substring-no-properties (icicle-transform-multi-completion name))
                       bmk-names))      <span class="linecomment">; Action function</span>
  "<span class="quote">Choose bookmark (`RET' when done): </span>" icicle-candidates-alist nil <span class="linecomment">; `completing-read' args</span>
  (not icicle-show-multi-completion-flag)
  nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil
  ((enable-recursive-minibuffers           t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
   (completion-ignore-case                 bookmark-completion-ignore-case)
   (icicle-list-use-nth-parts              '(1))
   (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                               nil
                                             (if (facep 'file-name-shadow)
                                                 '((2 (face file-name-shadow))
                                                   (3 (face bookmark-menu-heading)))
                                               '((3 (face bookmark-menu-heading))))))
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-transform-before-sort-p         t)
   (icicle-delete-candidate-object         'icicle-bookmark-delete-action)
   (types                                  icicle-bookmark-types)
   (icicle-candidates-alist                ())
   (bmk-names                              ())
   (icicle-sort-orders-alist
    (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
              ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
            (and (featurep 'bookmark+)
                 (append
                  '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
                    ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p))
                  (and (icicle-set-intersection types '("<span class="quote">info</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)))
                  (and (icicle-set-intersection types '("<span class="quote">gnus</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)))
                  (and (icicle-set-intersection types '("<span class="quote">url</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)))
                  (and (icicle-set-difference types
                                              '("<span class="quote">bookmark-list</span>" "<span class="quote">desktop</span>" "<span class="quote">gnus</span>" "<span class="quote">info</span>" "<span class="quote">man</span>" "<span class="quote">url</span>"))
                       '(("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                              bmkp-local-file-type-cp bmkp-handler-cp)
                          icicle-alpha-p)))
                  (and (icicle-set-difference
                        types '("<span class="quote">bookmark-list</span>" "<span class="quote">desktop</span>" "<span class="quote">dired</span>" "<span class="quote">non-file</span>"))
                       '(("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)))
                  (and (icicle-set-intersection types
                                                '("<span class="quote">local-file</span>" "<span class="quote">file</span>" "<span class="quote">dired</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                         ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                         ("<span class="quote">by last local file access</span>"
                          (bmkp-local-file-accessed-more-recently-cp)
                          icicle-alpha-p)
                         ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
                          icicle-alpha-p)))
                  (and (not (equal types '("<span class="quote">desktop</span>")))
                       '(("<span class="quote">by last buffer or file access</span>"
                          (bmkp-buffer-last-access-cp
                           bmkp-local-file-accessed-more-recently-cp)
                          icicle-alpha-p)))
                  (and (get-buffer "<span class="quote">*Bookmark List*</span>")
                       '(("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                          icicle-alpha-p)))))
            '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
              ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))         
   (icicle-candidate-help-fn
    #'(lambda (cand)
        (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag)
          (setq cand  (funcall icicle-get-alist-candidate-function cand))
          (setq cand  (cons (caar cand) (cdr cand))))
        (if (featurep 'bookmark+)
            (if current-prefix-arg
                (bmkp-describe-bookmark-internals cand)
              (bmkp-describe-bookmark cand))
          (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand))))))
  (progn
    (message "<span class="quote">Gathering bookmarks...</span>")
    (unless types  (setq types '(all)))
    (dolist (type  types)               <span class="linecomment">; First code</span>
      (setq icicle-candidates-alist
            (nconc icicle-candidates-alist
                   (if (not (featurep 'bookmark+))
                       (mapcar #'(lambda (cand) (list (icicle-candidate-short-help
                                                       (icicle-bookmark-help-string cand)
                                                       (icicle-bookmark-propertize-candidate cand))))
                               (if (eq type 'all)
                                   bookmark-alist
                                 (funcall (intern (format "<span class="quote">bmkp-%s-alist-only</span>" type)))))
                     (bookmark-maybe-load-default-file) <span class="linecomment">; Load bookmarks, define `bookmark-alist'.</span>
                     (mapcar (if icicle-show-multi-completion-flag
                                 #'(lambda (bmk)
                                     (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad bookmark.</span>
                                         (let* ((bname     (bookmark-name-from-full-record bmk))
                                                (guts      (bookmark-get-bookmark-record bmk))
                                                (file      (bookmark-get-filename bmk))
                                                (buf       (bmkp-get-buffer-name bmk))
                                                (file/buf
                                                 (if (and buf
                                                          (equal file bmkp-non-file-filename))
                                                     buf
                                                   file))
                                                (tags      (bmkp-get-tags bmk)))
                                           (cons `(,(icicle-candidate-short-help
                                                     (icicle-bookmark-help-string bname)
                                                     (icicle-bookmark-propertize-candidate bname))
                                                   ,file/buf
                                                   ,@(and tags (list (format "<span class="quote">%S</span>" tags))))
                                                 guts))
                                       (error nil)))
                               #'(lambda (bmk)
                                   (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad bookmark.</span>
                                       (let ((bname  (bookmark-name-from-full-record bmk))
                                             (guts   (bookmark-get-bookmark-record bmk)))
                                         (cons (icicle-candidate-short-help
                                                (icicle-bookmark-help-string bname)
                                                (icicle-bookmark-propertize-candidate bname))
                                               guts))
                                     (error nil))))
                             (bmkp-sort-omit
                              (if (eq type 'all)
                                  bookmark-alist
                                (funcall (intern (format "<span class="quote">bmkp-%s-alist-only</span>" type)))))))))))
  (icicle-bookmark-cleanup-on-quit)     <span class="linecomment">; Undo code</span>
  (prog1 (setq bmk-names  (nreverse (delete "<span class="quote"></span>" bmk-names))) <span class="linecomment">; Last code - return the list.</span>
    (icicle-bookmark-cleanup)
    (when (interactive-p) (message "<span class="quote">Bookmarks: %S</span>" bmk-names))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-cmd (&optional parg) <span class="linecomment">; Bound to what `bookmark-set' is bound to (`C-x r m').</span>
  "<span class="quote">Set bookmark or visit bookmark(s).
With a negative prefix arg, visit bookmark(s), using
  `icicle-bookmark-other-window' (see that command for more info).

Otherwise, set a bookmark, as follows:

* No prefix arg: Prompt for the bookmark name.

  If feature `bookmark+' is present:

  . You can use (lax) completion for the bookmark name.
    The candidates are bookmarks in the current buffer (or all
    bookmarks if there are none in this buffer).

  . If the region is active and nonempty, then use the buffer name
    followed by the region prefix as the default name.

  If feature `bookmark+' is not present, then completion is not
  available, and the default bookmark name is the last one used in
  this buffer.

  Note: You can use command `icicle-bookmark-set' with a numeric
  prefix arg if you want to complete against all bookmark names,
  instead of those for the current buffer.

* Plain prefix arg (`C-u'): Same as no prefix arg, but do not
  overwrite any existing bookmark that has the same name.

* Non-negative numeric prefix arg: Do not prompt for bookmark name.
  If feature `bookmark+' is present and the region is active and
    nonempty, then use the buffer name followed by a prefix of the
    region text as the bookmark name.
  Otherwise, use the buffer name followed by the text of the current
    line, starting at point.
  Use at most `icicle-bookmark-name-length-max' chars, in either case.
  If the prefix arg is 0, then do not overwrite any existing bookmark
    that has the same name.

By default, Icicle mode remaps all key sequences that are normally
bound to `bookmark-set' to `icicle-bookmark-cmd'.  If you do not want
this remapping, then customize option `icicle-top-level-key-bindings'.
In particular, you might prefer to remap `bookmark-set' to
`icicle-bookmark-set' (see Note, above).</span>"
  (interactive "<span class="quote">P</span>")
  (if (and parg (&lt; (prefix-numeric-value parg) 0))
      (icicle-bookmark-other-window)
    (if (or (not parg) (consp parg))
        (icicle-bookmark-set nil parg 'PSEUDO-INTERACTIVEP)
      (let* ((regionp    (and (featurep 'bookmark+)  transient-mark-mode  mark-active
                              (not (eq (region-beginning) (region-end)))))
             (name-beg   (if regionp (region-beginning) (point)))
             (name-end   (if regionp (region-end) (save-excursion (end-of-line) (point))))
             (def-name   (concat (buffer-name) "<span class="quote">: </span>" (buffer-substring name-beg name-end)))
             (trim-name  (replace-regexp-in-string
                          "<span class="quote">\n</span>" "<span class="quote"> </span>" (substring def-name 0 (min icicle-bookmark-name-length-max
                                                              (length def-name))))))
        (message "<span class="quote">Setting bookmark `%s'</span>" trim-name) (sit-for 2)
        (bookmark-set trim-name (and parg (or (consp parg)
                                              (zerop (prefix-numeric-value parg)))))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-set (&optional name parg interactivep) <span class="linecomment">; `C-x r m'</span>
  "<span class="quote">With Bookmark+, this is `bookmark-set' with Icicles multi-completions.
In particular, you can use (lax) completion for the bookmark name.
Without library `bookmark+.el', this is the same as vanilla Emacs
`bookmark-set'.</span>"
  (interactive (list nil current-prefix-arg t))
  (if (not (featurep 'bookmark+))
      (bookmark-set name parg)
    (unwind-protect
         (let ((enable-recursive-minibuffers           t) <span class="linecomment">; In case read input, e.g. File changed...</span>
               (completion-ignore-case                 bookmark-completion-ignore-case)
               (prompt                                 "<span class="quote">Bookmark: </span>")
               (icicle-list-use-nth-parts              '(1))
               (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                                           nil
                                                         (if (facep 'file-name-shadow)
                                                             '((2 (face file-name-shadow))
                                                               (3 (face bookmark-menu-heading)))
                                                           '((3 (face bookmark-menu-heading))))))
               (icicle-transform-function              (and (not (interactive-p))
                                                            icicle-transform-function))
               (icicle-whole-candidate-as-text-prop-p  t)
               (icicle-transform-before-sort-p         t)
               (icicle-sort-orders-alist
                (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
                          ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
                        (and (featurep 'bookmark+)
                             '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by last buffer or file access</span>"
                                (bmkp-buffer-last-access-cp
                                 bmkp-local-file-accessed-more-recently-cp)
                                icicle-alpha-p)
                               ("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                               ("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)
                               ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                               ("<span class="quote">by last local file access</span>"
                                (bmkp-local-file-accessed-more-recently-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by last local file update</span>"
                                (bmkp-local-file-updated-more-recently-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)
                               ("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)
                               ("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)
                               ("<span class="quote">by bookmark type</span>"
                                (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                 bmkp-local-file-type-cp bmkp-handler-cp)
                                icicle-alpha-p)))
                        '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
                          ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
               (icicle-candidate-help-fn
                #'(lambda (cand)
                    (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag)
                      (setq cand  (funcall icicle-get-alist-candidate-function cand))
                      (setq cand  (cons (caar cand) (cdr cand))))
                    (if (featurep 'bookmark+)
                        (if current-prefix-arg
                            (bmkp-describe-bookmark-internals cand)
                          (bmkp-describe-bookmark cand))
                      (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand)))))
               (icicle-candidates-alist
                (if (not (featurep 'bookmark+))
                    (mapcar #'(lambda (cand)
                                (list (icicle-candidate-short-help
                                       (icicle-bookmark-help-string cand)
                                       (icicle-bookmark-propertize-candidate cand))))
                            (bookmark-all-names)) <span class="linecomment">; Loads bookmarks file.</span>
                  (bookmark-maybe-load-default-file) <span class="linecomment">; Loads bookmarks file.</span>
                  (mapcar (if icicle-show-multi-completion-flag
                              #'(lambda (bmk)
                                  (let* ((bname     (bookmark-name-from-full-record bmk))
                                         (guts      (bookmark-get-bookmark-record bmk))
                                         (tags      (bmkp-get-tags bmk))
                                         (file      (bookmark-get-filename bmk))
                                         (buf       (bmkp-get-buffer-name bmk))
                                         (file/buf
                                          (if (and buf (equal file bmkp-non-file-filename))
                                              buf
                                            file)))
                                    (cons `(,(icicle-candidate-short-help
                                              (icicle-bookmark-help-string bname)
                                              (icicle-bookmark-propertize-candidate bname))
                                            ,file/buf
                                            ,@(and tags (list (format "<span class="quote">%S</span>" tags))))
                                          guts)))
                            #'(lambda (bmk)
                                (let ((bname  (bookmark-name-from-full-record bmk))
                                      (guts   (bookmark-get-bookmark-record bmk)))
                                  (cons (icicle-candidate-short-help
                                         (icicle-bookmark-help-string bname)
                                         (icicle-bookmark-propertize-candidate bname))
                                        guts))))
                          (bmkp-sort-omit
                           (and (or (not parg) (consp parg)) <span class="linecomment">; No numeric PARG: all bookmarks.</span>
                                (or (bmkp-specific-buffers-alist-only)
                                    bookmark-alist)))))))
           (require 'bookmark)
           (when (featurep 'bookmark+)
             <span class="linecomment">;; Bind keys to narrow bookmark candidates by type.  Lax is for multi-completion case.</span>
             (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
               (define-key (symbol-value map) "<span class="quote">\C-\M-b</span>" 'icicle-bookmark-non-file-narrow) <span class="linecomment">; `C-M-b'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-d</span>" 'icicle-bookmark-dired-narrow) <span class="linecomment">; `C-M-d'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-f</span>" 'icicle-bookmark-file-narrow) <span class="linecomment">; `C-M-f'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-g</span>" 'icicle-bookmark-gnus-narrow) <span class="linecomment">; `C-M-g'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-m</span>" 'icicle-bookmark-man-narrow) <span class="linecomment">; `C-M-m'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-r</span>" 'icicle-bookmark-region-narrow) <span class="linecomment">; `C-M-r'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-u</span>" 'icicle-bookmark-url-narrow) <span class="linecomment">; `C-M-u'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-w</span>" 'icicle-bookmark-w3m-narrow) <span class="linecomment">; `C-M-w'</span>
               (define-key (symbol-value map) "<span class="quote">\C-\M-@</span>" 'icicle-bookmark-remote-file-narrow) <span class="linecomment">; C-M-@</span>
               (define-key (symbol-value map) [(control meta ?=) ?b] <span class="linecomment">; `C-M-= b'</span>
                 'icicle-bookmark-specific-buffers-narrow)
               (define-key (symbol-value map) [(control meta ?=) ?f] <span class="linecomment">; `C-M-= f'</span>
                 'icicle-bookmark-specific-files-narrow)
               (define-key (symbol-value map) [(control meta ?\.)] <span class="linecomment">; `C-M-= .'</span>
                 'icicle-bookmark-this-buffer-narrow)
               (define-key (symbol-value map) [(control meta ?B)] <span class="linecomment">; `C-M-B'</span>
                 'icicle-bookmark-bookmark-list-narrow)
               (define-key (symbol-value map) [(control meta ?F)] <span class="linecomment">; `C-M-F'</span>
                 'icicle-bookmark-local-file-narrow)
               (define-key (symbol-value map) [(control meta ?I)] <span class="linecomment">; `C-M-I'</span>
                 'icicle-bookmark-info-narrow)
               (define-key (symbol-value map) [(control meta ?K)] <span class="linecomment">; `C-M-K'</span>
                 'icicle-bookmark-desktop-narrow)))
           (setq bookmark-current-point   (point)
                 bookmark-current-buffer  (current-buffer))
           (save-excursion (skip-chars-forward "<span class="quote"> </span>") (setq bookmark-yank-point  (point)))
           (let* ((record   (bookmark-make-record))
                  (regionp  (and transient-mark-mode mark-active (not (eq (mark) (point)))))
                  (regname  (concat (buffer-name) "<span class="quote">: </span>"
                                    (buffer-substring (if regionp (region-beginning) (point))
                                                      (if regionp
                                                          (region-end)
                                                        (save-excursion (end-of-line) (point))))))
                  (defname  (bmkp-replace-regexp-in-string
                             "<span class="quote">\n</span>" "<span class="quote"> </span>"
                             (cond (regionp
                                    (save-excursion
                                      (goto-char (region-beginning))
                                      (skip-chars-forward "<span class="quote"> </span>") (setq bookmark-yank-point  (point)))
                                    (substring regname 0 (min bmkp-bookmark-name-length-max
                                                              (length regname))))
                                   ((eq major-mode 'w3m-mode) w3m-current-title)
                                   ((eq major-mode 'gnus-summary-mode)
                                    (elt (gnus-summary-article-header) 1))
                                   ((memq major-mode '(Man-mode woman-mode))
                                    (buffer-substring (point-min) (save-excursion
                                                                    (goto-char (point-min))
                                                                    (skip-syntax-forward "<span class="quote">^ </span>")
                                                                    (point))))
                                   (t (car record)))))
                  (bname    (or name
                                (icicle-transform-multi-completion
                                 (bmkp-completing-read-lax "<span class="quote">Set bookmark </span>" defname
                                                                icicle-candidates-alist
                                                                nil bookmark-history)))))
             (when (string-equal bname "<span class="quote"></span>") (setq bname  defname))
             (bookmark-store bname (cdr record) (consp parg))
             (when (and bmkp-prompt-for-tags-flag interactivep)
               (bmkp-add-tags bname (bmkp-read-tags-completing)))
             (case (and (boundp 'bmkp-auto-light-when-set) bmkp-auto-light-when-set)
               (autonamed-bookmark       (when (bmkp-autonamed-bookmark-p bname)
                                           (bmkp-light-bookmark bname)))
               (non-autonamed-bookmark   (unless (bmkp-autonamed-bookmark-p bname)
                                           (bmkp-light-bookmark bname)))
               (any-bookmark             (bmkp-light-bookmark bname))
               (autonamed-in-buffer      (bmkp-light-bookmarks
                                          (bmkp-remove-if-not
                                           #'bmkp-autonamed-bookmark-p
                                           (bmkp-this-buffer-alist-only)) nil 'MSG))
               (non-autonamed-in-buffer  (bmkp-light-bookmarks
                                          (bmkp-remove-if
                                           #'bmkp-autonamed-bookmark-p
                                           (bmkp-this-buffer-alist-only)) nil 'MSG))
               (all-in-buffer            (bmkp-light-this-buffer nil 'MSG)))
             (run-hooks 'bmkp-after-set-hook)
             (if bookmark-use-annotations
                 (bookmark-edit-annotation bname)
               (goto-char bookmark-current-point))))
      (icicle-bookmark-cleanup))))

<span class="linecomment">;;;###autoload (autoload 'icicle-tag-a-file "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-tag-a-file <span class="linecomment">; `C-x p t + a'</span>
  "<span class="quote">Tag a file (an autofile bookmark) with one or more tags.
You are prompted for the tags, then the file name.
Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

When prompted for the file you can use `M-n' to pick up the file name
at point, or if none then the visited file.

The tags are added to an autofile bookmark for the same file name and
directory.  If the bookmark does not yet exist it is created.
Candidate help shows information about the file's autofile bookmark if
it already exists, or the file itself if not.</span>"
  (lambda (file) (bmkp-autofile-add-tags file tags nil nil 'MSG))
  "<span class="quote">File to tag: </span>" nil nil nil nil nil   <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((tags  (bmkp-read-tags-completing))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>"))) <span class="linecomment">; First sexp</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-untag-a-file "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-untag-a-file <span class="linecomment">; `C-x p t - a'</span>
  "<span class="quote">Remove one or more tags from a file (an autofile bookmark).
You are prompted for the tags, then the file name.
Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

When prompted for the file you can use `M-n' to pick up the file name
at point, or if none then the visited file.

The tags are removed from an autofile bookmark for the same file name
and directory.  During file-name completion, only files tagged with
all of the given input tags are completion candidates.</span>"
  (lambda (file)
    (bmkp-autofile-remove-tags file tags nil nil 'MSG))
  "<span class="quote">File to untag: </span>" nil nil t nil nil   <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((tags  (bmkp-read-tags-completing))) <span class="linecomment">; Pre bindings</span>
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     #'(lambda (ff)
         <span class="linecomment">;; Expand relative file name, using directory from minibuffer.</span>
         (setq ff  (expand-file-name ff (icicle-file-name-directory-w-default
                                         (icicle-input-from-minibuffer))))
         (let* ((bmk   (bmkp-get-autofile-bookmark ff))
                (btgs  (and bmk (bmkp-get-tags bmk))))
           (and btgs  (catch 'icicle-untag-a-file
                        (dolist (tag  tags) (when (not (member tag btgs))
                                              (throw 'icicle-untag-a-file nil)))
                        t)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>"))) <span class="linecomment">; First sexp</span>


<span class="linecomment">;;; These are like multi-command versions of `bmkp-find-file-all-tags' etc.,</span>
<span class="linecomment">;;; except that the predicate is applied after matching the user's input</span>
<span class="linecomment">;;; (`icicle-must-pass-after-match-predicate').</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-all-tags "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-all-tags <span class="linecomment">; `C-x j t a *'</span>
  "<span class="quote">Visit a file or directory that has all of the tags you enter.
This is otherwise like `icicle-find-file'.
You are prompted for the tags, then the file name.
Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

When prompted for the file you can use `M-n' to pick up the file name
at point, or if none then the visited file.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only 'find-file)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (tags           (bmkp-read-tags-completing))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff) (let* ((bmk   (bmkp-get-autofile-bookmark ff))
                         (btgs  (and bmk (bmkp-get-tags bmk))))
                    (and btgs  (bmkp-every #'(lambda (tag) (bmkp-has-tag-p bmk tag)) tags)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>")))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-all-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-all-tags-other-window <span class="linecomment">; `C-x 4 j t a *'</span>
  "<span class="quote">`icicle-find-file-all-tags', but in another window.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (tags           (bmkp-read-tags-completing))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff) (let* ((bmk   (bmkp-get-autofile-bookmark ff))
                         (btgs  (and bmk (bmkp-get-tags bmk))))
                    (and btgs  (bmkp-every #'(lambda (tag) (bmkp-has-tag-p bmk tag)) tags)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>"))) <span class="linecomment">; First sexp</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-all-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-all-tags-regexp <span class="linecomment">; `C-x j t a % *'</span>
  "<span class="quote">Visit a file or directory that has each tag matching a regexp you enter.
When prompted for the file you can use `M-n' to pick up the file name
at point, or if none then the visited file.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only 'find-file)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (regexp         (read-string "<span class="quote">Regexp for tags: </span>"))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff)
       (let* ((bmk   (bmkp-get-autofile-bookmark ff))
              (btgs  (and bmk (bmkp-get-tags bmk))))
         (and btgs  (bmkp-every #'(lambda (tag) (string-match regexp (bmkp-tag-name tag))) btgs)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>")))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-all-tag-regexp-other-windows "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-all-tags-regexp-other-window <span class="linecomment">; `C-x 4 j t a % *'</span>
  "<span class="quote">`icicle-find-file-all-tags-regexp', but in another window.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (regexp         (read-string "<span class="quote">Regexp for tags: </span>"))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff)
       (let* ((bmk   (bmkp-get-autofile-bookmark ff))
              (btgs  (and bmk (bmkp-get-tags bmk))))
         (and btgs  (bmkp-every #'(lambda (tag) (string-match regexp (bmkp-tag-name tag))) btgs)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>")))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-some-tags "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-some-tags <span class="linecomment">; `C-x j t a +'</span>
  "<span class="quote">Visit a file or directory that has at least one of the tags you enter.
This is otherwise like `icicle-find-file'.
You are prompted for the tags, then the file name.
Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

When prompted for the file you can use `M-n' to pick up the file name
at point, or if none then the visited file.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only 'find-file)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg)
    (tags           (bmkp-read-tags-completing))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate
     (lambda (ff) (let* ((bmk   (bmkp-get-autofile-bookmark ff))
                         (btgs  (and bmk (bmkp-get-tags bmk))))
                    (and btgs  (bmkp-some  #'(lambda (tag) (bmkp-has-tag-p bmk tag)) tags)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>")))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-some-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-some-tags-other-window <span class="linecomment">; `C-x 4 j t a +'</span>
  "<span class="quote">`icicle-find-file-some-tags', but in another window.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (tags           (bmkp-read-tags-completing))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff) (let* ((bmk   (bmkp-get-autofile-bookmark ff))
                         (btgs  (and bmk (bmkp-get-tags bmk))))
                    (and btgs  (bmkp-some #'(lambda (tag) (bmkp-has-tag-p bmk tag)) tags)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>"))) <span class="linecomment">; First sexp</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-some-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-some-tags-regexp <span class="linecomment">; `C-x j t a % +'</span>
  "<span class="quote">Visit a file or directory that has a tag matching a regexp you enter.
When prompted for the file you can use `M-n' to pick up the file name
at point, or if none then the visited file.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only 'find-file)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (regexp         (read-string "<span class="quote">Regexp for tags: </span>"))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff)
       (let* ((bmk   (bmkp-get-autofile-bookmark ff))
              (btgs  (and bmk (bmkp-get-tags bmk))))
         (and btgs  (bmkp-some #'(lambda (tag) (string-match regexp (bmkp-tag-name tag))) btgs)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>")))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-some-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-some-tags-regexp-other-window <span class="linecomment">; `C-x 4 j t a % +'</span>
  "<span class="quote">`icicle-find-file-some-tags-regexp', but in another window.</span>"
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
      (funcall fn file 'WILDCARDS)))
  "<span class="quote">Find file: </span>" nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg) <span class="linecomment">; Pre bindings</span>
    (regexp         (read-string "<span class="quote">Regexp for tags: </span>"))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files))))))
   ((icicle-must-pass-after-match-predicate <span class="linecomment">; Post bindings</span>
     (lambda (ff)
       (let* ((bmk   (bmkp-get-autofile-bookmark ff))
              (btgs  (and bmk (bmkp-get-tags bmk))))
         (and btgs  (bmkp-some #'(lambda (tag) (string-match regexp (bmkp-tag-name tag))) btgs)))))))
  (unless (featurep 'bookmark+) (error "<span class="quote">You need library Bookmark+ for this command</span>")))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark "icicles-cmd1.el")</span>
(icicle-define-command icicle-bookmark  <span class="linecomment">; Command name</span>
  "<span class="quote">Jump to a bookmark.
With a plain prefix argument (`C-u'), reverse the effect of option
`icicle-bookmark-refresh-cache-flag'.

During completion, you can use `S-delete' on a bookmark to delete it.

If you also use library `bookmark+.el', then:

 * `C-M-RET' shows detailed info about the current bookmark candidate.
   `C-u C-M-RET' shows the complete, internal info for the bookmark.
   Likewise, for the other candidate help keys: `C-M-down' etc.
   (And the mode line always shows summary info about the bookmark.)
   
 * You can use `C-,' to sort bookmarks in many different ways,
   according to their properties.

 * In `*Completions*', the candidate bookmarks are highlighted
   according to their type.  You can customize the highlighting faces:

  `bmkp-bad-bookmark'              - possibly bad bookmark
  `bmkp-bookmark-list'             - bookmark list
  `bmkp-buffer'                    - buffer
  `bmkp-desktop'                   - desktop
  `bmkp-function'                  - function bookmark
  `bmkp-gnus'                      - Gnus article
  `bmkp-info'                      - Info node
  `bmkp-local-directory'           - local directory
  `bmkp-local-file-with-region'    - local file with a region
  `bmkp-local-file-without-region' - local file without a region
  `bmkp-man'                       - `man' page
  `bmkp-non-file'                  - non-file (no current buffer)
  `bmkp-remote-file'               - remote-file
  `bmkp-sequence'                  - sequence bookmark
  `bmkp-url'                       - URL

 * In `*Completions*', if option `icicle-show-multi-completion-flag'
   is non-nil, then each completion candidate is a multi-completion:

    a. the bookmark name
    b. the bookmark file or buffer name
    c. any tags

   You can match any parts of the multi-completion.  You can toggle
   the option (for the next command) using `M-m' during completion.
   For example, you can match all bookmarks that have tags by typing:

     C-M-j . * C-M-j S-TAB

   (Each `C-M-j' inserts `^G\n', which is `icicle-list-join-string'.)

 * You can narrow the current completion candidates to bookmarks of a
   given type:

   `C-M-b'   - non-file (buffer) bookmarks
   `C-M-B'   - bookmark-list bookmarks
   `C-M-d'   - Dired bookmarks
   `C-M-f'   - file bookmarks
   `C-M-F'   - local-file bookmarks
   `C-M-g'   - Gnus bookmarks
   `C-M-I'   - Info bookmarks
   `C-M-K'   - desktop bookmarks
   `C-M-m'   - `man' pages
   `C-M-r'   - bookmarks with regions
   `C-M-u'   - URL bookmarks
   `C-M-w'   - W3M (URL) bookmarks
   `C-M-@'   - remote-file bookmarks
   `C-M-.'   - bookmarks for the current buffer
   `C-M-= b' - bookmarks for specific buffers
   `C-M-= f' - bookmarks for specific files

   See also the individual multi-commands for different bookmark
   types: `icicle-bookmark-info-other-window' etc.

If you also use library `crosshairs.el', then the visited bookmark
position is highlighted.</span>"               <span class="linecomment">; Doc string</span>
  (lambda (cand) (icicle-bookmark-jump (icicle-transform-multi-completion cand))) <span class="linecomment">; Action</span>
  prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) <span class="linecomment">; `completing-read' args</span>
  nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil
  ((enable-recursive-minibuffers           t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
   (completion-ignore-case                 bookmark-completion-ignore-case)
   (prompt                                 "<span class="quote">Bookmark: </span>")
   (icicle-list-use-nth-parts              '(1))
   (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                               nil
                                             (if (facep 'file-name-shadow)
                                                 '((2 (face file-name-shadow))
                                                   (3 (face bookmark-menu-heading)))
                                               '((3 (face bookmark-menu-heading))))))
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-transform-before-sort-p         t)
   (icicle-delete-candidate-object         'icicle-bookmark-delete-action)
   (icicle-sort-orders-alist
    (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
              ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
            (and (featurep 'bookmark+)
                 '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p)
                   ("<span class="quote">by last buffer or file access</span>" (bmkp-buffer-last-access-cp
                                                     bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                   ("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)
                   ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                   ("<span class="quote">by last local file access</span>" (bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)
                   ("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)
                   ("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                        bmkp-local-file-type-cp bmkp-handler-cp)
                    icicle-alpha-p)))
            '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
              ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
   (icicle-candidate-help-fn
    #'(lambda (cand)
        (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag)
          (setq cand  (funcall icicle-get-alist-candidate-function cand))
          (setq cand  (cons (caar cand) (cdr cand))))
        (if (featurep 'bookmark+)
            (if current-prefix-arg
                (bmkp-describe-bookmark-internals cand)
              (bmkp-describe-bookmark cand))
          (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand)))))
   (icicle-candidates-alist
    (if (not (featurep 'bookmark+))
        (mapcar #'(lambda (cand)
                    (list (icicle-candidate-short-help (icicle-bookmark-help-string cand)
                                                       (icicle-bookmark-propertize-candidate cand))))
                (bookmark-all-names))   <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (bookmark-maybe-load-default-file) <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (mapcar (if icicle-show-multi-completion-flag
                  #'(lambda (bmk)
                      (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
                          (let* ((bname     (bookmark-name-from-full-record bmk))
                                 (guts      (bookmark-get-bookmark-record bmk))
                                 (file      (bookmark-get-filename bmk))
                                 (buf       (bmkp-get-buffer-name bmk))
                                 (file/buf  (if (and buf (equal file bmkp-non-file-filename))
                                                buf
                                              file))
                                 (tags      (bmkp-get-tags bmk)))
                            (cons `(,(icicle-candidate-short-help
                                      (icicle-bookmark-help-string bname)
                                      (icicle-bookmark-propertize-candidate bname))
                                    ,file/buf
                                    ,@(and tags (list (format "<span class="quote">%S</span>" tags))))
                                  guts))
                        (error nil)))
                #'(lambda (bmk)
                    (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
                        (let ((bname  (bookmark-name-from-full-record bmk))
                              (guts   (bookmark-get-bookmark-record bmk)))
                          (cons (icicle-candidate-short-help
                                 (icicle-bookmark-help-string bname)
                                 (icicle-bookmark-propertize-candidate bname))
                                guts))
                      (error nil))))
              (or (and (or (and (not icicle-bookmark-refresh-cache-flag)
                                (not (consp current-prefix-arg)))
                           (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg)))
                       bmkp-sorted-alist)
                  (setq bmkp-sorted-alist  (bmkp-sort-omit bookmark-alist)))))))
  (progn                                <span class="linecomment">; First code</span>
    (require 'bookmark)
    (when (featurep 'bookmark+)
      <span class="linecomment">;; Bind keys to narrow bookmark candidates by type.  Lax is for multi-completion case.</span>
      (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
        (define-key (symbol-value map) "<span class="quote">\C-\M-b</span>" 'icicle-bookmark-non-file-narrow) <span class="linecomment">; `C-M-b'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-d</span>" 'icicle-bookmark-dired-narrow) <span class="linecomment">; `C-M-d'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-f</span>" 'icicle-bookmark-file-narrow) <span class="linecomment">; `C-M-f'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-g</span>" 'icicle-bookmark-gnus-narrow) <span class="linecomment">; `C-M-g'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-m</span>" 'icicle-bookmark-man-narrow) <span class="linecomment">; `C-M-m'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-r</span>" 'icicle-bookmark-region-narrow) <span class="linecomment">; `C-M-r'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-u</span>" 'icicle-bookmark-url-narrow) <span class="linecomment">; `C-M-u'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-w</span>" 'icicle-bookmark-w3m-narrow) <span class="linecomment">; `C-M-w'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-@</span>" 'icicle-bookmark-remote-file-narrow) <span class="linecomment">; `C-M-@'</span>
        (define-key (symbol-value map) [(control meta ?=) ?b] <span class="linecomment">; `C-M-= b'</span>
          'icicle-bookmark-specific-buffers-narrow)
        (define-key (symbol-value map) [(control meta ?=) ?f] <span class="linecomment">; `C-M-= f'</span>
          'icicle-bookmark-specific-files-narrow)
        (define-key (symbol-value map) [(control meta ?\.)] <span class="linecomment">; `C-M-= .'</span>
          'icicle-bookmark-this-buffer-narrow)
        (define-key (symbol-value map) [(control meta ?B)] <span class="linecomment">; `C-M-B'</span>
          'icicle-bookmark-bookmark-list-narrow)
        (define-key (symbol-value map) [(control meta ?F)] <span class="linecomment">; `C-M-F'</span>
          'icicle-bookmark-local-file-narrow)
        (define-key (symbol-value map) [(control meta ?I)] <span class="linecomment">; `C-M-I'</span>
          'icicle-bookmark-info-narrow)
        (define-key (symbol-value map) [(control meta ?K)] <span class="linecomment">; `C-M-K'</span>
          'icicle-bookmark-desktop-narrow))))
  (icicle-bookmark-cleanup-on-quit)     <span class="linecomment">; Undo code</span>
  (icicle-bookmark-cleanup))            <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-other-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-bookmark-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Jump to a bookmark in another window.
Same as `icicle-bookmark', but uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (cand) (icicle-bookmark-jump-other-window (icicle-transform-multi-completion cand)))
  prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) <span class="linecomment">; `completing-read' args</span>
  nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark) nil
  ((enable-recursive-minibuffers           t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
   (completion-ignore-case                 bookmark-completion-ignore-case)
   (prompt                                 "<span class="quote">Bookmark: </span>")
   (icicle-list-use-nth-parts              '(1))
   (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                               nil
                                             (if (facep 'file-name-shadow)
                                                 '((2 (face file-name-shadow))
                                                   (3 (face bookmark-menu-heading)))
                                               '((3 (face bookmark-menu-heading))))))
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-transform-before-sort-p         t)
   (icicle-delete-candidate-object         'icicle-bookmark-delete-action)
   (icicle-sort-orders-alist
    (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
              ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
            (and (featurep 'bookmark+)
                 '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p)
                   ("<span class="quote">by last buffer or file access</span>" (bmkp-buffer-last-access-cp
                                                     bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                   ("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)
                   ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                   ("<span class="quote">by last local file access</span>" (bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)
                   ("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)
                   ("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                        bmkp-local-file-type-cp bmkp-handler-cp)
                    icicle-alpha-p)))
            '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
              ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
   (icicle-candidate-help-fn
    #'(lambda (cand)
        (when (and (featurep 'bookmark+) icicle-show-multi-completion-flag)
          (setq cand  (funcall icicle-get-alist-candidate-function cand))
          (setq cand  (cons (caar cand) (cdr cand))))
        (if (featurep 'bookmark+)
            (if current-prefix-arg
                (bmkp-describe-bookmark-internals cand)
              (bmkp-describe-bookmark cand))
          (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand)))))
   (icicle-candidates-alist
    (if (not (featurep 'bookmark+))
        (mapcar #'(lambda (cand)
                    (list (icicle-candidate-short-help (icicle-bookmark-help-string cand)
                                                       (icicle-bookmark-propertize-candidate cand))))
                (bookmark-all-names))   <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (bookmark-maybe-load-default-file) <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (mapcar (if icicle-show-multi-completion-flag
                  #'(lambda (bmk)
                      (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
                          (let* ((bname     (bookmark-name-from-full-record bmk))
                                 (guts      (bookmark-get-bookmark-record bmk))
                                 (file      (bookmark-get-filename bmk))
                                 (buf       (bmkp-get-buffer-name bmk))
                                 (file/buf  (if (and buf (equal file bmkp-non-file-filename))
                                                buf
                                              file))
                                 (tags      (bmkp-get-tags bmk)))
                            (cons `(,(icicle-candidate-short-help
                                      (icicle-bookmark-help-string bname)
                                      (icicle-bookmark-propertize-candidate bname))
                                    ,file/buf
                                    ,@(and tags (list (format "<span class="quote">%S</span>" tags))))
                                  guts))
                        (error nil)))
                #'(lambda (bmk)
                    (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
                        (let ((bname  (bookmark-name-from-full-record bmk))
                              (guts   (bookmark-get-bookmark-record bmk)))
                          (cons (icicle-candidate-short-help
                                 (icicle-bookmark-help-string bname)
                                 (icicle-bookmark-propertize-candidate bname))
                                guts))
                      (error nil))))
              (or (and (or (and (not icicle-bookmark-refresh-cache-flag)
                                (not (consp current-prefix-arg)))
                           (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg)))
                       bmkp-sorted-alist)
                  (setq bmkp-sorted-alist  (bmkp-sort-omit bookmark-alist)))))))
  (progn                                <span class="linecomment">; First code</span>
    (require 'bookmark)
    (when (featurep 'bookmark+)
      <span class="linecomment">;; Bind keys to narrow bookmark candidates by type.  Lax is for multi-completion case.</span>
      (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
        (define-key (symbol-value map) "<span class="quote">\C-\M-b</span>" 'icicle-bookmark-non-file-narrow) <span class="linecomment">; `C-M-b'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-d</span>" 'icicle-bookmark-dired-narrow) <span class="linecomment">; `C-M-d'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-f</span>" 'icicle-bookmark-file-narrow) <span class="linecomment">; `C-M-f'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-g</span>" 'icicle-bookmark-gnus-narrow) <span class="linecomment">; `C-M-g'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-m</span>" 'icicle-bookmark-man-narrow) <span class="linecomment">; `C-M-m'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-r</span>" 'icicle-bookmark-region-narrow) <span class="linecomment">; `C-M-r'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-u</span>" 'icicle-bookmark-url-narrow) <span class="linecomment">; `C-M-u'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-w</span>" 'icicle-bookmark-w3m-narrow) <span class="linecomment">; `C-M-w'</span>
        (define-key (symbol-value map) "<span class="quote">\C-\M-@</span>" 'icicle-bookmark-remote-file-narrow) <span class="linecomment">; `C-M-@'</span>
        (define-key (symbol-value map) [(control meta ?=) ?b] <span class="linecomment">; `C-M-= b'</span>
          'icicle-bookmark-specific-buffers-narrow)
        (define-key (symbol-value map) [(control meta ?=) ?f] <span class="linecomment">; `C-M-= f'</span>
          'icicle-bookmark-specific-files-narrow)
        (define-key (symbol-value map) [(control meta ?\.)] <span class="linecomment">; `C-M-= .'</span>
          'icicle-bookmark-this-buffer-narrow)
        (define-key (symbol-value map) [(control meta ?B)] <span class="linecomment">; `C-M-B'</span>
          'icicle-bookmark-bookmark-list-narrow)
        (define-key (symbol-value map) [(control meta ?F)] <span class="linecomment">; `C-M-F'</span>
          'icicle-bookmark-local-file-narrow)
        (define-key (symbol-value map) [(control meta ?I)] <span class="linecomment">; `C-M-I'</span>
          'icicle-bookmark-info-narrow)
        (define-key (symbol-value map) [(control meta ?K)] <span class="linecomment">; `C-M-K'</span>
          'icicle-bookmark-desktop-narrow))))
  (icicle-bookmark-cleanup-on-quit)     <span class="linecomment">; Undo code</span>
  (icicle-bookmark-cleanup))            <span class="linecomment">; Last code</span>

(defun icicle-bookmark-delete-action (cand)
  "<span class="quote">Delete bookmark candidate CAND, then update `bmkp-sorted-alist'.</span>"
  (bookmark-delete (icicle-transform-multi-completion cand))
  (when (or (and (not icicle-bookmark-refresh-cache-flag)
                 (not (consp current-prefix-arg)))
            (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg)))
    (setq bmkp-sorted-alist (bmkp-sort-omit bookmark-alist))))

(defun icicle-bookmark-propertize-candidate (cand)
  "<span class="quote">Return bookmark name CAND, with a face indicating its type.</span>"
  (when (featurep 'bookmark+)
    (put-text-property
     0 (length cand) 'face
     (cond ((bmkp-sequence-bookmark-p cand)        'bmkp-sequence)
           ((bmkp-function-bookmark-p cand)        'bmkp-function)
           ((bmkp-bookmark-list-bookmark-p cand)   'bmkp-bookmark-list)
           ((bmkp-desktop-bookmark-p cand)         'bmkp-desktop)
           ((bmkp-info-bookmark-p cand)            'bmkp-info)
           ((bmkp-man-bookmark-p cand)             'bmkp-man)
           ((bmkp-gnus-bookmark-p cand)            'bmkp-gnus)
           ((bmkp-url-bookmark-p cand)             'bmkp-url)
           ((bmkp-remote-file-bookmark-p cand)     'bmkp-remote-file)
           ((and (bmkp-file-bookmark-p cand)
                 (file-directory-p
                  (bookmark-get-filename cand)))        'bmkp-local-directory)
           ((and (bmkp-local-file-bookmark-p cand)
                 (bmkp-region-bookmark-p cand))    'bmkp-local-file-with-region)
           ((bmkp-local-file-bookmark-p cand)      'bmkp-local-file-without-region)
           ((and (bmkp-get-buffer-name cand)
                 (get-buffer (bmkp-get-buffer-name cand))
                 (equal (bookmark-get-filename cand)
                        bmkp-non-file-filename))   'bmkp-buffer)
           ((not (bmkp-file-bookmark-p cand))      'bmkp-non-file)
           (t                                           'bmkp-bad-bookmark))
     cand))
  cand)

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-jump (bookmark)
  "<span class="quote">Jump to BOOKMARK.
If `crosshairs.el' is loaded, then highlight the target position.
You probably don't want to use this.  Use `icicle-bookmark' instead.</span>"
  (interactive (list (bookmark-completing-read "<span class="quote">Jump to bookmark</span>" bookmark-current-bookmark)))
  (icicle-bookmark-jump-1 bookmark))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-jump-other-window (bookmark)
  "<span class="quote">Jump to BOOKMARK in another window.
If `crosshairs.el' is loaded, then highlight the target position.
You probably don't want to use this.  Use
`icicle-bookmark-other-window' instead.</span>"
  (interactive (list (bookmark-completing-read "<span class="quote">Jump to bookmark (other window)</span>"
                                               bookmark-current-bookmark)))
  (icicle-bookmark-jump-1 bookmark 'other-window))

(defun icicle-bookmark-jump-1 (bookmark &optional other-window-p)
  "<span class="quote">Helper function for `icicle-bookmark-jump(-other-window)'.</span>"
  (unless bookmark (error "<span class="quote">No bookmark specified</span>"))
  (bookmark-maybe-historicize-string bookmark)
  (if (fboundp 'bookmark--jump-via)
      (bookmark--jump-via bookmark (if other-window-p 'pop-to-buffer 'switch-to-buffer))
    (let ((cell  (bookmark-jump-noselect bookmark))) <span class="linecomment">; Emacs &lt; 23 and without `bookmark+.el'.</span>
      (when cell
        (if other-window-p
            (pop-to-buffer (car cell) 'other-window)
          (switch-to-buffer (car cell)))
        (goto-char (cdr cell))
        (unless (pos-visible-in-window-p) (recenter icicle-recenter))
        (progn (run-hooks 'bookmark-after-jump-hook) t)
        <span class="linecomment">;; If there is an annotation for this bookmark, show it in a buffer.</span>
        (when bookmark-automatically-show-annotations (bookmark-show-annotation bookmark)))))
  <span class="linecomment">;; Unless `bmkp-use-region' and bookmark has a region, show position using crosshairs.</span>
  (unless (and (boundp 'bmkp-use-region) bmkp-use-region
               (fboundp 'bmkp-get-end-position) (bmkp-get-end-position bookmark)
               (/= (bookmark-get-position bookmark) (bmkp-get-end-position bookmark)))
    (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))))
<span class="linecomment">;; $$$$$$   (select-window (minibuffer-window))</span>
<span class="linecomment">;; $$$$$$   (select-frame-set-input-focus (selected-frame)))</span>

(defun icicle-bookmark-help-string (bookmark-name)
  "<span class="quote">Return a help string for BOOKMARK-NAME.</span>" <span class="linecomment">; `bmkp-*' functions are defined in `bookmark+.el'.</span>
  <span class="linecomment">;; Use BOOKMARK-NAME, not full bookmark BMK, as arg to vanilla bookmark functions, for Emacs &lt; 23.</span>
  (let* ((bmk         (bookmark-get-bookmark bookmark-name))
         (buf         (and (fboundp 'bmkp-get-buffer-name) (bmkp-get-buffer-name bmk)))
         (file        (bookmark-get-filename bookmark-name))
         (start       (bookmark-get-position bookmark-name))
         (end         (and (fboundp 'bmkp-get-end-position) (bmkp-get-end-position bmk)))
         (annot       (bookmark-get-annotation bookmark-name))
         (sequence-p  (and (fboundp 'bmkp-sequence-bookmark-p)
                           (bmkp-sequence-bookmark-p bmk)))
         (function-p  (and (fboundp 'bmkp-function-bookmark-p)
                           (bmkp-function-bookmark-p bmk)))
         (blist-p     (and (fboundp 'bmkp-bookmark-list-bookmark-p)
                           (bmkp-bookmark-list-bookmark-p bmk)))
         (desktop-p   (and (fboundp 'bmkp-desktop-bookmark-p)
                           (bmkp-desktop-bookmark-p bmk)))
         (dired-p     (and (fboundp 'bmkp-dired-bookmark-p) (bmkp-dired-bookmark-p bmk)))
         (gnus-p      (and (fboundp 'bmkp-gnus-bookmark-p) (bmkp-gnus-bookmark-p bmk)))
         (info-p      (and (fboundp 'bmkp-info-bookmark-p) (bmkp-info-bookmark-p bmk)))
         (man-p       (and (fboundp 'bmkp-man-bookmark-p) (bmkp-man-bookmark-p bmk)))
         (url-p       (and (fboundp 'bmkp-url-bookmark-p) (bmkp-url-bookmark-p bmk)))
         type-info-p no-position-p)
    (when (or sequence-p function-p) (setq no-position-p  t))
    (concat (setq type-info-p
                  (cond (sequence-p (format "<span class="quote">Sequence: %S</span>" (bookmark-prop-get bmk 'sequence)))
                        (function-p (let ((fn  (bookmark-prop-get bmk 'function)))
                                      (if (symbolp fn) (format "<span class="quote">Function: `%s'</span>" fn) "<span class="quote">Function</span>")))
                        (desktop-p  "<span class="quote">Desktop, </span>")
                        (dired-p    (format "<span class="quote">Dired %s, </span>" file))
                        (gnus-p     "<span class="quote">Gnus, </span>")
                        (info-p     "<span class="quote">Info, </span>")
                        (man-p      (let ((man-args  (bookmark-prop-get bmk 'man-args)))
                                      (if man-args
                                          (format "<span class="quote">`man %s', </span>" man-args)
                                        <span class="linecomment">;; WoMan has no variable for the cmd name.</span>
                                        (format "<span class="quote">%s, </span>" (bookmark-prop-get bmk 'buffer-name)))))
                        (url-p      "<span class="quote">URL, </span>")
                        (t nil)))
            (and (not dired-p)
                 (or (and file (or (not (boundp 'bmkp-non-file-filename))
                                   (not (equal file bmkp-non-file-filename)))
                          (format (if type-info-p "<span class="quote">file `%s', </span>" "<span class="quote">File `%s', </span>") file))
                     (and buf (format (if type-info-p "<span class="quote">buffer `%s', </span>" "<span class="quote">Buffer `%s', </span>") buf))))
            (and (not no-position-p)
                 (if (and end (&gt; (- end start) 0))
                     (format "<span class="quote">from %d to %d (%d chars)</span>" start end (- end start))
                   (format "<span class="quote">position %d</span>" start)))
            (and annot (format "<span class="quote">, %s</span>" annot)))))

<span class="linecomment">;;; MUST keep this synchronized with any general Icicle-mode `C-M-' bindings in `icicles-mode.el'.</span>
<span class="linecomment">;;  That includes things like `icicle-read+insert-file-name-keys'.</span>
(defun icicle-bookmark-cleanup ()
  "<span class="quote">Cleanup code for `icicle-bookmark'.
Remove crosshairs highlighting and unbind filtering keys.</span>"
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (featurep 'bookmark+)
    (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
      (define-key (symbol-value map) "<span class="quote">\C-\M-b</span>" nil) <span class="linecomment">; `C-M-b'</span>
      (define-key (symbol-value map) [(control meta ?B)] nil) <span class="linecomment">; `C-M-B'</span>
      (define-key (symbol-value map) "<span class="quote">\C-\M-d</span>" nil) <span class="linecomment">; `C-M-d'</span>
      (define-key (symbol-value map) "<span class="quote">\C-\M-f</span>" nil) <span class="linecomment">; `C-M-f'</span>
      (define-key (symbol-value map) [(control meta ?F)] nil) <span class="linecomment">; `C-M-F'</span>
      (dolist (key  icicle-read+insert-file-name-keys) <span class="linecomment">; `C-M-F' - overrides previous.</span>
        (define-key (symbol-value map) key 'icicle-read+insert-file-name))
      (define-key (symbol-value map) "<span class="quote">\C-\M-g</span>" nil) <span class="linecomment">; `C-M-g'</span>
      (define-key (symbol-value map) [(control meta ?I)] nil) <span class="linecomment">; `C-M-I' (`C-M-i' is `ESC TAB')</span>
      (define-key (symbol-value map) [(control meta ?K)] nil) <span class="linecomment">; `C-M-K'</span>
      (define-key (symbol-value map) "<span class="quote">\C-\M-m</span>" nil) <span class="linecomment">; `C-M-m'</span>
      (define-key (symbol-value map) "<span class="quote">\C-\M-r</span>" nil) <span class="linecomment">; `C-M-r'</span>
      (define-key (symbol-value map) "<span class="quote">\C-\M-w</span>" nil) <span class="linecomment">; `C-M-w'</span>
      (define-key (symbol-value map) "<span class="quote">\C-\M-@</span>" nil) <span class="linecomment">; `C-M-@'</span>
      (define-key (symbol-value map) [(control meta ?\.)] <span class="linecomment">; `C-M-.'</span>
        'icicle-toggle-dot)             <span class="linecomment">; `icicles-mode.el'.</span>
      (define-key (symbol-value map) [(control meta ?=) ?b] nil) <span class="linecomment">; `C-M-= b'</span>
      (define-key (symbol-value map) [(control meta ?=) ?f] nil)))) <span class="linecomment">; `C-M-= f'</span>

(defun icicle-bookmark-cleanup-on-quit ()
  "<span class="quote">Do `icicle-bookmark-cleanup', then return to original window.</span>"
  (icicle-bookmark-cleanup)
  (when (window-live-p icicle-orig-window)
    (select-window icicle-orig-window)
    (select-frame-set-input-focus (selected-frame))))

<span class="linecomment">;;; These are minibuffer commands, but we define them here instead of in `icicles-mcmd.el'.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-bookmark-list-narrow () <span class="linecomment">; Bound to `C-M-B' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmark-list bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-bookmark-list-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-desktop-narrow ()   <span class="linecomment">; Bound to `C-M-K' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to desktop bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-desktop-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-dired-narrow ()   <span class="linecomment">; Bound to `C-M-d' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to Dired bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-dired-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-file-narrow ()   <span class="linecomment">; Bound to `C-M-f' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to file bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-file-bookmark-p (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-gnus-narrow ()   <span class="linecomment">; Bound to `C-M-g' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to Gnus bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-gnus-bookmark-p (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-info-narrow ()   <span class="linecomment">; Bound to `C-M-I' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to Info bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-info-bookmark-p (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-local-file-narrow () <span class="linecomment">; Bound to `C-M-F' for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to local-file bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-local-file-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-man-narrow () <span class="linecomment">; Bound to `C-M-m' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to `man'-page bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-man-bookmark-p (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-non-file-narrow () <span class="linecomment">; Bound to `C-M-b' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to non-file (buffer-only) bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-non-file-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-region-narrow () <span class="linecomment">; Bound to `C-M-r' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks with regions.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-region-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-remote-file-narrow () <span class="linecomment">; Bound to `C-M-@' in minibuf for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to remote-file bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-remote-file-bookmark-p
                  (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-specific-buffers-narrow (buffers) <span class="linecomment">; `C-M-= b' for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks for specific BUFFERS.
You are prompted for the BUFFERS.</span>"
  (interactive (let ((icicle-completion-candidates  icicle-completion-candidates))
                 (list (icicle-bookmarked-buffer-list))))
  (icicle-narrow-candidates-with-predicate
   `(lambda (x)
     (member (bmkp-get-buffer-name (funcall icicle-get-alist-candidate-function (car x)))
      ',buffers))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-specific-files-narrow (files) <span class="linecomment">; `C-M-= f' in minibuf for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks for specific FILES.
You are prompted for the FILES.</span>"
  (interactive (list (icicle-bookmarked-file-list)))
  (icicle-narrow-candidates-with-predicate
   `(lambda (x)
     (member (bookmark-get-filename (funcall icicle-get-alist-candidate-function (car x)))
      ',files))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-this-buffer-narrow () <span class="linecomment">; `C-M-.' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks for the current buffer.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x)
       (with-current-buffer icicle-orig-buff
         (bmkp-this-buffer-p (funcall icicle-get-alist-candidate-function (car x)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-url-narrow ()    <span class="linecomment">; Bound to `C-M-u' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to URL bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-url-bookmark-p (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-w3m-narrow ()    <span class="linecomment">; Bound to `C-M-w' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to W3M (URL) bookmarks.</span>"
  (interactive)
  (icicle-narrow-candidates-with-predicate
   #'(lambda (x) (bmkp-w3m-bookmark-p (funcall icicle-get-alist-candidate-function (car x))))))

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-bookmark-command-1 (otherp type prompt args)
  "<span class="quote">Helper macro for `icicle-define*-bookmark-command' macros.
The command defined raises an error unless library `bookmark+.el' can
be loaded.</span>"
  `(icicle-define-command
    ,(intern (format "<span class="quote">icicle-bookmark-%s%s</span>" type (if otherp "<span class="quote">-other-window</span>" "<span class="quote"></span>"))) <span class="linecomment">; Command name</span>
    ,(format "<span class="quote">Jump to a %s bookmark%s.
Like `icicle-bookmark%s',
 but with %s bookmarks only.
This is a multi-command version of
 `bmkp-%s-jump%s'.
You need library `bookmark+.el' for this command.</span>"
             type (if otherp "<span class="quote"> in other window</span>" "<span class="quote"></span>")
             (if otherp "<span class="quote">-other-window</span>" "<span class="quote"></span>") type
             type (if otherp "<span class="quote">-other-window</span>" "<span class="quote"></span>")) <span class="linecomment">; Doc string</span>
    (lambda (cand) (,(if otherp 'icicle-bookmark-jump-other-window 'icicle-bookmark-jump)
                     (icicle-transform-multi-completion cand)))
    prompt1 icicle-candidates-alist nil <span class="linecomment">; `completing-read' args</span>
    (not icicle-show-multi-completion-flag)
    nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
    nil nil
    ((IGNORED1                               (unless (require 'bookmark+ nil t)
                                               (error "<span class="quote">You need library `bookmark+.el' for this \
command</span>")))
     (IGNORED2                               (bookmark-maybe-load-default-file)) <span class="linecomment">; `bookmark-alist'.</span>
     (enable-recursive-minibuffers           t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
     (completion-ignore-case                 bookmark-completion-ignore-case) <span class="linecomment">; Additional bindings</span>
     (prompt1                                ,(or prompt
                                                  (format "<span class="quote">%s%s bookmark: </span>"
                                                          (capitalize (substring type 0 1))
                                                          (substring type 1 (length type)))))
     (icicle-list-use-nth-parts              '(1))
     (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                                 nil
                                               (if (facep 'file-name-shadow)
                                                   '((2 (face file-name-shadow))
                                                     (3 (face bookmark-menu-heading)))
                                                 '((3 (face bookmark-menu-heading))))))
     (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
     (icicle-whole-candidate-as-text-prop-p  t)
     (icicle-transform-before-sort-p         t)
     (icicle-delete-candidate-object         'icicle-bookmark-delete-action)
     (icicle-sort-orders-alist
      (append
       '(("<span class="quote">in *Bookmark List* order</span>")   <span class="linecomment">; Renamed from "turned OFF'.</span>
         ("<span class="quote">by bookmark name</span>" . icicle-alpha-p)
         ("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
         ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p))
       (and (member ,type '("<span class="quote">info</span>" "<span class="quote">region</span>"))
        '(("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)))
       (and (member ,type '("<span class="quote">gnus</span>" "<span class="quote">region</span>"))
        '(("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)))
       (and (member ,type '("<span class="quote">url</span>" "<span class="quote">region</span>"))
        '(("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)))
       (and (not (member ,type '("<span class="quote">bookmark-list</span>" "<span class="quote">desktop</span>" "<span class="quote">gnus</span>" "<span class="quote">info</span>" "<span class="quote">man</span>" "<span class="quote">url</span>")))
        '(("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                               bmkp-local-file-type-cp bmkp-handler-cp)
           icicle-alpha-p)))
       (and (not (member ,type '("<span class="quote">bookmark-list</span>" "<span class="quote">desktop</span>" "<span class="quote">dired</span>" "<span class="quote">non-file</span>")))
        '(("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)))
       (and (member ,type '("<span class="quote">local-file</span>" "<span class="quote">file</span>" "<span class="quote">dired</span>" "<span class="quote">region</span>"))
        '(("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
          ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
          ("<span class="quote">by last local file access</span>" (bmkp-local-file-accessed-more-recently-cp)
           icicle-alpha-p)
          ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
           icicle-alpha-p)))
       (and (not (string= ,type "<span class="quote">desktop</span>"))
        '(("<span class="quote">by last buffer or file access</span>" (bmkp-buffer-last-access-cp
                                            bmkp-local-file-accessed-more-recently-cp)
           icicle-alpha-p)))
       (and (get-buffer "<span class="quote">*Bookmark List*</span>")
        '(("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
           icicle-alpha-p)))
       '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
         ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
     (icicle-candidate-help-fn
      #'(lambda (cand)
          (when icicle-show-multi-completion-flag
            (setq cand  (funcall icicle-get-alist-candidate-function cand))
            (setq cand  (cons (caar cand) (cdr cand))))
          (if current-prefix-arg
              (bmkp-describe-bookmark-internals cand)
            (bmkp-describe-bookmark cand))))
     (icicle-candidates-alist
      (mapcar (if icicle-show-multi-completion-flag
                  #'(lambda (bmk)
                      (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
                          (let* ((bname     (bookmark-name-from-full-record bmk))
                                 (guts      (bookmark-get-bookmark-record bmk))
                                 (file      (bookmark-get-filename bmk))
                                 (buf       (bmkp-get-buffer-name bmk))
                                 (file/buf  (if (and buf (equal file bmkp-non-file-filename))
                                                buf
                                              file))
                                 (tags      (bmkp-get-tags bmk)))
                            <span class="linecomment">;; Emacs 20 byte-compiler bug prevents using backslash syntax here.</span>
                            (cons (append (list (icicle-candidate-short-help
                                                 (icicle-bookmark-help-string bname)
                                                 (icicle-bookmark-propertize-candidate bname))
                                                file/buf)
                                          (and tags (list (format "<span class="quote">%S</span>" tags))))
                                  guts))
                        (error nil)))
                #'(lambda (bmk)
                    (condition-case nil <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
                        (let ((bname  (bookmark-name-from-full-record bmk))
                              (guts   (bookmark-get-bookmark-record bmk)))
                          (cons (icicle-candidate-short-help
                                 (icicle-bookmark-help-string bname)
                                 (icicle-bookmark-propertize-candidate bname))
                                guts))
                      (error nil))))
       (bmkp-sort-omit (funcall ',(intern (format "<span class="quote">bmkp-%s-alist-only</span>" type)) ,@args)))))
    nil                                 <span class="linecomment">; First code</span>
    (icicle-bookmark-cleanup-on-quit)   <span class="linecomment">; Undo code</span>
    (icicle-bookmark-cleanup)))         <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-bookmark-command (type &optional prompt &rest args)
  "<span class="quote">Define an Icicles multi-command for jumping to bookmarks of type TYPE.
TYPE is a string to be used for the doc string, default prompt, and in
 function names.  It should be lowercase and contain no spaces.
Optional arg PROMPT is the completion prompt.
ARGS is a list of any additional arguments to be passed to the
appropriate `bmkp-TYPE-alist-only' function.</span>"
  `(icicle-define-bookmark-command-1 nil ,type ,prompt ,args))

<span class="linecomment">;;;###autoload</span>
(defmacro icicle-define-bookmark-other-window-command (type &optional prompt &rest args)
  "<span class="quote">Same as `icicle-define-bookmark-command', but command uses other window.</span>"
  `(icicle-define-bookmark-command-1 t ,type ,prompt ,args))

<span class="linecomment">;; The following sexps macro-expand to define these commands:</span>
<span class="linecomment">;;  `icicle-bookmark-bookmark-list',</span>
<span class="linecomment">;;  `icicle-bookmark-desktop',</span>
<span class="linecomment">;;  `icicle-bookmark-dired',                 `icicle-bookmark-dired-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file',                  `icicle-bookmark-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-all-tags',         `icicle-bookmark-file-all-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-all-tags-regexp',  `icicle-bookmark-file-all-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-some-tags',        `icicle-bookmark-file-some-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-some-tags-regexp', `icicle-bookmark-file-some-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir',         `icicle-bookmark-file-this-dir-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags-regexp',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags-regexp',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-gnus',                  `icicle-bookmark-gnus-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-info',                  `icicle-bookmark-info-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-local-file',            `icicle-bookmark-local-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-man',                   `icicle-bookmark-man-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-non-file',              `icicle-bookmark-non-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-region',                `icicle-bookmark-region-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-remote-file',           `icicle-bookmark-remote-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-specific-buffers',      `icicle-bookmark-specific-buffers-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-specific-files',        `icicle-bookmark-specific-files-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-all-tags',              `icicle-bookmark-all-tags-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-all-tags-regexp',       `icicle-bookmark-all-tags-regexp-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-some-tags',             `icicle-bookmark-some-tags-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-some-tags-regexp',      `icicle-bookmark-some-tags-regexp-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-this-buffer',           `icicle-bookmark-this-buffer-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-url',                   `icicle-bookmark-url-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-w3m',                   `icicle-bookmark-w3m-other-window'</span>

<span class="linecomment">;; Other-window means nothing for a bookmark list or a desktop.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-non-file "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">non-file</span>")                      <span class="linecomment">; `C-x j b'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-non-file-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">non-file</span>")                      <span class="linecomment">; `C-x 4 j b'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-bookmark-list "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">bookmark-list</span>")                 <span class="linecomment">; `C-x j B'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-dired "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">dired</span>")                         <span class="linecomment">; `C-x j d'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-dired-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">dired</span>")                         <span class="linecomment">; `C-x 4 j d'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file</span>")                          <span class="linecomment">; `C-x j f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file</span>")                          <span class="linecomment">; `C-x 4 j f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir</span>")                 <span class="linecomment">; `C-x j C-f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir</span>")                 <span class="linecomment">; `C-x 4 j C-f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-gnus "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">gnus</span>")                          <span class="linecomment">; `C-x j g'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-gnus-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">gnus</span>")                          <span class="linecomment">; `C-x 4 j g'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-info "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">info</span>")                          <span class="linecomment">; `C-x j i'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-info-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">info</span>")                          <span class="linecomment">; `C-x 4 j i'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-desktop "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">desktop</span>")                       <span class="linecomment">; `C-x j K'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-local-file "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">local-file</span>")                    <span class="linecomment">; `C-x j l'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-local-file-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">local-file</span>")                    <span class="linecomment">; `C-x 4 j l'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-man "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">man</span>")                           <span class="linecomment">; `C-x j m'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-man-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">man</span>")                           <span class="linecomment">; `C-x 4 j m'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-remote-file "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">remote-file</span>")                   <span class="linecomment">; `C-x j n'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-remote-file-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">remote-file</span>")                   <span class="linecomment">; `C-x 4 j n'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-region "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">region</span>" "<span class="quote">Select region: </span>")      <span class="linecomment">; `C-x j r'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-region-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">region</span>" "<span class="quote">Select region: </span>")      <span class="linecomment">; `C-x 4 j r'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">all-tags</span>" nil                   <span class="linecomment">; `C-x j t *'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">all-tags</span>" nil                   <span class="linecomment">; `C-x 4 j t *'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">some-tags</span>" nil                  <span class="linecomment">; `C-x j t +'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">some-tags</span>" nil                  <span class="linecomment">; `C-x 4 j t +'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">all-tags-regexp</span>" nil            <span class="linecomment">; `C-x j t % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">all-tags-regexp</span>" nil            <span class="linecomment">; `C-x 4 j t % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">some-tags-regexp</span>" nil           <span class="linecomment">; `C-x j t % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">some-tags-regexp</span>" nil           <span class="linecomment">; `C-x 4 j t % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-all-tags</span>" nil              <span class="linecomment">; `C-x j t f *'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-all-tags</span>" nil              <span class="linecomment">; `C-x 4 j t f *'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-some-tags</span>" nil             <span class="linecomment">; `C-x j t f +'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-some-tags</span>" nil             <span class="linecomment">; `C-x 4 j t f +'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-all-tags-regexp</span>" nil       <span class="linecomment">; `C-x j t f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-all-tags-regexp</span>" nil       <span class="linecomment">; `C-x 4 j t f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-some-tags-regexp</span>" nil      <span class="linecomment">; `C-x j t f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-some-tags-regexp</span>" nil      <span class="linecomment">; `C-x 4 j t f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-this-dir-file-all-tags "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-all-tags</span>" nil <span class="linecomment">; `C-x j t C-f *'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-all-tags</span>" nil <span class="linecomment">; `C-x 4 j t C-f *'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-some-tags</span>" nil <span class="linecomment">; `C-x j t C-f +'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-some-tags</span>" nil <span class="linecomment">; `C-x 4 j t C-f +'</span>
                                             (bmkp-read-tags-completing))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-all-tags-regexp</span>" nil <span class="linecomment">; `C-x j t C-f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-all-tags-regexp</span>" nil <span class="linecomment">; `C-x 4 j t C-f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags-regexp "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-some-tags-regexp</span>" nil <span class="linecomment">; `C-x j t C-f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags-regexp-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-some-tags-regexp</span>" nil <span class="linecomment">; `C-x 4 j t C-f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-url "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">url</span>")                           <span class="linecomment">; `C-x j u'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-url-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">url</span>")                           <span class="linecomment">; `C-x 4 j u'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-w3m "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">w3m</span>")                           <span class="linecomment">; `C-x j w'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-w3m-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">w3m</span>")                           <span class="linecomment">; `C-x 4 j w'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-this-buffer "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">this-buffer</span>")                   <span class="linecomment">; `C-x j .'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-this-buffer-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">this-buffer</span>")                   <span class="linecomment">; `C-x 4 j .'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-buffers "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">specific-buffers</span>" nil           <span class="linecomment">; `C-x j = b'</span>
                                             (icicle-bookmarked-buffer-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-buffers-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">specific-buffers</span>" nil           <span class="linecomment">; `C-x 4 j = b'</span>
                                             (icicle-bookmarked-buffer-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-files "icicles-cmd1.el")</span>
(icicle-define-bookmark-command              "<span class="quote">specific-files</span>" nil             <span class="linecomment">; `C-x j = f'</span>
                                             (icicle-bookmarked-file-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-files-other-window "icicles-cmd1.el")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">specific-files</span>" nil             <span class="linecomment">; `C-x 4 j = f'</span>
                                             (icicle-bookmarked-file-list))
<span class="linecomment">;;;###autoload</span>
(defalias 'icicle-select-bookmarked-region 'icicle-bookmark-region-other-window)

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmarked-buffer-list ()
  "<span class="quote">`icicle-buffer-list', but only for bookmarked buffers.</span>"
  (interactive)
  (let ((icicle-buffer-predicate  (lambda (buf) (member buf (bmkp-buffer-names)))))
    (icicle-buffer-list)))
  
<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmarked-file-list ()
  "<span class="quote">`icicle-buffer-list', but only for bookmarked buffers.</span>"
  (interactive)
  (let ((use-file-dialog        nil)
        (icicle-file-predicate  (lambda (file) (member (expand-file-name file) (bmkp-file-names)))))
    (icicle-file-list)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-first-tag "icicles-cmd1.el")</span>
(icicle-define-command icicle-find-first-tag <span class="linecomment">; Command name</span>
  "<span class="quote">Find first tag in current tags table whose name matches your input.
This is similar to standard command `find-tag', with these
differences:

* This is a multi-command, so you can visit any number of tags.

* Only the first tag of several identical tags is a candidate, so you
  cannot visit the others.  That is, there is no equivalent to using
  `M-,' (`tags-loop-continue') after `find-tag' to find additional,
  identical tags.

* If `crosshairs.el' is loaded, the target position is highlighted.

To browse all tags (including duplicates) in all tags tables, use the
more powerful Icicles multi-command `icicle-find-tag'.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag-other-window' to `icicle-find-first-tag'.  If you
do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"       <span class="linecomment">; Doc string</span>
  icicle-find-first-tag-action          <span class="linecomment">; Action function</span>
  "<span class="quote">Find tag: </span>"                          <span class="linecomment">; `completing-read' args</span>
  (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag)
  nil nil nil nil (funcall (or find-tag-default-function (get major-mode 'find-tag-default-function)
                               'find-tag-default))
  nil
  ((completion-ignore-case  (progn (require 'etags)
                                   (if (and (boundp 'tags-case-fold-search) <span class="linecomment">; Bindings</span>
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search)))
   (case-fold-search        completion-ignore-case))
  nil                                   <span class="linecomment">; First, undo, last code.</span>
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)))

(defun icicle-find-first-tag-action (cand)
  "<span class="quote">Action function for `icicle-find-first-tag'.</span>"
  (find-tag cand)
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-first-tag-other-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-find-first-tag-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Find first tag in current tags table whose name matches your input.
Same as `icicle-find-first-tag' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  icicle-find-first-tag-other-window-action <span class="linecomment">; Action function</span>
  "<span class="quote">Find tag other window: </span>"             <span class="linecomment">; `completing-read' args</span>
  (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag)
  nil nil nil nil (funcall (or find-tag-default-function (get major-mode 'find-tag-default-function)
                               'find-tag-default))
  nil
  ((completion-ignore-case  (progn (require 'etags)
                                   (if (and (boundp 'tags-case-fold-search) <span class="linecomment">; Bindings</span>
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search)))
   (case-fold-search        completion-ignore-case))
  nil                                   <span class="linecomment">; First, undo, last code.</span>
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)))

(defun icicle-find-first-tag-other-window-action (cand)
  "<span class="quote">Action function for `icicle-find-first-tag-other-window'.</span>"
  (find-tag-other-window cand)
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-find-tag (regexp &optional arg)
  "<span class="quote">Navigate among all tags that match REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You can use completion to choose a tag in the current tags table as
REGEXP.  You can use `\\[icicle-pop-tag-mark]' to return to your starting point.

All matching tags are shown, including duplicate tags from the same or
different source files.  This means that you do not need `M-,' - you
see all tags as candidates to visit.

By default:

* Tags from all tags files are candidates.
* In `*Completions*', the source file name is shown after each tag.

A prefix argument changes this default behavior, as follows:

* ARG = 0 or ARG &gt; 0: only the current tag table is used
* ARG = 0 or ARG &lt; 0: source file names are not shown

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag' to `icicle-find-tag'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive
   (let* ((completion-ignore-case  (if (and (boundp 'tags-case-fold-search)
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search))
          (case-fold-search        completion-ignore-case))
     (require 'etags)
     (list (completing-read "<span class="quote">Find tag matching regexp: </span>"
                            <span class="linecomment">;; $$$ Or should we just read a regexp against `regexp-history'?</span>
                            (if (fboundp 'tags-lazy-completion-table)
                                (tags-lazy-completion-table) <span class="linecomment">; Emacs 23+</span>
                              'tags-complete-tag) <span class="linecomment">; Emacs &lt; 23</span>
                            nil nil nil 'find-tag-history
                            (funcall (or find-tag-default-function
                                         (get major-mode 'find-tag-default-function)
                                         'find-tag-default)))
           current-prefix-arg)))

  (unwind-protect
       (let* ((icicle-whole-candidate-as-text-prop-p  t)
              (icicle-sort-comparer                   nil)
              (icicle-inhibit-sort-p                  t)
              (icicle-candidate-action-fn             'icicle-find-tag-action)
              (icicle-candidate-help-fn               'icicle-find-tag-help)
              (completion-ignore-case                 (if (and (boundp 'tags-case-fold-search)
                                                               (memq tags-case-fold-search
                                                                     '(t nil)))
                                                          tags-case-fold-search
                                                        case-fold-search))
              (case-fold-search                       completion-ignore-case)
              (orig-pt-find-tag                       (point-marker)))

         (ring-insert find-tag-marker-ring orig-pt-find-tag) <span class="linecomment">; Record starting point.</span>
         (icicle-explore #'(lambda () (icicle-find-tag-define-candidates regexp arg))
                         #'icicle-find-tag-final-act #'icicle-find-tag-quit-or-error
                         #'icicle-find-tag-quit-or-error nil
                         "<span class="quote">Choose a tag: </span>" nil nil nil 'find-tag-history))
    (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-pop-tag-mark ()
  "<span class="quote">Like `pop-tag-mark', but uses `pop-to-buffer', not `switch-to-buffer'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-tag-mark' to `icicle-pop-tag-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive)
  (require 'etags)
  (when (ring-empty-p find-tag-marker-ring) (error "<span class="quote">No previous locations for find-tag invocation</span>"))
  (let ((marker  (ring-remove find-tag-marker-ring 0)))
    (pop-to-buffer (or (marker-buffer marker) (error "<span class="quote">The marked buffer has been deleted</span>")))
    (goto-char (marker-position marker))
    (unless (pos-visible-in-window-p) (recenter icicle-recenter))
    (set-marker marker nil nil)))

(defun icicle-find-tag-define-candidates (regexp arg)
  "<span class="quote">Define candidates for `icicle-find-tag'.
See `icicle-explore', argument DEFINE-CANDIDATES-FN.</span>"
  (save-excursion
    (let ((first-time  t)
          (morep       t))
      (setq icicle-candidates-alist  ())
      (while (and morep (visit-tags-table-buffer (not first-time)))
        (when (and arg (wholenump (prefix-numeric-value arg))) (setq morep  nil))
        (setq first-time               nil
              icicle-candidates-alist  (append icicle-candidates-alist
                                               (nreverse
                                                (icicle-find-tag-define-candidates-1
                                                 regexp (&gt; (prefix-numeric-value arg)
                                                           0)))))))))

(defun icicle-find-tag-define-candidates-1 (regexp show-file-p)
  "<span class="quote">Helper function for `icicle-find-tag-define-candidates'.
Returns completion alist of tag information for tags matching REGEXP.
Include file name (label) if SHOW-FILE-P is non-nil.

If SHOW-FILE-P is nil, then alist items look like this:

 (TAG TAG-INFO FILE-PATH GOTO-FUNC)

If SHOW-FILE-P is non-nil, then alist items look like this:

 ((TAG FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC) or

 (FILE-LABEL TAG-INFO FILE-PATH GOTO-FUNC) if no matching TAG.

TAG-INFO is what `snarf-tag-function' (e.g. `etags-snarf-tag')
returns.  It is a cons (TEXT LINE . POSITION).

TEXT is the initial part of a line containing the tag.
LINE is the line number.
POSITION is the (one-based) char position of TEXT within the file.

If TEXT is t, it means the tag refers to exactly LINE or POSITION,
whichever is present, LINE having preference, no searching.
Either LINE or POSITION can be nil.  POSITION is used if present.</span>"
  (icicle-highlight-lighter)
  (message "<span class="quote">Gathering tags...</span>")
  (goto-char (point-min))
  (let ((temp-list  ()))
    (while (re-search-forward (concat regexp "<span class="quote">.*\177*</span>") nil t) <span class="linecomment">; Look before the DEL character.</span>
      (beginning-of-line)
      (let* ((goto-func  goto-tag-location-function) <span class="linecomment">; e.g. `etags-goto-tag-location'.</span>
             <span class="linecomment">;; TAG-INFO: If no specific tag, (t nil (point-min)). Else, (TEXT LINE . STARTPOS).</span>
             <span class="linecomment">;; e.g. TEXT = "(defun foo ()" or just "foo" (if explicit),</span>
             <span class="linecomment">;;      LINE = "148", STARTPOS = "1723"</span>
             (tag-info (save-excursion (funcall snarf-tag-function))) <span class="linecomment">; e.g. `etags-snarf-tag'.</span>
             (tag (if (eq t (car tag-info)) nil (car tag-info)))
             <span class="linecomment">;; FILE-PATH is absolute. FILE-LABEL is relative to `default-directory'.</span>
             (file-path (save-excursion
                          (if tag (file-of-tag) (save-excursion (next-line 1) (file-of-tag)))))
             (file-label (expand-file-name file-path (file-truename default-directory))))
        (when (and tag (not (string= "<span class="quote"></span>" tag)) (= (aref tag 0) ?\( ))
          (setq tag  (concat tag "<span class="quote"> ...)</span>")))
        (when (file-readable-p file-path)
          <span class="linecomment">;; Add item to alist.</span>
          <span class="linecomment">;;   Item looks like this:         ((TAG FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC)</span>
          <span class="linecomment">;;   or like this, if no matching tag: ((FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC)</span>
          (cond (tag
                 (push `(,(if show-file-p
                              (list tag <span class="linecomment">; Make multi-completion cons: add file name to candidate.</span>
                                    (progn (put-text-property 0 (length file-label) 'face
                                                              'icicle-candidate-part file-label)
                                           file-label))
                              tag)
                         ,tag-info ,file-path ,goto-func)
                       temp-list))
                (show-file-p            <span class="linecomment">; No tag.  Use only the FILE-LABEL.</span>
                 (push `((,(progn (put-text-property 0 (length file-label) 'face
                                                     'icicle-candidate-part file-label)
                                  file-label))
                         ,tag-info ,file-path ,goto-func)
                       temp-list)))))
      (forward-line))
    temp-list))                         <span class="linecomment">; Return the alist for this TAGS file.</span>

(defun icicle-find-tag-action (ignored-string)
  "<span class="quote">Action function for `icicle-find-tag'.</span>"
  <span class="linecomment">;; Ignore (TAG FILE-LABEL) part.  Use only (TAG-INFO FILE-PATH GOTO-FUNC) part.</span>
  (let* ((cand       (cdr (elt (icicle-filter-alist icicle-candidates-alist
                                                    icicle-completion-candidates)
                               icicle-candidate-nb)))
         (tag-info   (nth 0 cand))
         (goto-func  (nth 2 cand)))
    (switch-to-buffer-other-window      <span class="linecomment">; Go to source file at FILE-PATH.</span>
     (if (fboundp 'tag-find-file-of-tag-noselect)
         (tag-find-file-of-tag-noselect (nth 1 cand))
       (find-file-noselect (nth 1 cand))))
    (widen)
    (condition-case err
        (funcall goto-func tag-info)    <span class="linecomment">; Go to text at TAG-INFO.</span>
      (error (message (error-message-string err)) (sit-for 2) nil)))
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-find-tag-help (cand)
  "<span class="quote">Use as `icicle-candidate-help-fn' for `icicle-find-first-tag'.</span>"
  (let* ((cand      (cdr (elt (icicle-filter-alist icicle-candidates-alist
                                                   icicle-completion-candidates)
                              icicle-candidate-nb)))
         (tag-info  (nth 0 cand)))
    (message (if (eq t (car tag-info))
                 "<span class="quote">No tag - file name itself matches</span>"
               (format "<span class="quote">Line: %d, Position: %d, File: %s</span>"
                       (cadr tag-info) (cddr tag-info) (nth 1 cand))))
    (sit-for 4)))

(defun icicle-find-tag-final-act ()
  "<span class="quote">Go to the final tag choice.</span>"
  (let ((cand  (cdr icicle-explore-final-choice-full)))
    (unless cand (error "<span class="quote">No such occurrence: %s</span>" cand))
    (switch-to-buffer-other-window <span class="linecomment">; Go to source file at FILE-PATH.</span>
     (if (fboundp 'tag-find-file-of-tag-noselect)
         (tag-find-file-of-tag-noselect (nth 1 cand))
       (find-file-noselect (nth 1 cand))))
    (widen)
    (funcall (nth 2 cand) (nth 0 cand)))) <span class="linecomment">; Go to text at TAG-INFO.</span>

(defun icicle-find-tag-quit-or-error ()
  "<span class="quote">Pop back to the last tag visited.</span>"
  (icicle-pop-tag-mark)
  (raise-frame))

<span class="linecomment">;;;###autoload</span>
(defun icicle-other-window-or-frame (arg) <span class="linecomment">; Bound to `C-x o' in Icicle mode.</span>
  "<span class="quote">Select a window or frame, by name or by order.
This command combines Emacs commands `other-window' and `other-frame',
together with Icicles multi-commands `icicle-select-window', and
`icicle-select-frame'.  Use the prefix argument to choose, as follows:

 With no prefix arg or a non-zero numeric prefix arg:
  If the selected frame has multiple windows, then this is
  `other-window'.  Otherwise, it is `other-frame'.

 With a zero prefix arg (e.g. `C-0'):
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows in the frame as candidates.
  Otherwise (single-window frame), this is `icicle-select-frame'.

 With plain `C-u':
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows from all visible frames as
  candidates.  Otherwise, this is `icicle-select-frame'.

By default, Icicle mode remaps all key sequences that are normally
bound to `other-window' to `icicle-other-window-or-frame'.  If you do
not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((numarg  (prefix-numeric-value arg)))
    (cond ((consp arg)
           (if (one-window-p) (icicle-select-frame) (icicle-select-window)))
          ((zerop numarg)
           (if (one-window-p)
               (icicle-select-frame)
             (let ((current-prefix-arg  nil)) (icicle-select-window))))
          (t
           (if (one-window-p) (other-frame numarg) (other-window numarg))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-select-frame "icicles-cmd1.el")</span>
(icicle-define-command icicle-select-frame <span class="linecomment">; Bound to `C-x 5 o' in Icicle mode.</span>
  "<span class="quote">Select frame by its name and raise it.
A frame name in this context is suffixed as needed by [NUMBER], to
make it unique.  For example, in a context where frames are named for
their buffers and you have two frames showing buffer *Help*, one of
the frames will be called `*Help*[2]' for use with this command.</span>" <span class="linecomment">; Doc string</span>
  icicle-select-frame-by-name           <span class="linecomment">; Action function</span>
  "<span class="quote">Select frame: </span>"                      <span class="linecomment">; `completing-read' args</span>
  icicle-frame-alist nil t nil
  (if (boundp 'frame-name-history) 'frame-name-history 'icicle-frame-name-history)
  (cdr (assq 'name (frame-parameters (next-frame (selected-frame))))) nil
  ((icicle-frame-alist  (icicle-make-frame-alist)) <span class="linecomment">; Bindings</span>
   (alt-fn              nil)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">frame</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn (icicle-alt-act-fn-for-type "<span class="quote">frame</span>")))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-select-frame-by-name (name &optional frame-alist)
  "<span class="quote">Select the frame named NAME, and raise it.
Optional argument FRAME-ALIST is an alist of frames to choose from.
Each element has the form (FNAME . FRAME), where FNAME names FRAME.
See `icicle-make-frame-alist' for more about FNAME.</span>"
  (interactive (let* ((alist    (icicle-make-frame-alist))
                      (default  (car (rassoc (selected-frame) alist)))
                      (input    (completing-read "<span class="quote">Select Frame: </span>" alist nil t nil
                                                 'frame-name-history default)))
                 (list (if (= (length input) 0) default input)
                       alist)))
  (unless frame-alist (setq frame-alist  (or (and (boundp 'icicle-frame-alist) icicle-frame-alist)
                                             (icicle-make-frame-alist))))
  (let ((frame  (cdr (assoc name frame-alist))))
    (unless frame (error "<span class="quote">No such frame: `%s'</span>" name))
    (make-frame-visible frame)
    (select-frame-set-input-focus frame)))

(defun icicle-make-frame-alist ()
  "<span class="quote">Return an alist of entries (FNAME . FRAME), where FNAME names FRAME.
Frame parameter `name' is used as FNAME, unless there is more than one
frame with the same name.  In that case, FNAME includes a suffix
\[NUMBER], to make it a unique name.  The NUMBER order among frame
names that differ only by their [NUMBER] is arbitrary.</span>"
  (let ((fr-alist  ())
        (count     2)
        fname new-name)
    (dolist (fr  (frame-list))
      (setq fname  (frame-parameter fr 'name))
      (if (not (assoc fname fr-alist))
          (push (cons fname fr) fr-alist)
        (setq new-name  fname)
        (while (assoc new-name fr-alist)
          (setq new-name  (format "<span class="quote">%s[%d]</span>" fname count)
                count     (1+ count)))
        (push (cons new-name fr) fr-alist))
      (setq count  2))
    fr-alist))

<span class="linecomment">;;;###autoload (autoload 'icicle-select-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-select-window <span class="linecomment">; Command name</span>
<span class="linecomment">;; Free vars here: `icicle-window-alist' is bound in Bindings form.</span>
  "<span class="quote">Select window by its name.
With no prefix arg, candidate windows are those of the selected frame.
With a prefix arg, windows of all visible frames are candidates.

A window name is the name of its displayed buffer, but suffixed as
needed by [NUMBER], to make the name unique.  For example, if you have
two windows showing buffer *Help*, one of the windows will be called
`*Help*[2]' for use with this command.</span>" <span class="linecomment">; Doc string</span>
  icicle-select-window-by-name          <span class="linecomment">; Action function</span>
  "<span class="quote">Select window: </span>" icicle-window-alist nil t nil nil <span class="linecomment">; `completing-read' args</span>
  (buffer-name (window-buffer (other-window 1))) nil
  ((icicle-window-alist  (icicle-make-window-alist current-prefix-arg)))) <span class="linecomment">; Bindings</span>

<span class="linecomment">;; Free vars here: `icicle-window-alist' is bound in `icicle-select-window'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-select-window-by-name (name &optional window-alist)
  "<span class="quote">Select the window named NAME.
Optional argument WINDOW-ALIST is an alist of windows to choose from.

Interactively:
 A prefix arg means windows from all visible frames are candidates.
 No prefix arg means windows from the selected frame are candidates.

Each alist element has the form (WNAME . WINDOW), where WNAME names
WINDOW.  See `icicle-make-window-alist' for more about WNAME.

If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive (let* ((alist    (icicle-make-window-alist current-prefix-arg))
                      (default  (car (rassoc (selected-window) alist)))
                      (input    (completing-read "<span class="quote">Select Window: </span>" alist nil t nil nil default)))
                 (list (if (= (length input) 0) default input) alist)))
  (unless window-alist
    (setq window-alist  (or (and (boundp 'icicle-window-alist) icicle-window-alist)
                            (icicle-make-window-alist))))
  (let ((window  (cdr (assoc name window-alist))))
    (unless window (error "<span class="quote">No such window: `%s'</span>" name))
    (select-window window)
    (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))
    (select-frame-set-input-focus (selected-frame))))

(defun icicle-make-window-alist (&optional all-p)
  "<span class="quote">Return an alist of entries (WNAME . WINDOW), where WNAME names WINDOW.
The name of the buffer in a window is used as its name, unless there
is more than one window displaying the same buffer.  In that case,
WNAME includes a suffix [NUMBER], to make it a unique name.  The
NUMBER order among window names that differ only by their [NUMBER] is
arbitrary.

Non-nil argument ALL-P means use windows from all visible frames.
Otherwise, use only windows from the selected frame.</span>"
  (let ((win-alist  ())
        (count      2)
        wname new-name)
    (walk-windows #'(lambda (w)
                      (setq wname  (buffer-name (window-buffer w)))
                      (if (not (assoc wname win-alist))
                          (push (cons wname w) win-alist)
                        (setq new-name  wname)
                        (while (assoc new-name win-alist)
                          (setq new-name  (format "<span class="quote">%s[%d]</span>" wname count)
                                count     (1+ count)))
                        (push (cons new-name w) win-alist))
                      (setq count  2))
                  'no-mini
                  (if all-p 'visible 'this-frame))
    win-alist))

<span class="linecomment">;;;###autoload (autoload 'icicle-delete-windows "icicles-cmd1.el")</span>
(icicle-define-command icicle-delete-windows <span class="linecomment">; Command name</span>
  "<span class="quote">Delete windows showing a buffer, anywhere.</span>" <span class="linecomment">; Doc string</span>
  delete-windows-on                     <span class="linecomment">; Action function</span>
  "<span class="quote">Delete windows on buffer: </span>"          <span class="linecomment">; `completing-read' args</span>
  (let ((cand-bufs  nil))
    (dolist (buf  (buffer-list))
      (when (get-buffer-window buf 0) (push (list (buffer-name buf)) cand-bufs)))
    cand-bufs)
  nil t nil 'buffer-name-history (buffer-name (current-buffer)) nil
  ((icicle-use-candidates-only-once-flag  t) <span class="linecomment">; Bindings</span>
   (icicle-inhibit-try-switch-buffer      t)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-window (bufferp)   <span class="linecomment">; Bound to `C-x 0' in Icicle mode.</span>
  "<span class="quote">`delete-window' or prompt for buffer and delete all its windows.
When called from the minibuffer, remove the `*Completions*' window.

Otherwise:
 With no prefix argument, delete the selected window.
 With a prefix argument, prompt for a buffer and delete all windows,
   on any frame, that show that buffer.

 With a prefix argument, this is an Icicles multi-command - see
 command `icicle-mode'.  Input-candidate completion and cycling are
 available.  While cycling, these keys with prefix `C-' are active:

 `C-RET'   - Act on current completion candidate only
 `C-down'  - Move to next completion candidate and act
 `C-up'    - Move to previous completion candidate and act
 `C-next'  - Move to next apropos-completion candidate and act
 `C-prior' - Move to previous apropos-completion candidate and act
 `C-end'   - Move to next prefix-completion candidate and act
 `C-home'  - Move to previous prefix-completion candidate and act
 `C-!'     - Act on *all* candidates (or all that are saved),
             successively (careful!)

 With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
 `C-M-RET', `C-M-down', and so on) provide help about candidates.

 Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
 or `C-g' to quit.

By default, Icicle mode remaps all key sequences that are normally
bound to `delete-window' to `icicle-delete-window'.  If you do not
want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (window-minibuffer-p (selected-window))
      (icicle-remove-Completions-window)
    (if bufferp (icicle-delete-windows) (delete-window))))

<span class="linecomment">;;;###autoload (autoload 'icicle-kill-buffer "icicles-cmd1.el")</span>
(icicle-define-command icicle-kill-buffer <span class="linecomment">; Bound to `C-x k' in Icicle mode.</span>
  "<span class="quote">Kill a buffer.
With a positive prefix arg, only buffers visiting files are candidates.
With a negative prefix arg, only buffers associated with the selected
 frame are candidates.
With a zero prefix arg, only buffers that have the same mode as the
 current buffer are candidates.

You can use `C-x M' during completion to allow only buffers of a
certain major mode as candidates.  You are prompted for the mode.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

By default, Icicle mode remaps all key sequences that are normally
bound to `kill-buffer' to `icicle-kill-buffer'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  icicle-kill-a-buffer-and-update-completions <span class="linecomment">; Action function</span>
  "<span class="quote">Kill buffer: </span>"                       <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs23.</span>
  nil 'buffer-name-history (buffer-name (current-buffer)) nil
  (icicle-buffer-bindings)              <span class="linecomment">; Bindings</span>
  (progn                                <span class="linecomment">; First code</span>
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil)))

(defun icicle-kill-a-buffer-and-update-completions (buf)
  "<span class="quote">Kill buffer BUF and update the set of completions.</span>"
  (setq buf  (get-buffer buf))
  (if buf
      (condition-case err
          (if (not (buffer-live-p buf))
              (message "<span class="quote">Buffer already deleted: `%s'</span>" buf)
            (if (fboundp 'kill-buffer-and-its-windows)
                (kill-buffer-and-its-windows buf) <span class="linecomment">; Defined in `misc-cmds.el'.</span>
              (kill-buffer buf))
            <span class="linecomment">;; Update the set of completions, then update `*Completions*'.</span>
            (setq minibuffer-completion-table  (mapcar #'(lambda (buf) (list (buffer-name buf)))
                                                       (buffer-list)))
            (icicle-complete-again-update))
        (error nil))
    (message "<span class="quote">No such live buffer: `%s'</span>" buf)))

(put 'icicle-buffer 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-buffer "icicles-cmd1.el")</span>
(icicle-define-command icicle-buffer    <span class="linecomment">; Bound to `C-x b' in Icicle mode.</span>
  "<span class="quote">Switch to a different buffer.
With a positive prefix arg, only buffers visiting files are candidates.
With a negative prefix arg, only buffers associated with the selected
 frame are candidates.
With a zero prefix arg, only buffers that have the same mode as the
 current buffer are candidates.

You can use `C-x m' during completion to access buffer (non-file)
 bookmarks, if you use library `bookmark+.el'.
You can use `S-delete' during completion to kill a candidate buffer.

You can use `C-x M' during completion to allow only buffers of a
certain major mode as candidates.  You are prompted for the mode.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

For example, to show only buffers that are associated with files, set
`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).

Option `icicle-buffer-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-buffers-ido-like' non-nil gives this command a more
Ido-like behavior.

See also command `icicle-buffer-config'.

By default, Icicle mode remaps all key sequences that are normally
bound to `switch-to-buffer' to `icicle-buffer'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  switch-to-buffer                      <span class="linecomment">; Action function</span>
  "<span class="quote">Switch to buffer: </span>"                  <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names) nil
  (icicle-buffer-bindings)              <span class="linecomment">; Bindings</span>
  (progn                                <span class="linecomment">; First code</span>
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-non-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-non-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-non-file-other-window))
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil)))

<span class="linecomment">;; Free var here: `icicle-bufflist' is bound by `icicle-buffer-bindings'.</span>
(defun icicle-default-buffer-names ()
  "<span class="quote">Default buffer names (Emacs 23+) or name (&lt; Emacs 23).</span>"
  (let ((bname  (buffer-name (if (fboundp 'another-buffer) <span class="linecomment">; In `misc-fns.el'.</span>
                                 (another-buffer nil t)
                               (other-buffer (current-buffer))))))
    (if (&gt; emacs-major-version 22)      <span class="linecomment">; Emacs 23 accepts a list of default values.</span>
        (cons bname
              (mapcar #'buffer-name
                      (delete (current-buffer) <span class="linecomment">; Just keep the first 4.  (This could be an option.)</span>
                              (icicle-first-N 4 (or icicle-bufflist (buffer-list))))))
      bname)))

<span class="linecomment">;; Free var here: `icicle-bufflist' is bound by `icicle-buffer-bindings'.</span>
(defun icicle-filter-buffer-cands-for-mode ()
  "<span class="quote">Prompt for a major mode, then remove buffer candidates not in that mode.</span>"
  (interactive)
  (save-selected-window (icicle-remove-Completions-window))
  (let* ((enable-recursive-minibuffers  t)
         (mode
          (intern (completing-read
                   "<span class="quote">Major mode: </span>"
                   (icicle-remove-duplicates
                    (mapcar (lambda (buf) (with-current-buffer buf (list (symbol-name major-mode))))
                            icicle-bufflist))
                   nil t))))
    (setq icicle-must-pass-after-match-predicate
          `(lambda (buf)
            (with-current-buffer buf (eq major-mode ',mode)))))
  (icicle-complete-again-update))

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-other-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-buffer-other-window <span class="linecomment">; Bound to `C-x 4 b' in Icicle mode.</span>
  "<span class="quote">Switch to a different buffer in another window.
Same as `icicle-buffer' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  switch-to-buffer-other-window         <span class="linecomment">; Action function</span>
  "<span class="quote">Switch to buffer in other window: </span>"  <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names) nil
  (icicle-buffer-bindings)              <span class="linecomment">; Bindings</span>
  (progn                                <span class="linecomment">; First code</span>
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-non-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-non-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-non-file-other-window))
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-insert-buffer "icicles-cmd1.el")</span>
(icicle-define-command icicle-insert-buffer
  "<span class="quote">Multi-command version of `insert-buffer'.
With a positive prefix arg, only buffers visiting files are candidates.
With a negative prefix arg, only buffers associated with the selected
 frame are candidates.
With a zero prefix arg, only buffers that have the same mode as the
 current buffer are candidates.

You can use `C-x M' during completion to allow only buffers of a
certain major mode as candidates.  You are prompted for the mode.

You can use `S-delete' during completion to kill a candidate buffer.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

For example, to show only buffers that are associated with files, set
`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).

Option `icicle-buffer-require-match-flag' can be used to override
option `icicle-require-match-flag'.

See also command `icicle-buffer-config'.

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  insert-buffer                         <span class="linecomment">; Action function</span>
  "<span class="quote">Buffer: </span>"                            <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names) nil
  (icicle-buffer-bindings)              <span class="linecomment">; Bindings</span>
  (progn                                <span class="linecomment">; First code</span>
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-add-buffer-candidate "icicles-cmd1.el")</span>
(icicle-define-command icicle-add-buffer-candidate <span class="linecomment">; Command name</span>
  "<span class="quote">Add buffer as an always-show completion candidate.
Add the buffer to `icicle-buffer-extras'.  Save the updated option.
With a positive prefix arg, only buffers visiting files are candidates.
With a negative prefix arg, only buffers associated with the selected
 frame are candidates.
With a zero prefix arg, only buffers that have the same mode as the
 current buffer are candidates.

You can use `S-delete' on any completion candidate to remove it from
`icicle-buffer-extras'.

You can use `C-x M' during completion to allow only buffers of a
certain major mode as candidates.  You are prompted for the mode.

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  (lambda (buf)
    (add-to-list 'icicle-buffer-extras buf) <span class="linecomment">; Action function</span>
    (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras)
    (message "<span class="quote">Buffer `%s' added to always-show buffers</span>" buf))
  "<span class="quote">Buffer candidate to show always: </span>"   <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names) nil
  (icicle-buffer-bindings ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">; Bindings</span>
  (progn                                <span class="linecomment">; First code</span>
    (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" 'icicle-filter-buffer-cands-for-mode))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xM</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xM</span>" nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-buffer-candidate "icicles-cmd1.el")</span>
(icicle-define-command icicle-remove-buffer-candidate <span class="linecomment">; Command name</span>
  "<span class="quote">Remove buffer as an always-show completion candidate.
Remove the buffer from `icicle-buffer-extras'.
Save the updated option.</span>"               <span class="linecomment">; Doc string</span>
  icicle-remove-buffer-candidate-action <span class="linecomment">; Action function</span>
  "<span class="quote">Remove buffer from always-show list: </span>" <span class="linecomment">; `completing-read' args</span>
  (mapcar #'list icicle-buffer-extras) nil t nil 'buffer-name-history (car icicle-buffer-extras) nil
  ((icicle-use-candidates-only-once-flag  t) <span class="linecomment">; Bindings</span>
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>"))))
  (unless icicle-buffer-extras (error "<span class="quote">`icicle-extra-buffers' is empty</span>"))) <span class="linecomment">; First code</span>

(defun icicle-remove-buffer-candidate-action (buf)
  "<span class="quote">Action function for command `icicle-remove-buffer-candidate'.</span>"
  (setq icicle-buffer-extras  (delete buf icicle-buffer-extras))
  (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras)
  (message "<span class="quote">Buffer `%s' removed from always-show buffers</span>" buf))

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-config "icicles-cmd1.el")</span>
(icicle-define-command icicle-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a configuration of user options for `icicle-buffer'.
You can use `S-delete' on any configuration during completion to
remove it.  See user option `icicle-buffer-configs'.
See also commands `icicle-add-buffer-config' and
`icicle-remove-buffer-config'.</span>"         <span class="linecomment">; Doc string</span>
  (lambda (config-name)                 <span class="linecomment">; Action function</span>
    (let ((config  (assoc config-name icicle-buffer-configs)))
      (setq icicle-buffer-match-regexp     (elt config 1)
            icicle-buffer-no-match-regexp  (elt config 2)
            icicle-buffer-predicate        (elt config 3)
            icicle-buffer-extras           (elt config 4)
            icicle-buffer-sort             (elt config 5))))
  "<span class="quote">Configuration: </span>" icicle-buffer-configs nil t nil <span class="linecomment">; `completing-read' args</span>
  'icicle-buffer-config-history nil nil
  ((icicle-delete-candidate-object  'icicle-remove-buffer-config-action))) <span class="linecomment">; Bindings</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-add-buffer-config "icicles-cmd1.el")</span>
(icicle-define-add-to-alist-command icicle-add-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Add buffer configuration to `icicle-buffer-configs'.
You are prompted for the buffer configuration components.
For the list of extra buffers to always display, you can choose them
using `C-mouse-2', `C-RET', and so on, just as you would make any
Icicles multiple choice.</span>"
  #'(lambda ()
      (let ((name            (read-from-minibuffer "<span class="quote">Add buffer configuration.  Name: </span>"))
            (match-regexp    (icicle-read-from-minibuf-nil-default
                              "<span class="quote">Regexp to match: </span>" nil nil nil 'regexp-history
                              icicle-buffer-match-regexp))
            (nomatch-regexp  (icicle-read-from-minibuf-nil-default
                              "<span class="quote">Regexp not to match: </span>" nil nil nil 'regexp-history
                              icicle-buffer-no-match-regexp))
            (pred            (icicle-read-from-minibuf-nil-default
                              "<span class="quote">Predicate to satify: </span>" nil nil nil
                              (if (boundp 'function-name-history)
                                  'function-name-history
                                'icicle-function-name-history)
                              icicle-buffer-predicate))
            (sort-fn         (icicle-read-from-minibuf-nil-default
                              "<span class="quote">Sort function: </span>" nil nil t
                              (if (boundp 'function-name-history)
                                  'function-name-history
                                'icicle-function-name-history)
                              (and icicle-buffer-sort (symbol-name icicle-buffer-sort))))
            (extras          (progn (message "<span class="quote">Choose extra buffers to show...</span>") (sit-for 1)
                                    (icicle-buffer-list)))) <span class="linecomment">; Do last, for convenience.</span>
        (list name match-regexp nomatch-regexp pred extras sort-fn)))
  icicle-buffer-configs)

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-list "icicles-cmd1.el")</span>
(icicle-define-command icicle-buffer-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of buffer names.
With a positive prefix arg, only buffers visiting files are candidates.
With a negative prefix arg, only buffers associated with the selected
frame are candidates.

You can use `S-delete' during completion to kill a candidate buffer.
The list of names (strings) is returned.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  (lambda (name) (push name buf-names)) <span class="linecomment">; Action function</span>
  "<span class="quote">Choose buffer (`RET' when done): </span>"   <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (buf) (list (buffer-name buf)))
          (if current-prefix-arg
              (if (wholenump (prefix-numeric-value current-prefix-arg))
                  (icicle-remove-if-not #'(lambda (bf) (buffer-file-name bf)) (buffer-list))
                (cdr (assq 'buffer-list (frame-parameters))))
            (buffer-list)))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'buffer-name-history nil nil
  ((buf-names                               ()) <span class="linecomment">; Bindings</span>
   (completion-ignore-case                  (or (and (boundp 'read-buffer-completion-ignore-case)
                                                     read-buffer-completion-ignore-case)
                                                completion-ignore-case))
   (icicle-must-match-regexp                icicle-buffer-match-regexp)
   (icicle-must-not-match-regexp            icicle-buffer-no-match-regexp)
   (icicle-must-pass-after-match-predicate  icicle-buffer-predicate)
   (icicle-require-match-flag               icicle-buffer-require-match-flag)
   (icicle-extra-candidates                 icicle-buffer-extras)
   (icicle-ignore-space-prefix-flag         icicle-buffer-ignore-space-prefix-flag)
   (icicle-delete-candidate-object          'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buf</span>
   (icicle-transform-function               'icicle-remove-dups-if-extras)
   (icicle-sort-comparer                    (or icicle-buffer-sort icicle-sort-comparer))
   (icicle-sort-orders-alist
    (append (list '("<span class="quote">by last access</span>")   <span class="linecomment">; Renamed from "turned OFF'.</span>
                  '("<span class="quote">*...* last</span>" . icicle-buffer-sort-*...*-last)
                  '("<span class="quote">by buffer size</span>" . icicle-buffer-smaller-p)
                  '("<span class="quote">by major mode name</span>" . icicle-major-mode-name-less-p)
                  (and (fboundp 'icicle-mode-line-name-less-p)
                       '("<span class="quote">by mode-line mode name</span>" . icicle-mode-line-name-less-p))
                  '("<span class="quote">by file/process name</span>" . icicle-buffer-file/process-name-less-p))
            (delete '("<span class="quote">turned OFF</span>") icicle-sort-orders-alist)))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-use-candidates-only-once-flag  t))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq buf-names  (nreverse (delete "<span class="quote"></span>" buf-names))) <span class="linecomment">; Last code - return the list of buffers</span>
    (when (interactive-p) (message "<span class="quote">Buffers: %S</span>" buf-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-buffer-config "icicles-cmd1.el")</span>
(icicle-define-command icicle-remove-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Remove buffer configuration from `icicle-buffer-configs'.
Save the updated option.</span>"               <span class="linecomment">; Doc string</span>
  icicle-remove-buffer-config-action    <span class="linecomment">; Action function</span>
  "<span class="quote">Remove buffer configuration: </span>"       <span class="linecomment">; `completing-read' args</span>
  (mapcar #'(lambda (config) (list (car config))) icicle-buffer-configs)
  nil t nil 'icicle-buffer-config-history (caar icicle-buffer-configs) nil
  ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">; Bindings</span>

(defun icicle-remove-buffer-config-action (config-name)
  "<span class="quote">Action function for command `icicle-remove-buffer-config'.</span>"
  (setq icicle-buffer-configs  (icicle-assoc-delete-all config-name icicle-buffer-configs))
  (funcall icicle-customize-save-variable-function 'icicle-buffer-configs icicle-buffer-configs)
  (message "<span class="quote">Buffer configuration `%s' removed</span>" config-name))

<span class="linecomment">;;;###autoload (autoload 'icicle-face-list "icicles-cmd1.el")</span>
(icicle-define-command icicle-face-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of face names.  The list of names (strings) is returned.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name) (push (icicle-transform-multi-completion name) face-names)) <span class="linecomment">; Action function</span>
  prompt (mapcar #'icicle-make-face-candidate (face-list)) nil <span class="linecomment">; `completing-read' args</span>
  (not (stringp icicle-WYSIWYG-Completions-flag)) nil
  (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history)
  nil nil
  ((prompt                                "<span class="quote">Choose face (`RET' when done): </span>") <span class="linecomment">; Bindings</span>
   (icicle-list-nth-parts-join-string     "<span class="quote">: </span>")
   (icicle-list-join-string               "<span class="quote">: </span>")
   (icicle-list-end-string                "<span class="quote"></span>")
   (icicle-list-use-nth-parts             '(1))
   (icicle-use-candidates-only-once-flag  t)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">face</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn (icicle-alt-act-fn-for-type "<span class="quote">face</span>")))
   (face-names                            ()))
  (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (prog1 (setq face-names  (nreverse (delete "<span class="quote"></span>" face-names))) <span class="linecomment">; Last code - return list of faces</span>
    (when (interactive-p) (message "<span class="quote">Faces: %S</span>" face-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-color-theme "icicles-cmd1.el")</span>
(icicle-define-command icicle-color-theme <span class="linecomment">; Command name</span>
  "<span class="quote">Change color theme.
You can use `S-delete' during completion to remove the current
candidate from the list of color themes.

If you use `C-g' during this command, the previous color-theme
snapshot is used to restore that color theme.

Remember too that you can use the pseudo-theme [Reset] to restore the
last theme: `M-x color-theme-select [Reset]'.

By default, each time you invoke this command, a snapshot is first
made of the current color theme (or current colors, if no theme is
used).  Thus, by default, if you use `C-g', the colors restored are
those used before you changed themes using this command.

However, if you use a prefix arg, then this command takes no new
snapshot, unless no snapshot has ever been taken during this Emacs
session.  This can be useful when experimenting, to restore not to the
state just before this command invocation, but to some previous
snapshot.

To use this command, you must have loaded library `color-theme.el',
available from http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme.</span>" <span class="linecomment">; Doc string</span>
  (lambda (theme)
    (when (string= "<span class="quote"></span>" theme) (error "<span class="quote">No theme name entered (empty input)</span>"))
    (funcall  (intern theme)))          <span class="linecomment">; Action function: just call the theme.</span>
  "<span class="quote">Theme: </span>" icicle-color-themes nil t nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'color-theme-history) 'color-theme-history 'icicle-color-theme-history)
  nil nil
  ((icicle-delete-candidate-object  'icicle-color-themes) <span class="linecomment">; Bindings</span>
   (prefix-arg                      current-prefix-arg))
  (progn (unless (prog1 (require 'color-theme nil t) <span class="linecomment">; First code</span>
                   (when (and (fboundp 'color-theme-initialize) (not color-theme-initialized))
                     <span class="linecomment">;; NOTE: We need the `condition-case' because of a BUG in `directory-files'</span>
                     <span class="linecomment">;; for Emacs 20.  Bug reported to `color-theme.el' maintainer 2009-11-22.  The</span>
                     <span class="linecomment">;; problem is that the default value of `color-theme-libraries' concats</span>
                     <span class="linecomment">;; `file-name-directory', which ends in `/', with `/themes', not with `themes'.</span>
                     <span class="linecomment">;; So the result is `...//themes'.  That is tolerated by Emacs 21+</span>
                     <span class="linecomment">;; `directory-files', but not for Emacs 20.  Until this `color-theme.el' bug is</span>
                     <span class="linecomment">;; fixed, Emacs 20 users will need to manually load `color-theme-libraries.el'.</span>
                     (condition-case nil
                         (let ((color-theme-load-all-themes  t))
                           (color-theme-initialize)
                           (setq color-theme-initialized  t))
                       (error nil))))
           (error "<span class="quote">This command requires library `color-theme.el'</span>"))
         (unless icicle-color-themes
           (setq icicle-color-themes
                 (delete '("<span class="quote">bury-buffer</span>")
                         (mapcar (lambda (entry) (list (symbol-name (car entry))))
                                 color-themes)))) <span class="linecomment">; Free here, defined in `color-theme.el'.</span>
         <span class="linecomment">;; Create the snapshot, if not available.  Do this so users can also undo using</span>
         <span class="linecomment">;; pseudo-theme `[Reset]'.</span>
         (when (or (not prefix-arg)
                   (not (assq 'color-theme-snapshot color-themes))
                   (not (commandp 'color-theme-snapshot)))
           (fset 'color-theme-snapshot (color-theme-make-snapshot))
           (setq color-themes  (delq (assq 'color-theme-snapshot color-themes) color-themes)
                 color-themes  (delq (assq 'bury-buffer color-themes) color-themes)
                 color-themes  (append '((color-theme-snapshot
                                          "<span class="quote">[Reset]</span>" "<span class="quote">Undo changes, if possible.</span>")
                                         (bury-buffer "<span class="quote">[Quit]</span>" "<span class="quote">Bury this buffer.</span>"))
                                       color-themes))))
  (color-theme-snapshot))               <span class="linecomment">; Undo code</span>

<span class="linecomment">;; Bound to `C-- C-y' via `icicle-yank-maybe-completing'.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-completing-yank "icicles-cmd1.el")</span>
(icicle-define-command icicle-completing-yank
  "<span class="quote">Yank an entry from the `kill-ring', choosing it using completion.
This is like `yank', but it does not rotate the `kill-ring'.
The mark is pushed first, so the yanked text becomes the region.
You can sort the candidates to yank - use `C-,'.
You can use `S-delete' during completion to remove a candidate entry
from the `kill-ring'.</span>"                  <span class="linecomment">; Doc string</span>
  icicle-insert-for-yank                <span class="linecomment">; Action function</span>
  "<span class="quote">Insert: </span>" (mapcar #'list kill-ring) nil t nil 'icicle-kill-history <span class="linecomment">; `completing-read' args</span>
  (car kill-ring) nil
  ((icicle-transform-function       'icicle-remove-duplicates) <span class="linecomment">; Bindings</span>
   (icicle-sort-comparer            nil)
   (icicle-delete-candidate-object  'kill-ring)))

(defun icicle-insert-for-yank (string)
  "<span class="quote">`insert-for-yank', if defined; else, `insert' with `read-only' removed.
Pushes the mark first, so the inserted text becomes the region.</span>"
  (push-mark)
  (if (fboundp 'insert-for-yank)        <span class="linecomment">; Defined in `subr.el' (not required).</span>
      (insert-for-yank string)
    (let ((opoint  (point)))
      (insert string)
      (let ((inhibit-read-only  t)) (remove-text-properties opoint (point) '(read-only nil))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank-maybe-completing (&optional arg) <span class="linecomment">;  Bound to `C-y' (or what `yank' was bound to).</span>
  "<span class="quote">`icicle-completing-yank', `icicle-yank', or `icicle-yank-function'.
If called from the minibuffer, call `icicle-yank'.
Otherwise:
 With a negative prefix argument, call `icicle-completing-yank'.
 Otherwise, call the value of user option `icicle-yank-function' (by
 default, `yank').</span>"
  (interactive "<span class="quote">*P</span>")
  (if (window-minibuffer-p (selected-window))
      (icicle-yank arg)
    (if (wholenump (prefix-numeric-value arg))
        (funcall icicle-yank-function arg)
      (icicle-completing-yank))))

<span class="linecomment">;;;###autoload (autoload 'icicle-delete-file "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-delete-file <span class="linecomment">; Command name</span>
  "<span class="quote">Delete a file or directory.</span>"         <span class="linecomment">; Doc string</span>
  icicle-delete-file-or-directory       <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Delete file or directory: </span>" default-directory nil t nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings))               <span class="linecomment">; Bindings</span>

(defun icicle-delete-file-or-directory (file)
  "<span class="quote">Delete file or (empty) directory FILE.</span>"
  (condition-case i-delete-file
      (if (eq t (car (file-attributes file)))
          (delete-directory file)
        (delete-file file))
    (error (message (error-message-string i-delete-file))
           (error (error-message-string i-delete-file)))))

<span class="linecomment">;; $$$$$ (icicle-define-command icicle-file-list ; Command name</span>
<span class="linecomment">;;   "Choose a list of file names.</span>
<span class="linecomment">;; You can use `S-delete' during completion to delete a candidate file.</span>
<span class="linecomment">;; The list of names (strings) is returned." ; Doc string</span>
<span class="linecomment">;;   (lambda (name) (push name file-names)) ; Function to perform the action</span>
<span class="linecomment">;;   "Choose file (`RET' when done): "     ; `completing-read' args</span>
<span class="linecomment">;;   (mapcar #'list (directory-files default-directory nil icicle-re-no-dot))</span>
<span class="linecomment">;;   nil nil nil 'file-name-history nil nil</span>
<span class="linecomment">;;   ((file-names nil)                     ; Additional bindings</span>
<span class="linecomment">;;    (icicle-delete-candidate-object  'icicle-delete-file-or-directory) ; `S-delete' deletes file.</span>
<span class="linecomment">;;    (icicle-use-candidates-only-once-flag  t))</span>
<span class="linecomment">;;   nil nil                               ; First code, undo code</span>
<span class="linecomment">;;   (prog1 (setq file-names  (nreverse (delete "" file-names))) ; Last code - return files list</span>
<span class="linecomment">;;     (when (interactive-p) (message "Files: %S" file-names))))</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-file-list "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-file-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of file and directory names.
The list of file names (strings) is returned.

Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.
You can navigate the directory tree, picking files and directories
anywhere in the tree.

Remember too that you can use `C-!' to gather all of the file names
matching your current input.  For example, apropos-completing with
input `foo.*bar' and hitting `C-!' adds all file names matching that
regexp.

You can use either `RET' or `C-g' to finish adding file names to the
list.

You can use `S-delete' during completion to delete a candidate file.
  Careful: This deletes the file, it does not just remove it as a
  candidate.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (name) (push name file-names)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Choose file (`RET' when done): </span>" nil nil t nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((file-names                         nil)
    (icicle-comp-base-is-default-dir-p  t)
    <span class="linecomment">;; $$$$$ (icicle-dir-candidate-can-exit-p (not current-prefix-arg))</span>
    ))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq file-names  (nreverse (delete "<span class="quote"></span>" file-names))) <span class="linecomment">; Last code - return list of files</span>
    (when (interactive-p) (message "<span class="quote">Files: %S</span>" file-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-directory-list "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-directory-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of directory names.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.
You can navigate the directory tree, picking directories anywhere in
the tree.

You can use `S-delete' during completion to delete a candidate (empty)
directory.
  Careful: This deletes the directory, it does not just remove it as a
  candidate.
The list of directory names (strings) is returned.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra directory names to display
 `icicle-file-match-regexp'     - Regexp directory names must match
 `icicle-file-no-match-regexp'  - Regexp dir names must not match
 `icicle-file-predicate'        - Predicate the dir names must satisfy
 `icicle-file-sort'             - Sort function for candidates

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (name) (push name dir-names)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Choose directory (`RET' when done): </span>" <span class="linecomment">; `read-file-name' args</span>
  nil nil t nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((dir-names                          ())
    (user-file-pred                     icicle-file-predicate)
    (icicle-file-predicate              (if user-file-pred
                                            #'(lambda (f) (and (file-directory-p f)
                                                               (funcall user-file-pred f)))
                                          #'file-directory-p))
    (icicle-comp-base-is-default-dir-p  t)
    <span class="linecomment">;; $$$$$ (icicle-dir-candidate-can-exit-p (not current-prefix-arg))</span>
    ))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq dir-names  (nreverse (delete "<span class="quote"></span>" dir-names))) <span class="linecomment">; Last code - return the list of dirs</span>
    (when (interactive-p) (message "<span class="quote">Directories: %S</span>" dir-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-dired "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-dired
  "<span class="quote">Multi-command version of `dired'.
During completion:
 You can use `C-x m' to access Dired bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.</span>"                           <span class="linecomment">; Doc string</span>
  (lambda (dir) (dired dir switches))   <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Dired (directory): </span>" nil default-directory nil nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((switches               (and current-prefix-arg
                                 (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches)))
    (icicle-file-sort       (or icicle-file-sort 'icicle-dirs-first-p))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (unless (boundp 'minibuffer-local-filename-completion-map) <span class="linecomment">; First code</span>
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-dired-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-dired-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-dired-other-window)))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-dired-other-window "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-dired-other-window
  "<span class="quote">Multi-command version of `dired-other-window'.
During completion:
 You can use `C-x m' to access Dired bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.</span>"                           <span class="linecomment">; Doc string</span>
  (lambda (dir) (dired-other-window dir switches)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Dired in other window (directory): </span>" nil default-directory nil nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((switches               (and current-prefix-arg
                                 (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches)))
    (icicle-file-sort       (or icicle-file-sort 'icicle-dirs-first-p))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (unless (boundp 'minibuffer-local-filename-completion-map) <span class="linecomment">; First code</span>
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-dired-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-dired-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-dired-other-window)))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)))


(put 'icicle-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-file (arg)                <span class="linecomment">; Bound to `C-x C-f' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory.
With no prefix argument, use relative file names
 (`icicle-find-file').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

By default, Icicle mode remaps all key sequences that are normally bound
to `find-file' to `icicle-file'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (wholenump (prefix-numeric-value arg))
          (let ((current-prefix-arg  nil)) (icicle-find-file-absolute))
        (icicle-find-file-absolute))
    (icicle-find-file)))


(put 'icicle-file-other-window 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-file-other-window (arg)   <span class="linecomment">; Bound to `C-x 4 f' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory in another window.
With no prefix argument, use relative file names
 (`icicle-find-file-other-window').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute-other-window').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-file-other-window' to `icicle-file-other-window'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (wholenump (prefix-numeric-value arg))
          (let ((current-prefix-arg  nil)) (icicle-find-file-absolute-other-window))
        (icicle-find-file-absolute-other-window))
    (icicle-find-file-other-window)))


(put 'icicle-find-file-absolute 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-absolute "icicles-cmd1.el")</span>
(icicle-define-command icicle-find-file-absolute <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file or directory, given its absolute name.
Unlike `icicle-find-file', the completion candidates are absolute, not
relative, file names.  By default, the completion candidates are files
in the current directory, but you can substitute other candidates by
retrieving a saved candidate set.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

With a prefix argument, you can choose also by date: Completion
candidates include the last modification date.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c C-d' (think `cd') to change the `default-directory'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  default-directory 'file-name-history default-directory nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File or dir (absolute): </span>")
    (icicle-abs-file-candidates
     (mapcar #'(lambda (file) (if (file-directory-p file) (concat file "<span class="quote">/</span>") file))
             (directory-files default-directory 'full nil 'nosort)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts          (and current-prefix-arg '(1)))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            'icicle-cd-for-abs-files)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            'icicle-cd-for-abs-files)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil)))


(put 'icicle-find-file-absolute-other-window 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-absolute-other-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-find-file-absolute-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file or directory in another window, given its absolute name.
Same as `icicle-find-file-absolute' except uses a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  default-directory 'file-name-history default-directory nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File or dir (absolute): </span>")
    (icicle-abs-file-candidates
     (mapcar #'(lambda (file) (if (file-directory-p file) (concat file "<span class="quote">/</span>") file))
             (directory-files default-directory 'full nil 'nosort)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts          (and current-prefix-arg '(1)))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            'icicle-cd-for-abs-files)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            'icicle-cd-for-abs-files)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil)))


<span class="linecomment">;; This is a minibuffer command.  It is in this file because it is used only here.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-cd-for-abs-files (dir)
  "<span class="quote">Change `default-directory' during `icicle-find-file-absolute'.</span>"
  (interactive
   <span class="linecomment">;; Should not need to bind `minibuffer-completion-predicate'.  Emacs 23.2 bug, per Stefan.</span>
   (let ((enable-recursive-minibuffers     t)
         (minibuffer-completion-predicate  minibuffer-completion-predicate))
     (list (funcall (if (fboundp 'read-directory-name)
                        #'read-directory-name
                      #'read-file-name)
                    "<span class="quote">Change default directory: </span>" nil nil
                    (and (member cd-path '(nil ("<span class="quote">./</span>"))) (null (getenv "<span class="quote">CDPATH</span>")))))))
  (cd dir)
  (let* ((icicle-abs-file-candidates
          (mapcar #'(lambda (file) (if (file-directory-p file) (concat file "<span class="quote">/</span>") file))
                  (directory-files default-directory 'full nil 'nosort)))
         (collection
          (mapcar (if icicle-list-use-nth-parts #'icicle-make-file+date-candidate #'list)
                  icicle-abs-file-candidates)))
    (setq minibuffer-completion-table
          (car (icicle-mctize-all collection minibuffer-completion-predicate)))))


(put 'icicle-find-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-find-file "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file
  "<span class="quote">Visit a file or directory.
If you use a prefix argument when you act on a candidate file name,
then you visit the file in read-only mode.

If you use a prefix arg for the command itself, this reverses the
effect of using a prefix arg on individual candidates.  That is, with
a prefix arg for the command, files are visited in read-only mode by
default and a prefix arg for an individual file visits it without
read-only mode.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra absolute file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only 'find-file)))
      (funcall fn file 'WILDCARDS)))
  (concat "<span class="quote">File or directory</span>" (and init-pref-arg "<span class="quote"> (read-only)</span>") "<span class="quote">: </span>") <span class="linecomment">; `read-file-name' args</span>
  nil (if (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit)) <span class="linecomment">; Emacs 22+.</span>
          (condition-case nil           <span class="linecomment">; E.g. error because not on file line (ignore)</span>
              (abbreviate-file-name (dired-get-file-for-visit))
            (error nil))
        default-directory)
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg)
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (unless (boundp 'minibuffer-local-filename-completion-map) <span class="linecomment">; First code</span>
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-other-window "icicles-cmd1.el")</span>
(icicle-define-file-command icicle-find-file-other-window
  "<span class="quote">Visit a file or directory in another window.
Same as `icicle-find-file' except it uses a different window.

Note: Unlike standard `find-file-other-window', in Dired the file or
directory on the current line is the default value.  Like
`find-file-other-window', if you just hit `RET' without entering any
text, that is the same as if you first use `M-n' to retrieve the
default value and then hit `RET'.  Thus, if you just want to visit, in
a different window, the current directory instead of the file or
directory of the current line, you should use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-erase-minibuffer-or-history-element]' to first empty the
minibuffer.  Or you can just use a different command, such as `\\[dired]',
to visit the current directory.</span>"        <span class="linecomment">; Doc string</span>
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (let* ((r-o  (if (eq this-command 'icicle-candidate-action)
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
      (funcall fn file 'WILDCARDS)))
  (concat "<span class="quote">File or directory</span>" (and init-pref-arg "<span class="quote"> (read-only)</span>") "<span class="quote">: </span>") <span class="linecomment">; `read-file-name' args</span>
  nil (if (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit)) <span class="linecomment">; Emacs 22+.</span>
          (condition-case nil           <span class="linecomment">; E.g. error because not on file line (ignore)</span>
              (abbreviate-file-name (dired-get-file-for-visit))
            (error nil))
        default-directory)
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg)
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (unless (boundp 'minibuffer-local-filename-completion-map) <span class="linecomment">; First code</span>
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil))
  (progn (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" nil)))


(put 'icicle-find-file-read-only 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-find-file-read-only ()    <span class="linecomment">; Bound to `C-x C-r' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory in read-only mode.
If you use a prefix argument when you act on a candidate file name,
then visit the file without read-only mode.

If you use a prefix arg for the command itself, this reverses the
effect of using a prefix arg on individual candidates.  That is, with
a prefix arg for the command, files are not visited in read-only mode
by default and a prefix arg for an individual file visits it in
read-only mode.</span>"
  (interactive)
  (let ((current-prefix-arg  (not current-prefix-arg)))
    (icicle-find-file)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-find-file-read-only-other-window ()    <span class="linecomment">; Bound to `C-x 4 r' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory in read-only mode in another window.
Same as `icicle-find-file-read-only' except use a different window.</span>"
  (interactive)
  (let ((current-prefix-arg  (not current-prefix-arg)))
    (icicle-find-file-other-window)))


(put 'icicle-recent-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-recent-file "icicles-cmd1.el")</span>
(icicle-define-command icicle-recent-file <span class="linecomment">; Command name</span>
  "<span class="quote">Open a recently used file.
With a prefix argument, you can choose also by date: Completion
candidates include the last modification date.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

You can use any of the alternative-action keys, such as `C-S-RET', to
remove a candidate file from the recent files list, `recentf-list'.
\(The file itself is not deleted.)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra absolute file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history (car recentf-list) nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                                 "<span class="quote">Recent file (absolute): </span>")
    (icicle-abs-file-candidates             (progn (unless (boundp 'recentf-list) (require 'recentf))
                                                   (when (fboundp 'recentf-mode) (recentf-mode 99))
                                                   (unless (consp recentf-list)
                                                     (error "<span class="quote">No recently accessed files</span>"))
                                                   recentf-list))
    (icicle-candidate-alt-action-fn         'icicle-remove-from-recentf-candidate-action)
    (icicle-use-candidates-only-once-alt-p  t)
    (icicle-candidate-properties-alist      (and current-prefix-arg
                                                 '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts              (and current-prefix-arg '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>")
                                                 (mapcar #'icicle-transform-multi-completion
                                                         files))))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-recent-file-other-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-recent-file-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Open a recently used file in another window.
Same as `icicle-recent-file' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history (car recentf-list) nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                                 "<span class="quote">Recent file (absolute): </span>")
    (icicle-abs-file-candidates             (progn (unless (boundp 'recentf-list) (require 'recentf))
                                                   (when (fboundp 'recentf-mode) (recentf-mode 99))
                                                   (unless (consp recentf-list)
                                                     (error "<span class="quote">No recently accessed files</span>"))
                                                   recentf-list))
    (icicle-candidate-alt-action-fn         'icicle-remove-from-recentf-candidate-action)
    (icicle-use-candidates-only-once-alt-p  t)
    (icicle-candidate-properties-alist      (and current-prefix-arg
                                                 '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts              (and current-prefix-arg '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>")
                                                 (mapcar #'icicle-transform-multi-completion
                                                         files))))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-file-from-recentf-list "icicles-cmd1.el")</span>
(icicle-define-command icicle-remove-file-from-recentf-list
  "<span class="quote">Remove file from `recentf-list' - the list of recently used files.</span>"
  icicle-remove-from-recentf-candidate-action
  "<span class="quote">Remove from recent files list, `recentf-list': </span>"
  (mapcar #'list (progn (unless (boundp 'recentf-list) (require 'recentf))
                        (when (fboundp 'recentf-mode) (recentf-mode 99))
                        (unless (consp recentf-list) (error "<span class="quote">No recently accessed files</span>"))
                        recentf-list))
  nil (and (fboundp 'confirm-nonexistent-file-or-buffer) <span class="linecomment">; Emacs23.</span>
           (confirm-nonexistent-file-or-buffer))
  nil 'file-name-history (car recentf-list) nil
  ((icicle-use-candidates-only-once-flag  t)))

(defun icicle-remove-from-recentf-candidate-action (file)
  "<span class="quote">Action function for command `icicle-remove-file-from-recentf-list'.</span>"
  (setq recentf-list  (delete file recentf-list))
  (message "<span class="quote">`%s' removed from `recentf-list'</span>" file))


(defvar icicle-locate-file-action-fn nil
  "<span class="quote">Action function used in `icicle-locate-file-1'.</span>")

(defvar icicle-locate-file-no-symlinks-p nil
  "<span class="quote">Flag bound in `icicle-locate-file* for use by `icicle-files-within'.</span>")


(put 'icicle-locate-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-locate-file ()
  "<span class="quote">Visit a file within a directory or its subdirectories.
With a non-negative (&gt;= 0) prefix argument, you are prompted for the
directory.  Otherwise, the current directory is used.

With a non-positive (&lt;= 0) prefix argument, you can choose also by
date: Completion candidates include the last modification date.

The absolute names of all files within the directory and all of its
subdirectories are targets for completion.  Regexp input is matched
against all parts of the absolute name, not just the file-name part.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

You can use this command to find all files within your file system
that match a regexp, but be aware that gathering and matching the file
names will take some time.

See also command `icicle-locate-file-no-symlinks', which does the same
thing but without following symbolic links.

Remember that you can save the set of files matching your input using
`\\[icicle-candidate-set-save]' or \
`\\[icicle-candidate-set-save-persistently]'.  You can then retrieve quickly them later using
`\\[icicle-candidate-set-retrieve]' or \
`\\[icicle-candidate-set-retrieve-persistent]'.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `C-c C-d' (think `cd') to change the `default-directory'.
 You can use `C-c +' to create a new directory.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

Directories in `icicle-ignored-directories' are ignored (skipped).  In
addition, these options control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-require-match-flag' - See `icicle-require-match-flag'
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-action)
        (icicle-locate-file-no-symlinks-p  nil))
    (icicle-locate-file-1)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-locate-file-other-window ()
  "<span class="quote">Same as `icicle-locate-file' except visit file in a different window.
See also command `icicle-locate-file-no-symlinks-other-window', which
does not follow symbolic links.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-other-window-action)
        (icicle-locate-file-no-symlinks-p  nil))
    (icicle-locate-file-1)))

(put 'icicle-locate-file-no-symlinks 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-locate-file-no-symlinks ()
  "<span class="quote">`icicle-locate-file' except do not follow symlinks.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-other-window-action)
        (icicle-locate-file-no-symlinks-p  t))
    (icicle-locate-file-1)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-locate-file-no-symlinks-other-window ()
  "<span class="quote">`icicle-locate-file-no-symlinks' except visit file in different window.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-other-window-action)
        (icicle-locate-file-no-symlinks-p  t))
    (icicle-locate-file-1)))

(defun icicle-locate-file-action (file)
  "<span class="quote">Action function for `icicle-locate-file'.</span>"
  (find-file (icicle-transform-multi-completion file) 'WILDCARDS))

(defun icicle-locate-file-other-window-action (file)
  "<span class="quote">Action function for `icicle-locate-file-other-window'.</span>"
  (find-file-other-window (icicle-transform-multi-completion file) 'WILDCARDS))

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-file-1 "icicles-cmd1.el")</span>
(icicle-define-command icicle-locate-file-1
  "<span class="quote">Helper function for `icicle-locate-file(-other-window)'.</span>" <span class="linecomment">; Doc string</span>
  <span class="linecomment">;; `icicle-locate-file-action-fn' is free here.</span>
  (lambda (f) (funcall icicle-locate-file-action-fn f)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if (&lt;= (prefix-numeric-value current-prefix-arg) 0)
              #'icicle-make-file+date-candidate
            #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File (absolute): </span>")
    (dir                                (if (and current-prefix-arg
                                                 (wholenump (prefix-numeric-value
                                                             current-prefix-arg)))
                                            (read-file-name "<span class="quote">Locate under which directory: </span>" nil
                                                            default-directory nil)
                                          default-directory))
    (IGNORED--FOR-SIDE-EFFECT           (progn
                                          (icicle-highlight-lighter)
                                          (message "<span class="quote">Gathering files within `%s' (this could take \
a while)...</span>" dir)))
    (icicle-abs-file-candidates         <span class="linecomment">; `icicle-locate-file-no-symlinks-p' is free here.</span>
     (icicle-files-within (directory-files dir 'full icicle-re-no-dot)
                          nil icicle-locate-file-no-symlinks-p))
    (use-dialog-box                     nil)
    (icicle-candidate-properties-alist  (and (&lt;= (prefix-numeric-value current-prefix-arg) 0)
                                             '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts          (and (&lt;= (prefix-numeric-value current-prefix-arg) 0)
                                             '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>")
                                                 (mapcar #'icicle-transform-multi-completion
                                                         files))))))))
  (progn                                <span class="linecomment">; First code</span>
    (when (&lt;= (prefix-numeric-value current-prefix-arg) 0)
      (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            'icicle-cd-for-loc-files)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            'icicle-cd-for-loc-files)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
    (when (and (require 'bookmark+ nil t) (fboundp 'icicle-bookmark-file-other-window))
      (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>" 'icicle-bookmark-file-other-window)))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Undo code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil))
  (progn (define-key minibuffer-local-completion-map [(control backspace)] nil) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-must-match-map [(control backspace)] nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>"            nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c+</span>"               nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-xm</span>"               nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-xm</span>"               nil))
  'NON-INTERACTIVE)                     <span class="linecomment">; This is not a real command.</span>

<span class="linecomment">;; This is a minibuffer command.  It is in this file because it is used only here.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-cd-for-loc-files (dir &optional no-symlinks-p)
  "<span class="quote">Change `default-directory' during `icicle-locate-file'.
Optional arg NO-SYMLINKS-P non-nil means do not follow symbolic links.</span>"
  (interactive
   (save-selected-window
     <span class="linecomment">;; Should not need to bind `minibuffer-completion-predicate'.  Emacs 23.2 bug, per Stefan.</span>
     (let ((minibuffer-completion-predicate  minibuffer-completion-predicate))
       (list (funcall (if (fboundp 'read-directory-name)
                          #'read-directory-name
                        #'read-file-name)
                      "<span class="quote">Change default directory: </span>" nil nil
                      (and (member cd-path '(nil ("<span class="quote">./</span>"))) (null (getenv "<span class="quote">CDPATH</span>"))))))))
  (cd dir)
  (let* ((icicle-abs-file-candidates
          (icicle-files-within (directory-files dir 'full icicle-re-no-dot) nil no-symlinks-p))
         (collection
          (mapcar (if icicle-list-use-nth-parts #'icicle-make-file+date-candidate #'list)
                  icicle-abs-file-candidates)))
    (setq minibuffer-completion-table
          (car (icicle-mctize-all collection minibuffer-completion-predicate)))))


(put 'icicle-find-file-in-tags-table 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-in-tags-table "icicles-cmd1.el")</span>
(icicle-define-command icicle-find-file-in-tags-table <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file listed in a tags table.
By default, the completion candidates are the file names listed in the
current tags table, but you can substitute other candidates by
retrieving a saved candidate set.  The default candidates appear as
they did in the `etags' command that created the tags table, which
typically means without directory names.

Completion here matches candidates as ordinary strings.  It knows
nothing of file names per se.  In particular, you cannot use remote
file-name syntax.  If a candidate is an absolute file name then you
can complete against any and all parts of the name (including
directory components).

`find-file' is called for the candidate(s) you choose, with the
directory of the tags file as `default-directory'.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

With a prefix argument, you can choose also by date: Completion
candidates include the last modification date.

During completion:
 You can use `C-x m' to access file bookmarks, if you use library
  `bookmark+.el'.
 You can use `M-|' to open Dired on the currently matching file names.
 You can use `S-delete' to delete a candidate file or (empty)
  directory.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (ff)
    (visit-tags-table-buffer 'same)     <span class="linecomment">; To pick up `default-directory' of TAGS table.</span>
    (find-file (icicle-transform-multi-completion ff) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          (save-excursion (let ((enable-recursive-minibuffers  t)) (visit-tags-table-buffer))
                          (tags-table-files)))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File (in tags table): </span>")
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts          (and current-prefix-arg '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (unless (require 'etags nil t) (error "<span class="quote">`etags.el' is required</span>"))))


(put 'icicle-find-file-in-tags-table-other-window 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-in-tags-table-other-window "icicles-cmd1.el")</span>
(icicle-define-command icicle-find-file-in-tags-table-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a tags-table file in another window.
Same as `icicle-find-file-in-tags-table', but uses a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (ff)
    (visit-tags-table-buffer 'same)     <span class="linecomment">; To pick up `default-directory' of TAGS table.</span>
    (find-file (icicle-transform-multi-completion ff) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          (save-excursion (let ((enable-recursive-minibuffers  t)) (visit-tags-table-buffer))
                          (tags-table-files)))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File (in tags table): </span>")
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts          (and current-prefix-arg '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (unless (require 'etags nil t) (error "<span class="quote">`etags.el' is required</span>"))))

(defun icicle-make-file+date-candidate (file)
  "<span class="quote">Return a multi-completion candidate: FILE + last modification date.</span>"
  (list (list file (format-time-string "<span class="quote">%Y %m %d %T </span>" (nth 5 (file-attributes file))))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-cmd1)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-cmd1.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-cmd1.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-cmd1.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-cmd1.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-cmd1.el">Administration</a></span><span class="time"><br /> Last edited 2011-05-22 20:25 UTC by <a class="author" title="from 148.87.67.196" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-cmd1.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
