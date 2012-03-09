<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-mcmd.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mcmd.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-mcmd.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mcmd.el" />
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
      title="Changes for icicles-mcmd.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mcmd.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-mcmd.el%22">icicles-mcmd.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/icicles-mcmd.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-mcmd.el --- Minibuffer commands for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-mcmd.el</span>
<span class="linecomment">;; Description: Minibuffer commands for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:04 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sun Jun 26 20:09:55 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 16975</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-mcmd.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `cl', `doremi', `el-swank-fuzzy',</span>
<span class="linecomment">;;   `ffap', `ffap-', `fuzzy', `fuzzy-match', `hexrgb',</span>
<span class="linecomment">;;   `icicles-face', `icicles-fn', `icicles-opt', `icicles-var',</span>
<span class="linecomment">;;   `image-dired', `kmacro', `levenshtein', `mouse3', `mwheel',</span>
<span class="linecomment">;;   `pp', `pp+', `regexp-opt', `ring', `ring+', `thingatpt',</span>
<span class="linecomment">;;   `thingatpt+', `wid-edit', `wid-edit+', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  commands to be used mainly in the minibuffer or buffer</span>
<span class="linecomment">;;  `*Completions*' (and a few non-interactive functions used in those</span>
<span class="linecomment">;;  commands).  For top-level commands, see `icicles-cmd1.el' and</span>
<span class="linecomment">;;  `icicles-cmd2.el'.  For Icicles documentation, see</span>
<span class="linecomment">;;  `icicles-doc1.el' and `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `cycle-icicle-image-file-thumbnail',</span>
<span class="linecomment">;;    `icicle-abort-recursive-edit', `icicle-add-file-to-fileset',</span>
<span class="linecomment">;;    `icicle-add/update-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-all-candidates-action',</span>
<span class="linecomment">;;    `icicle-all-candidates-alt-action',</span>
<span class="linecomment">;;    `icicle-all-candidates-list-action',</span>
<span class="linecomment">;;    `icicle-all-candidates-list-alt-action',</span>
<span class="linecomment">;;    `icicle-apropos-complete', `icicle-apropos-complete-and-exit',</span>
<span class="linecomment">;;    `icicle-apropos-complete-and-narrow',</span>
<span class="linecomment">;;    `icicle-apropos-complete-and-widen',</span>
<span class="linecomment">;;    `icicle-apropos-complete-no-display',</span>
<span class="linecomment">;;    `icicle-backward-char-dots',</span>
<span class="linecomment">;;    `icicle-backward-delete-char-untabify',</span>
<span class="linecomment">;;    `icicle-backward-kill-paragraph',</span>
<span class="linecomment">;;    `icicle-backward-kill-sentence', `icicle-backward-kill-sexp',</span>
<span class="linecomment">;;    `icicle-backward-kill-word', `icicle-beginning-of-line+',</span>
<span class="linecomment">;;    `icicle-candidate-action', `icicle-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-candidate-read-fn-invoke',</span>
<span class="linecomment">;;    `icicle-candidate-set-complement',</span>
<span class="linecomment">;;    `icicle-candidate-set-define',</span>
<span class="linecomment">;;    `icicle-candidate-set-difference',</span>
<span class="linecomment">;;    `icicle-candidate-set-intersection',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-from-variable',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-more',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-persistent',</span>
<span class="linecomment">;;    `icicle-candidate-set-save', `icicle-candidate-set-save-more',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-more-selected',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-persistently',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-selected',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-to-variable',</span>
<span class="linecomment">;;    `icicle-candidate-set-swap', `icicle-candidate-set-truncate',</span>
<span class="linecomment">;;    `icicle-candidate-set-union',</span>
<span class="linecomment">;;    `icicle-change-alternative-sort-order',</span>
<span class="linecomment">;;    `icicle-change-history-variable', `icicle-change-sort-order',</span>
<span class="linecomment">;;    `icicle-choose-completion', `icicle-completing-read+insert',</span>
<span class="linecomment">;;    `icicle-Completions-mouse-3-menu',</span>
<span class="linecomment">;;    `icicle-cycle-image-file-thumbnail',</span>
<span class="linecomment">;;    `icicle-delete-backward-char', `icicle-delete-candidate-object',</span>
<span class="linecomment">;;    `icicle-delete-char', `icicle-delete-windows-on',</span>
<span class="linecomment">;;    `icicle-describe-file', `icicle-digit-argument',</span>
<span class="linecomment">;;    `icicle-dispatch-C-^', `icicle-dispatch-C-.',</span>
<span class="linecomment">;;    `icicle-dispatch-M-_', `icicle-dispatch-M-comma',</span>
<span class="linecomment">;;    `icicle-dispatch-M-q', `icicle-doremi-candidate-width-factor+',</span>
<span class="linecomment">;;    `icicle-doremi-increment-max-candidates+',</span>
<span class="linecomment">;;    `icicle-doremi-increment-swank-prefix-length+',</span>
<span class="linecomment">;;    `icicle-doremi-increment-swank-timeout+',</span>
<span class="linecomment">;;    `icicle-doremi-inter-candidates-min-spaces+',</span>
<span class="linecomment">;;    `icicle-doremi-zoom-Completions+', `icicle-end-of-line+',</span>
<span class="linecomment">;;    `icicle-erase-minibuffer',</span>
<span class="linecomment">;;    `icicle-erase-minibuffer-or-history-element',</span>
<span class="linecomment">;;    `icicle-exit-minibuffer', `icicle-forward-char-dots',</span>
<span class="linecomment">;;    `icicle-goto/kill-failed-input', `icicle-help-on-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-next-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-next-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-previous-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-previous-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-help-string-completion',</span>
<span class="linecomment">;;    `icicle-help-string-non-completion', `icicle-history',</span>
<span class="linecomment">;;    `icicle-insert-completion', `icicle-insert-dot-command',</span>
<span class="linecomment">;;    `icicle-insert-history-element',</span>
<span class="linecomment">;;    `icicle-insert-key-description',</span>
<span class="linecomment">;;    `icicle-insert-list-join-string',</span>
<span class="linecomment">;;    `icicle-insert-newline-in-minibuffer',</span>
<span class="linecomment">;;    `icicle-insert-string-at-point',</span>
<span class="linecomment">;;    `icicle-insert-string-from-variable', `icicle-isearch-complete',</span>
<span class="linecomment">;;    `icicle-keep-only-past-inputs', `icicle-kill-line',</span>
<span class="linecomment">;;    `icicle-kill-paragraph', `icicle-kill-region',</span>
<span class="linecomment">;;    `icicle-kill-region-wimpy', `icicle-kill-sentence',</span>
<span class="linecomment">;;    `icicle-kill-sexp', `icicle-kill-word', `icicle-make-directory',</span>
<span class="linecomment">;;    `icicle-minibuffer-complete-and-exit', `icicle-minibuffer-help',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-action',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-read-fn-invoke',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-set-save',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-set-save-more',</span>
<span class="linecomment">;;    `icicle-mouse-choose-completion',</span>
<span class="linecomment">;;    `icicle-mouse-help-on-candidate',</span>
<span class="linecomment">;;    `icicle-mouse-remove-candidate',</span>
<span class="linecomment">;;    `icicle-mouse-save/unsave-candidate',</span>
<span class="linecomment">;;    `icicle-mouse-save-then-kill', `icicle-mouse-yank-secondary',</span>
<span class="linecomment">;;    `icicle-move-to-next-completion',</span>
<span class="linecomment">;;    `icicle-move-to-previous-completion',</span>
<span class="linecomment">;;    `icicle-narrow-candidates',</span>
<span class="linecomment">;;    `icicle-narrow-candidates-with-predicate',</span>
<span class="linecomment">;;    `icicle-negative-argument', `icicle-next-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-next-apropos-candidate-action',</span>
<span class="linecomment">;;    `icicle-next-apropos-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-next-candidate-per-mode',</span>
<span class="linecomment">;;    `icicle-next-candidate-per-mode-action',</span>
<span class="linecomment">;;    `icicle-next-candidate-per-mode-alt-action',</span>
<span class="linecomment">;;    `icicle-next-history-element', `icicle-next-line',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate-action',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-next-S-TAB-completion-method',</span>
<span class="linecomment">;;    `icicle-next-TAB-completion-method', `icicle-other-history',</span>
<span class="linecomment">;;    `icicle-plus-saved-sort',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression-in-minibuffer',</span>
<span class="linecomment">;;    `icicle-prefix-complete', `icicle-prefix-complete-no-display',</span>
<span class="linecomment">;;    `icicle-prefix-word-complete',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate-action',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-previous-candidate-per-mode',</span>
<span class="linecomment">;;    `icicle-previous-candidate-per-mode-action',</span>
<span class="linecomment">;;    `icicle-previous-candidate-per-mode-alt-action',</span>
<span class="linecomment">;;    `icicle-previous-line', `icicle-previous-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-previous-prefix-candidate-action',</span>
<span class="linecomment">;;    `icicle-previous-prefix-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-read+insert-file-name', `icicle-regexp-quote-input',</span>
<span class="linecomment">;;    `icicle-remove-candidate', `icicle-remove-Completions-window',</span>
<span class="linecomment">;;    `icicle-retrieve-last-input', `icicle-retrieve-next-input',</span>
<span class="linecomment">;;    `icicle-retrieve-previous-input', `icicle-reverse-sort-order',</span>
<span class="linecomment">;;    `icicle-save-predicate-to-variable',</span>
<span class="linecomment">;;    `icicle-save/unsave-candidate',</span>
<span class="linecomment">;;    `icicle-scroll-Completions-backward',</span>
<span class="linecomment">;;    `icicle-scroll-Completions-forward', `icicle-scroll-backward',</span>
<span class="linecomment">;;    `icicle-scroll-forward', `icicle-search-define-replacement',</span>
<span class="linecomment">;;    `icicle-self-insert', `icicle-sit-for',</span>
<span class="linecomment">;;    `icicle-sort-alphabetical', `icicle-sort-by-abbrev-frequency',</span>
<span class="linecomment">;;    `icicle-sort-by-directories-first',</span>
<span class="linecomment">;;    `icicle-sort-by-directories-last', `icicle-sort-by-file-type',</span>
<span class="linecomment">;;    `icicle-sort-by-last-file-modification-time',</span>
<span class="linecomment">;;    `icicle-sort-by-last-use-as-input',</span>
<span class="linecomment">;;    `icicle-sort-by-previous-use-alphabetically',</span>
<span class="linecomment">;;    `icicle-sort-by-2nd-parts-alphabetically',</span>
<span class="linecomment">;;    `icicle-sort-case-insensitive',</span>
<span class="linecomment">;;    `icicle-sort-extra-candidates-first',</span>
<span class="linecomment">;;    `icicle-sort-proxy-candidates-first',</span>
<span class="linecomment">;;    `icicle-sort-special-candidates-first',</span>
<span class="linecomment">;;    `icicle-sort-turned-OFF', `icicle-switch-to-Completions-buf',</span>
<span class="linecomment">;;    `icicle-switch-to-completions',</span>
<span class="linecomment">;;    `icicle-switch-to/from-minibuffer', `icicle-toggle-.',</span>
<span class="linecomment">;;    `icicle-toggle-~-for-home-dir',</span>
<span class="linecomment">;;    `icicle-toggle-alternative-sorting',</span>
<span class="linecomment">;;    `icicle-toggle-angle-brackets',</span>
<span class="linecomment">;;    `icicle-toggle-case-sensitivity', `icicle-toggle-C-for-actions',</span>
<span class="linecomment">;;    `icicle-toggle-dot', `icicle-toggle-expand-to-common-match',</span>
<span class="linecomment">;;    `icicle-toggle-hiding-common-match',</span>
<span class="linecomment">;;    `icicle-toggle-highlight-all-current',</span>
<span class="linecomment">;;    `icicle-toggle-highlight-historical-candidates',</span>
<span class="linecomment">;;    `icicle-toggle-highlight-saved-candidates',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-space-prefix',</span>
<span class="linecomment">;;    `icicle-toggle-ignoring-comments',</span>
<span class="linecomment">;;    `icicle-toggle-incremental-completion',</span>
<span class="linecomment">;;    `icicle-toggle-literal-replacement',</span>
<span class="linecomment">;;    `icicle-toggle-proxy-candidates', `icicle-toggle-regexp-quote',</span>
<span class="linecomment">;;    `icicle-toggle-remote-file-testing',</span>
<span class="linecomment">;;    `icicle-toggle-search-cleanup',</span>
<span class="linecomment">;;    `icicle-toggle-search-replace-common-match',</span>
<span class="linecomment">;;    `icicle-toggle-search-replace-whole',</span>
<span class="linecomment">;;    `icicle-toggle-search-whole-word',</span>
<span class="linecomment">;;    `icicle-toggle-show-multi-completion', `icicle-toggle-sorting',</span>
<span class="linecomment">;;    `icicle-toggle-transforming',</span>
<span class="linecomment">;;    `icicle-toggle-WYSIWYG-Completions', `icicle-transpose-chars',</span>
<span class="linecomment">;;    `icicle-transpose-sexps', `icicle-transpose-words',</span>
<span class="linecomment">;;    `icicle-universal-argument', `icicle-universal-argument-minus',</span>
<span class="linecomment">;;    `icicle-universal-argument-more',</span>
<span class="linecomment">;;    `icicle-universal-argument-other-key', `icicle-up-directory',</span>
<span class="linecomment">;;    `icicle-use-interactive-command-history',</span>
<span class="linecomment">;;    `icicle-widen-candidates', `icicle-yank', `icicle-yank-pop',</span>
<span class="linecomment">;;    `icicle-yank-secondary', `old-choose-completion',</span>
<span class="linecomment">;;    `old-exit-minibuffer', `old-minibuffer-complete-and-exit',</span>
<span class="linecomment">;;    `old-sit-for', `old-switch-to-completions', `toggle-icicle-.',</span>
<span class="linecomment">;;    `toggle-icicle-~-for-home-dir',</span>
<span class="linecomment">;;    `toggle-icicle-alternative-sorting',</span>
<span class="linecomment">;;    `toggle-icicle-angle-brackets',</span>
<span class="linecomment">;;    `toggle-icicle-case-sensitivity', `toggle-icicle-C-for-actions',</span>
<span class="linecomment">;;    `toggle-icicle-dot', `toggle-icicle-expand-to-common-match',</span>
<span class="linecomment">;;    `toggle-icicle-highlight-all-current',</span>
<span class="linecomment">;;    `toggle-icicle-highlight-historical-candidates',</span>
<span class="linecomment">;;    `toggle-icicle-highlight-saved-candidates',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-extensions',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-space-prefix',</span>
<span class="linecomment">;;    `toggle-icicle-incremental-completion',</span>
<span class="linecomment">;;    `toggle-icicle-literal-replacement',</span>
<span class="linecomment">;;    `toggle-icicle-proxy-candidates', `toggle-icicle-regexp-quote',</span>
<span class="linecomment">;;    `toggle-icicle-remote-file-testing',</span>
<span class="linecomment">;;    `toggle-icicle-search-cleanup',</span>
<span class="linecomment">;;    `toggle-icicle-search-replace-common-match',</span>
<span class="linecomment">;;    `toggle-icicle-search-replace-whole',</span>
<span class="linecomment">;;    `toggle-icicle-search-whole-word',</span>
<span class="linecomment">;;    `toggle-icicle-show-multi-completion', `toggle-icicle-sorting',</span>
<span class="linecomment">;;    `toggle-icicle-transforming',</span>
<span class="linecomment">;;    `toggle-icicle-WYSIWYG-Completions'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-all-candidates-action-1', `icicle-all-exif-data',</span>
<span class="linecomment">;;    `icicle-anychar-regexp', `icicle-apply-to-saved-candidate',</span>
<span class="linecomment">;;    `icicle-apropos-complete-1',</span>
<span class="linecomment">;;    `icicle-backward-delete-char-untabify-dots',</span>
<span class="linecomment">;;    `icicle-candidate-action-1', `icicle-candidate-set-retrieve-1',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-1',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-selected-1',</span>
<span class="linecomment">;;    `icicle-column-wise-cand-nb', `icicle-Completions-popup-choice',</span>
<span class="linecomment">;;    `icicle-Completions-popup-choice-1', `icicle-convert-dots',</span>
<span class="linecomment">;;    `icicle-current-completion-in-Completions',</span>
<span class="linecomment">;;    `icicle-current-sort-functions', `icicle-current-sort-order',</span>
<span class="linecomment">;;    `icicle-delete-backward-char-dots',</span>
<span class="linecomment">;;    `icicle-delete-candidate-object-1', `icicle-delete-char-dots',</span>
<span class="linecomment">;;    `icicle-delete-current-candidate-object',</span>
<span class="linecomment">;;    `icicle-ensure-overriding-map-is-bound',</span>
<span class="linecomment">;;    `icicle-help-on-candidate-symbol',</span>
<span class="linecomment">;;    `icicle-input-is-a-completion-p', `icicle-insert-dot',</span>
<span class="linecomment">;;    `icicle-insert-input', `icicle-insert-thing',</span>
<span class="linecomment">;;    `icicle-looking-at-anychar-regexp-p',</span>
<span class="linecomment">;;    `icicle-looking-back-at-anychar-regexp-p',</span>
<span class="linecomment">;;    `icicle-markers-to-readable',</span>
<span class="linecomment">;;    `icicle-maybe-multi-completion-completing-p',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-action-1', `icicle-nb-Completions-cols',</span>
<span class="linecomment">;;    `icicle-nb-of-candidate-in-Completions',</span>
<span class="linecomment">;;    `icicle-nb-of-cand-in-Completions-horiz',</span>
<span class="linecomment">;;    `icicle-prefix-complete-1', `icicle-raise-Completions-frame',</span>
<span class="linecomment">;;    `icicle-remove-cand-from-lists',</span>
<span class="linecomment">;;    `icicle-remove-candidate-display-others',</span>
<span class="linecomment">;;    `icicle-replace-input-w-parent-dir',</span>
<span class="linecomment">;;    `icicle-retrieve-candidates-from-set',</span>
<span class="linecomment">;;    `icicle-row-wise-cand-nb', `icicle-signum',</span>
<span class="linecomment">;;    `icicle-substitute-keymap-vars', `icicle-successive-action',</span>
<span class="linecomment">;;    `icicle-transform-sole-candidate',</span>
<span class="linecomment">;;    `icicle-transpose-chars-dots', `icicle-upcase-if-ignore-case',</span>
<span class="linecomment">;;    `icicle-update-and-next'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `overriding-map-is-bound', `saved-overriding-map'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: These EMACS PRIMITIVES have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `exit-minibuffer'              - Remove *Completion* window and</span>
<span class="linecomment">;;                                   input mismatch highlighting</span>
<span class="linecomment">;;  `minibuffer-complete-and-exit' - Use Icicles prefix completion</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `mouse.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `choose-completion'       - Don't iconify frame or bury buffer.</span>
<span class="linecomment">;;  `mouse-choose-completion' - Return the number of the completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `simple.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `switch-to-completions' - Always selects `*Completions*' window.</span>
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
<span class="linecomment">;;  (@&gt; "Redefined standard commands")</span>
<span class="linecomment">;;  (@&gt; "Icicles commands")</span>
<span class="linecomment">;;    (@&gt; "Minibuffer editing commands")</span>
<span class="linecomment">;;    (@&gt; "Commands to sort completion candidates")</span>
<span class="linecomment">;;    (@&gt; "Other commands to be used mainly in the minibuffer")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 2, or (at</span>
<span class="linecomment">;; your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; case, flet, lexical-let, loop</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: dolist, push</span>
(eval-when-compile (require 'filesets nil t)) <span class="linecomment">; Emacs 22+.</span>
  <span class="linecomment">;; filesets-data, filesets-entry-get-files, filesets-entry-mode, filesets-entry-set-files,</span>
  <span class="linecomment">;; filesets-files-equalp, filesets-init, filesets-member, filesets-set-config</span>

(eval-when-compile
 (or (condition-case nil
         (load-library "<span class="quote">icicles-mac</span>")   <span class="linecomment">; Use load-library to ensure latest .elc.</span>
       (error nil))
     (require 'icicles-mac)))           <span class="linecomment">; Require, so can load separately if not on `load-path'.</span>
  <span class="linecomment">;; icicle-assoc-delete-all, icicle-define-sort-command</span>
(require 'icicles-opt)                  <span class="linecomment">; (This is required anyway by `icicles-var.el'.)</span>
  <span class="linecomment">;; icicle-alternative-sort-comparer, icicle-Completions-frame-at-right-flag,</span>
  <span class="linecomment">;; icicle-Completions-mouse-3-menu-entries, icicle-default-cycling-mode,</span>
  <span class="linecomment">;; icicle-default-thing-insertion, icicle-expand-input-to-common-match-flag,</span>
  <span class="linecomment">;; icicle-ignore-space-prefix-flag, icicle-incremental-completion-flag, icicle-input-string,</span>
  <span class="linecomment">;; icicle-key-descriptions-use-&lt;&gt;-flag, icicle-regexp-quote-flag, icicle-saved-completion-sets,</span>
  <span class="linecomment">;; icicle-search-cleanup-flag, icicle-search-highlight-all-current-flag, icicle-sort-comparer,</span>
  <span class="linecomment">;; icicle-sort-orders-alist, icicle-TAB-shows-candidates-flag, icicle-thing-at-point-functions,</span>
  <span class="linecomment">;; icicle-transform-function</span>
(eval-and-compile (require 'icicles-var)) <span class="linecomment">; (This is required anyway by `icicles-fn.el'.)</span>
  <span class="linecomment">;; lacarte-menu-items-alist, icicle-candidate-action-fn, icicle-candidate-nb,</span>
  <span class="linecomment">;; icicle-complete-keys-alist, icicle-completion-candidates, </span>
  <span class="linecomment">;; icicle-current-completion-candidate-overlay, icicle-current-completion-mode,</span>
  <span class="linecomment">;; icicle-current-input, icicle-current-raw-input, icicle-default-directory,</span>
  <span class="linecomment">;; icicle-default-thing-insertion-flipped-p, icicle-edit-update-p, icicle-general-help-string,</span>
  <span class="linecomment">;; icicle-get-alist-candidate-function, icicle-ignored-extensions, icicle-ignored-extensions-regexp,</span>
  <span class="linecomment">;; icicle-incremental-completion-p, icicle-insert-string-at-pt-end, `icicle-insert-string-at-pt-start,</span>
  <span class="linecomment">;; icicle-last-completion-candidate, icicle-last-completion-command, icicle-last-input,</span>
  <span class="linecomment">;; icicle-last-sort-comparer, icicle-last-transform-function, </span>
  <span class="linecomment">;; icicle-nb-of-other-cycle-candidates, icicle-pre-minibuffer-buffer,</span>
  <span class="linecomment">;; icicle-saved-candidates-variables-obarray, icicle-saved-completion-candidates,</span>
  <span class="linecomment">;; icicle-saved-ignored-extensions, icicle-successive-grab-count, icicle-thing-at-pt-fns-pointer,</span>
  <span class="linecomment">;; icicle-universal-argument-map, icicle-variable-name-history</span>
(require 'icicles-fn)
  <span class="linecomment">;; icicle-isearch-complete-past-string, icicle-minibuf-input-sans-dir,</span>
  <span class="linecomment">;; icicle-toggle-icicle-mode-twice</span>

(require 'pp+ nil t) <span class="linecomment">;; (no error if not found): pp-eval-expression</span>
(require 'doremi nil t) <span class="linecomment">;; (no error if not found):</span>
                        <span class="linecomment">;; doremi, doremi(-boost)-(up|down)-keys, doremi-limit, doremi-wrap</span>
(when (&gt; emacs-major-version 22) (require 'help-fns+ nil t)) <span class="linecomment">;; (no error if not found):</span>
                                                             <span class="linecomment">;; help-commands-to-key-buttons</span>

(eval-when-compile (require 'fit-frame nil t)) <span class="linecomment">;; (no error if not found): fit-frame</span>
(eval-when-compile
 (when (&gt; emacs-major-version 21) (require 'linkd nil t))) <span class="linecomment">;; (no error if not found): linkd-mode</span>

<span class="linecomment">;; Byte-compiling this file, you will likely get some byte-compiler warning messages.</span>
<span class="linecomment">;; These are probably benign - ignore them.  Icicles is designed to work with multiple</span>
<span class="linecomment">;; versions of Emacs, and that fact provokes compiler warnings.  If you get byte-compiler</span>
<span class="linecomment">;; errors (not warnings), then please report a bug, using `M-x icicle-send-bug-report'.</span>

<span class="linecomment">;; Some defvars to quiet byte-compiler a bit:</span>

(when (&lt; emacs-major-version 22)
  (defvar overriding-map-is-bound)
  (defvar read-file-name-completion-ignore-case) <span class="linecomment">; In `minibuffer.el'</span>
  (defvar read-file-name-predicate)
  (defvar saved-overriding-map))

(when (&lt; emacs-major-version 23)
  (defvar read-buffer-completion-ignore-case)
  (defvar mouse-drag-copy-region))

(defvar doremi-boost-down-keys)         <span class="linecomment">; In `doremi.el'</span>
(defvar doremi-boost-up-keys)           <span class="linecomment">; In `doremi.el'</span>
(defvar doremi-down-keys)               <span class="linecomment">; In `doremi.el'</span>
(defvar doremi-up-keys)                 <span class="linecomment">; In `doremi.el'</span>
(defvar filesets-data)                  <span class="linecomment">; In `filesets.el'.</span>
(defvar ignore-comments-flag)           <span class="linecomment">; In `thing-cmds.el'.</span>
(defvar minibuffer-confirm-exit-commands) <span class="linecomment">; In `minibuffer.el' in Emacs 23+.</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Redefined standard commands")</span>

<span class="linecomment">;;; Redefined standard commands --------------------------------------</span>


<span class="linecomment">;; REPLACE ORIGINAL `next-history-element' in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Selects minibuffer contents and leaves point at its beginning.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-next-history-element)
  (defalias 'old-next-history-element (symbol-function 'next-history-element)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-history-element (arg) <span class="linecomment">; Bound to `M-n' in minibuffer.</span>
  "<span class="quote">Insert the next element of the minibuffer history in the minibuffer.
With argument N, it uses the Nth following element.</span>"
  (interactive "<span class="quote">p</span>")
  (old-next-history-element (prefix-numeric-value arg))
  (when (and icicle-mode (memq icicle-default-value '(preselect-start preselect-end)))
    (icicle-select-minibuffer-contents)
    (setq deactivate-mark  nil)))


<span class="linecomment">;; REPLACE ORIGINAL `exit-minibuffer' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Remove input mismatch highlighting.</span>
<span class="linecomment">;; Remove *Completion* window.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-exit-minibuffer)
  (defalias 'old-exit-minibuffer (symbol-function 'exit-minibuffer)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-exit-minibuffer ()        <span class="linecomment">; Bound to `C-m' (`RET') in minibuffer.</span>
  "<span class="quote">Terminate this minibuffer argument.
Remove `*Completions*' window.  Remove Icicles minibuffer faces.</span>"
  <span class="linecomment">;; This removal lets users retrieve candidates that have other faces, and saves input-history space.</span>
  (interactive)
  (when (active-minibuffer-window)
    (with-current-buffer (window-buffer (minibuffer-window))
      (let ((pos                (icicle-minibuffer-prompt-end))
            (icy-minibuf-faces  '(icicle-input-completion-fail  icicle-input-completion-fail-lax
                                  icicle-whitespace-highlight   icicle-match-highlight-minibuffer
                                  icicle-complete-input))
            (keep-faces         ()))
        (while (&lt; pos (point-max))
          (let ((faces  (get-text-property pos 'face)))
            (when (or (and (consp faces) (cdr faces) (atom (cdr faces))) <span class="linecomment">; (background-color . "abc")</span>
                      (and faces (atom faces))) <span class="linecomment">; face name</span>
              (setq faces  (list faces))) <span class="linecomment">; No-op: (foo (background-color . "abc") (:foreground "abc"))</span>
            (setq keep-faces  (icicle-set-union keep-faces
                                                (icicle-set-difference faces icy-minibuf-faces))))
          (setq pos  (1+ pos)))
        (when keep-faces                <span class="linecomment">; Don't add a nil `face' property.</span>
          (put-text-property (icicle-minibuffer-prompt-end) (point-max) 'face keep-faces)))
      <span class="linecomment">;; $$$$$  (let ((pos  (icicle-minibuffer-prompt-end)))</span>
      <span class="linecomment">;;     (while (&lt; pos (point-max))</span>
      <span class="linecomment">;;       (when (memq (get-text-property pos 'face)</span>
      <span class="linecomment">;;                   '(icicle-input-completion-fail icicle-input-completion-fail-lax))</span>
      <span class="linecomment">;;         (remove-text-properties pos (point-max) '(face))</span>
      <span class="linecomment">;;         (setq pos  (point-max)))</span>
      <span class="linecomment">;;       (setq pos  (1+ pos))))</span>
      ))
  (icicle-remove-Completions-window)
  (old-exit-minibuffer))


<span class="linecomment">;; REPLACE ORIGINAL `minibuffer-complete-and-exit' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Use Icicles completion.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-minibuffer-complete-and-exit)
  (defalias 'old-minibuffer-complete-and-exit (symbol-function 'minibuffer-complete-and-exit)))

<span class="linecomment">;; Bound to `C-m' (`RET') in `minibuffer-local-must-match-map'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-minibuffer-complete-and-exit ()
  "<span class="quote">If the minibuffer contents is a valid completion, then exit.
Otherwise try to complete it.</span>"
  (interactive)
  (let ((last-cmd  last-command))
    (cond ((string= "<span class="quote"></span>" (if (icicle-file-name-input-p) <span class="linecomment">;  Empty input - exit.</span>
                           (icicle-minibuf-input-sans-dir)
                         (icicle-input-from-minibuffer)))
           (icicle-exit-minibuffer))
          <span class="linecomment">;; This case serves when property `icicle-display-string' is used.</span>
          <span class="linecomment">;; What's returned is the replacement display string, not the original candidate.</span>
          <span class="linecomment">;; If you want to get the original candidate back, you'll need to search the obarray for a</span>
          <span class="linecomment">;; symbol that has this `icicle-display-string' value.  Or put the symbol on the display</span>
          <span class="linecomment">;; string as a text property.</span>
          ((icicle-input-is-a-completion-p) (icicle-exit-minibuffer))
          ((eq minibuffer-completion-confirm 'confirm) <span class="linecomment">; User wants it anyway? - Emacs 23+.</span>
           (if (eq last-cmd this-command)
               (icicle-exit-minibuffer)
             (minibuffer-message "<span class="quote">Confirm</span>")
             nil))
          ((eq minibuffer-completion-confirm 'confirm-after-completion) <span class="linecomment">; Emacs 23+.</span>
           <span class="linecomment">;; Similar to `confirm', but only if trying to exit immediately</span>
           <span class="linecomment">;; after completing (this catches most minibuffer typos).</span>
           (if (not (memq last-cmd (and (boundp 'minibuffer-confirm-exit-commands)
                                        (append icicle-confirm-exit-commands
                                                minibuffer-confirm-exit-commands))))
               (icicle-exit-minibuffer)
             (minibuffer-message "<span class="quote">Confirm</span>")
             nil))
          (t
           (setq icicle-current-input  (icicle-input-from-minibuffer))
           (let* (<span class="linecomment">;; Bind these first two to suppress (a) the throw or (b) the message, highlighting,</span>
                  <span class="linecomment">;; mode-line help, and the wait involved in completing again.</span>
                  (icicle-prefix-complete-and-exit-p   t)
                  (icicle-apropos-complete-and-exit-p  t)

                  (candidates
                   <span class="linecomment">;; If we're not using `icicle-candidates-alist', complete the input again.</span>
                   <span class="linecomment">;; If we're using `icicle-candidates-alist', try filtering it against just the</span>
                   <span class="linecomment">;; input.</span>
                   <span class="linecomment">;;   If the input is already complete, then we're done.  If not, then filtering</span>
                   <span class="linecomment">;;   will give nil and we will just continue to display the candidates.  If there</span>
                   <span class="linecomment">;;   are multiple matches, then the user can either cycle or complete again.</span>
                   (if (not icicle-candidates-alist)
                       (if (eq icicle-current-completion-mode 'apropos)
                           (icicle-apropos-complete-no-display 'nomsg)
                         (icicle-prefix-complete-no-display 'nomsg))
                     (icicle-filter-alist icicle-candidates-alist (list icicle-current-input)))))
             (cond ((and (eq icicle-require-match-p t) <span class="linecomment">; Don't exit if non-nil and non-t.</span>
                         (icicle-input-is-a-completion-p))
                    (icicle-exit-minibuffer))
                   (t
                    (icicle-display-candidates-in-Completions))))))))

(defun icicle-upcase-if-ignore-case (string)
  "<span class="quote">Return (icicle-upcase STRING) if `completion-ignore-case', else STRING.</span>"
  (if completion-ignore-case (icicle-upcase string) string))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-exit () <span class="linecomment">; Bound to `S-RET' in `minibuffer-local-must-match-map'.</span>
  "<span class="quote">If the minibuffer contents is a valid apropos completion, then exit.
Otherwise try to complete it.  If completion leads to a valid
completion, then exit.
This is to `minibuffer-complete-and-exit' as `icicle-apropos-complete'
is to `minibuffer-complete'.  That is, it is the regexp-match version.</span>"
  (interactive)
  (setq icicle-last-input  (icicle-input-from-minibuffer))
  (let* ((icicle-apropos-complete-and-exit-p  t) <span class="linecomment">; Suppress the throw or the msg plus the wait.</span>
         (candidates                          (icicle-apropos-complete)))
    (when (and candidates (null (cdr candidates))) (old-exit-minibuffer)))) <span class="linecomment">; Single candidate.</span>


<span class="linecomment">;; REPLACE ORIGINAL `choose-completion' in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Don't iconify frame or bury buffer.</span>
<span class="linecomment">;; Don't strip text properties.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-choose-completion)
  (defalias 'old-choose-completion (symbol-function 'choose-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-choose-completion ()
  "<span class="quote">Choose the completion that point is in or next to.</span>"
  (interactive)
  (let ((buffer     completion-reference-buffer)
	(base-size  completion-base-size)
        beg end completion)
    (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
      (setq end  (point)
            beg  (1+ (point))))
    (when (and (&gt;= (point) (icicle-start-of-candidates-in-Completions))
               (get-text-property (1- (point)) 'mouse-face))
      (setq end  (1- (point))
            beg  (point)))
    (unless beg	(error "<span class="quote">No completion here</span>"))
    (setq beg         (previous-single-property-change beg 'mouse-face)
          end         (or (next-single-property-change end 'mouse-face) (point-max))
          <span class="linecomment">;; $$$$ completion  (buffer-substring-no-properties beg end))</span>
          completion  (buffer-substring beg end))
    <span class="linecomment">;; (let ((owindow  (selected-window)))</span>
    <span class="linecomment">;;   (if (and (one-window-p t 'selected-frame) (window-dedicated-p (selected-window)))</span>
    <span class="linecomment">;;    (iconify-frame (selected-frame)) ; Iconify special buffer's frame</span>
    <span class="linecomment">;;  (or (window-dedicated-p (selected-window)) (bury-buffer)))</span>
    <span class="linecomment">;;   (select-window owindow))</span>
    (unless (or (not (member completion icicle-extra-candidates))
                icicle-extra-candidates-dir-insert-p)
      (setq base-size  0))
    (choose-completion-string completion buffer base-size)))


<span class="linecomment">;; REPLACE ORIGINAL `mouse-choose-completion' in `mouse.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Return the number of the completion.</span>
<span class="linecomment">;; Don't strip text properties.</span>
<span class="linecomment">;;</span>
(when (and (fboundp 'mouse-choose-completion) (not (fboundp 'old-mouse-choose-completion)))
  (defalias 'old-mouse-choose-completion (symbol-function 'mouse-choose-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-choose-completion (event) <span class="linecomment">; Bound to `mouse-2' in `*Completions*'.</span>
  "<span class="quote">Click a completion candidate in buffer `*Completions*', to choose it.
Return the number of the candidate: 0 for first, 1 for second, ...</span>"
  (interactive "<span class="quote">e</span>")
  <span class="linecomment">;; $$$$$ (unless (active-minibuffer-window) (error "Minibuffer is not active"))</span>
  <span class="linecomment">;; Give temporary modes such as isearch a chance to turn off.</span>
  (run-hooks 'mouse-leave-buffer-hook)
  (let ((buffer  (window-buffer))
         <span class="linecomment">;; $$$$$$ (icicle-orig-buff  buffer)</span>
        choice base-size)
    (with-current-buffer (window-buffer (posn-window (event-start event)))
      (save-excursion
        (when completion-reference-buffer (setq buffer  completion-reference-buffer))
        (setq base-size  completion-base-size)
        (save-excursion
          (goto-char (posn-point (event-start event)))
          (let (beg end)
            (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
              (setq end  (point)
                    beg  (1+ (point))))
            (unless beg (error "<span class="quote">No completion here</span>"))
            (setq beg  (previous-single-property-change beg 'mouse-face)
                  end  (or (next-single-property-change end 'mouse-face) (point-max)))
            <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
            <span class="linecomment">;; in `*Completions*'. Add the newline back. `icicle-insert-candidates' puts property</span>
            <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
            <span class="linecomment">;; being just part of the display in columns.</span>
            (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
              (setq end  (1+ end)))
            <span class="linecomment">;; $$$$$$ (setq choice  (buffer-substring-no-properties beg end)))))</span>
            (setq choice  (buffer-substring beg end))))))
    <span class="linecomment">;; $$$$$ (if (eq icicle-orig-buff (get-buffer "*Completions*"))</span>
    <span class="linecomment">;;    (icicle-remove-Completions-window)</span>
    <span class="linecomment">;;    (save-selected-window (icicle-remove-Completions-window)))</span>
    (setq icicle-candidate-nb  (icicle-nb-of-candidate-in-Completions (posn-point (event-start event))))
    (when (and (icicle-file-name-input-p) insert-default-directory
               (or (not (member choice icicle-extra-candidates))
                   icicle-extra-candidates-dir-insert-p))
      (let ((dir  (icicle-file-name-directory-w-default icicle-current-input)))
        (with-current-buffer buffer
          (icicle-clear-minibuffer)
          (insert dir)
          (setq choice     (concat dir choice)
                base-size  0))))
    (choose-completion-string choice buffer base-size))
  icicle-candidate-nb)

(defun icicle-nb-of-candidate-in-Completions (position)
  "<span class="quote">Return number of candidate at POSITION in `*Completions*'.
POSITION is a buffer position.</span>"
  (let ((hor-nb  (icicle-nb-of-cand-in-Completions-horiz position)))
    (save-excursion
      (with-current-buffer (get-buffer "<span class="quote">*Completions*</span>")
        (goto-char position)
        (if (memq icicle-completions-format-internal '(horizontal nil))
            hor-nb
          (let* ((cols      (icicle-nb-Completions-cols))
                 (nb-cands  (length icicle-completion-candidates))
                 (rows      (/ nb-cands cols)))
            (unless (zerop (% nb-cands cols)) (setq rows  (1+ rows)))
            (icicle-column-wise-cand-nb hor-nb nb-cands rows cols)))))))

(defun icicle-nb-of-cand-in-Completions-horiz (position)
  "<span class="quote">Return number of horizontal candidate at POSITION in `*Completions*'.
POSITION is a buffer position.</span>"
  (let ((compl-buf  (get-buffer "<span class="quote">*Completions*</span>")))
    (unless compl-buf (error "<span class="quote">No `*Completions*' buffer</span>"))
    (save-window-excursion
      (set-buffer compl-buf)
      (goto-char position)
      <span class="linecomment">;; If in a completion, move to its start, and set POSITION there.</span>
      (let ((prop  (get-text-property  (1- (point)) 'mouse-face)))
        (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
          (goto-char (previous-single-property-change (point) 'mouse-face nil
                                                      (icicle-start-of-candidates-in-Completions)))))
      (setq position  (point))
      <span class="linecomment">;; Binary search.</span>
      (let ((cand-nb                             (/ (length icicle-completion-candidates) 2))
            (last-nb                             0)
            (icicle-completions-format-internal  nil)
            delta)
        (goto-char (point-min))
        (icicle-move-to-next-completion cand-nb t)
        (while (/= (point) position)
          (setq delta    (max 1 (/ (abs (- cand-nb last-nb)) 2))
                last-nb  cand-nb)
          (cond ((&lt; (point) position)
                 (icicle-move-to-next-completion delta t)
                 (setq cand-nb  (+ cand-nb delta)))
                (t
                 (icicle-move-to-next-completion (- delta) t)
                 (setq cand-nb  (- cand-nb delta)))))
        (set-buffer-modified-p nil)
        (1- cand-nb)))))

(defun icicle-nb-Completions-cols ()
  "<span class="quote">Return the number of candidate columns in `*Completions*'.</span>"
  (let* ((start       (icicle-start-of-candidates-in-Completions))
         (eol         (save-excursion (goto-char start) (line-end-position)))
         (mouse-chgs  0)
         mousef)
    (save-excursion
      (goto-char start)
      (while (&lt; (point) eol)
        (setq mousef  (next-single-property-change (point) 'mouse-face nil eol))
        (when mousef
          (goto-char mousef)
          (setq mouse-chgs  (1+ mouse-chgs)))))
    (/ (1+ mouse-chgs) 2)))             <span class="linecomment">; Return # of columns.</span>

(defun icicle-column-wise-cand-nb (horiz-nb nb-cands rows cols)
  "<span class="quote">Column-wise number of horizontal candidate number HORIZ-NB.</span>"
  (let ((row-lim  (- rows (- (* rows cols) nb-cands)))
        (row      (/ horiz-nb cols))
        (col      (mod horiz-nb cols))
        nb)
    (setq nb  (+ row (* col rows)))
    (when (&gt;= row row-lim)
      (setq cols      (1- cols)
            horiz-nb  (- horiz-nb row-lim)
            row       (/ horiz-nb cols)
            col       (mod horiz-nb cols)
            nb        (+ row (* col rows))))
    nb))

(defun icicle-row-wise-cand-nb (vert-nb nb-cands rows cols)
  "<span class="quote">Row-wise number of vertical candidate number VERT-NB.</span>"
  (let* ((row  (mod vert-nb rows))
         (col  (/ vert-nb rows))
         (nb   (+ col (* row cols)))
         (lim  (- rows (- (* rows cols) nb-cands))))
    (when (&gt; row lim) (setq nb  (- nb (- row lim))))
    nb))


<span class="linecomment">;; REPLACE ORIGINAL `switch-to-completions' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Selects `*Completions*' window even if on another frame.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-switch-to-completions)
  (defalias 'old-switch-to-completions (symbol-function 'switch-to-completions)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-completions ()
  "<span class="quote">Select the completion list window, `*Completions*'.</span>"
  (interactive)
  <span class="linecomment">;; Make sure we have a completions window.</span>
  (or (get-buffer-window "<span class="quote">*Completions*</span>") (minibuffer-completion-help))
  (let ((window  (get-buffer-window "<span class="quote">*Completions*</span>" 0))) <span class="linecomment">; Added 0 arg.</span>
    (when window
      (select-window window)
      (goto-char (icicle-start-of-candidates-in-Completions)))))

<span class="linecomment">;; The branch that deletes a history element is based on Juri Linkov's</span>
<span class="linecomment">;; `delete-history-element', proposed for Emacs 22 but rejected by RMS.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-erase-minibuffer-or-history-element () <span class="linecomment">; Bound to `M-k' in minibuffer.</span>
  "<span class="quote">`icicle-erase-minibuffer' or, if using history, delete history element.</span>"
  (interactive)
  (if (not (memq last-command '(previous-history-element next-history-element
                                icicle-erase-minibuffer-or-history-element
                                previous-matching-history-element next-matching-history-element)))
      (icicle-erase-minibuffer)
    (let* ((curr-pos  (1- minibuffer-history-position))
           (current   (nth curr-pos (and (boundp minibuffer-history-variable)
                                         (symbol-value minibuffer-history-variable)))))
      (cond ((= minibuffer-history-position 1)
             (set minibuffer-history-variable (and (boundp minibuffer-history-variable)
                                                   (cdr (symbol-value minibuffer-history-variable)))))
            ((&gt; minibuffer-history-position 1)
             (setcdr (nthcdr (- minibuffer-history-position 2)
                             (and (boundp minibuffer-history-variable)
                                  (symbol-value minibuffer-history-variable)))
                     (nthcdr minibuffer-history-position
                             (and (boundp minibuffer-history-variable)
                                  (symbol-value minibuffer-history-variable))))))
      (condition-case nil
          (cond ((memq last-command '(next-history-element next-matching-history-element))
                 (next-history-element 1)
                 (setq this-command  'next-history-element))
                ((memq last-command '(previous-history-element previous-matching-history-element))
                 (next-history-element 1)
                 (previous-history-element 1)
                 (setq this-command  'previous-history-element)))
        (error (condition-case nil
                   (cond ((memq last-command '(next-history-element next-matching-history-element))
                          (previous-history-element 1)
                          (setq this-command  'previous-history-element))
                         ((memq last-command
                                '(previous-history-element previous-matching-history-element))
                          (next-history-element 1)
                          (setq this-command  'next-history-element)))
                 (error nil))))
      (when (and current (wholenump curr-pos))
        (icicle-msg-maybe-in-minibuffer "<span class="quote">Deleted `%s'</span>" current)))))
 
<span class="linecomment">;;(@* "Icicles commands")</span>

<span class="linecomment">;;; Icicles commands -------------------------------------------------</span>

<span class="linecomment">;;(@* "Minibuffer editing commands")</span>

<span class="linecomment">;;; Minibuffer editing commands  . . . . . . . . . . . . . . . . . . .</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; All except `icicle-erase-minibuffer' are bound in the minibuffer to whatever the same</span>
<span class="linecomment">;;; command without `icicle-' is bound to globally.</span>

(defun icicle-looking-back-at-anychar-regexp-p ()
  "<span class="quote">Return non-nil if `icicle-anychar-regexp' immediately precedes point.</span>"
  (let ((len  (length icicle-anychar-regexp)))
    (save-excursion (save-match-data
                      (search-backward icicle-anychar-regexp
                                       (max (- (point) len) (icicle-minibuffer-prompt-end)) t)))))

(defun icicle-looking-at-anychar-regexp-p ()
  "<span class="quote">Return non-nil if `icicle-anychar-regexp' immediately succeeds point.</span>"
  (let ((len  (length icicle-anychar-regexp)))
    (save-excursion (save-match-data
                      (search-forward icicle-anychar-regexp (min (+ (point) len) (point-max)) t)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-forward-char-dots (&optional n)
  "<span class="quote">Move forward N chars (backward if N is negative).  Handles dots (`.').</span>"
  (interactive "<span class="quote">p</span>")
  (let ((len  (length icicle-anychar-regexp)))
    (dotimes (i  (abs n))
      (or (save-match-data
            (if (wholenump n)
                (search-forward icicle-anychar-regexp (min (+ (point) len) (point-max)) t)
              (search-backward icicle-anychar-regexp
                               (max (- (point) len) (icicle-minibuffer-prompt-end)) t)))
          (forward-char (if (wholenump n) 1 -1))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-char-dots (&optional n)
  "<span class="quote">Move backward N chars (forward if N is negative).  Handles dots (`.').</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-forward-char-dots (- n)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-delete-char-untabify (n &optional killflag)
  "<span class="quote">`backward-delete-char-untabify' + update `*Completions*' with matches.
Handles Icicles dots (`.').</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'icicle-backward-delete-char-untabify-dots n killflag))

(defun icicle-backward-delete-char-untabify-dots (n killflag)
  "<span class="quote">`backward-delete-char-untabify', but also handle dots (`.').</span>"
  (let ((len  (length icicle-anychar-regexp)))
    (dotimes (i  (abs n))
      (if (icicle-looking-back-at-anychar-regexp-p)
          (backward-delete-char-untabify len killflag)
        (backward-delete-char-untabify 1 killflag)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-backward-char (n &optional killflag) <span class="linecomment">; Bound to `DEL' in minibuffer.</span>
  "<span class="quote">`delete-backward-char' and update `*Completions*' with input matches.
Handles Icicles dots (`.').</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'icicle-delete-backward-char-dots n killflag))

(defun icicle-delete-backward-char-dots (n killflag)
  "<span class="quote">`delete-backward-char', but also handle dots (`.').</span>"
  (let ((len  (length icicle-anychar-regexp)))
    (dotimes (i  (abs n))
      (if (icicle-looking-back-at-anychar-regexp-p)
          (delete-char (- len) killflag)
        (delete-char -1 killflag)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-char (n &optional killflag) <span class="linecomment">; Bound to `C-d' in minibuffer.</span>
  "<span class="quote">`delete-char' and update `*Completions*' with input matches.
Handles Icicles dots (`.').</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'icicle-delete-char-dots n killflag))

(defun icicle-delete-char-dots (n killflag)
  "<span class="quote">`delete-char', but also handle dots (`.').</span>"
  (let ((len  (length icicle-anychar-regexp)))
    (dotimes (i  (abs n))
      (if (icicle-looking-at-anychar-regexp-p)
          (delete-char len killflag)
        (delete-char 1 killflag)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-word (arg)  <span class="linecomment">; Bound to `M-DEL' (`M-backspace') in minibuffer.</span>
  "<span class="quote">`backward-kill-word' and update `*Completions*' with input matches.
See description of `backward-kill-word'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-word arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-word (arg)           <span class="linecomment">; Bound to `M-d' in minibuffer.</span>
  "<span class="quote">`kill-word' and update `*Completions*' with regexp input matches.
See description of `kill-word'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-word arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-sexp (arg)  <span class="linecomment">; Bound to `C-M-backspace' in minibuffer.</span>
  "<span class="quote">`backward-kill-sexp' and update `*Completions*' with input matches.
See description of `backward-kill-sexp'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-sexp arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-sexp (arg)           <span class="linecomment">; Bound to `C-M-delete' and `C-M-k' in minibuffer.</span>
  "<span class="quote">`kill-sexp' and update `*Completions*' with regexp input matches.
See description of `kill-sexp'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-sexp arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-sentence (arg) <span class="linecomment">; Bound to `C-x DEL' in minibuffer.</span>
  "<span class="quote">`backward-kill-sentence' and update `*Completions*' with input matches.
See description of `backward-kill-sentence'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-sentence arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-sentence (arg)
  "<span class="quote">`kill-sentence' and update `*Completions*' with regexp input matches.
See description of `kill-sentence'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-sentence arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-paragraph (arg) <span class="linecomment">; Bound to `C-backspace' in minibuffer, except for files.</span>
  "<span class="quote">`backward-kill-paragraph' and update `*Completions*' with input matches.
See description of `backward-kill-paragraph'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-paragraph arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-paragraph (arg)      <span class="linecomment">; Bound to `C-delete' in minibuffer.</span>
  "<span class="quote">`kill-paragraph' and update `*Completions*' with regexp input matches.
See description of `kill-paragraph'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-paragraph arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-line (arg)           <span class="linecomment">; Bound to `C-k' and `deleteline' in minibuffer.</span>
  "<span class="quote">`kill-line' and update `*Completions*' with regexp input matches.
See description of `kill-line'.</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-call-then-update-Completions #'kill-line arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-region (beg end)     <span class="linecomment">; Bound to `C-w' in minibuffer.</span>
<span class="linecomment">;; Don't bother with Emacs 22 optional 3rd arg.</span>
  "<span class="quote">`kill-region' and update `*Completions*' with regexp input matches.
See description of `kill-region'.</span>"
  (interactive "<span class="quote">r</span>")
  (icicle-call-then-update-Completions #'kill-region beg end))

(when (fboundp 'kill-region-wimpy)
  (defun icicle-kill-region-wimpy (beg end) <span class="linecomment">; Bound to `C-w' in minibuffer.</span>
    "<span class="quote">`kill-region-wimpy' and update `*Completions*' with input matches.
See description of `kill-region-wimpy'.</span>"
    (interactive "<span class="quote">r</span>")
    (icicle-call-then-update-Completions #'kill-region-wimpy beg end)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-make-directory (dir)
  "<span class="quote">Create a directory.</span>"
  (interactive
   (let ((enable-recursive-minibuffers  t))
     (list (funcall (if (fboundp 'read-directory-name) #'read-directory-name #'read-file-name)
                    "<span class="quote">Create directory: </span>" default-directory default-directory))))
  (setq dir  (directory-file-name (expand-file-name dir)))
  (while (file-exists-p dir)
    (message "<span class="quote">%s already exists</span>" dir) (sit-for 1)
    (let ((enable-recursive-minibuffers  t))
      (setq dir  (funcall (if (fboundp 'read-directory-name) #'read-directory-name #'read-file-name)
                          "<span class="quote">Create directory: </span>" default-directory default-directory))))
  <span class="linecomment">;;(setq dir  (directory-file-name (expand-file-name dir)))</span>
  (if (not (y-or-n-p (format "<span class="quote">Really create %s? </span>" (file-name-as-directory dir))))
      (message "<span class="quote">Directory creation canceled</span>")
    (make-directory dir 'PARENTS-TOO)
    (unless (file-accessible-directory-p dir)
      (error "<span class="quote">Could not create %s</span>" (file-name-as-directory dir)))
    (message "<span class="quote">Created %s</span>" (file-name-as-directory dir))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-up-directory () <span class="linecomment">; Bound to `C-backspace' in minibuffer, for file-name completion.</span>
  "<span class="quote">Replace minibuffer input with parent directory, then upate `*Completions*'.</span>"
  (interactive)
  (icicle-call-then-update-Completions #'icicle-replace-input-w-parent-dir))

<span class="linecomment">;;;###autoload</span>
(defun icicle-replace-input-w-parent-dir ()
  "<span class="quote">Replace minibuffer input with the parent directory.</span>"
  (interactive)
  (goto-char (point-max))
  (let ((directoryp  (equal ?/ (char-before)))
        (bob         (icicle-minibuffer-prompt-end)))
    (while (and (&gt; (point) bob) (not (equal ?/ (char-before))))  (delete-char -1))
    (when directoryp
      (delete-char -1)
      (while (and (&gt; (point) bob) (not (equal ?/ (char-before))))  (delete-char -1)))))

<span class="linecomment">;;; ;;;###autoload</span>
<span class="linecomment">;;; (defun icicle-kill-failed-input ()      ; Bound to `C-M-l' in minibuffer during completion.</span>
<span class="linecomment">;;;   "Kill (delete) the part of the input that does not complete.</span>
<span class="linecomment">;;; Repeat to delete more."</span>
<span class="linecomment">;;;   (interactive)</span>
<span class="linecomment">;;;   (goto-char (1- (point-max)))</span>
<span class="linecomment">;;;   (while (and (not (bobp))</span>
<span class="linecomment">;;;               (memq (get-text-property (point) 'face)</span>
<span class="linecomment">;;;                     '(icicle-input-completion-fail icicle-input-completion-fail-lax)))</span>
<span class="linecomment">;;;     (delete-char 1)</span>
<span class="linecomment">;;;     (backward-char 1))</span>
<span class="linecomment">;;;   (unless (eobp) (forward-char))</span>
<span class="linecomment">;;;   (icicle-highlight-input-noncompletion))</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-goto/kill-failed-input () <span class="linecomment">; Bound to `C-M-l' in minibuffer during completion.</span>
  "<span class="quote">Go to start of input portion that does not complete.  Repeat to kill.
Kill (delete) the part of the input that does not complete.
Repeat to delete more.</span>"
  (interactive)
  (if (eq last-command this-command)
      (unless (eobp) (kill-line))
    (when (and (overlayp icicle-input-completion-fail-overlay)
               (overlay-start icicle-input-completion-fail-overlay))
      (goto-char (overlay-start icicle-input-completion-fail-overlay)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-chars (arg)     <span class="linecomment">; Bound to `C-t' in minibuffer.</span>
  "<span class="quote">`transpose-chars' and update `*Completions*' with regexp input matches.
Handles Icicles dots (`.').</span>"
  (interactive "<span class="quote">*P</span>")
  (icicle-call-then-update-Completions #'icicle-transpose-chars-dots arg))

(defun icicle-transpose-chars-dots (arg)
  "<span class="quote">`transpose-chars', but also handle dots (`.').</span>"
  (and (null arg) (eolp) (icicle-forward-char-dots -1))
  (transpose-subr 'icicle-forward-char-dots (prefix-numeric-value arg)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-words (arg)     <span class="linecomment">; Bound to `M-t' in minibuffer.</span>
  "<span class="quote">`transpose-words' and update `*Completions*' with regexp input matches.
See description of `transpose-words'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'transpose-words arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-sexps (arg)    <span class="linecomment">; Bound to `C-M-t' in minibuffer.</span>
  "<span class="quote">`transpose-sexps' and update `*Completions*' with regexp input matches.
See description of `transpose-sexps'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'transpose-sexps arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank (arg)                <span class="linecomment">; Bound to `C-y' and `S-insert' in minibuffer.</span>
  "<span class="quote">`yank' and update `*Completions*' with regexp input matches.
See description of `yank'.</span>"
  (interactive "<span class="quote">*P</span>")
  (icicle-call-then-update-Completions #'yank arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank-pop (arg)            <span class="linecomment">; Bound to `M-y' and `M-insert' in minibuffer.</span>
  "<span class="quote">`yank-pop' and update `*Completions*' with regexp input matches.
See description of `yank-pop'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'yank-pop arg))

(when (fboundp 'yank-secondary)         <span class="linecomment">; In `second-sel.el'.</span>
  (defun icicle-yank-secondary ()       <span class="linecomment">; Bound to `C-M-y' in minibuffer.</span>
    "<span class="quote">Insert the secondary selection at point.
Move point to the end of the inserted text.  Does not change mark.</span>"
    (interactive "<span class="quote">*</span>")
    (icicle-call-then-update-Completions #'yank-secondary))
  <span class="linecomment">;; Tell `delete-selection-mode' to replace active region by yanked secondary selection.</span>
  (put 'icicle-yank-secondary 'delete-selection 'yank))


<span class="linecomment">;; Tell `delete-selection-mode' to replace active region by yanked secondary selection.</span>
(put 'icicle-mouse-yank-secondary 'delete-selection 'yank)
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-yank-secondary (event) <span class="linecomment">; Bound to `M-mouse-2' in minibuffer.</span>
  "<span class="quote">Insert the secondary selection where you click.
Move point to the end of the inserted text.
If `mouse-yank-at-point' is non-nil, insert at point
regardless of where you click.</span>"
  (interactive "<span class="quote">*e</span>")
  (if (fboundp 'yank-secondary)         <span class="linecomment">; In `mouse+.el'.</span>
      (icicle-call-then-update-Completions #'mouse-yank-secondary event current-prefix-arg)
    (icicle-call-then-update-Completions #'mouse-yank-secondary event)))


<span class="linecomment">;; Make delete-selection mode recognize self-insertion, so it replaces region text.</span>
(put 'icicle-self-insert 'delete-selection t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-self-insert (n) <span class="linecomment">;; Bound in minibuffer to stuff bound globally to `self-insert-command'.</span>
  "<span class="quote">`self-insert' and update `*Completions*' with regexp input matches.
See description of `self-insert'.</span>"
  (interactive "<span class="quote">p</span>")
  (if executing-kbd-macro
      (funcall #'self-insert-command n)
    (icicle-call-then-update-Completions #'self-insert-command n)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-a-space ()
  "<span class="quote">Insert a space.
For convenience in the minibuffer - does the same thing as `C-q SPC'.
To use this, bind it to some key sequence in keymaps
`minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', and
`minibuffer-local-must-match-map'.</span>"
  (interactive) (insert ?\ ))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-dot-command (&optional arg) <span class="linecomment">; Bound to `.' in minibuffer during completion.</span>
  "<span class="quote">Insert `icicle-dot-string': either `.' or `icicle-anychar-regexp'.
With a numeric prefix argument, insert the dot that many times.

With a plain prefix arg (`C-u'), insert the opposite kind of dot
\(once) from what is indicated by the current value of
`icicle-dot-string'.</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (if (consp arg)
      (let ((opposite  (if (string= icicle-dot-string-internal "<span class="quote">.</span>")
                           (icicle-anychar-regexp)
                         (let ((strg  "<span class="quote">.</span>"))
                           (add-text-properties
                            0 1 '(icicle-user-plain-dot t rear-nonsticky (icicle-user-plain-dot))
                            strg)
                           strg))))
        (if executing-kbd-macro
            (insert opposite)
          (icicle-call-then-update-Completions (lambda () (insert opposite)))))
    (setq arg  (prefix-numeric-value arg))
    (if executing-kbd-macro
        (funcall #'icicle-insert-dot arg)
      (icicle-call-then-update-Completions #'icicle-insert-dot arg))))

(defun icicle-insert-dot (n)
  "<span class="quote">Insert `icicle-dot-string' N times.</span>"
  (dotimes (i n)
    (if (not (string= icicle-dot-string-internal "<span class="quote">.</span>"))
        (insert (icicle-anychar-regexp))
      (insert "<span class="quote">.</span>")
      (add-text-properties (1- (point)) (point) '(icicle-user-plain-dot t rear-nonsticky t)))))

(defun icicle-anychar-regexp ()
  "<span class="quote">Return a regexp that matches any single character, including newline.
The value returned is like that of constant `icicle-anychar-regexp',
but the `display' string is unique for each call.</span>"
  (let ((strg  (copy-sequence "<span class="quote">\\(.\\|[\n]\\)</span>")))
    (set-text-properties 0 (length strg)
                         (if icicle-dot-show-regexp-flag
                             '(face highlight rear-nonsticky t)
                           `(display ,(copy-sequence "<span class="quote">.</span>") face highlight rear-nonsticky t))
                         strg)
    strg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-erase-minibuffer ()       <span class="linecomment">; Bound to `M-S-backspace', `M-S-delete' in minibuffer.</span>
  "<span class="quote">Delete all user input in the minibuffer, then update completions.</span>"
  (interactive)
  (icicle-call-then-update-Completions #'icicle-clear-minibuffer))
 
<span class="linecomment">;;(@* "Commands to sort completion candidates")</span>

<span class="linecomment">;;; Commands to sort completion candidates . . . . . . . . . . . . . .</span>

<span class="linecomment">;; We don't bother to define a command for the sort functions `icicle-prefix-keys-first-p' and</span>
<span class="linecomment">;; `icicle-command-names-alphabetic-p'.  They are bound in `icicle-complete-keys'.</span>

<span class="linecomment">;; The order here defines the reverse order of `icicle-sort-orders-alist'.</span>
<span class="linecomment">;; The first here is also the default sort order.  Entries are traversed by `C-,' in</span>
<span class="linecomment">;; `icicle-sort-orders-alist' order.</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-alphabetical "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">alphabetical</span>" <span class="linecomment">; `icicle-sort-alphabetical'</span>
    icicle-case-string-less-p
  "<span class="quote">Sort completion candidates alphabetically.
Ignore letter case if `completion-ignore-case' or `case-fold-search'
is non-nil.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-special-candidates-first "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">special candidates first</span>" <span class="linecomment">; `icicle-sort-special-candidates-first'</span>
    icicle-special-candidates-first-p
  "<span class="quote">Sort completion candidates by putting special candidates first.
Otherwise, sorting is alphabetical.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-extra-candidates-first "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">extra candidates first</span>" <span class="linecomment">; `icicle-sort-extra-candidates-first'</span>
    icicle-extra-candidates-first-p
  "<span class="quote">Sort completion candidates by putting extra candidates first.
Otherwise, sorting is alphabetical.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.
An extra candidate is one that is a member of
`icicle-extra-candidates'.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-proxy-candidates-first "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">proxy candidates first</span>" <span class="linecomment">; `icicle-sort-proxy-candidates-first'</span>
    icicle-proxy-candidate-first-p
  "<span class="quote">Sort completion candidates by putting proxy candidates first.
Otherwise, sorting is alphabetical.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-case-insensitive "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">case insensitive</span>" <span class="linecomment">; `icicle-sort-case-insensitive'</span>
    icicle-case-insensitive-string-less-p
  "<span class="quote">Sort completion candidates alphabetically, but case-insenstively.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-2nd-parts-alphabetically "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by 2nd parts alphabetically</span>" <span class="linecomment">; `icicle-sort-by-2nd-parts-alphabetically'</span>
    icicle-2nd-part-string-less-p
  "<span class="quote">Sort multi-completion candidates alphabetically by their second parts.
After that, sort alphabetically by the first parts.  Ignore letter
case if `completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-last-file-modification-time "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by last file modification time</span>"
    icicle-last-modified-first-p        <span class="linecomment">; `icicle-sort-by-last-file-modification-time'</span>
  "<span class="quote">Sort file-name completion candidates in order of last modification.
If not doing file-name completion, then sort alphabetically.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-file-type "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by file type</span>" <span class="linecomment">; `icicle-sort-by-file-type'</span>
    icicle-file-type-less-p
  "<span class="quote">Sort file-name completion candidates by file type.
Directories sort first, alphabetically.
Then sort by file type (extension), alphabetically.
Sort names that have the same extension alphabetically.
If not doing file-name completion, sort candidates alphabetically.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-directories-first "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by directories first</span>" <span class="linecomment">; `icicle-sort-by-directories-first'</span>
    icicle-dirs-first-p
  "<span class="quote">Sort file-name completion candidates so that directories are first.
If not doing file-name completion, then sort alphabetically.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-directories-last "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by directories last</span>" <span class="linecomment">; `icicle-sort-by-directories-last'</span>
    icicle-dirs-last-p
  "<span class="quote">Sort file-name completion candidates so that directories are last.
If not doing file-name completion, then sort alphabetically.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-last-use-as-input "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by last use as input</span>" <span class="linecomment">; `icicle-sort-by-last-use-as-input'</span>
    icicle-most-recent-first-p
  "<span class="quote">Sort completion candidates in order of last use as minibuffer input.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-previous-use-alphabetically "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by previous use alphabetically</span>"
    icicle-historical-alphabetic-p      <span class="linecomment">; `icicle-sort-by-previous-use-alphabetically'</span>
  "<span class="quote">Sort completion candidates by previous use and alphabetically.
Candidates matching previous inputs are available first.  Candidates
are in two groups, each of which is sorted alphabetically separately:
those matching previous inputs, followed by those that have not yet
been used.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-by-abbrev-frequency "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">by abbrev frequency</span>" <span class="linecomment">; `icicle-sort-by-abbrev-frequency'</span>
    icicle-command-abbrev-used-more-p
  "<span class="quote">Sort abbrev completion candidates by frequency of use
Otherwise, sort alphabetically.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-sort-turned-OFF "icicles-mcmd.el")</span>
(icicle-define-sort-command "<span class="quote">turned OFF</span>" nil <span class="linecomment">; `icicle-sort-turned-OFF'</span>
  "<span class="quote">Do not sort completion candidates.</span>")

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-M-_ ()           <span class="linecomment">; Bound to `M-_' in minibuffer.</span>
  "<span class="quote">Do the right thing for `M-_'.
During Icicles search, call `icicle-toggle-search-replace-whole'.
Otherwise, call `icicle-toggle-ignored-space-prefix'.

Bound to `M-_' in the minibuffer.</span>"
  (interactive)
  (if icicle-searching-p
      (icicle-toggle-search-replace-whole)
    (call-interactively #'icicle-toggle-ignored-space-prefix)))

<span class="linecomment">;;; No longer used.</span>
<span class="linecomment">;;; (defun icicle-dispatch-C-comma ()</span>
<span class="linecomment">;;;   "Do the right thing for `C-,'.</span>
<span class="linecomment">;;; When candidate sorting is possible, call `icicle-change-sort-order'.</span>
<span class="linecomment">;;; When searching, call `icicle-toggle-search-replace-whole'.</span>
<span class="linecomment">;;; Otherwise, do nothing.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Bound to `C-,' in the minibuffer."</span>
<span class="linecomment">;;;   (interactive)</span>
<span class="linecomment">;;;   (cond (icicle-searching-p (icicle-toggle-search-replace-whole))</span>
<span class="linecomment">;;;         (icicle-inhibit-sort-p (message "Cannot sort candidates now"))</span>
<span class="linecomment">;;;         (t (call-interactively #'icicle-change-sort-order))))</span>

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-ignoring-comments 'icicle-toggle-ignoring-comments)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignoring-comments () <span class="linecomment">; Bound to `C-M-;' in minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-ignore-comments-flag'.
If option `ignore-comments-flag' is defined (in library
`thing-cmds.el') then it too is toggled.
Bound to `C-M-;' in the minibuffer.</span>"
  (interactive)
  (setq icicle-ignore-comments-flag  (not icicle-ignore-comments-flag))
  (when (boundp ignore-comments-flag) (setq ignore-comments-flag  (not ignore-comments-flag)))
  (icicle-msg-maybe-in-minibuffer (if icicle-ignore-comments-flag
                                      "<span class="quote">Ignoring comments is now ON</span>"
                                    "<span class="quote">Ignoring comments is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-search-replace-common-match 'icicle-toggle-search-replace-common-match)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-replace-common-match () <span class="linecomment">; Bound to `M-;' in minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-search-replace-common-match-flag'.
Note that that option has no effect if
`icicle-expand-input-to-common-match-flag' is nil.
Bound to `M-;' in the minibuffer.</span>"
  (interactive)
  (setq icicle-search-replace-common-match-flag  (not icicle-search-replace-common-match-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-replace-common-match-flag
                                      "<span class="quote">Replacing expanded common match is now ON</span>"
                                    "<span class="quote">Replacing expanded common match is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-search-replace-whole 'icicle-toggle-search-replace-whole)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-replace-whole ()
  "<span class="quote">Toggle the value of `icicle-search-replace-whole-candidate-flag'.
Bound to `M-_' in the minibuffer when searching.</span>"
  (interactive)
  (setq icicle-search-replace-whole-candidate-flag  (not icicle-search-replace-whole-candidate-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-replace-whole-candidate-flag
                                      "<span class="quote">Replacing whole search context is now ON</span>"
                                    "<span class="quote">Replacing whole search context is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-dot 'icicle-toggle-dot)
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-.   'icicle-toggle-dot)
<span class="linecomment">;;;###autoload</span>
(defalias 'icicle-toggle-.   'icicle-toggle-dot)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-dot ()             <span class="linecomment">; Bound to `C-M-.' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-dot-string' between `.' and `icicle-anychar-regexp'.
Bound to `C-M-.' in the minibuffer.</span>"
  (interactive)
  (setq icicle-dot-string           (if (string= icicle-dot-string "<span class="quote">.</span>") (icicle-anychar-regexp) "<span class="quote">.</span>"))
  (icicle-msg-maybe-in-minibuffer
   (cond ((string= icicle-dot-string "<span class="quote">.</span>")
          (icicle-convert-dots (equal icicle-current-input icicle-last-input) t)
          "<span class="quote">`.' now matches any char EXCEPT newline</span>")
         (t
          (icicle-convert-dots (equal icicle-current-input icicle-last-input))
          "<span class="quote">`.' now matches any char, including NEWLINE</span>")))
  (setq icicle-dot-string-internal  icicle-dot-string))

(defun icicle-convert-dots (&optional no-confirm-p plainp)
  "<span class="quote">Convert existing dots.
Optional arg NO-CONFIRM-P means don't ask user for confirmation.
Optional arg PLAINP means convert to plain `.'.
  Otherwise, convert to `icicle-anychar-regexp'.</span>"
  (if plainp
      (save-excursion
        (when (and (goto-char (icicle-minibuffer-prompt-end))
                   (search-forward icicle-anychar-regexp nil t))
          (goto-char (icicle-minibuffer-prompt-end))
          (while (search-forward icicle-anychar-regexp nil t)
            (replace-match "<span class="quote">.</span>" nil t))))
    (save-excursion
      (when (and (goto-char (icicle-minibuffer-prompt-end)) (search-forward "<span class="quote">.</span>" nil t))
        (goto-char (icicle-minibuffer-prompt-end))
        (let ((allp  nil))
          (while (search-forward "<span class="quote">.</span>" nil t)
            <span class="linecomment">;; If we hit a plain dot inserted by user explicitly, ask if we should convert all such.</span>
            (when (and (not allp)
                       (get-text-property (match-beginning 0) 'icicle-user-plain-dot)
                       (not no-confirm-p)
                       (y-or-n-p "<span class="quote">Should all dots (`.') in current input match newlines too? </span>"))
              (setq allp  t))
            (when (or allp (not (get-text-property (match-beginning 0) 'icicle-user-plain-dot)))
              (replace-match (icicle-anychar-regexp) nil t))))))))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
(when (require 'image-dired nil t)      <span class="linecomment">; Emacs 22+.</span>
  (defalias 'cycle-icicle-image-file-thumbnail 'icicle-toggle-show-image-file-thumbnail)
  (defun icicle-cycle-image-file-thumbnail () <span class="linecomment">; Bound to `C-x t' in minibuffer.</span>
    "<span class="quote">Toggle `icicle-image-files-in-Completions'.
This has no effect if you do not have library `image-dired.el' (Emacs 23+).
Bound to `C-x t' in the minibuffer.</span>"
    (interactive)
    (if (not (require 'image-dired nil t))
        (message "<span class="quote">No-op: this command requires library `image-dired.el'</span>")
      (setq icicle-image-files-in-Completions
            (case icicle-image-files-in-Completions
              ((nil)       'image-only)
              (image-only  t)
              (t           nil)))
      (icicle-complete-again-update)
      (icicle-msg-maybe-in-minibuffer
       (case icicle-image-files-in-Completions
         ((nil)       "<span class="quote">Image files in `*Completions*': showing only NAMES</span>")
         (image-only  "<span class="quote">Image files in `*Completions*': showing only IMAGES</span>")
         (t           "<span class="quote">Image files in `*Completions*': showing IMAGES and NAMES</span>"))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-doremi-increment-max-candidates+ (&optional increment) <span class="linecomment">; `C-x #' in minibuffer</span>
  "<span class="quote">Change `icicle-max-candidates' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
 use the `Meta' key (e.g. `M-up') to increment in larger steps.
You can use a numeric prefix arg to specify the increment.
A plain prefix arg (`C-u') resets `icicle-max-candidates' to nil,
 meaning no limit.</span>"
  (interactive "<span class="quote">P</span>")
  (cond ((consp increment)
         (setq icicle-max-candidates  nil)
         (icicle-msg-maybe-in-minibuffer "<span class="quote">No longer any limit on number of candidates</span>"))
        (t
         (setq increment  (prefix-numeric-value increment))
         (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
         (let ((mini  (active-minibuffer-window)))
           (unwind-protect
                (save-selected-window
                  (select-window (minibuffer-window))
                  (unless icicle-completion-candidates (message "<span class="quote">Hit `TAB' or `S-TAB'</span>"))
                  (let ((enable-recursive-minibuffers  t)
                        (nb-cands                      (length icicle-completion-candidates)))
                    (when (or (not icicle-max-candidates) (&gt; icicle-max-candidates nb-cands))
                      (setq icicle-max-candidates  nb-cands))
                    (when (zerop icicle-max-candidates) (setq icicle-max-candidates 10))
                    (doremi (lambda (new-val)
                              (setq icicle-max-candidates
                                    (setq new-val (doremi-limit new-val 2 nil)))
                              (unless (input-pending-p)
                                (let ((icicle-edit-update-p  t)
                                      (icicle-last-input     nil))
                                  (funcall (or icicle-last-completion-command
                                               (if (eq icicle-current-completion-mode 'prefix)
                                                   #'icicle-prefix-complete
                                                 #'icicle-apropos-complete)))
                                  (run-hooks 'icicle-update-input-hook)))
                              new-val)
                            icicle-max-candidates
                            increment))
                  (setq unread-command-events  ()))
             (unless mini (icicle-remove-Completions-window)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-doremi-increment-swank-timeout+ () <span class="linecomment">; Bound to `C-x 1' in minibuffer (swank only)</span>
  "<span class="quote">Change `icicle-swank-timeout' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-up') to increment in larger steps.</span>"
  (interactive)
  (icicle-doremi-increment-variable+ 'icicle-swank-timeout 1000))

<span class="linecomment">;;;###autoload</span>
(defun icicle-doremi-increment-swank-prefix-length+ () <span class="linecomment">; Bound to `C-x 2' in minibuffer (swank only)</span>
  "<span class="quote">Change `icicle-swank-prefix-length' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-up') to increment in larger steps.</span>"
  (interactive)
  (icicle-doremi-increment-variable+ 'icicle-swank-prefix-length 1))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-TAB-completion-method (temporary-p) <span class="linecomment">; Bound to `C-(' in minibuffer.</span>
  "<span class="quote">Cycle to the next `TAB' completion method.
Bound to \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-next-TAB-completion-method]' \
in the minibuffer.
Option `icicle-TAB-completion-methods' determines the TAB completion
methods that are available.

With a prefix argument, the newly chosen method is used only for the
current command.  More precisely, the previously active method is
restored as soon as you return to the top level.</span>"
  (interactive "<span class="quote">P</span>")
  (unless icicle-current-TAB-method     <span class="linecomment">; nil means the same as the default (first).</span>
    (setq icicle-current-TAB-method  (car icicle-TAB-completion-methods)))
  (if temporary-p
      (unless (get 'icicle-last-top-level-command 'icicle-current-TAB-method)
        (put 'icicle-last-top-level-command 'icicle-current-TAB-method icicle-current-TAB-method))
    (put 'icicle-last-top-level-command 'icicle-current-TAB-method nil))

  (let ((now  (memq icicle-current-TAB-method icicle-TAB-completion-methods)))
    (setq icicle-current-TAB-method  (or (cadr now) (car icicle-TAB-completion-methods)))
    <span class="linecomment">;; Skip any method that is not currently supported.</span>
    (while (or (and (eq icicle-current-TAB-method 'fuzzy)        (not (featurep 'fuzzy-match)))
               (and (eq icicle-current-TAB-method 'vanilla)      (not (boundp 'completion-styles)))
               (and (eq icicle-current-TAB-method 'swank)        (not (featurep 'el-swank-fuzzy))))
      (setq now                        (memq icicle-current-TAB-method icicle-TAB-completion-methods)
            icicle-current-TAB-method  (or (cadr now) (car icicle-TAB-completion-methods)))))
  (cond ((and (eq icicle-current-TAB-method 'swank) (fboundp 'doremi))
         (define-key minibuffer-local-completion-map "<span class="quote">\C-x1</span>"
           'icicle-doremi-increment-swank-timeout+)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-x1</span>"
           'icicle-doremi-increment-swank-timeout+)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-x2</span>"
           'icicle-doremi-increment-swank-prefix-length+)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-x2</span>"
           'icicle-doremi-increment-swank-prefix-length+))
        ((fboundp 'doremi)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-x1</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-x1</span>" nil)
         (define-key minibuffer-local-completion-map "<span class="quote">\C-x2</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-x2</span>" nil)))
  <span class="linecomment">;; $$$$$$ Inhibiting sorting is not correct for file-name completion, and sorting would not be</span>
  <span class="linecomment">;;        restored when change back to non-fuzzy.</span>
  <span class="linecomment">;; (when (eq 'fuzzy icicle-current-TAB-method) (setq icicle-inhibit-sort-p  t))</span>
  (icicle-msg-maybe-in-minibuffer "<span class="quote">TAB completion is %s %s</span>"
                                  (icicle-upcase (symbol-name icicle-current-TAB-method))
                                  (if temporary-p "<span class="quote">for this command</span>" "<span class="quote">now</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-S-TAB-completion-method (temporary-p) <span class="linecomment">; Bound to `M-(' in minibuffer.</span>
  "<span class="quote">Cycle to the next `S-TAB' completion method.
Bound to `M-(' in the minibuffer.
Option `icicle-S-TAB-completion-methods-alist' customizes the
available TAB completion methods.

With a prefix argument, the newly chosen method is used only for the
current command.  More precisely, the previously active method is
restored as soon as you return to the top level.</span>"
  (interactive "<span class="quote">P</span>")
  (if temporary-p
      (unless (get 'icicle-last-top-level-command 'icicle-apropos-complete-match-fn)
        (put 'icicle-last-top-level-command 'icicle-apropos-complete-match-fn
             icicle-apropos-complete-match-fn))
    (put 'icicle-last-top-level-command 'icicle-apropos-complete-match-fn nil))
  (let ((entry  (rassq icicle-apropos-complete-match-fn icicle-S-TAB-completion-methods-alist)))
    (setq icicle-apropos-complete-match-fn
          (or (cdadr (member entry icicle-S-TAB-completion-methods-alist))
              (cdar icicle-S-TAB-completion-methods-alist))
          icicle-last-apropos-complete-match-fn  icicle-apropos-complete-match-fn) <span class="linecomment">; Backup copy.</span>
    (icicle-msg-maybe-in-minibuffer
     (format "<span class="quote">S-TAB completion is %s%s %s</span>"
             (icicle-upcase (car (rassq icicle-apropos-complete-match-fn
                                        icicle-S-TAB-completion-methods-alist)))
             (if (memq icicle-apropos-complete-match-fn
                       '(icicle-levenshtein-match icicle-levenshtein-strict-match))
                 (format "<span class="quote"> (%d)</span>" icicle-levenshtein-distance)
               "<span class="quote"></span>")
             (if temporary-p "<span class="quote">for this command</span>" "<span class="quote">now</span>")))))
    <span class="linecomment">;; (icicle-complete-again-update) ; No - too slow for some completion methods.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-change-sort-order (&optional arg alternativep) <span class="linecomment">; Bound to `C-,' in minibuffer.</span>
  "<span class="quote">Choose a sort order.
With a numeric prefix arg, reverse the current sort order.

If plain `C-u' is used or `C-u' is not used at all:

- Use completion if `icicle-change-sort-order-completion-flag' is
  non-nil and no prefix arg is used, or if it is nil and a prefix arg
  is used.

- Otherwise, just cycle to the next sort order.

This command updates `icicle-sort-comparer'.  Non-interactively,
optional arg ALTERNATIVEP means change the current alternative sort
order instead, updating `icicle-alternative-sort-comparer'.</span>"
  (interactive "<span class="quote">P</span>")
  (setq icicle-sort-orders-alist  (delq nil icicle-sort-orders-alist)) <span class="linecomment">; Purge any nil entries.</span>
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (if (and arg (not (consp arg)))
        (icicle-reverse-sort-order)
      (let (next-order)
        (cond ((or (and icicle-change-sort-order-completion-flag (not arg)) <span class="linecomment">; Use completion.</span>
                   (and (not icicle-change-sort-order-completion-flag) arg))
               (setq next-order  (let ((icicle-whole-candidate-as-text-prop-p  nil)
                                       (enable-recursive-minibuffers           t))
                                   (save-selected-window
                                     (completing-read
                                      (format "<span class="quote">New %ssort order: </span>" (if alternativep "<span class="quote">alternative </span>" "<span class="quote"></span>"))
                                      (icicle-current-sort-functions)
                                      nil t))))
               (set (if alternativep 'icicle-alternative-sort-comparer 'icicle-sort-comparer)
                    (cdr (assoc next-order icicle-sort-orders-alist))))
              (t                        <span class="linecomment">; Cycle to next sort order.</span>
               (let ((orders  (mapcar #'car (icicle-current-sort-functions))))
                 (setq next-order  (or (cadr (memq (icicle-current-sort-order alternativep) orders))
                                       (car orders)))
                 (set (if alternativep 'icicle-alternative-sort-comparer 'icicle-sort-comparer)
                      (cdr (assoc next-order icicle-sort-orders-alist))))))
        (icicle-complete-again-update)
        (icicle-msg-maybe-in-minibuffer
         "<span class="quote">%sorting is now %s%s.  Reverse: `C-9 C-,'</span>"
         (if alternativep "<span class="quote">Alternative s</span>" "<span class="quote">S</span>") next-order
         (if icicle-reverse-sort-p "<span class="quote">, REVERSED</span>" "<span class="quote"></span>"))))))

(defun icicle-current-sort-functions ()
  "<span class="quote">Subset of `icicle-sort-orders-alist' that is currently appropriate.
For some common kinds of completion, remove simple sort functions (not
multi-sort comparers) that are not pertinent for the current kind of
completion.</span>"
  (icicle-remove-if (lambda (pred)
                      (setq pred  (cdr pred))
                      (and pred (symbolp pred) <span class="linecomment">; Do not handle multi-sort comparers.</span>
                           (or (and (get pred 'icicle-proxy-sort-predicate)
                                    (not icicle-add-proxy-candidates-flag))
                               (and (get pred 'icicle-file-name-sort-predicate)
                                    (not (icicle-file-name-input-p)))
                               <span class="linecomment">;; Not really needed yet, because we only add such sorts dynamically.</span>
                               (and (get pred 'icicle-buffer-name-sort-predicate) <span class="linecomment">; Better than nothing.</span>
                                    (not (eq minibuffer-history-variable 'buffer-name-history)))
                               (and (get pred 'icicle-command-sort-predicate)
                                    (not (and (eq minibuffer-completion-table obarray)
                                              <span class="linecomment">;; But this will fail if predicate is more complex.</span>
                                              (eq minibuffer-completion-predicate 'commandp))))
                               <span class="linecomment">;; Sort order for multi-completions. `minibuffer-completion-table'</span>
                               <span class="linecomment">;; could be a function (e.g. `icicle-describe-opt-of-type-complete')</span>
                               <span class="linecomment">;; or it could be a list of multi-completions.</span>
                               (and (get pred 'icicle-multi-completion-sort-predicate)
                                    (not (icicle-maybe-multi-completion-completing-p))))))
                    icicle-sort-orders-alist))

(defun icicle-maybe-multi-completion-completing-p ()
  "<span class="quote">Returns non-nil if we might currently be multi-completion completing.
Note: If `minibuffer-completion-table' is a function, multi-completion
is possible but not sure.  Return non-nil in that case.</span>"
  (or (functionp minibuffer-completion-table) icicle-list-use-nth-parts))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-M-comma ()       <span class="linecomment">; Bound to `M-,' in minibuffer.</span>
  "<span class="quote">Do the right thing for `M-,'.
If sorting is possible, call `icicle-change-alternative-sort-order'.
If using `icicle-search', call `icicle-search-define-replacement'.
Otherwise, do nothing.

Bound to `M-,' in the minibuffer.</span>"
  (interactive)
  (cond (icicle-searching-p (icicle-search-define-replacement))
        (icicle-inhibit-sort-p (message "<span class="quote">Cannot sort candidates now</span>"))
        (t (icicle-change-alternative-sort-order))))

<span class="linecomment">;; Free vars here: `icicle-scan-fn-or-regexp' is bound in `icicle-search'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-search-define-replacement () <span class="linecomment">; Bound to `M-,' in minibuffer during `icicle-search'.</span>
  "<span class="quote">Prompt user and set new value of `icicle-search-replacement'.
Bound to `M-,' in the minibuffer.</span>"
  (interactive)
  (save-selected-window
    (icicle-remove-Completions-window)) <span class="linecomment">; Prevent incremental completion kicking in from the get-go.</span>
  (setq icicle-search-replacement
        (let ((enable-recursive-minibuffers        t)
              (icicle-incremental-completion-flag  t) <span class="linecomment">; Override current upgrade to `always'.</span>
              (icicle-completion-candidates        icicle-completion-candidates)
              (icicle-current-input                icicle-current-input)
              (icicle-candidate-nb                 icicle-candidate-nb)
              (icicle-update-input-hook            nil))
          (icicle-completing-read-history "<span class="quote">Replace with: </span>" 'icicle-search-replacement-history)))
  <span class="linecomment">;; Just a sanity check.  Cannot really test equivalence of two regexps.</span>
  (while (if icicle-search-replace-whole-candidate-flag
             (equal icicle-search-replacement icicle-scan-fn-or-regexp)
           (equal icicle-search-replacement icicle-current-input))
    (setq icicle-search-replacement
          (let ((enable-recursive-minibuffers        t)
                (icicle-incremental-completion-flag  t) <span class="linecomment">; Override current upgrade to `always'.</span>
                (icicle-completion-candidates        icicle-completion-candidates)
                (icicle-current-input                icicle-current-input)
                (icicle-candidate-nb                 icicle-candidate-nb)
                (icicle-update-input-hook            nil))
            (icicle-completing-read-history "<span class="quote">Replacement = replaced.  Replace with: </span>"
                                            'icicle-search-replacement-history)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-change-alternative-sort-order (&optional arg) <span class="linecomment">; Bound to `M-,' in minibuffer (not search).</span>
  "<span class="quote">Choose an alternative sort order.
Similar to command `icicle-change-sort-order', but change the
alternative sort order, not the current sort order.</span>"
  (interactive "<span class="quote">P</span>")
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (icicle-change-sort-order arg t)))

(defun icicle-current-sort-order (alternativep)
  "<span class="quote">Current sort order, or nil if sorting is inactive.
If ALTERNATIVEP is non-nil, the alternative sort order is returned.</span>"
  (car (rassq (if alternativep icicle-alternative-sort-comparer icicle-sort-comparer)
              icicle-sort-orders-alist)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-reverse-sort-order ()
  "<span class="quote">Reverse the current sort order.</span>"
  (interactive)
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (setq icicle-reverse-sort-p  (not icicle-reverse-sort-p))
    (icicle-display-candidates-in-Completions icicle-reverse-sort-p)
    (icicle-complete-again-update)
    (icicle-msg-maybe-in-minibuffer
     (format "<span class="quote">Sort order is %s%s</span>"
             (icicle-current-sort-order nil) (if icicle-reverse-sort-p "<span class="quote">, REVERSED</span>" "<span class="quote"></span>")))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-plus-saved-sort ()        <span class="linecomment">; Bound to `C-M-+' during completion.</span>
  "<span class="quote">Sort candidates by combining their current order with the saved order.</span>"
  (interactive)
  (let ((icicle-sort-comparer  'icicle-merge-saved-order-less-p)
        (cands                 (copy-sequence icicle-completion-candidates)))
    (setq icicle-completion-candidates
          (if (or (icicle-file-name-input-p) icicle-abs-file-candidates)
              (icicle-strip-ignored-files-and-sort cands)
            (icicle-maybe-sort-maybe-truncate cands))))
  (when (get-buffer-window "<span class="quote">*Completions*</span>" 0) (icicle-display-candidates-in-Completions))
  (when (interactive-p) (icicle-msg-maybe-in-minibuffer "<span class="quote">Added in the saved sort order</span>")))

 
<span class="linecomment">;;(@* "Other commands to be used mainly in the minibuffer")</span>

<span class="linecomment">;;; Other commands to be used mainly in the minibuffer . . . . . . . .</span>

<span class="linecomment">;; $$ Probably need to do something to work around problem of Windows</span>
<span class="linecomment">;; selecting the new frame, when `pop-up-frames' is non-nil.  Need to</span>
<span class="linecomment">;; redirect focus back to the frame with the minibuffer.  Leave it as</span>
<span class="linecomment">;; is, for now, in hopes Emacs will eventually fix this.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-minibuffer-help ()        <span class="linecomment">; Bound to `C-?' in minibuffer.</span>
  "<span class="quote">Describe Icicles minibuffer and *Completion* buffer bindings.</span>"
  (interactive)
  (let ((cur-buf  (current-buffer)))
    (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
      (when (icicle-completing-p)
        (princ (concat "<span class="quote">You are completing input</span>" (and icicle-candidate-action-fn
                                                       "<span class="quote"> for an Icicles multi-command</span>")
                       "<span class="quote">.\n\n</span>"))
        (princ "<span class="quote">To show help on individual completion candidates:
     Current candidate                       C-M-RET, C-M-mouse-2
     Next, previous candidate                C-M-down, C-M-up,
                                              C-M- plus mouse wheel
                    prefix-match candidate   C-M-end, C-M-home
                    apropos-match candidate  C-M-next, C-M-prior\n\n</span>")
        (when icicle-candidate-action-fn
          (princ "<span class="quote">To act on individual candidates:
     Current candidate                       C-RET, C-mouse-2
     Next, previous candidate                C-down, C-up,
                                              C- plus mouse wheel
                    prefix-match candidate   C-end, C-home
                    apropos-match candidate  C-next, C-prior
     All candidates at once                  C-! (each) or M-! (list)
     Delete object named by candidate        S-delete
     Object-action: apply a fn to candidate  M-RET</span>"))
        (when icicle-candidate-alt-action-fn
          (princ "<span class="quote">\nFor alt action, use `C-S-' instead of `C-', but use `C-|' or `M-|',\n\
     instead of `C-!' or `M-!', to act on all.\n</span>")))
      (if icicle-completing-p
          (with-current-buffer standard-output
            (insert (concat "<span class="quote">\n</span>" (icicle-help-string-completion))))
        (princ (icicle-help-string-non-completion))))
    <span class="linecomment">;; Don't bother to do this for Emacs 21.3.  Its `help-insert-xref-button' signature is different.</span>
    (when (and (&gt; emacs-major-version 21)
               (require 'help-mode nil t) (fboundp 'help-insert-xref-button)) <span class="linecomment">; In `help-mode.el'.</span>
      (save-excursion
        (with-current-buffer (get-buffer "<span class="quote">*Help*</span>")
          (let ((buffer-read-only  nil))
            (goto-char (point-min))
            (help-insert-xref-button "<span class="quote">[Icicles Help on the Web]</span>" 'icicle-help-button)
            (insert "<span class="quote">                        </span>")
            (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 1]</span>" 'icicle-commentary1-button)
            (insert "<span class="quote">\n</span>")
            (help-insert-xref-button "<span class="quote">[Icicles Options & Faces]</span>" 'icicle-customize-button)
            (insert "<span class="quote">                        </span>")
            (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 2]</span>" 'icicle-commentary2-button)
            (insert "<span class="quote">\n\n</span>")
            (goto-char (point-max))
            (insert (funcall
                     (if (fboundp 'help-commands-to-key-buttons) <span class="linecomment">; In `help-fns.el'.</span>
                         #'help-commands-to-key-buttons
                       #'substitute-command-keys)
                     "<span class="quote">\n\nSend an Icicles bug report: `\\[icicle-send-bug-report]'.\n\n</span>"))
            (help-insert-xref-button "<span class="quote">[Icicles Help on the Web]</span>" 'icicle-help-button)
            (insert "<span class="quote">                        </span>")
            (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 1]</span>" 'icicle-commentary1-button)
            (insert "<span class="quote">\n</span>")
            (help-insert-xref-button "<span class="quote">[Icicles Options & Faces]</span>" 'icicle-customize-button)
            (insert "<span class="quote">                        </span>")
            (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 2]</span>" 'icicle-commentary2-button)
            (insert "<span class="quote">\n\n</span>")
            (goto-char (point-min))))))
    (when (memq cur-buf (list (window-buffer (minibuffer-window)) (get-buffer "<span class="quote">*Completions*</span>")))
      (select-window (minibuffer-window))
      (select-frame-set-input-focus (selected-frame)))))

(defun icicle-help-string-completion ()
  "<span class="quote">Update the bindings within the Icicles completion help string.</span>"
  (icicle-S-iso-lefttab-to-S-TAB
   (funcall
    (if (fboundp 'help-commands-to-key-buttons) <span class="linecomment">; In `help-fns+.el'.</span>
        #'help-commands-to-key-buttons
      #'substitute-command-keys)
    (concat
     (format "<span class="quote">\\&lt;minibuffer-local-completion-map&gt; 

                    Icicles Minibuffer Completion
                    -----------------------------

Minibuffer input can be completed in several ways.
These are the main Icicles actions and their minibuffer key bindings:

 * Show Icicles minibuffer help (this).      \\[icicle-minibuffer-help]
     For help on individual completion candidates, see \"Show help on
     individual completion candidates\", below.

 * Abandon or commit your input.
     Abandon input                           \\[icicle-abort-recursive-edit]
     Commit input to Emacs                   RET
       Complete partial input, then commit   \\&lt;minibuffer-local-must-match-map&gt;\
\\[icicle-apropos-complete-and-exit]\\&lt;minibuffer-local-completion-map&gt;

 * Toggle/cycle Icicles options on the fly.  Key:   \tCurrently:
     Highlighting of past inputs             \\[icicle-toggle-highlight-historical-candidates]\t%S
     Highlighting of saved candidates        \\[icicle-toggle-highlight-saved-candidates]\t%S
     Removal of duplicate candidates         \\[icicle-toggle-transforming]\t%S
     Sort order                              \\[icicle-change-sort-order]\t%s
     Alternative sort order                  \\[icicle-dispatch-M-comma]\t%s
     Swap alternative/normal sort            \\[icicle-toggle-alternative-sorting]\t- (swaps) -
     Case sensitivity                        \\[icicle-toggle-case-sensitivity]\t%S
     `.' matching newlines too (any char)    \\[icicle-toggle-dot]\t%S
     Escaping of special regexp chars        \\[icicle-toggle-regexp-quote]\t%S
     Incremental completion                  \\[icicle-toggle-incremental-completion]\t%S
     Input expansion to common match         \\[icicle-toggle-expand-to-common-match]\t%S
     Hiding common match in `*Completions*'  \\[icicle-toggle-hiding-common-match]\t%S
     S-TAB completion method                 \\[icicle-next-S-TAB-completion-method]\t%s
     TAB completion method                   \\[icicle-next-TAB-completion-method]\t%s
     Showing image-file thumbnails (E22+)    C-x t\t%S
     Inclusion of proxy candidates           \\[icicle-toggle-proxy-candidates]\t%S
     Ignoring certain file extensions        \\[icicle-dispatch-C-.]\t%S
     Checking for remote file names          \\[icicle-dispatch-C-^]\t%S
     Ignoring space prefix                   \\[icicle-dispatch-M-_]\t%S
     Using `C-' for multi-command actions    \\[icicle-toggle-C-for-actions]\t%S
     Using `~' for your home directory       \\[icicle-toggle-~-for-home-dir]\t%S
     `icicle-search' all-current highlights  \\[icicle-dispatch-C-^]\t%S
     Whole-word searching                    \\[icicle-dispatch-M-q]\t%S
     Removal of `icicle-search' highlighting \\[icicle-dispatch-C-.]\t%S
     Replacement of whole search hit         \\[icicle-dispatch-M-_]\t%S
     Replacement of expanded common match    \\[icicle-toggle-search-replace-common-match]\t%S

 * Regexp-quote input, then apropos-complete \\[icicle-regexp-quote-input]

 * Change the set of completion candidates.  Modify your input.
     Edit your input                         (just edit in minibuffer)
     Erase your input (clear minibuffer)     \\[icicle-erase-minibuffer-or-history-element]
     Goto/kill non-matching portion of input \\[icicle-goto/kill-failed-input]
     Retrieve previous completion inputs     \\[icicle-retrieve-previous-input], \
\\[icicle-retrieve-next-input]
     Match another regexp (chaining)         \\[icicle-narrow-candidates]
     Satisfy another predicate (chaining)    \\[icicle-narrow-candidates-with-predicate]
     Remove a candidate from set of matches  delete, S-mouse-2
     Yank text at cursor into minibuffer     \\[icicle-insert-string-at-point]
     Insert text (string) from a variable    \\[icicle-insert-string-from-variable]
     Insert `icicle-list-join-string'        \\[icicle-insert-list-join-string]
     Insert previously entered input         \\[icicle-insert-history-element]
     Insert key description (key completion) \\[icicle-dispatch-M-q]

 * Complete your current input in the minibuffer.
     Apropos (regexp) completion             \\[icicle-apropos-complete]
       Without displaying candidates         \\[icicle-apropos-complete-no-display]
       Complete and match another regexp     \\[icicle-apropos-complete-and-narrow]
     Prefix completion
       As much as possible                   \\[icicle-prefix-complete]
         Without displaying candidates       \\[icicle-prefix-complete-no-display]
       A word at a time                      \\[icicle-prefix-word-complete]
     Complete and commit (if required match) \\&lt;minibuffer-local-must-match-map&gt;\
\\[icicle-apropos-complete-and-exit]\\&lt;minibuffer-local-completion-map&gt;
     Complete search string using past input \\[icicle-apropos-complete]

 * Display/navigate completions for current input (in `*Completions*').
     Show completion candidates
       Prefix completion                     \\[icicle-prefix-complete] (repeat)
       Apropos completion                    \\[icicle-apropos-complete]
     Move between minibuffer and list        \\&lt;completion-list-mode-map&gt;\
\\[icicle-insert-completion]
     Cycle among completion candidates       right, left, \
\\[icicle-move-to-next-completion], \\[icicle-move-to-previous-completion]
       Within a `*Completions*' column       down, up
     Choose a completion candidate           \\[choose-completion], \
\\[mouse-choose-completion]\\&lt;minibuffer-local-completion-map&gt;

 * Cycle among input candidates.
     Completion candidates
       Current mode                          down, up, mouse wheel
       Prefix completion                     end, home
       Apropos completion                    next, prior
     Minibuffer history items                \\[next-history-element], \
\\[previous-history-element]
     Completion history items                \\[icicle-retrieve-previous-input], \
\\[icicle-retrieve-next-input]

 * Show help on individual completion candidates.
     Current candidate                       C-M-RET, C-M-mouse-2
     Next, previous candidate                C-M-down, C-M-up,
                                              C-M- plus mouse wheel
                    prefix-match candidate   C-M-end, C-M-home
                    apropos-match candidate  C-M-next, C-M-prior

 * Choose a previous input from the minibuffer history.
     Complete to insert a previous input     \\[icicle-insert-history-element]
     Complete against history items          \\[icicle-history], \
\\[icicle-keep-only-past-inputs]
     Restrict candidates to history items    \\[icicle-keep-only-past-inputs]
     Change to another history               \\[icicle-other-history]
     List history items first in Completions \\[icicle-toggle-alternative-sorting]
     Cycle among minibuffer history items    \\[next-history-element], \
\\[previous-history-element]
     Search among minibuffer history items   \
\\[next-matching-history-element], \\[previous-matching-history-element]

 * Delete history entries
     Delete current entry (cycling)          \\[icicle-erase-minibuffer-or-history-element]
     Delete any or all entries               \\[icicle-clear-current-history]

 * Multi-commands: Act on completion candidates.
   For alternative action, use `C-S-' instead of `C-', but
   `C-|' and `M-|' are alternative action versions of `C-!' and `M-!'.
     Current candidate                       C-RET, C-mouse-2
     Next, previous candidate                C-down, C-up,
                                              C- plus mouse wheel
                    prefix-match candidate   C-end, C-home
                    apropos-match candidate  C-next, C-prior
     Act on each matching candidate, in turn C-!
     Act on the list of matching candidates  M-!
     Delete object named by candidate        S-delete
     Remove candidate from set of matches    delete, S-mouse-2
     Save candidate (add to those saved)     insert, M-S-mouse-2
     Object-action: apply a fn to candidate  M-RET

 * Search and replace (e.g. `C-c `').  See also `icicle-search'.
     Use action keys (prefix `C-') to navigate.
     Use alternative action keys (prefix `C-S-') to replace matches.
     Toggle input highlighting at all hits   \\[icicle-dispatch-C-^]
     Toggle whole-word searching             \\[icicle-dispatch-M-q]
     Toggle `.' matching newlines too        \\[icicle-toggle-dot]
     Toggle escaping of special regexp chars \\[icicle-toggle-regexp-quote]
     Toggle removal of search highlighting   \\[icicle-dispatch-C-.]

     Replace all                             M-|
     Redefine the replacement string         \\[icicle-dispatch-M-comma]
     Toggle literal replacement              \\[icicle-toggle-literal-replacement]
     Toggle replacement of whole search hit  \\[icicle-dispatch-M-_]
     Toggle replacement of common match      \\[icicle-toggle-search-replace-common-match]

 * Perform set operations on candidate sets.
     Remove candidate from current set       delete, S-mouse-2
     Add current candidate to saved set      insert, M-S-mouse-2
     Retrieve saved candidates from...
       `icicle-saved-completion-candidates'  \\[icicle-candidate-set-retrieve]
       another variable                      \\[icicle-candidate-set-retrieve-from-variable]
       a cache file                          \\[icicle-candidate-set-retrieve-persistent]
     Retrieve more saved candidates          \\[icicle-candidate-set-retrieve-more]
     Save candidates in current set to...
       `icicle-saved-completion-candidates'  \\[icicle-candidate-set-save]
       another variable                      \\[icicle-candidate-set-save-to-variable]
       a cache file                          \\[icicle-candidate-set-save-persistently]
     Save more candidates to current set     \\[icicle-candidate-set-save-more]
     Save, save more selected candidates     \\[icicle-candidate-set-save-selected], \
\\[icicle-candidate-set-save-more-selected]  with region
     Clear all saved candidates              \\[icicle-candidate-set-save-selected] \
with empty region
     Add new or update existing saved set
       \\[icicle-add/update-saved-completion-set]
     Remove a saved completion set
       \\[icicle-remove-saved-completion-set]
     Swap current and saved sets             \\[icicle-candidate-set-swap]
     Define current set by evaluating sexp   \\[icicle-candidate-set-define]
     Restrict candidates to history items    \\[icicle-keep-only-past-inputs]
     Set complement                          \\[icicle-candidate-set-complement]
     Set difference                          \\[icicle-candidate-set-difference]
     Set union                               \\[icicle-candidate-set-union]
     Set intersection                        \\[icicle-candidate-set-intersection]
     Set intersection using regexp           \\[icicle-narrow-candidates]
     Set intersection using predicate        \\[icicle-narrow-candidates-with-predicate]
       Save current predicate to a variable  \\[icicle-save-predicate-to-variable]
       Insert string variable as input       \\[icicle-insert-string-from-variable]

 * Adjust Icicles options incrementally on the fly (uses Do Re Mi).
     `icicle-candidate-width-factor'        \\[icicle-doremi-candidate-width-factor+]
     `icicle-max-candidates'                \\[icicle-doremi-increment-max-candidates+]
     `icicle-swank-timeout'                 C-x 1
     `icicle-swank-prefix-length'           C-x 2
     `icicle-inter-candidates-min-spaces'   \\[icicle-doremi-inter-candidates-min-spaces+]
     Zoom `*Completions*' (not an option)   C-x -   (Emacs 23+)

Remember: You can always input any character (e.g. \\[icicle-prefix-complete]) that is bound
          to a command by preceding it with \\&lt;global-map&gt;\\[quoted-insert].

Though it has no direct connection with completion, you can use \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-pp-eval-expression-in-minibuffer]'
in the minibuffer at any time to evaluate an Emacs-Lisp expression.
This calls `icicle-pp-eval-expression-in-minibuffer', which displays
the result in the echo area or a popup buffer, *Pp Eval Output*.
It also provides some of the Emacs-Lisp key bindings during expression
editing.</span>"
             icicle-highlight-historical-candidates-flag
             icicle-highlight-saved-candidates-flag
             icicle-transform-function
             (icicle-current-sort-order nil)
             (icicle-current-sort-order 'ALTERNATIVE)
             (not case-fold-search)
             (string= icicle-dot-string icicle-anychar-regexp)
             icicle-regexp-quote-flag
             icicle-incremental-completion-flag
             icicle-expand-input-to-common-match-flag
             icicle-hide-common-match-in-Completions-flag
             (car (rassq icicle-apropos-complete-match-fn icicle-S-TAB-completion-methods-alist))
             (icicle-current-TAB-method)
             icicle-add-proxy-candidates-flag
             (and completion-ignored-extensions t)
             icicle-image-files-in-Completions
             icicle-test-for-remote-files-flag
             icicle-ignore-space-prefix-flag
             icicle-use-C-for-actions-flag
             icicle-use-~-for-home-dir-flag
             icicle-search-highlight-all-current-flag
             icicle-search-whole-word-flag
             icicle-search-cleanup-flag                
             icicle-search-replace-whole-candidate-flag
             icicle-search-replace-common-match-flag)
     icicle-general-help-string
     "<span class="quote"> 

These are all of the minibuffer bindings during completion:

\\{minibuffer-local-completion-map}</span>"))))

(defun icicle-help-string-non-completion ()
  "<span class="quote">Description of Icicles minibuffer bindings when not completing input.</span>"
  (icicle-S-iso-lefttab-to-S-TAB
   (substitute-command-keys
    (concat "<span class="quote">\\&lt;minibuffer-local-completion-map&gt;\
              Icicles Minibuffer Input when Not Completing
              --------------------------------------------

These are the main Icicles minibuffer key bindings when completion is
not available:

 * Show this help.                           \\[icicle-minibuffer-help]

 * Abandon your input.                       \\[icicle-abort-recursive-edit]

 * Commit your input to Emacs.               RET

 * Modify your input.
     Edit your input                         (just edit in minibuffer)
     Erase your input (clear minibuffer)     \\[icicle-erase-minibuffer-or-history-element]
     Yank text at cursor into minibuffer     \\[icicle-insert-string-at-point]
     Insert text (string) from a variable    \\[icicle-insert-string-from-variable]
     Insert previously entered input         \\[icicle-insert-history-element]

 * Choose a previous input from the minibuffer history.
     Complete to insert a previous input     \\[icicle-insert-history-element]
     Cycle among minibuffer history items    \\[next-history-element], \
\\[previous-history-element]
     Search among minibuffer history items   \
\\[next-matching-history-element], \\[previous-matching-history-element]

 * Delete history entries
     Delete current entry (cycling)          \\[icicle-erase-minibuffer-or-history-element]
     Delete any or all entries               \\[icicle-clear-current-history]

 * Evaluate an Emacs-Lisp sexp on the fly    \\[icicle-pp-eval-expression-in-minibuffer]

Remember: You can always input any character that is bound to a
          command by preceding it with \\&lt;global-map&gt;\\[quoted-insert].</span>"
            icicle-general-help-string

            "<span class="quote"> 
These are the minibuffer bindings when not completing input:

\\{minibuffer-local-map}</span>"))))

(when (and (&gt; emacs-major-version 21)
           (require 'help-mode nil t) (get 'help-xref 'button-category-symbol)) <span class="linecomment">; In `button.el'</span>
  (define-button-type 'icicle-help-button
      :supertype 'help-xref
      'help-function #'(lambda () (browse-url "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>"))
      'help-echo
      (purecopy "<span class="quote">mouse-2, RET: Icicles documentation on the Emacs Wiki (requires Internet access)</span>"))
  (define-button-type 'icicle-commentary1-button
      :supertype 'help-xref
      'help-function #'(lambda ()
                         (finder-commentary "<span class="quote">icicles-doc1</span>")
                         (when (require 'linkd nil t) (linkd-mode 1))
                         (when (require 'fit-frame nil t) (fit-frame)))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Icicles documentation, Part 1 (no Internet needed)</span>"))
  (define-button-type 'icicle-commentary2-button
      :supertype 'help-xref
      'help-function #'(lambda ()
                         (finder-commentary "<span class="quote">icicles-doc2</span>")
                         (when (require 'linkd nil t) (linkd-mode 1))
                         (when (require 'fit-frame nil t) (fit-frame)))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Icicles documentation, Part 2 (no Internet needed)</span>"))
  (define-button-type 'icicle-customize-button
      :supertype 'help-xref
      'help-function #'(lambda () (customize-group-other-window 'Icicles))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Customize/Browse Icicles Options & Faces</span>")))


<span class="linecomment">;; This is just the macro expansion of the following:</span>
<span class="linecomment">;; `(def-completion-wrapper icicle-abort-recursive-edit :minibuffer-separator)'.</span>
<span class="linecomment">;; Taken from the definition of `def-completion-wrapper' in `completion.el'.</span>
(put 'icicle-abort-recursive-edit 'completion-function 'use-completion-minibuffer-separator)
<span class="linecomment">;;;###autoload</span>
(defun icicle-abort-recursive-edit ()   <span class="linecomment">; Bound to `C-]',`C-g' in minibuf, `C-g',`q' in `*Completions*'.</span>
  "<span class="quote">Abort command that requested this recursive edit or minibuffer input.
This calls `abort-recursive-edit' after killing the `*Completions*'
buffer or (if called from the minibuffer) removing its window.

By default, Icicle mode remaps all key sequences that are normally
bound to `abort-recursive-edit' to `icicle-abort-recursive-edit'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive)
  (if (not (active-minibuffer-window))
      (when (get-buffer "<span class="quote">*Completions*</span>") (kill-buffer (get-buffer "<span class="quote">*Completions*</span>")))
    (icicle-remove-Completions-window 'FORCE))
  (abort-recursive-edit))

(defun icicle-ensure-overriding-map-is-bound ()
  "<span class="quote">Set `overriding-terminal-local-map' to `icicle-universal-argument-map'.</span>"
  (if (not (boundp 'overriding-map-is-bound)) <span class="linecomment">; Emacs 20, 21.</span>
      (setq overriding-terminal-local-map  icicle-universal-argument-map)
    (unless overriding-map-is-bound     <span class="linecomment">; Emacs 22+.</span>
      (setq saved-overriding-map           overriding-terminal-local-map
            overriding-terminal-local-map  icicle-universal-argument-map
            overriding-map-is-bound        t))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-digit-argument (arg) <span class="linecomment">; Bound to `C-&lt;0-9&gt;', `M-&lt;0-9&gt;', `C-M-&lt;0-9&gt;' in minibuffer.</span>
  "<span class="quote">`digit-argument', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((char   (if (integerp last-command-char)
                     last-command-char
                   (get last-command-char 'ascii-character)))
         (digit  (- (logand char ?\177) ?0)))
    (cond ((integerp arg)
           (setq prefix-arg  (+ (* arg 10) (if (&lt; arg 0) (- digit) digit))))
          ((eq arg '-)
           <span class="linecomment">;; Treat -0 as just -, so that -01 will work.</span>
           (setq prefix-arg  (if (zerop digit) '- (- digit))))
          (t
           (setq prefix-arg  digit))))
  (setq universal-argument-num-events  (length (this-command-keys)))
  (icicle-ensure-overriding-map-is-bound)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-negative-argument (arg) <span class="linecomment">; Bound to `M--', `C-M--' in minibuffer.</span>
  "<span class="quote">`negative-argument', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (cond ((integerp arg) (setq prefix-arg  (- arg)))
        ((eq arg '-) (setq prefix-arg  nil))
        (t (setq prefix-arg  '-)))
  (setq universal-argument-num-events  (length (this-command-keys)))
  (icicle-ensure-overriding-map-is-bound)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument ()    <span class="linecomment">; Bound to `C-u' in minibuffer.</span>
  "<span class="quote">`universal-argument', but also echo the prefix.</span>"
  (interactive)
  (setq prefix-arg                     (list 4)
        universal-argument-num-events  (length (this-command-keys)))
  (icicle-ensure-overriding-map-is-bound)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument-more (arg)
  "<span class="quote">`universal-argument-more', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (universal-argument-more arg)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument-other-key (arg)
  "<span class="quote">`universal-argument-other-key', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (universal-argument-other-key arg)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument-minus (arg)
  "<span class="quote">`universal-argument-minus', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (universal-argument-minus arg)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))


<span class="linecomment">;; REPLACE ORIGINAL `sit-for' in `subr.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Ensure that `sit-for' after `C-u' in the minibuffer is immediately interrupted by user input.</span>
<span class="linecomment">;; This fix is not needed for Emacs &lt; 23.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'old-sit-for)
  (defalias 'old-sit-for (symbol-function 'sit-for)))

(when (&gt; emacs-major-version 22)
  (defun icicle-sit-for (seconds &optional nodisp obsolete)
    "<span class="quote">Perform redisplay, then wait for SECONDS seconds or until input is available.
SECONDS may be a floating-point value.
\(On operating systems that do not support waiting for fractions of a
second, floating-point values are rounded down to the nearest integer.)

If optional arg NODISP is t, don't redisplay, just wait for input.
Redisplay does not happen if input is available before it starts.

Value is t if waited the full time with no input arriving, and nil otherwise.

An obsolete, but still supported form is
\(sit-for SECONDS &optional MILLISECONDS NODISP)
where the optional arg MILLISECONDS specifies an additional wait period,
in milliseconds; this was useful when Emacs was built without
floating point support.</span>"
    (if (numberp nodisp)
        (setq seconds  (+ seconds (* 1e-3 nodisp))
              nodisp   obsolete)
      (if obsolete (setq nodisp  obsolete)))
    (cond (noninteractive
           (sleep-for seconds)
           t)
          ((input-pending-p)
           nil)
          ((&lt;= seconds 0)
           (or nodisp (redisplay)))
          (t
           (or nodisp (redisplay))
           (let ((read (read-event nil nil seconds)))
             (or (null read)
                 (progn
                   <span class="linecomment">;; If last command was a prefix arg, e.g. C-u, push this event onto</span>
                   <span class="linecomment">;; `unread-command-events' as (t . EVENT) so it will be added to</span>
                   <span class="linecomment">;; `this-command-keys' by `read-key-sequence'.</span>
                   (if (memq overriding-terminal-local-map
                             (list universal-argument-map icicle-universal-argument-map))
                       (setq read (cons t read)))
                   (push read unread-command-events)
                   nil)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-retrieve-next-input (&optional arg) <span class="linecomment">; Bound to `C-S-l' (`C-L') in minibuffer.</span>
  "<span class="quote">Retrieve next minibuffer input.
Like `icicle-retrieve-previous-input', but traverses history toward
the present.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-retrieve-next-input]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-retrieve-previous-input arg 'interactive-p)) <span class="linecomment">; Must be `interactive-p'.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-retrieve-previous-input (&optional arg reversep allow-empty-p) <span class="linecomment">; `C-l' in minibuffer.</span>
  "<span class="quote">Retrieve previous minibuffer input.
The possible inputs were not necessarily those entered with `RET'.
With a negative prefix arg, this just empties the completion history.
Otherwise:
 Use completion if `icicle-C-l-uses-completion-flag' is non-nil and no
   prefix arg is used, or if it is nil and a prefix arg is used, or if
   `icicle-retrieve-previous-input' is not used interactively.
 Otherwise, just cycle to the previous input.

Non-interactively:
 Non-nil argument REVERSEP means reverse the history order: return the
  next, not the previous, input.
 Non-nil ALLOW-EMPTY-P means the retrieved input can be \"\".

You can use this command only from buffer *Completions or from the
minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-retrieve-previous-input]').</span>"
  (interactive "<span class="quote">P</span>")
  (let ((interactive-p       (or (interactive-p) (eq reversep 'interactive-p)))
        (prev-inputs-var     (if (icicle-file-name-input-p)
                                 'icicle-previous-raw-file-name-inputs
                               'icicle-previous-raw-non-file-name-inputs))
        <span class="linecomment">;; `irpi-was-cycling-p' is used to remember, for the second `C-l' in a row, that the first</span>
        <span class="linecomment">;; `C-l' came after cycling.  In that case, the second `C-l' restores the current raw input.</span>
        (irpi-was-cycling-p  icicle-cycling-p))
    (when interactive-p (icicle-barf-if-outside-Completions-and-minibuffer))
    (cond ((wholenump (prefix-numeric-value arg))
           (let ((input  "<span class="quote"></span>"))
             (save-selected-window
               (select-window (minibuffer-window))
               (icicle-clear-minibuffer)
               (let ((prev-inputs
                      (if allow-empty-p
                          (symbol-value prev-inputs-var)
                        (icicle-remove-if (lambda (x) (string= "<span class="quote"></span>" x)) <span class="linecomment">; Exclude "".</span>
                                          (symbol-value prev-inputs-var)))))
                 (setq input
                       (if (and interactive-p (or (and icicle-C-l-uses-completion-flag (not arg))
                                                  (and (not icicle-C-l-uses-completion-flag) arg)))
                           (let ((icicle-whole-candidate-as-text-prop-p   nil)
                                 (enable-recursive-minibuffers            t)
                                 (icicle-show-Completions-initially-flag  t))
                             (prog1 (completing-read
                                     "<span class="quote">Retrieve input: </span>" (mapcar #'list prev-inputs) nil t)
                               (setq icicle-last-input  nil)))
                         (if (or (not interactive-p)
                                 (not (memq last-command '(icicle-retrieve-next-input
                                                           icicle-retrieve-previous-input))))
                             <span class="linecomment">;; We use this one, to exclude common-match expansions from completion</span>
                             <span class="linecomment">;; history, and to save the typed input only when you complete.</span>
                             (let ((try  (if icicle-cycling-p
                                             icicle-last-input
                                           icicle-current-raw-input)))
                               (if (or allow-empty-p (not (equal "<span class="quote"></span>" try))) try (car prev-inputs)))

                           <span class="linecomment">;; You can use this one instead, if you want to include common-match</span>
                           <span class="linecomment">;; expansions and save the typed input even when you don't complete.</span>
                           <span class="linecomment">;; (or icicle-last-input icicle-current-raw-input)</span>
                           
                           (let ((next  (member icicle-current-raw-input prev-inputs)))
                             (unless next (setq next  prev-inputs))
                             (if reversep
                                 (or (let ((res     ())
                                           (inputs  prev-inputs))
                                       (while (and (consp inputs) (not (eq inputs next)))
                                         (push (pop inputs) res))
                                       (car res))
                                     (car (last prev-inputs)))
                               <span class="linecomment">;; If we were cycling before the first `C-l', then need to pick up the</span>
                               <span class="linecomment">;; current raw input.  Otherwise, we need to pick up the previous one.</span>
                               (prog1 (if irpi-was-cycling-p (car next) (cadr next))
                                 (setq irpi-was-cycling-p  nil))))))) <span class="linecomment">; So third `C-l' acts normally.</span>
                 (when input
                   (setq icicle-current-raw-input  input)
                   (insert input)
                   (icicle-highlight-initial-whitespace input) <span class="linecomment">; (e.g. user typo).</span>
                   (icicle-place-cursor input 'deactivate-mark))))
             (let ((icicle-edit-update-p  t))
               (funcall (or icicle-last-completion-command 'icicle-apropos-complete))
               <span class="linecomment">;; Restore raw input.  Cycling resets it to "", so `icicle-save-or-restore-input'</span>
               <span class="linecomment">;; doesn't use out-of-date raw input (cycling does not necessarily follow completion</span>
               <span class="linecomment">;; or completion of the same kind).</span>
               (setq icicle-current-raw-input  input))
             (setq icicle-last-input  nil <span class="linecomment">; So `TAB' will expand it - `icicle-save-or-restore-input'.</span>
                   icicle-cycling-p   irpi-was-cycling-p))) <span class="linecomment">; Let next `C-l' know the state.</span>
          (t
           (set prev-inputs-var nil)
           (setq icicle-current-raw-input  "<span class="quote"></span>")
           (icicle-msg-maybe-in-minibuffer "<span class="quote">Cleared completion history</span>")))))

<span class="linecomment">;; $$ No longer bound.  Now we bind `icicle-retrieve-previous-input', instead, to `C-l'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-retrieve-last-input ()
  "<span class="quote">Put the last real input into the minibuffer.
Use this to replace a completion candidate inserted during cycling.
If `icicle-expand-input-to-common-match-flag' is non-nil or this is
prefix completion, then using this once restores the expanded common
match string, and using it twice in succession restores your original
input.

You can use this command only from buffer *Completions or from the
minibuffer.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (save-selected-window
    (select-window (minibuffer-window))
    (icicle-clear-minibuffer)
    (if (and (or icicle-expand-input-to-common-match-flag (eq icicle-current-completion-mode 'prefix))
             (eq last-command 'icicle-retrieve-last-input))
        (insert icicle-current-raw-input)
      (insert icicle-current-input))
    <span class="linecomment">;;$$$ (when (interactive-p) (setq icicle-last-completion-command  nil))</span>
    (let ((input  (if (and (or icicle-expand-input-to-common-match-flag
                               (eq icicle-current-completion-mode 'prefix))
                           (eq last-command this-command))
                      icicle-current-raw-input
                    icicle-current-input)))
      (icicle-highlight-initial-whitespace input) <span class="linecomment">; Highlight initial whitespace (e.g. user typo).</span>
      (icicle-place-cursor input 'deactivate-mark))))

<span class="linecomment">;; $$ No longer used.  It was originally used in `icicle-retrieve-last-input'.</span>
(defun icicle-insert-input (input)
  "<span class="quote">Insert INPUT.  Prepend the directory if appropriate.</span>"
  (insert (if (and (icicle-file-name-input-p) insert-default-directory
                   (or (not (member input icicle-extra-candidates))
                       icicle-extra-candidates-dir-insert-p))
              (icicle-expand-file-or-dir-name input (icicle-file-name-directory input))
            input)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-history-element () <span class="linecomment">; Bound to `M-o' in minibuffer.</span>
  "<span class="quote">Use completion to insert a previously entered input in the minibuffer.
Always available for any minibuffer input, not just during completion.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (and (boundp minibuffer-history-variable) (consp (symbol-value minibuffer-history-variable)))
    (let ((enable-recursive-minibuffers  t))
      (insert (icicle-completing-read-history "<span class="quote">Choose input: </span>" minibuffer-history-variable))))
  (when (and icicle-mode (memq icicle-default-value '(preselect-start preselect-end)))
    (icicle-select-minibuffer-contents)
    (setq deactivate-mark  nil)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-string-at-point (&optional arg) <span class="linecomment">; Bound to `M-.' in minibuffer.</span>
  "<span class="quote">Insert text at the cursor into the minibuffer.
Each time this command is called, some text at or near the cursor is
inserted into the minibuffer.  One of two things happens, depending on
the value of option `icicle-default-thing-insertion' and whether or
not you use `C-u'.

See the doc for option `icicle-thing-at-point-functions' for a
complete description of its behavior.  What follows is an overview.

`icicle-thing-at-point-functions' is a cons of two parts - call them
ALTERNATIVES and FORWARD-THING.

If ALTERNATIVES is not nil and one of the following is true:
 - FORWARD-THING is nil
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have not used plain `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have used plain `C-u' in this series of `M-.'
then the next function in ALTERNATIVES is used to retrieve the text to
be inserted.

If FORWARD-THING is not nil and one of the following is true:
 - ALTERNATIVES is nil
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have not used `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have used `C-u' in this series of `M-.'
then function FORWARD-THING is used to retrieve the text to be
inserted.

If you use a numeric prefix arg (not just plain `C-u'), the behavior
is as follows.

* If a function in ALTERNATIVES is used (see above), then the text
  that is grabbed at or near point is read as a Lisp sexp and
  evaluated, and the value is inserted instead of the grabbed text.

  Yes, this means you need to know when the particular ALTERNATIVES
  function that you want is coming up next, and use, say, `C-9' just
  before hitting `M-.' for that alternative.  So if, e.g., you want to
  evaluate the active region and insert the value, then you use
  `M-. C-9 M-.', since it is the second `M-.' that grabs the region.

* If the FORWARD-THING is being used, then the prefix arg determines
  the number of things to grab, and the direction of grabbing.: A
  negative argument grabs text to the left of the cursor; a positive
  argument grabs text to the right.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-at-point]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (consp icicle-thing-at-point-functions) <span class="linecomment">; Option should always be a cons cell.</span>
    (unless (eq last-command this-command) (setq icicle-default-thing-insertion-flipped-p  nil))
    (let ((alt-fns       (car icicle-thing-at-point-functions))
          (fwd-thing-fn  (cdr icicle-thing-at-point-functions))
          (flipped       (or icicle-default-thing-insertion-flipped-p <span class="linecomment">; Already flipped.</span>
                             (setq icicle-default-thing-insertion-flipped-p  (consp arg)))))
      (cond
        <span class="linecomment">;; Use alternative text-grabbing functions successively.</span>
        ((and alt-fns (or (if (eq 'alternatives icicle-default-thing-insertion)
                              (not flipped) <span class="linecomment">; Normal behavior for `alternatives'.</span>
                            flipped)    <span class="linecomment">; Flipped behavior for `more-of-the-same'.</span>
                          (not fwd-thing-fn))) <span class="linecomment">; No alternative.</span>
         (setq icicle-successive-grab-count  1 <span class="linecomment">; In this mode, reset other mode's accumulator.</span>
               icicle-thing-at-pt-fns-pointer
               (if (eq last-command this-command) <span class="linecomment">; If repeated, get next text-grabbing function.</span>
                   (mod (1+ icicle-thing-at-pt-fns-pointer) (length alt-fns))
                 0))
         (let ((thing   "<span class="quote"></span>")
               (alt-fn  (nth icicle-thing-at-pt-fns-pointer alt-fns)))
           (save-excursion (with-current-buffer icicle-pre-minibuffer-buffer
                             (setq thing  (funcall alt-fn))))
           (setq thing  (or thing "<span class="quote">nil</span>"))
           (when (and arg (atom arg))   <span class="linecomment">; Numeric prefix arg.</span>
             (setq thing  (condition-case err
                              (format "<span class="quote">%s</span>" (eval (car (read-from-string thing))))
                            (error thing))))
           (icicle-insert-thing thing)
           (icicle-msg-maybe-in-minibuffer (format "<span class="quote">`%s'</span>" alt-fn))))

        <span class="linecomment">;; Use same text-grabbing function successively.</span>
        ((and fwd-thing-fn (or (if (eq 'alternatives icicle-default-thing-insertion)
                                   flipped <span class="linecomment">; Flipped behavior for `alternatives'.</span>
                                 (not flipped)) <span class="linecomment">; Normal behavior for `more-of-the-same'.</span>
                               (not alt-fns))) <span class="linecomment">; No alternative.</span>
         (if (and arg (atom arg))

             <span class="linecomment">;; Explicit numeric arg.  If it doesn't change direction, then increment</span>
             <span class="linecomment">;; existing count.  Otherwise, set count absolutely.</span>
             (if (eq last-command this-command)
                 (if (= (icicle-signum icicle-successive-grab-count) <span class="linecomment">; Repeated `M-.'.</span>
                        (icicle-signum (prefix-numeric-value arg)))
                     (setq icicle-successive-grab-count <span class="linecomment">; Same direction - increment count.</span>
                           (* (icicle-signum icicle-successive-grab-count)
                              (+ (abs icicle-successive-grab-count)
                                 (abs (prefix-numeric-value arg)))))
                   (setq icicle-successive-grab-count  (prefix-numeric-value arg))) <span class="linecomment">; New dir - set.</span>
               (setq icicle-successive-grab-count  (prefix-numeric-value arg))) <span class="linecomment">; First `M-.' - set.</span>

           <span class="linecomment">;; No explicit numeric arg.</span>
           <span class="linecomment">;; If first `M-.' or plain `C-u', set count. Otherwise, increment count.</span>
           (if (eq last-command this-command)
               (setq icicle-successive-grab-count <span class="linecomment">; Repeated `M-.'.</span>
                     (if (consp arg)
                         <span class="linecomment">;; We're here from plain `C-u' with `alternatives' - use 1, not 4.</span>
                         (if (wholenump icicle-successive-grab-count) 1 -1)
                       (if (wholenump icicle-successive-grab-count) <span class="linecomment">; Increment count.</span>
                           (+ icicle-successive-grab-count (abs (prefix-numeric-value arg)))
                         (- icicle-successive-grab-count (abs (prefix-numeric-value arg))))))
             (setq icicle-successive-grab-count  1))) <span class="linecomment">; First `M-.' - reset count.</span>
         (let ((things  "<span class="quote"></span>"))
           (save-excursion
             (with-current-buffer (cadr (buffer-list))
               (setq things  (buffer-substring-no-properties
                              (point)
                              (save-excursion (funcall fwd-thing-fn icicle-successive-grab-count)
                                              (point))))))
           (icicle-insert-thing things)))))))

(defun icicle-signum (num)
  "<span class="quote">Return 1 if NUM is positive, -1 if negative, 0 if zero.</span>"
  (cond ((&lt; num 0) -1) ((&gt; num 0) 1) (t 0)))

(defun icicle-insert-thing (text &optional no-replace-p)
  "<span class="quote">Insert TEXT in the minibuffer.
TEXT replaces the last text that was inserted, if this command repeats
the last and NO-REPLACE-P is nil.</span>"
  (when (and (stringp text) (not (string= "<span class="quote"></span>" text)))
    (remove-text-properties 0 (length text) '(face nil) text)
    (when (and (eq last-command this-command) (not no-replace-p)
               icicle-insert-string-at-pt-start) <span class="linecomment">; Ensure that we've defined the ends.</span>
      (delete-region icicle-insert-string-at-pt-start icicle-insert-string-at-pt-end))
    (setq icicle-insert-string-at-pt-start  (point))
    (insert text)
    (setq icicle-insert-string-at-pt-end  (point))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-string-from-variable (askp) <span class="linecomment">; Bound to `C-=' in minibuffer.</span>
  "<span class="quote">Insert text into the minibuffer from a variable.
By default, the variable is user option `icicle-input-string'.
To insert from a different variable, use a prefix argument; you are
then prompted for the variable to use.  You can use command
`icicle-save-string-to-variable' to save a string to a variable.
Typically, you store a regexp or part of a regexp in the variable.
This command is bound in the minibuffer to `C-=', by default.
This is especially useful when used with command `icicle-search'.

Some regexps that you might want to assign to variables:

 \"[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\"          ; Email address
 \"\\\\([0-9]+\\\.[0-9]+\\\.[0-9]+\\\.[0-9]+\\\\)\"     ; IP address
 \"[0-9]\\\\\\\={4\\\\}-[0-9]\\\\\\\={2\\\\}-[0-9]\\\\\\\={2\\\\}\"   ; Date: 2006-04-14, Time:
 \"^[ \\\=\\t]*[0-9]?[0-9]\\\\([:.]?[0-9][0-9]\\\\)?\\\\(am\\\\|pm\\\\|AM\\\\|PM\\\\)?\"
 \"`\\\\(\\\\sw\\\\sw+\\\\)'\"                        ; Words inside `_'
 \"\\\\*.*\\\\*\"                                 ; Special buffer name: *_*

Standard Emacs Lisp libraries are full of regexps that you can assign
to variables for use with `C-='.
 See `align.el' for regexps for programming languages.
 See `url-dav.el' for regexps matching iso8601 dates.
 See `rmail.el', `sendmail.el', and `mh-show.el' for regexps matching
 mail-header fields.

Imenu regexps occurring as parts of different values of
`imenu-generic-expression' for different buffer types can be used as
variable values for `C-='.  They all work fine with `icicle-search',
turning it into a browser or navigator for the given mode.

See, for example, `generic-x.el' and `lisp-mode.el'.  Here is a regexp
for Javascript function definitions from `generic-x.el':

 \"^function\\\\s-+\\\\([A-Za-z0-9_]+\\\\)\"

And `lisp-imenu-generic-expression' (in `lisp-mode.el') provides
regexps for Lisp function, variable, and type definitions.  Here is
the variable-definition regexp:

 \"^\\\\s-*(\\\\(def\\\\(c\\\\(onst\\\\(ant\\\\)?\\\\|ustom\\\\)\\\\|ine-symbol-macro\\\\|
 parameter\\\\|var\\\\)\\\\)\\\\s-+\\\\(\\\\(\\\\sw\\\\|\\\\s_\\\\)+\\\\)\"

Command `icicle-imenu' exploits this to automatically let you browse
definitions.  It is a specialization of `icicle-search' for Imenu.

For more useful regexps, grep for `font-lock-keywords' in Emacs `lisp'
directory and subdirs.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (save-selected-window
    (select-window (minibuffer-window))
    (if askp
        (let* ((icicle-whole-candidate-as-text-prop-p   nil)
               <span class="linecomment">;; If we didn't use this here we'd at least have to bind it to</span>
               <span class="linecomment">;; `orig-must-pass-after-match-predicate', because of `icicle-execute-extended-command'.</span>
               (icicle-must-pass-after-match-predicate  #'(lambda (s) (boundp (intern s))))
               (enable-recursive-minibuffers            t)
               (var
                (intern
                 (completing-read
                  "<span class="quote">Insert text from variable: </span>"
                  (mapcar  #'list
                           (mapcar 'symbol-name
                                   '(adaptive-fill-first-line-regexp adaptive-fill-regexp
                                     add-log-current-defun-header-regexp
                                     ange-ftp-gateway-prompt-pattern allout-bullets-string
                                     allout-line-boundary-regexp allout-regexp
                                     comment-start-skip comment-end comint-prompt-regexp
                                     ffap-url-regexp find-face-regexp find-function-regexp
                                     find-variable-regexp imenu-example--function-name-regexp-c
                                     org-plain-time-of-day-regexp outline-heading-end-regexp
                                     outline-line-boundary-regexp outline-plain-bullets-string
                                     outline-regexp page-delimiter paragraph-separate paragraph-start
                                     rmail-mime-charset-pattern sentence-end shell-prompt-pattern
                                     telnet-prompt-pattern temp-file-name-pattern
                                     thing-at-point-url-regexp)))
                  nil  nil nil (if (boundp 'variable-name-history)
                                   'variable-name-history
                                 'icicle-variable-name-history))))
               <span class="linecomment">;; Make sure we use the buffer-local value of the variable, if there is one.</span>
               (text
                (with-current-buffer (cadr (buffer-list)) (symbol-value var))))
          (icicle-insert-thing text 'no-replace))
      (icicle-insert-thing icicle-input-string 'no-replace))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-list-join-string () <span class="linecomment">; Bound to `C-M-j' in minibuffer during completion.</span>
  "<span class="quote">Insert `icicle-list-join-string' in the minibuffer.
Then, if `1on1-fit-minibuffer-frame-flag' is defined and non-nil, fit
a standalone minibuffer frame to the new minibuffer contents.
You need library `fit-frame.el' for the frame-fitting part.</span>"
  (interactive)
  (icicle-insert-thing icicle-list-join-string 'no-replace)
  (let ((len  (length icicle-list-join-string)))
    (when (and (string= "<span class="quote">\C-j</span>" (substring icicle-list-join-string (1- len) len))
               (boundp '1on1-fit-minibuffer-frame-flag) <span class="linecomment">; In `oneonone.el'.</span>
               1on1-fit-minibuffer-frame-flag
               (require 'fit-frame nil t))
      (1on1-fit-minibuffer-frame))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-M-q (&optional arg) <span class="linecomment">; Bound to `M-q' in minibuffer.</span>
  "<span class="quote">Do the right thing for `M-q'.
If searching, call `icicle-toggle-search-whole-word'.
Otherwise, call `icicle-insert-key-description'.
Bound to `M-q' in the minibuffer.</span>"
  (interactive "<span class="quote">P</span>") <span class="linecomment">; Argument is ignored for `icicle-toggle-search-whole-word'.</span>
  (cond (icicle-searching-p (icicle-toggle-search-whole-word))
        (t (icicle-insert-key-description arg))))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-search-whole-word 'icicle-toggle-search-whole-word)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-whole-word () <span class="linecomment">; Bound to `M-q' in minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-search-whole-word-flag'.
The new value takes effect for the next Icicles search command.
Bound to `M-q' in the minibuffer when searching.</span>"
  (interactive)
  (setq icicle-search-whole-word-flag  (not icicle-search-whole-word-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-whole-word-flag
                                      "<span class="quote">Whole-word searching is now ON, starting with next search</span>"
                                    "<span class="quote">Whole-word searching is now OFF, starting with next search</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-key-description (toggle-angle-brackets-p) <span class="linecomment">; Bound to `M-q' in minibuffer.</span>
  "<span class="quote">Read key and insert its description.
For example, if the key read is ^F, then \"C-f\" is inserted.

`icicle-key-descriptions-use-&lt;&gt;-flag' determines whether angle
brackets (`&lt;', `&gt;') are used for named keys, such as function
keys, but a prefix argument reverses the meaning of
`icicle-key-descriptions-use-&lt;&gt;-flag'.

Bound to `M-q' in the minibuffer during key completion.</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((enable-recursive-minibuffers  t)
         (key
          (progn (minibuffer-message "<span class="quote"> [Quoting key]</span>") (read-event))))
    (insert (single-key-description key (if toggle-angle-brackets-p
                                            icicle-key-descriptions-use-&lt;&gt;-flag
                                          (not icicle-key-descriptions-use-&lt;&gt;-flag))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-pp-eval-expression-in-minibuffer (insert-value) <span class="linecomment">; Bound to `M-:' in minibuffer.</span>
  "<span class="quote">Evaluate an Emacs-Lisp expression and pretty-print its value.
This just calls `pp-eval-expression' from a recursive minibuffer.</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (let ((enable-recursive-minibuffers  t))
    (call-interactively 'icicle-pp-eval-expression))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-newline-in-minibuffer (arg) <span class="linecomment">; Bound to `C-j' in minibuffer.</span>
  "<span class="quote">Insert a newline character (`C-j'), in the minibuffer.
Then, if `1on1-fit-minibuffer-frame-flag' is defined and non-nil, fit
a standalone minibuffer frame to the new minibuffer contents.
You need library `fit-frame.el' for the frame-fitting part.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-self-insert arg)
  (when (and (boundp '1on1-fit-minibuffer-frame-flag) <span class="linecomment">; In `oneonone.el'.</span>
             1on1-fit-minibuffer-frame-flag
             (require 'fit-frame nil t))
    (1on1-fit-minibuffer-frame)))

<span class="linecomment">;; Bound in minibuffer to keys in `icicle-modal-cycle-down-keys' (`down', `wheel-down').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-candidate-per-mode (&optional nth)
  "<span class="quote">Replace input by NTH next completion candidate.
Default value of NTH is 1, meaning use the next candidate.
Negative NTH means use a previous, not subsequent, candidate.

Uses the next prefix or apropos completion command, depending on
`icicle-current-completion-mode'.  If that is nil and
`icicle-default-cycling-mode' is non-nil, uses the next history
element instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-candidate-per-mode]').</span>"
  (interactive)
  (unless nth (setq nth  1))
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (case icicle-current-completion-mode
    (prefix
     (setq this-command
           (if (wholenump nth) 'icicle-next-prefix-candidate 'icicle-previous-prefix-candidate))
     (icicle-next-prefix-candidate nth))
    (apropos
     (setq this-command
           (if (wholenump nth) 'icicle-next-apropos-candidate 'icicle-previous-apropos-candidate))
     (icicle-next-apropos-candidate nth))
    ((nil)
     (when icicle-default-cycling-mode (next-history-element (or nth 1))))))

<span class="linecomment">;; Bound in minibuffer to keys in `icicle-modal-cycle-up-keys' (`up', `wheel-up').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-candidate-per-mode (&optional nth)
  "<span class="quote">Replace input by NTH previous completion candidate.
Default value of NTH is 1, meaning use the previous candidate.
Negative NTH means use a subsequent, not previous, candidate.

Uses the previous prefix or apropos completion command, depending on
`icicle-current-completion-mode'. If that is nil and
`icicle-default-cycling-mode' is non-nil, uses the previous history
element instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-candidate-per-mode]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-next-candidate-per-mode (- (or nth 1))))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-previous-keys' (`home').</span>
(put 'icicle-previous-prefix-candidate 'icicle-cycling-command         'backward)
(put 'icicle-previous-prefix-candidate 'icicle-prefix-cycling-command  'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate (&optional nth)
  "<span class="quote">Replace input by NTH previous prefix completion for an input.
Default value of NTH is 1, meaning use the previous prefix completion.
Negative NTH means use a subsequent, not previous, prefix completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq nth  (or nth 1))
  (icicle-next-prefix-candidate (- nth)))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-next-cycle-previous-keys' (`end').</span>
(put 'icicle-next-prefix-candidate 'icicle-cycling-command         'forward)
(put 'icicle-next-prefix-candidate 'icicle-prefix-cycling-command  'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate (&optional nth)
  "<span class="quote">Replace input by NTH next prefix completion for an input.
Default value of NTH is 1, meaning use the next prefix completion.
Negative NTH means use a previous, not subsequent, prefix completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-completion-mode         'prefix
        icicle-next-apropos-complete-cycles-p  nil)
  (icicle-next-candidate nth (if (icicle-file-name-input-p)
                                 'icicle-file-name-prefix-candidates
                               'icicle-prefix-candidates)))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-previous-keys' (`prior').</span>
(put 'icicle-previous-apropos-candidate 'icicle-cycling-command         'backward)
(put 'icicle-previous-apropos-candidate 'icicle-apropos-cycling-command 'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate (&optional nth)
  "<span class="quote">Replace input by NTH previous apropos completion for an input.
Default value of NTH is 1, meaning use the previous apropos completion.
Negative NTH means use a subsequent, not previous, apropos completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq nth  (or nth 1))
  (icicle-next-apropos-candidate (- nth)))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-next-keys' (`next').</span>
(put 'icicle-next-apropos-candidate 'icicle-cycling-command         'forward)
(put 'icicle-next-apropos-candidate 'icicle-apropos-cycling-command 'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate (&optional nth)
  "<span class="quote">Replace input by NTH next apropos completion for an input.
Default value of NTH is 1, meaning use the next apropos completion.
Negative NTH means use a previous, not subsequent, apropos completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-completion-mode        'apropos
        icicle-next-prefix-complete-cycles-p  nil)
  (icicle-next-candidate nth (if (icicle-file-name-input-p)
                                 'icicle-file-name-apropos-candidates
                               'icicle-apropos-candidates)
                         'regexp-p))

<span class="linecomment">;; Bound  in minibuffer to keys in `icicle-modal-cycle-up-action-keys' (`C-up').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-candidate-per-mode-action (&optional nth)
  "<span class="quote">`icicle-previous-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-candidate-per-mode-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-candidate-per-mode #'icicle-candidate-action nth))

<span class="linecomment">;; Bound  in minibuffer to keys in `icicle-modal-cycle-up-alt-action-keys' (`C-S-up').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-candidate-per-mode-alt-action (&optional nth)
  "<span class="quote">`icicle-previous-candidate-per-mode' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-candidate-per-mode-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-candidate-per-mode #'icicle-candidate-alt-action nth))

<span class="linecomment">;; Bound in minibuffer to keys in `icicle-modal-cycle-down-action-keys' (`C-down').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-candidate-per-mode-action (&optional nth)
  "<span class="quote">`icicle-next-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-candidate-per-mode-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-candidate-per-mode #'icicle-candidate-action nth))

<span class="linecomment">;; Bound in minibuffer to keys in `icicle-modal-cycle-down-alt-action-keys' (`C-S-down').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-candidate-per-mode-alt-action (&optional nth)
  "<span class="quote">`icicle-next-candidate-per-mode' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-candidate-per-mode-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-candidate-per-mode #'icicle-candidate-alt-action nth))

<span class="linecomment">;; Bound in minibuffer to keys in `icicle-modal-cycle-up-help-keys' (`C-M-up').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-candidate-per-mode-help (&optional nth)
  "<span class="quote">`icicle-previous-candidate-per-mode' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-candidate-per-mode-help]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-candidate-per-mode #'icicle-help-on-candidate nth))

<span class="linecomment">;; Bound in minibuffer to keys in `icicle-modal-cycle-down-help-keys' (`C-M-down').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-candidate-per-mode-help (&optional nth)
  "<span class="quote">`icicle-next-candidate-per-mode' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-candidate-per-mode-help]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-candidate-per-mode #'icicle-help-on-candidate nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-previous-action-keys' (`C-home').</span>
(put 'icicle-previous-prefix-candidate-action 'icicle-cycling-command         'backward)
(put 'icicle-previous-prefix-candidate-action 'icicle-prefix-cycling-command  'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate-action (&optional nth)
  "<span class="quote">`icicle-previous-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-prefix-candidate #'icicle-candidate-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-next-action-keys' (`C-end').</span>
(put 'icicle-next-prefix-candidate-action 'icicle-cycling-command         'forward)
(put 'icicle-next-prefix-candidate-action 'icicle-prefix-cycling-command  'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate-action (&optional nth)
  "<span class="quote">`icicle-next-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-prefix-candidate #'icicle-candidate-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-previous-action-keys' (`C-prior').</span>
(put 'icicle-previous-apropos-candidate-action 'icicle-cycling-command         'backward)
(put 'icicle-previous-apropos-candidate-action 'icicle-apropos-cycling-command 'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate-action (&optional nth)
  "<span class="quote">`icicle-previous-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-apropos-candidate #'icicle-candidate-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-next-action-keys' (`C-next').</span>
(put 'icicle-next-apropos-candidate-action 'icicle-cycling-command         'forward)
(put 'icicle-next-apropos-candidate-action 'icicle-apropos-cycling-command 'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate-action (&optional nth)
  "<span class="quote">`icicle-next-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-apropos-candidate #'icicle-candidate-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-previous-alt-action-keys' (`C-S-home').</span>
(put 'icicle-previous-prefix-candidate-alt-action 'icicle-cycling-command         'backward)
(put 'icicle-previous-prefix-candidate-alt-action 'icicle-prefix-cycling-command  'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate-alt-action (&optional nth)
  "<span class="quote">`icicle-previous-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-prefix-candidate #'icicle-candidate-alt-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-next-alt-action-keys' (`C-S-end').</span>
(put 'icicle-next-prefix-candidate-alt-action 'icicle-cycling-command         'forward)
(put 'icicle-next-prefix-candidate-alt-action 'icicle-prefix-cycling-command  'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate-alt-action (&optional nth)
  "<span class="quote">`icicle-next-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-prefix-candidate #'icicle-candidate-alt-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-previous-alt-action-keys' (`C-S-prior').</span>
(put 'icicle-previous-apropos-candidate-alt-action 'icicle-cycling-command         'backward)
(put 'icicle-previous-apropos-candidate-alt-action 'icicle-apropos-cycling-command 'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate-alt-action (&optional nth)
  "<span class="quote">`icicle-previous-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-apropos-candidate #'icicle-candidate-alt-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-next-alt-action-keys' (`C-S-next').</span>
(put 'icicle-next-apropos-candidate-alt-action 'icicle-cycling-command         'forward)
(put 'icicle-next-apropos-candidate-alt-action 'icicle-apropos-cycling-command 'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate-alt-action (&optional nth)
  "<span class="quote">`icicle-next-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-apropos-candidate #'icicle-candidate-alt-action nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-previous-help-keys' (`C-M-home').</span>
(put 'icicle-help-on-previous-prefix-candidate 'icicle-cycling-command         'backward)
(put 'icicle-help-on-previous-prefix-candidate 'icicle-prefix-cycling-command  'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-previous-prefix-candidate (&optional nth)
  "<span class="quote">`icicle-previous-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-previous-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-prefix-candidate #'icicle-help-on-candidate nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-cycle-next-help-keys' (`C-M-end').</span>
(put 'icicle-help-on-next-prefix-candidate 'icicle-cycling-command         'forward)
(put 'icicle-help-on-next-prefix-candidate 'icicle-prefix-cycling-command  'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-next-prefix-candidate (&optional nth)
  "<span class="quote">`icicle-next-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-next-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-prefix-candidate #'icicle-help-on-candidate nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-previous-help-keys' (`C-M-prior').</span>
(put 'icicle-help-on-previous-apropos-candidate 'icicle-cycling-command         'backward)
(put 'icicle-help-on-previous-apropos-candidate 'icicle-apropos-cycling-command 'backward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-previous-apropos-candidate (&optional nth)
  "<span class="quote">`icicle-previous-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-previous-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-apropos-candidate #'icicle-help-on-candidate nth))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-cycle-previous-help-keys' (`C-M-next').</span>
(put 'icicle-help-on-next-apropos-candidate 'icicle-cycling-command         'forward)
(put 'icicle-help-on-next-apropos-candidate 'icicle-apropos-cycling-command 'forward)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-next-apropos-candidate (&optional nth)
  "<span class="quote">`icicle-next-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-next-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-apropos-candidate #'icicle-help-on-candidate nth))

(defun icicle-successive-action (nav-fn action-fn nth)
  "<span class="quote">Call NAV-FN and ACTION-FN.  Pass argument NTH to NAV-FN.
Set `icicle-current-completion-mode'.
The order between NAV-FN and ACTION-FN respects the value of
`icicle-act-before-cycle-flag'.</span>"
  <span class="linecomment">;; Set mode only if known.  Otherwise, leave it alone (e.g. for per-mode functions).</span>
  (cond ((get nav-fn 'icicle-apropos-cycling-command)
         (setq icicle-current-completion-mode        'apropos
               icicle-next-prefix-complete-cycles-p  nil))
        ((get nav-fn 'icicle-prefix-cycling-command)
         (setq icicle-current-completion-mode         'prefix
               icicle-next-apropos-complete-cycles-p  nil)))

  <span class="linecomment">;; We bind `icicle-acting-on-next/prev' to non-nil (and the direction) while calling the action</span>
  <span class="linecomment">;; function.  This is used by Icicles search-and-replace (`icicle-search-highlight-and-maybe-replace')</span>
  <span class="linecomment">;; to ensure the correct candidate number for a series of replacements.</span>
  <span class="linecomment">;; (Not currently used for the `icicle-act-before-cycle-flag' case, but we do it there also, anyway.)</span>
  (cond (icicle-act-before-cycle-flag
         (let ((icicle-acting-on-next/prev  (get nav-fn 'icicle-cycling-command)))
           (save-excursion (save-selected-window (funcall action-fn))))
         (funcall nav-fn nth))
        (t
         <span class="linecomment">;; Inhibit showing help in mode-line while moving to next/previous candidate</span>
         <span class="linecomment">;; in `*Completions*', because help sits for `icicle-help-in-mode-line-delay' sec.</span>
         <span class="linecomment">;; Display the help after we do the action.</span>
         (let ((icicle-help-in-mode-line-delay  0)) (funcall nav-fn nth))
         (let ((icicle-acting-on-next/prev  (get nav-fn 'icicle-cycling-command)))
           (save-excursion (save-selected-window (funcall action-fn))))
         (when (stringp icicle-last-completion-candidate)
           (icicle-show-help-in-mode-line icicle-last-completion-candidate)))))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-complete-keys' (`TAB').</span>
(put 'icicle-prefix-complete 'icicle-cycling-command t)
(put 'icicle-prefix-complete 'icicle-prefix-cycling-command t)
(put 'icicle-prefix-complete 'icicle-completing-command t)
(put 'icicle-prefix-complete 'icicle-prefix-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete ()
  "<span class="quote">Complete the minibuffer contents as far as possible, as a prefix.
Repeat this to cycle among candidate completions.
If no characters can be completed, display the possible completions.
Candidate completions are appropriate names whose prefix is the
minibuffer input, where appropriateness is determined by the context
\(command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (unless (string= icicle-dot-string-internal "<span class="quote">.</span>")
    (icicle-convert-dots t t)
    (setq icicle-dot-string-internal  "<span class="quote">.</span>"))
  (icicle-prefix-complete-1))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-prefix-complete-no-display-keys' (`C-M-TAB').</span>
(put 'icicle-prefix-complete-no-display 'icicle-cycling-command t)
(put 'icicle-prefix-complete-no-display 'icicle-prefix-cycling-command t)
(put 'icicle-prefix-complete-no-display 'icicle-completing-command t)
(put 'icicle-prefix-complete-no-display 'icicle-prefix-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete-no-display (&optional no-msg-p) <span class="linecomment">; Bound to `C-M-TAB' in minibuffer.</span>
  "<span class="quote">Like `icicle-prefix-complete', but without displaying `*Completions*'.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete-no-display]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1 (if no-msg-p 'no-msg 'no-display)))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-word-completion-keys' (`M-SPC').</span>
(put 'icicle-prefix-word-complete 'icicle-cycling-command t)
(put 'icicle-prefix-word-complete 'icicle-prefix-cycling-command t)
(put 'icicle-prefix-word-complete 'icicle-completing-command t)
(put 'icicle-prefix-word-complete 'icicle-prefix-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-word-complete ()
  "<span class="quote">Complete the minibuffer contents at most a single word.
Repeating this completes additional words.
Spaces and hyphens in candidates are considered word separators.
If only a single candidate matches, the input is completed entirely.
Return nil if there is no valid completion, else t.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-word-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1 nil t))

(defun icicle-prefix-complete-1 (&optional no-display-p word-p)
  "<span class="quote">Helper function for `icicle-prefix-complete(-no-display)'.
Return the list of completion candidates.
Optional argument NO-DISPLAY-P non-nil means do not display buffer
 `*Completions*'.  If the value is `no-msg', then do not show any
  message either.  NO-DISPLAY-P is passed to
 `icicle-display-candidates-in-Completions' as its second arg.
Optional argument WORD-P non-nil means complete only a word at a time.</span>"
  (let ((ipc1-was-cycling-p  icicle-cycling-p)
        (mode-line-help      nil))
    (setq icicle-current-input                   (if (and icicle-last-input
                                                          icicle-cycling-p
                                                          (not icicle-edit-update-p)
                                                          (eq icicle-current-completion-mode 'prefix)
                                                          (or (not word-p)
                                                              (eq this-command last-command))
                                                          (symbolp last-command)
                                                          (or (get last-command 'icicle-cycling-command)
                                                              (get last-command 'icicle-action-command))
                                                          icicle-completion-candidates)
                                                     icicle-last-input
                                                   (if (icicle-file-name-input-p)
                                                       (abbreviate-file-name
                                                        (icicle-input-from-minibuffer 'leave-envar))
                                                     (icicle-input-from-minibuffer)))
          icicle-current-completion-mode         'prefix
          icicle-next-apropos-complete-cycles-p  nil
          icicle-input-fail-pos                  nil
          icicle-cycling-p                       nil)
    (when icicle-edit-update-p (setq icicle-next-prefix-complete-cycles-p  nil))
    (let ((word-complete-input      "<span class="quote"></span>")
          (input-before-completion  icicle-current-input)
          return-value)
      (unless (and (stringp icicle-current-input) (stringp icicle-last-input)
                   (string= icicle-current-input icicle-last-input)
                   (or (get last-command 'icicle-prefix-completing-command)
                       (get last-command 'icicle-action-command))
                   (not word-p))
        (unless (or icicle-edit-update-p (get-buffer-window "<span class="quote">*Completions*</span>" 0) no-display-p)
          (message "<span class="quote">Computing completion candidates...</span>"))
        (if (not word-p)
            (setq icicle-completion-candidates
                  (condition-case nil
                      (if (icicle-file-name-input-p)
                          (icicle-file-name-prefix-candidates icicle-current-input)
                        (icicle-prefix-candidates icicle-current-input))
                    (error icicle-completion-candidates))) <span class="linecomment">; No change if completion error.</span>
          <span class="linecomment">;; Complete a word.  Save input before trying to complete.</span>
          <span class="linecomment">;; Update `icicle-current-input': `minibuffer-complete-word' might have completed the input</span>
          <span class="linecomment">;; beyond a complete candidate - e.g. `forwar-char' to `forward-char-'.</span>
          (setq word-complete-input   (icicle-input-from-minibuffer)
                return-value
                (let ((temp-buffer-show-hook       nil) <span class="linecomment">; Don't let it fit frame here.</span>
                      (completion-auto-help        nil) <span class="linecomment">; Don't show `*Completions*'.</span>
                      (minibuffer-message-timeout  0)) <span class="linecomment">; No timeout.</span>
                  (icicle-clear-minibuffer)
                  (insert icicle-current-input)
                  (save-selected-window (minibuffer-complete-word)))
                icicle-current-input  (icicle-input-from-minibuffer)) <span class="linecomment">; Update input.</span>
          <span class="linecomment">;; If incremental compl., or completed some, or not repeated, then update input and recompute.</span>
          (when (or icicle-edit-update-p
                    (&gt; (length icicle-current-input) (length word-complete-input))
                    (not (eq this-command last-command)))
            (setq word-complete-input           icicle-current-input
                  icicle-completion-candidates  (condition-case nil
                                                    (if (icicle-file-name-input-p)
                                                        (icicle-file-name-prefix-candidates
                                                         icicle-current-input)
                                                      (icicle-prefix-candidates icicle-current-input))
                                                  (error icicle-completion-candidates)))))
        (message nil))                  <span class="linecomment">; Clear out "Computing completion candidates..." message.</span>
      (unless word-p (setq return-value  icicle-completion-candidates)) <span class="linecomment">; Word returns special value.</span>
      (icicle-save-or-restore-input)
      (cond ((null icicle-completion-candidates)
             (setq icicle-nb-of-other-cycle-candidates  0)
             (let ((icicle-incremental-completion-flag <span class="linecomment">; Upgrade if OK for explicit.</span>
                    (or (memq icicle-highlight-input-completion-failure
                              '(explicit-strict explicit explicit-remote))
                        icicle-incremental-completion-flag)))
               (icicle-highlight-input-noncompletion))
             (save-selected-window (icicle-remove-Completions-window))
             (run-hooks 'icicle-no-match-hook)
             (unless (eq no-display-p 'no-msg)
               (minibuffer-message (case (icicle-current-TAB-method)
                                     (fuzzy        "<span class="quote">  [No fuzzy completions]</span>")
                                     (vanilla      "<span class="quote">  [No vanilla completions]</span>")
                                     (swank        "<span class="quote">  [No swank (fuzzy symbol) completions]</span>")
                                     (t            "<span class="quote">  [No prefix completions]</span>")))))
            ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single candidate.  Update minibuffer.</span>
             <span class="linecomment">;; When `icicle-whole-candidate-as-text-prop-p' is t and</span>
             <span class="linecomment">;; `icicle-expand-input-to-common-match-flag' is nil, we need to expand the input anyway.</span>
             <span class="linecomment">;; That transfers any `icicle-whole-candidate' property from the candidate to</span>
             <span class="linecomment">;; `icicle-current-input', so things that use `icicle-candidates-alist' will work.</span>
             (when (and icicle-whole-candidate-as-text-prop-p
                        (not icicle-expand-input-to-common-match-flag))
               (setq icicle-common-match-string  (icicle-expanded-common-match
                                                  icicle-current-input icicle-completion-candidates))
               (when icicle-common-match-string
                 (let ((common  (if (and (icicle-file-name-input-p) insert-default-directory)
                                    (if (string= "<span class="quote"></span>" icicle-common-match-string)
                                        (or (icicle-file-name-directory icicle-current-input) "<span class="quote"></span>")
                                      (directory-file-name (icicle-abbreviate-or-expand-file-name
                                                            icicle-common-match-string
                                                            (icicle-file-name-directory
                                                             icicle-current-input))))
                                  icicle-common-match-string)))
                   <span class="linecomment">;; Save as current input, unless input is a directory.</span>
                   (unless (and (icicle-file-name-input-p)  (file-directory-p icicle-current-input))
                     (setq icicle-current-input  common)))))
             <span class="linecomment">;; Expand file-name input to the common match for the current candidate.</span>
             (when (icicle-file-name-input-p)
               (setq icicle-common-match-string  (icicle-expanded-common-match
                                                  (car icicle-completion-candidates)
                                                  icicle-completion-candidates))
               (when icicle-common-match-string
                 (let ((common  (if (and (icicle-file-name-input-p) insert-default-directory)
                                    (if (string= "<span class="quote"></span>" icicle-common-match-string)
                                        (or (icicle-file-name-directory icicle-current-input) "<span class="quote"></span>")
                                      (directory-file-name (icicle-abbreviate-or-expand-file-name
                                                            icicle-common-match-string
                                                            (icicle-file-name-directory
                                                             icicle-current-input))))
                                  icicle-common-match-string)))
                   (setq icicle-current-input  common))))
             (setq icicle-nb-of-other-cycle-candidates  0)
             (unless icicle-edit-update-p
               (icicle-clear-minibuffer)
               (let ((cand  (car icicle-completion-candidates)))
                 (if (icicle-file-name-input-p)
                     (cond ((string= "<span class="quote"></span>" cand) <span class="linecomment">; This indicates an empty dir.</span>
                            (setq icicle-last-completion-candidate  icicle-current-input))
                           ((eq ?\/  (aref cand (1- (length cand)))) <span class="linecomment">; Add `/', so cycling expands dir.</span>
                            (setq icicle-current-input (concat icicle-current-input "<span class="quote">/</span>")
                                  icicle-last-completion-candidate  icicle-current-input))
                           (t           <span class="linecomment">; Non-dir - use the candidate file, but without any dir.</span>
                            (setq icicle-last-completion-candidate
                                  (icicle-file-name-nondirectory cand))))
                   (setq icicle-last-completion-candidate  cand)))
               (let ((inserted  (if (and (icicle-file-name-input-p) insert-default-directory
                                         (or (not (member icicle-last-completion-candidate
                                                          icicle-extra-candidates))
                                             icicle-extra-candidates-dir-insert-p))
                                    (icicle-abbreviate-or-expand-file-name
                                     icicle-last-completion-candidate
                                     (icicle-file-name-directory-w-default icicle-current-input))
                                  icicle-last-completion-candidate)))
                 (insert inserted)
                 (when (and (icicle-file-name-input-p)
                            (icicle-file-directory-p (icicle-abbreviate-or-expand-file-name inserted)))
                   (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name inserted)))))
             (save-selected-window (icicle-remove-Completions-window))
             (icicle-transform-sole-candidate)
             (unless (boundp 'icicle-prefix-complete-and-exit-p)
               (icicle-highlight-complete-input)
               (cond ((and icicle-top-level-when-sole-completion-flag
                           (sit-for icicle-top-level-when-sole-completion-delay))
                      (set minibuffer-history-variable
                           (cons icicle-current-input
                                 (symbol-value minibuffer-history-variable)))
                      (condition-case icicle-prefix-complete-1
                          (throw 'icicle-read-top
                            (if (and (icicle-file-name-input-p) insert-default-directory
                                     (or (not (member icicle-current-input
                                                      icicle-extra-candidates))
                                         icicle-extra-candidates-dir-insert-p))
                                (expand-file-name icicle-current-input)
                              icicle-current-input))
                        (no-catch
                         (icicle-retrieve-last-input)
                         icicle-current-input)
                        (error (message (error-message-string icicle-prefix-complete-1)))))
                     ((and icicle-edit-update-p (not (eq no-display-p 'no-msg)))
                      (minibuffer-message
                       (format (case (icicle-current-TAB-method)
                                 (fuzzy        "<span class="quote">  [One fuzzy completion: %s]</span>")
                                 (vanilla      "<span class="quote">  [One vanilla completion: %s]</span>")
                                 (swank        "<span class="quote">  [One swank (fuzzy symbol) completion: %s]</span>")
                                 (t            "<span class="quote">  [One prefix completion: %s]</span>"))
                               icicle-current-input))
                      (setq mode-line-help  icicle-current-input))
                     ((not (eq no-display-p 'no-msg))
                      (minibuffer-message (case (icicle-current-TAB-method)
                                            (fuzzy        "<span class="quote">  [Sole fuzzy completion]</span>")
                                            (vanilla      "<span class="quote">  [Sole vanilla completion]</span>")
                                            (swank        "<span class="quote">  [Sole swank (fuzzy symbol) completion]</span>")
                                            (t            "<span class="quote">  [Sole prefix completion]</span>")))
                      (setq mode-line-help  icicle-current-input)))))
            (t                          <span class="linecomment">; Multiple candidates.</span>
             (if icicle-edit-update-p
                 (icicle-display-candidates-in-Completions nil no-display-p)
               (unless word-p
                 (icicle-clear-minibuffer)
                 (save-window-excursion
                   <span class="linecomment">;; Shouldn't need to explicitly select minibuffer like this, since `*Completions*'</span>
                   <span class="linecomment">;; input is directed there.  But there seems to be an Emacs bug somewhere, because</span>
                   <span class="linecomment">;; although using just `insert' inserts the input in the minibuffer OK, in some</span>
                   <span class="linecomment">;; cases the cursor might not follow the insertion.</span>
                   (select-window (active-minibuffer-window))
                   (insert icicle-current-input))
                 <span class="linecomment">;; Shouldn't need to do this if it is on `post-command-hook', but it seems we need to.</span>
                 (when (and (boundp '1on1-fit-minibuffer-frame-flag) 1on1-fit-minibuffer-frame-flag
                            (require 'fit-frame nil t))
                   (1on1-fit-minibuffer-frame))) <span class="linecomment">; In `oneonone.el'.</span>
               (deactivate-mark)
               (icicle-highlight-initial-whitespace icicle-current-input)
               (when (and (icicle-file-name-input-p)
                          (icicle-file-directory-p icicle-last-completion-candidate))
                 (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name
                                                  icicle-last-completion-candidate)))
               (when (and (icicle-input-is-a-completion-p icicle-current-input)
                          (not (boundp 'icicle-prefix-complete-and-exit-p)))
                 (icicle-highlight-complete-input)
                 (setq mode-line-help  (icicle-minibuf-input-sans-dir icicle-current-input)))
               (cond (<span class="linecomment">;; Candidates visible.  If second prefix complete, cycle, else update candidates.</span>
                      (get-buffer-window "<span class="quote">*Completions*</span>" 0)
                      (if (and (or ipc1-was-cycling-p icicle-next-prefix-complete-cycles-p)
                               (get icicle-last-completion-command 'icicle-prefix-completing-command)
                               (if word-p
                                   <span class="linecomment">;; Word completion cycles only if both of these are true:</span>
                                   <span class="linecomment">;; * Input is not yet complete (null `return-value').</span>
                                   <span class="linecomment">;; * Either last command was an edit and input does not end in `-',</span>
                                   <span class="linecomment">;;          or the current input is from cycling.</span>
                                   <span class="linecomment">;; E.g. `M-x fo M-SPC r M-SPC' cycles among foreground-color etc.</span>
                                   (and (not return-value)
                                        (or (and (not (or (get last-command
                                                               'icicle-prefix-completing-command)
                                                          (get last-command 'icicle-action-command)))
                                                 (not (eq (aref icicle-current-input
                                                                (1- (length icicle-current-input)))
                                                          ?-)))
                                            (not (string= icicle-last-input word-complete-input))))
                                 (or (get last-command 'icicle-prefix-completing-command)
                                     (get last-command 'icicle-action-command))))
                          <span class="linecomment">;; Second prefix complete in a row.  Cycle down.</span>
                          (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                       'icicle-file-name-prefix-candidates
                                                     'icicle-prefix-candidates))
                        <span class="linecomment">;; User did something else (e.g. changed input).  Update the candidates.</span>
                        (icicle-display-candidates-in-Completions nil no-display-p)))
                     (<span class="linecomment">;; No candidates shown.  Could be first completion or could follow `C-M-(S-)TAB'.</span>
                      icicle-TAB-shows-candidates-flag
                      (if (not (and (or ipc1-was-cycling-p icicle-next-prefix-complete-cycles-p)
                                    (get icicle-last-completion-command
                                         'icicle-prefix-completing-command)
                                    (or (get last-command 'icicle-prefix-completing-command)
                                        (get last-command 'icicle-action-command))
                                    (not word-p)))
                          <span class="linecomment">;; First prefix complete is enough to update candidates.</span>
                          (icicle-display-candidates-in-Completions nil no-display-p)
                        <span class="linecomment">;; Second prefix complete.  If `TAB', then it follows `C-M-TAB', so show window.</span>
                        (unless no-display-p (icicle-display-candidates-in-Completions nil))
                        (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                     'icicle-file-name-prefix-candidates
                                                   'icicle-prefix-candidates))))
                     (<span class="linecomment">;; No candidates shown.  Second prefix complete.</span>
                      <span class="linecomment">;; If NO-DISPLAY-P and either not WORD-P or input is complete, then cycle down.</span>
                      <span class="linecomment">;; Else, vanilla Emacs: second `TAB' shows candidates.</span>
                      (and (get icicle-last-completion-command 'icicle-prefix-completing-command)
                           (or (get last-command 'icicle-prefix-completing-command)
                               (get last-command 'icicle-action-command))
                           completion-auto-help)
                      (if (or (not no-display-p) (and word-p (not return-value)))
                          (icicle-display-candidates-in-Completions nil)
                        (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                     'icicle-file-name-prefix-candidates
                                                   'icicle-prefix-candidates))))
                     <span class="linecomment">;; Input is complete, but exist other candidates with same prefix.</span>
                     ((and (member icicle-current-input icicle-completion-candidates)
                           (not (eq no-display-p 'no-msg)))
                      (minibuffer-message "<span class="quote">  [Complete, but not unique]</span>"))))))
      (setq icicle-last-completion-command        (if word-p
                                                      'icicle-prefix-word-complete
                                                    (if no-display-p
                                                        'icicle-prefix-complete-no-display
                                                      'icicle-prefix-complete))
            icicle-next-prefix-complete-cycles-p  (equal input-before-completion
                                                         (icicle-input-from-minibuffer 'leave-envvars)))
      (when mode-line-help (icicle-show-help-in-mode-line mode-line-help))
      return-value)))

(defun icicle-input-is-a-completion-p (&optional input)
  "<span class="quote">Return non-nil if the input is a valid completion.
Optional arg INPUT is passed to `icicle-minibuffer-input-sans-dir'.
This is essentially a `member' test, except for environment vars, for
which the initial `$' is ignored.</span>"
  (let* ((input-sans-dir  (icicle-minibuf-input-sans-dir input))
         (env-var-name    (and (icicle-not-basic-prefix-completion-p)
                               (&gt; (length input-sans-dir) 0)
                               (eq ?\$ (aref input-sans-dir 0))
                               (substring input-sans-dir 1))))
    (member (icicle-upcase-if-ignore-case (or env-var-name input-sans-dir))
            (mapcar #'icicle-upcase-if-ignore-case icicle-completion-candidates))))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-complete-keys' (`S-TAB').</span>
(put 'icicle-apropos-complete 'icicle-cycling-command t)
(put 'icicle-apropos-complete 'icicle-apropos-cycling-command t)
(put 'icicle-apropos-complete 'icicle-completing-command t)
(put 'icicle-apropos-complete 'icicle-apropos-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete ()
  "<span class="quote">Complete the minibuffer contents as far as possible.
Repeat this to cycle among candidate completions.
This uses \"apropos completion\", defined as follows:
A completion contains the minibuffer input somewhere, as a substring.
Display a list of possible completions in buffer `*Completions*'.
Candidate completions are appropriate names that match the current
input, taken as a regular expression, where appropriateness is
determined by the context (command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (and (string= icicle-dot-string icicle-anychar-regexp)
             (not (string= icicle-dot-string-internal icicle-anychar-regexp)))
    (icicle-convert-dots (equal icicle-current-input icicle-last-input)) <span class="linecomment">; No confirm if same input.</span>
    (setq icicle-dot-string-internal  (icicle-anychar-regexp)))
  (let* ((error-msg  nil)               <span class="linecomment">; Apropos complete.</span>
         (candidates
          (condition-case lossage
              (icicle-apropos-complete-1)
            (invalid-regexp
             (setq error-msg  (cadr lossage))
             (when (string-match "<span class="quote">\\`Premature \\|\\`Unmatched \\|\\`Invalid </span>" error-msg)
               (setq error-msg  "<span class="quote">incomplete input</span>")))
            (error (setq error-msg  (error-message-string lossage))))))
    (when error-msg (minibuffer-message (concat "<span class="quote">  </span>" error-msg)))
    candidates))


<span class="linecomment">;; Bound in minibuffer to keys in `icicle-apropos-complete-no-display-keys' (`C-M-S-TAB').</span>
(put 'icicle-apropos-complete-no-display 'icicle-cycling-command t)
(put 'icicle-apropos-complete-no-display 'icicle-apropos-cycling-command t)
(put 'icicle-apropos-complete-no-display 'icicle-completing-command t)
(put 'icicle-apropos-complete-no-display 'icicle-apropos-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-no-display (&optional no-msg-p)
  "<span class="quote">Like `icicle-apropos-complete', but without displaying `*Completions*'.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.
You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete-no-display]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((error-msg  nil)
         (candidates
          (condition-case lossage
              (icicle-apropos-complete-1 (if no-msg-p 'no-msg 'no-display))
            (invalid-regexp
             (setq error-msg  (cadr lossage))
             (when (string-match "<span class="quote">\\`Premature \\|\\`Unmatched \\|\\`Invalid </span>" error-msg)
               (setq error-msg  "<span class="quote">incomplete input</span>")))
            (error (setq error-msg  (error-message-string lossage))))))
    (when error-msg (minibuffer-message (concat "<span class="quote">  </span>" error-msg)))
    candidates))

(defun icicle-apropos-complete-1 (&optional no-display-p)
  "<span class="quote">Helper function for `icicle-apropos-complete(-no-display)'.
This does everything except deal with regexp-match errors.
Return the list of completion candidates.

Optional argument NO-DISPLAY-P non-nil means do not display buffer
`*Completions*'.  If the value is `no-msg', then do not show any
message either.  NO-DISPLAY-P is passed to
`icicle-display-candidates-in-Completions' as its second arg.</span>"
  (let ((iac1-was-cycling-p  icicle-cycling-p)
        (mode-line-help      nil)
        input-before-completion)
    (setq icicle-current-input                  (if (and icicle-last-input
                                                         icicle-cycling-p
                                                         (not icicle-edit-update-p)
                                                         (eq icicle-current-completion-mode 'apropos)
                                                         (symbolp last-command)
                                                         (or (get last-command 'icicle-cycling-command)
                                                             (get last-command 'icicle-action-command))
                                                         icicle-completion-candidates)
                                                    icicle-last-input
                                                  (icicle-input-from-minibuffer))
          icicle-current-completion-mode        'apropos
          icicle-next-prefix-complete-cycles-p  nil
          icicle-input-fail-pos                 nil
          icicle-cycling-p                      nil)
    (when icicle-edit-update-p (setq icicle-next-apropos-complete-cycles-p  nil))
    (when (icicle-file-name-input-p)
      (setq icicle-current-input  (abbreviate-file-name
                                   (if icicle-regexp-quote-flag
                                       (substitute-in-file-name icicle-current-input)
                                     icicle-current-input))))
    (setq input-before-completion  icicle-current-input)
    (unless (or icicle-edit-update-p (get-buffer-window "<span class="quote">*Completions*</span>" 0) no-display-p)
      (message "<span class="quote">Computing completion candidates...</span>"))
    (unless (and (stringp icicle-current-input) (stringp icicle-last-input)
                 (string= icicle-current-input icicle-last-input)
                 (or (get last-command 'icicle-apropos-completing-command)
                     (get last-command 'icicle-action-command)))
      (setq icicle-completion-candidates
            (condition-case nil
                (if (icicle-file-name-input-p)
                    (icicle-file-name-apropos-candidates icicle-current-input)
                  (icicle-apropos-candidates icicle-current-input))
              (error icicle-completion-candidates)))) <span class="linecomment">; No change if completion error.</span>
    (icicle-save-or-restore-input)
    (cond ((null icicle-completion-candidates)
           (setq icicle-nb-of-other-cycle-candidates  0)
           (let ((icicle-incremental-completion-flag <span class="linecomment">; Upgrade if OK for explicit.</span>
                  (or (memq icicle-highlight-input-completion-failure
                            '(explicit-strict explicit explicit-remote))
                      icicle-incremental-completion-flag)))
             (icicle-highlight-input-noncompletion))
           (save-selected-window (icicle-remove-Completions-window))
           (run-hooks 'icicle-no-match-hook)
           (unless (eq no-display-p 'no-msg)
             (minibuffer-message (let ((typ  (car (rassq icicle-apropos-complete-match-fn
                                                         icicle-S-TAB-completion-methods-alist))))
                                   (concat "<span class="quote">  [No </span>" typ (and typ "<span class="quote"> </span>") "<span class="quote">completion]</span>")))))
          ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single candidate. Update minibuffer.</span>
           <span class="linecomment">;; When `icicle-whole-candidate-as-text-prop-p' is t</span>
           <span class="linecomment">;; and `icicle-expand-input-to-common-match-flag' is nil, we need to expand the input anyway.</span>
           <span class="linecomment">;; That transfers any `icicle-whole-candidate' property from the candidate to</span>
           <span class="linecomment">;; `icicle-current-input', so things that use `icicle-candidates-alist' will work.</span>
           (when (and icicle-whole-candidate-as-text-prop-p
                      (not icicle-expand-input-to-common-match-flag))
             (setq icicle-common-match-string  (icicle-expanded-common-match
                                                icicle-current-input icicle-completion-candidates))
             (when icicle-common-match-string
               (let ((common  (if (and (icicle-file-name-input-p) insert-default-directory)
                                  (if (string= "<span class="quote"></span>" icicle-common-match-string)
                                      (or (icicle-file-name-directory icicle-current-input) "<span class="quote"></span>")
                                    (directory-file-name (icicle-abbreviate-or-expand-file-name
                                                          icicle-common-match-string
                                                          (icicle-file-name-directory
                                                           icicle-current-input))))
                                icicle-common-match-string)))
                 <span class="linecomment">;; Save as current input, unless input is a directory.</span>
                 (unless (and (icicle-file-name-input-p)  (file-directory-p icicle-current-input))
                   (setq icicle-current-input  common)))))
           <span class="linecomment">;; Expand file-name input to the common match for the current candidate.</span>
           (when (icicle-file-name-input-p)
             (setq icicle-common-match-string  (icicle-expanded-common-match
                                                (car icicle-completion-candidates)
                                                icicle-completion-candidates))
             (when icicle-common-match-string
               (let ((common  (if (and (icicle-file-name-input-p) insert-default-directory)
                                  (if (string= "<span class="quote"></span>" icicle-common-match-string)
                                      (or (icicle-file-name-directory icicle-current-input) "<span class="quote"></span>")
                                    (directory-file-name (icicle-abbreviate-or-expand-file-name
                                                          icicle-common-match-string
                                                          (icicle-file-name-directory
                                                           icicle-current-input))))
                                icicle-common-match-string)))
                 (setq icicle-current-input  common))))
           (setq icicle-nb-of-other-cycle-candidates  0)
           (unless icicle-edit-update-p
             (icicle-clear-minibuffer)
             (if (icicle-file-name-input-p)
                 (let ((cand  (car icicle-completion-candidates)))
                   (cond ((string= "<span class="quote"></span>" cand) <span class="linecomment">; This indicates an empty dir.</span>
                          (setq icicle-last-completion-candidate  icicle-current-input))
                         ((eq ?\/  (aref cand (1- (length cand)))) <span class="linecomment">; Add `/', so cycling expands dir.</span>
                          (setq icicle-current-input              (concat icicle-current-input "<span class="quote">/</span>")
                                icicle-last-completion-candidate  icicle-current-input))
                         (t             <span class="linecomment">; Non-dir - use the candidate file.</span>
                          (setq icicle-last-completion-candidate  (car icicle-completion-candidates)))))
               (setq icicle-last-completion-candidate  (car icicle-completion-candidates)))
             (let ((inserted  (if (and (icicle-file-name-input-p) insert-default-directory
                                       (or (not (member icicle-last-completion-candidate
                                                        icicle-extra-candidates))
                                           icicle-extra-candidates-dir-insert-p))
                                  (icicle-abbreviate-or-expand-file-name
                                   icicle-last-completion-candidate
                                   (icicle-file-name-directory-w-default icicle-current-input))
                                icicle-last-completion-candidate)))
               (insert inserted)
               (when (and (icicle-file-name-input-p)
                          (icicle-file-directory-p (icicle-abbreviate-or-expand-file-name inserted)))
                 (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name inserted)))))
           (save-selected-window (icicle-remove-Completions-window))
           (icicle-transform-sole-candidate)
           (unless (boundp 'icicle-apropos-complete-and-exit-p)
             (icicle-highlight-complete-input)
             (cond ((and icicle-top-level-when-sole-completion-flag
                         (sit-for icicle-top-level-when-sole-completion-delay))
                    (set minibuffer-history-variable (cons (car icicle-completion-candidates)
                                                           (symbol-value minibuffer-history-variable)))
                    (condition-case icicle-apropos-complete-1
                        (throw 'icicle-read-top
                          (if (and (icicle-file-name-input-p) insert-default-directory
                                   (or (not (member (car icicle-completion-candidates)
                                                    icicle-extra-candidates))
                                       icicle-extra-candidates-dir-insert-p))
                              (expand-file-name (car icicle-completion-candidates))
                            (car icicle-completion-candidates)))
                      (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                                (icicle-retrieve-last-input)
                                icicle-current-input)
                      (error (message (error-message-string icicle-apropos-complete-1)))))
                   ((and icicle-edit-update-p (not (eq no-display-p 'no-msg)))
                    (minibuffer-message (format "<span class="quote">  [One apropos completion: %s]</span>"
                                                (car icicle-completion-candidates)))
                    (setq mode-line-help  (car icicle-completion-candidates)))
                   ((not (eq no-display-p 'no-msg))
                    (minibuffer-message "<span class="quote">  [Sole apropos completion]</span>")
                    (setq mode-line-help  (car icicle-completion-candidates))))))
          (t                            <span class="linecomment">; Multiple candidates.</span>
           (if icicle-edit-update-p
               (icicle-display-candidates-in-Completions nil no-display-p)
             (icicle-clear-minibuffer)
             (insert icicle-current-input) <span class="linecomment">; Update minibuffer.</span>
             <span class="linecomment">;; Shouldn't need to do this if it is on `post-command-hook', but it seems we need to.</span>
             (when (and (boundp '1on1-fit-minibuffer-frame-flag) 1on1-fit-minibuffer-frame-flag
                        (require 'fit-frame nil t))
               (1on1-fit-minibuffer-frame)) <span class="linecomment">; In `oneonone.el'.</span>
             (deactivate-mark)
             (icicle-highlight-initial-whitespace icicle-current-input)
             (when (and (icicle-file-name-input-p)
                        (icicle-file-directory-p icicle-last-completion-candidate))
               (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name
                                                icicle-last-completion-candidate)))
             (let ((input-sans-dir  (icicle-minibuf-input-sans-dir icicle-current-input)))
               (when (and (member (icicle-upcase-if-ignore-case input-sans-dir)
                                  (mapcar #'icicle-upcase-if-ignore-case icicle-completion-candidates))
                          (not (boundp 'icicle-apropos-complete-and-exit-p)))
                 (icicle-highlight-complete-input)
                 (setq mode-line-help  input-sans-dir)))
             (cond (<span class="linecomment">;; Candidates already displayed.  If second `S-TAB', cycle, else update candidates.</span>
                    (get-buffer-window "<span class="quote">*Completions*</span>" 0)
                    (if (and (or iac1-was-cycling-p icicle-next-apropos-complete-cycles-p)
                             (get icicle-last-completion-command 'icicle-apropos-completing-command)
                             (or (get last-command 'icicle-apropos-completing-command)
                                 (get last-command 'icicle-action-command)))
                        <span class="linecomment">;; Second `S-TAB' in a row.  Cycle down.</span>
                        (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                     'icicle-file-name-apropos-candidates
                                                   'icicle-apropos-candidates)
                                               'regexp-p)
                      <span class="linecomment">;; User did something else (e.g. changed input).  (Possibly) update the display.</span>
                      (icicle-display-candidates-in-Completions nil no-display-p)))
                   (t
                    (if (not (and (or iac1-was-cycling-p icicle-next-apropos-complete-cycles-p)
                                  (get icicle-last-completion-command
                                       'icicle-apropos-completing-command)
                                  (or (get last-command 'icicle-apropos-completing-command)
                                      (get last-command 'icicle-action-command))))
                        (icicle-display-candidates-in-Completions nil no-display-p)
                      <span class="linecomment">;; Second apropos complete.  If `S-TAB', it follows `C-M-S-TAB', so show window.</span>
                      (unless no-display-p (icicle-display-candidates-in-Completions nil))
                      (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                   'icicle-file-name-apropos-candidates
                                                 'icicle-apropos-candidates)
                                             'regexp-p)))))))
    (setq icicle-last-completion-command         (if no-display-p
                                                     'icicle-apropos-complete-no-display
                                                   'icicle-apropos-complete)
          icicle-next-apropos-complete-cycles-p  (equal input-before-completion
                                                        (icicle-input-from-minibuffer)))
    (when mode-line-help (icicle-show-help-in-mode-line mode-line-help))
    icicle-completion-candidates))

(defun icicle-transform-sole-candidate ()
  "<span class="quote">Transform matching candidate according to `icicle-list-use-nth-parts'.</span>"
  (when (and icicle-list-use-nth-parts icicle-current-input)
    <span class="linecomment">;; $$$$$$ (let ((newcand  (icicle-transform-multi-completion (car icicle-completion-candidates))))</span>
    (let ((newcand  (icicle-transform-multi-completion icicle-current-input)))
      (icicle-clear-minibuffer)
      (insert newcand)
      (setq icicle-completion-candidates      (list newcand)
            icicle-last-completion-candidate  newcand))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-Completions-buf () <span class="linecomment">; Bound to `C-insert' in minibuffer.</span>
  "<span class="quote">Select the completion list window.
The cursor is placed on the first occurrence of the current minibuffer
content.  You can use \\&lt;completion-list-mode-map&gt;\
`\\[icicle-insert-completion]' to get back to the minibuffer.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-switch-to-Completions-buf]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-input  (icicle-input-from-minibuffer))
  (let ((window     (get-buffer-window "<span class="quote">*Completions*</span>" 0))
        (search-fn  'search-forward))
    (unless window                      <span class="linecomment">; Make sure we have a completions window.</span>
      (icicle-apropos-complete)
      (setq window     (get-buffer-window "<span class="quote">*Completions*</span>" 0)
            search-fn  're-search-forward)) <span class="linecomment">; Use regexp search: input is not yet complete.</span>
    (when window
      (select-window window)
      (let ((case-fold-search
             <span class="linecomment">;; Don't bother to detect buffer completion and check `read-buffer-completion-ignore-case'.</span>
             (if (and (icicle-file-name-input-p)
                      (boundp 'read-file-name-completion-ignore-case))
                 read-file-name-completion-ignore-case
               completion-ignore-case)))
        (goto-char (icicle-start-of-candidates-in-Completions))
        (when (icicle-file-name-input-p)
          (setq icicle-current-input  (icicle-file-name-nondirectory icicle-current-input)))
        (when (and (get icicle-last-completion-command 'icicle-apropos-completing-command)
                   <span class="linecomment">;; $$ Previously allowed the -action's.</span>
                   (not (and (symbolp last-command) (get last-command 'icicle-cycling-command))))
          (setq search-fn  're-search-forward)) <span class="linecomment">; Use regexp search: input is not yet complete.</span>
        (while (and (not (eobp))
                    (save-restriction
                      (narrow-to-region (point) (next-single-property-change (point) 'mouse-face
                                                                             nil (point-max)))
                      (not (funcall search-fn icicle-current-input nil 'leave-at-end)))))
        (unless (eobp)
          (goto-char (match-beginning 0))
          (let ((prop  (get-text-property (1- (point)) 'mouse-face)))
            <span class="linecomment">;; If in a completion, move to the start of it.</span>
            (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
              (goto-char (previous-single-property-change (point) 'mouse-face nil (point-min)))))
          (icicle-place-overlay
           (point) (next-single-property-change (point) 'mouse-face nil (point-max))
           'icicle-current-completion-candidate-overlay 'icicle-current-candidate-highlight
           100 (current-buffer)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-completion (&optional completion) <span class="linecomment">; Bound to `C-insert' in `*Completions*'.</span>
  "<span class="quote">Select the active minibuffer window.  Insert current completion.
The current candidate in `*Completions*' (under the cursor) is
inserted into the minibuffer as the current input.  You can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-switch-to-Completions-buf]'
to switch to the `*Completions*' window.

You can use this command only from buffer `*Completions*' (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-insert-completion]').

Non-interactively, optional arg COMPLETION is the completion inserted.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (when (active-minibuffer-window)
    (unwind-protect                     <span class="linecomment">; If no current completion, return to minibuffer anyway.</span>
         (progn
           (setq completion  (or completion (icicle-current-completion-in-Completions)))
           (select-window (active-minibuffer-window))
           (with-current-buffer (window-buffer) <span class="linecomment">; Needed if `*Completions*' is redirected to minibuffer.</span>
             (goto-char (icicle-minibuffer-prompt-end))
             (icicle-clear-minibuffer)
             (insert (if (and (icicle-file-name-input-p) insert-default-directory
                              (or (not (member icicle-current-input icicle-extra-candidates))
                                  icicle-extra-candidates-dir-insert-p))
                         (icicle-file-name-directory-w-default icicle-current-input)
                       "<span class="quote"></span>")
                     completion)
             (setq icicle-current-input  (icicle-input-from-minibuffer))))
      (select-window (active-minibuffer-window)))))

(defun icicle-current-completion-in-Completions ()
  "<span class="quote">The completion candidate under the cursor in buffer `*Completions*'.
Return the name as a string.</span>" <span class="linecomment">; See also `choose-completion' and `mouse-choose-completion'.</span>
  (let ((buffer          completion-reference-buffer)
        (base-size       completion-base-size)
        (start-of-cands  (icicle-start-of-candidates-in-Completions))
        beg end)
    (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
      (setq end  (point)
            beg  (1+ (point))))
    (when (and (&gt; (point) start-of-cands) (get-text-property (1- (point)) 'mouse-face))
      (setq end  (1- (point))
            beg  (point)))
    (setq beg  (previous-single-property-change (or beg (point)) 'mouse-face nil start-of-cands)
          end  (next-single-property-change (or end (point)) 'mouse-face nil (point-max)))
    (unless beg (error "<span class="quote">No completion here</span>"))
    <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
    <span class="linecomment">;; in `*Completions*'. Add the newline back. `icicle-insert-candidates' puts property</span>
    <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
    <span class="linecomment">;; being just part of the display in columns.</span>
    (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
      (setq end  (1+ end)))
    <span class="linecomment">;; $$$$ (buffer-substring-no-properties beg end)))</span>
    (buffer-substring beg end)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to/from-minibuffer () <span class="linecomment">; Bound to `pause' in Icicle mode.</span>
  "<span class="quote">Switch to minibuffer or previous buffer, in other window.
If current buffer is the minibuffer, then switch to the buffer that
was previously current.  Otherwise, switch to the minibuffer.</span>"
  (interactive)
  (unless (active-minibuffer-window) (error "<span class="quote">Minibuffer is not active</span>"))
  (if (eq (selected-window) (active-minibuffer-window))
      (switch-to-buffer-other-window icicle-pre-minibuffer-buffer)
    (select-window (active-minibuffer-window))))


<span class="linecomment">;; Replaces `previous-completion' (defined in `simple.el').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-move-to-previous-completion (n) <span class="linecomment">; Bound to `left', `S-TAB' in `*Completions*'.</span>
  "<span class="quote">Move to the previous item in the completion list.

You can use this command only from buffer `*Completions*' (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-move-to-previous-completion]').</span>"
  (interactive "<span class="quote">p</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (setq n  (or n 0))
  (icicle-move-to-next-completion (- n)))


<span class="linecomment">;; Replaces `next-completion' (defined in `simple.el').</span>
<span class="linecomment">;; This is similar, except:</span>
<span class="linecomment">;; 1. This highlights the current candidate.</span>
<span class="linecomment">;; 2. This wraps around from first to last and last to first.</span>
<span class="linecomment">;; 3. Properly handles completions laid out vertically.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-move-to-next-completion (n <span class="linecomment">; Bound to `right', `TAB' in `*Completions*'.</span>
                                       &optional no-minibuffer-follow-p)
  "<span class="quote">Move to the next item in the completion list.
With prefix argument N, move N items (negative N means move backward).
Optional second argument, if non-nil, means do not copy the completion
back to the minibuffer.

You can use this command only from buffer `*Completions*' (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-move-to-next-completion]').</span>"
  (interactive "<span class="quote">p</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (setq n  (or n 0))
  (when (eq icicle-completions-format-internal 'vertical)
    (let* ((cols      (icicle-nb-Completions-cols))
           (nb-cands  (length icicle-completion-candidates))
           (rows      (/ nb-cands cols)))
      (unless (zerop (% nb-cands cols)) (setq rows  (1+ rows)))
      (setq n  (icicle-row-wise-cand-nb n nb-cands rows cols))))
  (let ((beg  (icicle-start-of-candidates-in-Completions))
        (end  (point-max)))
 
    <span class="linecomment">;; Forward: n &gt; 0.</span>
    (while (and (&gt; n 0) (not (eobp)))
      (when (get-text-property (point) 'mouse-face) <span class="linecomment">; If in a candidate, move to its end.</span>
        (goto-char (next-single-property-change (point) 'mouse-face nil end)))
      (unless (get-text-property (point) 'mouse-face) <span class="linecomment">; Move to start of next candidate.</span>
        (goto-char (or (next-single-property-change (point) 'mouse-face)
                       beg)))           <span class="linecomment">; Wrap back to first candidate.</span>
      (setq n  (1- n)))

    <span class="linecomment">;; Backward: n &lt; 0.</span>
    (while (and (&lt; n 0) (&gt;= (count-lines 1 (point)) (if icicle-show-Completions-help-flag 3 2)))
      (let ((prop  (get-text-property (1- (point)) 'mouse-face)))
        (when (and prop (eq prop (get-text-property (point) 'mouse-face))) <span class="linecomment">; If in cand, move to start.</span>
          (goto-char (previous-single-property-change (point) 'mouse-face nil beg))))
      (unless (or (&lt; (count-lines 1 (point)) <span class="linecomment">; Move to end of previous candidate.</span>
                     (if icicle-show-Completions-help-flag 3 2))
                  (get-text-property (1- (point)) 'mouse-face))
        (goto-char (or (previous-single-property-change (point) 'mouse-face)
                       end)))           <span class="linecomment">; Wrap back to last candidate.</span>

      <span class="linecomment">;; Move to the start of that candidate.</span>
      (goto-char (previous-single-property-change (point) 'mouse-face nil beg))
      (setq n  (1+ n)))

    (icicle-place-overlay
     (point) (next-single-property-change (point) 'mouse-face nil end)
     'icicle-current-completion-candidate-overlay 'icicle-current-candidate-highlight
     100 (current-buffer)))
  (unless no-minibuffer-follow-p (save-excursion (save-window-excursion (icicle-insert-completion)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-line ()          <span class="linecomment">; Bound to `up' in `*Completions*'.</span>
  "<span class="quote">Move up a line, in `*Completions*' buffer.  Wrap around first to last.
You can use this command only from buffer `*Completions*' (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-previous-line]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (let ((opoint          (point))
        (curr-col        1)
        (next-line-cols  1)
        (eol             (save-excursion (end-of-line) (point))))
    (save-excursion
      (beginning-of-line)
      (while (and (&lt; (point) opoint) (re-search-forward "<span class="quote">[^ ] +</span>" eol t))
        (setq curr-col  (1+ curr-col))))
    (forward-line -1)
    (when (&lt; (point) (icicle-start-of-candidates-in-Completions))
      (goto-char (point-max)) (beginning-of-line)) <span class="linecomment">; Wrap around</span>
    (let ((eol  (save-excursion (end-of-line) (point))))
      (save-excursion
        (beginning-of-line)
        (while (re-search-forward "<span class="quote">[^ ] +[^ ]</span>" eol t) (setq next-line-cols  (1+ next-line-cols)))))
    (if (&gt; curr-col next-line-cols)
        (icicle-move-to-next-completion (1- next-line-cols))
      (icicle-move-to-next-completion (1- curr-col)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-line ()              <span class="linecomment">; Bound to `down' in `*Completions*'.</span>
  "<span class="quote">Move down a line, in `*Completions*' buffer.  Wrap around last to first.
You can use this command only from buffer `*Completions*' (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-next-line]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (let ((opoint          (point))
        (curr-col        1)
        (next-line-cols  1)
        (eol             (save-excursion (end-of-line) (point))))
    (save-excursion
      (beginning-of-line)
      (while (and (&lt; (point) opoint) (re-search-forward "<span class="quote">[^ ] +</span>" eol t))
        (setq curr-col  (1+ curr-col))))
    (forward-line 1)
    (when (eobp) (goto-char (icicle-start-of-candidates-in-Completions))) <span class="linecomment">; Wrap around</span>
    (let ((eol  (save-excursion (end-of-line) (point))))
      (save-excursion
        (beginning-of-line)
        (while (re-search-forward "<span class="quote">[^ ] +[^ ]</span>" eol t) (setq next-line-cols  (1+ next-line-cols)))))
    (if (&gt; curr-col next-line-cols)
        (icicle-move-to-next-completion (1- next-line-cols))
      (icicle-move-to-next-completion (1- curr-col)))))

<span class="linecomment">;; Same as `end-of-line+' in `misc-cmds.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-end-of-line+ (&optional n) <span class="linecomment">; Bound to `C-e' in minibuffer and in `*Completions*'.</span>
  "<span class="quote">Move cursor to end of current line or end of next line if repeated.
This is similar to `end-of-line', but:
  If called interactively with no prefix arg:
     If the previous command was also `end-of-line+', then move to the
     end of the next line.  Else, move to the end of the current line.
  Otherwise, move to the end of the Nth next line (Nth previous line
     if N&lt;0).  Command `end-of-line', by contrast, moves to the end of
     the (N-1)th next line.</span>"
  (interactive
   (list (if current-prefix-arg (prefix-numeric-value current-prefix-arg) 0)))
  (unless n (setq n  0))                <span class="linecomment">; non-interactive with no arg</span>
  (if (and (eq this-command last-command) (not current-prefix-arg))
      (forward-line 1)
    (forward-line n))
  (let ((inhibit-field-text-motion  t)) <span class="linecomment">; Emacs 22+, so we get past the end of the prompt field.</span>
    (end-of-line)))

<span class="linecomment">;; Same as `beginning-of-line+' in `misc-cmds.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-beginning-of-line+ (&optional n) <span class="linecomment">; Bound to `C-a' in minibuffer and in `*Completions*'.</span>
  "<span class="quote">Move cursor to beginning of current line or next line if repeated.
This is the similar to `beginning-of-line', but:
1. With arg N, the direction is the opposite: this command moves
   backward, not forward, N lines.
2. If called interactively with no prefix arg:
      If the previous command was also `beginning-of-line+', then move
      to the beginning of the previous line.  Else, move to the
      beginning of the current line.
   Otherwise, move to the beginning of the Nth previous line (Nth next
      line if N&lt;0).  Command `beginning-of-line', by contrast, moves to
      the beginning of the (N-1)th next line.</span>"
  (interactive
   (list (if current-prefix-arg (prefix-numeric-value current-prefix-arg) 0)))
  (unless n (setq n  0))                <span class="linecomment">; non-interactive with no arg</span>
  (if (and (eq this-command last-command) (not current-prefix-arg))
      (forward-line -1)
    (forward-line (- n)))
  (when (bobp) (goto-char (icicle-minibuffer-prompt-end))))


(put 'icicle-all-candidates-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-action ()  <span class="linecomment">; Bound to `C-!' in minibuffer.</span>
  "<span class="quote">Take action on each completion candidate, in turn.
Apply `icicle-candidate-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-candidate-action-fn' is nil but
`icicle-all-candidates-list-action-fn' is not, then apply the latter
to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-action-fn icicle-candidate-action-fn)
    (error "<span class="quote">No action defined</span>"))
  (if icicle-candidate-action-fn
      (icicle-all-candidates-action-1 icicle-candidate-action-fn nil)
    (icicle-all-candidates-action-1 icicle-all-candidates-list-action-fn t)))


(put 'icicle-all-candidates-alt-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-alt-action () <span class="linecomment">; Bound to `C-|' in minibuffer.</span>
  "<span class="quote">Take alternative action on each completion candidate, in turn.
Apply `icicle-candidate-alt-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-candidate-alt-action-fn' is nil but
`icicle-all-candidates-list-alt-action-fn' is not, then apply the
latter to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-alt-action-fn icicle-candidate-alt-action-fn)
    (error "<span class="quote">No alternative action defined</span>"))
  (if icicle-candidate-alt-action-fn
      (icicle-all-candidates-action-1 icicle-candidate-alt-action-fn nil t) <span class="linecomment">; ALTP flag</span>
    (icicle-all-candidates-action-1 icicle-all-candidates-list-alt-action-fn t)))


(put 'icicle-all-candidates-list-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-list-action () <span class="linecomment">; Bound to `M-!' in minibuffer.</span>
  "<span class="quote">Take action on the list of all completion candidates.
Apply `icicle-all-candidates-list-action-fn' to the list of saved
completion candidates or the list of candidates that match the current
input (a regular expression).

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-action-fn' is nil but
`icicle-candidate-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-list-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-action-fn icicle-candidate-action-fn)
    (error "<span class="quote">No action defined</span>"))
  (if icicle-all-candidates-list-action-fn
      (icicle-all-candidates-action-1 icicle-all-candidates-list-action-fn t)
    (icicle-all-candidates-action-1 icicle-candidate-action-fn nil)))


(put 'icicle-all-candidates-list-alt-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-list-alt-action () <span class="linecomment">; Bound to `M-|' in minibuffer.</span>
  "<span class="quote">Take alternative action on the list of all completion candidates.
Apply `icicle-all-candidates-list-alt-action-fn' to the list of saved
completion candidates or the list of completion candidates that match
the current input (a regular expression).

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-alt-action-fn' is nil but
`icicle-candidate-alt-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-list-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-alt-action-fn icicle-candidate-alt-action-fn)
    (error "<span class="quote">No alternative action defined</span>"))
  (unless icicle-completion-candidates
    (error "<span class="quote">No completion candidates.  Did you use `TAB' or `S-TAB'?</span>"))
  (if icicle-all-candidates-list-alt-action-fn
      (icicle-all-candidates-action-1 icicle-all-candidates-list-alt-action-fn t)
    (icicle-all-candidates-action-1 icicle-candidate-alt-action-fn nil t))) <span class="linecomment">; ALTP flag</span>

(defun icicle-all-candidates-action-1 (fn-var listp &optional altp)
  "<span class="quote">Helper function for `icicle-all-candidates(-alt)-action'.
ALTP is used only if LISTP is nil.
ALTP is passed to `icicle-candidate-action-1'.</span>"
  (let* ((local-saved
          (catch 'i-a-c-a-1
            (dolist (cand  icicle-saved-completion-candidates  icicle-saved-completion-candidates)
              (unless (member cand icicle-completion-candidates) (throw 'i-a-c-a-1 nil)))))
         (candidates                      (or local-saved icicle-completion-candidates))
         (failures                        nil)
         (icicle-minibuffer-message-ok-p  nil) <span class="linecomment">; Avoid delays from `icicle-msg-maybe-in-minibuffer'.</span>
         (icicle-help-in-mode-line-delay  0) <span class="linecomment">; Avoid delays for individual candidate help.</span>
         (icicle-all-candidates-action    t))
    (when local-saved (setq icicle-completion-candidates  local-saved))
    (if listp
        (funcall fn-var candidates)
      (while candidates
        (let ((error-msg  (condition-case act-on-each
                              (icicle-candidate-action-1 fn-var altp (car candidates))
                            (error (error-message-string act-on-each)))))
          (when error-msg (setq failures  (cons (cons (car candidates) error-msg) failures)))
          (setq candidates  (cdr candidates))))
      (when failures
        (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
          (princ "<span class="quote">Action failures:</span>")(terpri)(terpri)
          (mapcar (lambda (entry)
                    (princ (car entry)) (princ "<span class="quote">:</span>") (terpri) (princ "<span class="quote">  </span>")
                    (princ (cdr entry)) (terpri))
                  failures))))))
<span class="linecomment">;; $$$$$$ (icicle-abort-recursive-edit))</span>


(put 'icicle-candidate-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-action ()       <span class="linecomment">; Bound to `C-RET' in minibuffer.</span>
  "<span class="quote">Take action on the current minibuffer-completion candidate.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the current candidate, to perform the action.

If no action is available in the current context, help on the
candidate is shown - see `icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-candidate-action-1 icicle-candidate-action-fn))


(put 'icicle-candidate-alt-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-alt-action ()   <span class="linecomment">; Bound to `C-S-RET' in minibuffer.</span>
  "<span class="quote">Take alternative action on the current completion candidate.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the current candidate, to perform the action.

For many Icicles commands, if `icicle-candidate-alt-action-fn' is nil,
you are prompted to choose an alternative action, using completion.

In any case, any alternative action defined for the current context by
user option `icicle-alternative-actions-alist' always overrides
`icicle-candidate-alt-action'.  That is, if
`icicle-alternative-actions-alist' says to use function `foo', then
Icicles uses `foo' as the alternative action, regardless of the value
of `icicle-candidate-alt-action'.

If no alternative action is available in the current context, help on
the candidate is shown - see `icicle-help-on-candidate'.  

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let ((alt-fn  (or (cdr (assq icicle-cmd-reading-input icicle-alternative-actions-alist))
                     icicle-candidate-alt-action-fn)))
    (icicle-candidate-action-1 alt-fn 'alternative-p)))

(defun icicle-candidate-action-1 (fn-var &optional altp cand)
  "<span class="quote">Helper function for `icicle-candidate(-alt)-action'.
FN-VAR is an Icicles action function or alternative action function.
Optional arg ALTP non-nil means FN-VAR is alternative action function.
Optional arg CAND non-nil means it is the candidate to act on.</span>"
  (when cand (setq icicle-last-completion-candidate  cand))
  (cond ((not fn-var) (icicle-help-on-candidate cand)) <span class="linecomment">; It doesn't `icicle-raise-Completions-frame'.</span>
        ((icicle-require-match-p)
         <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
         (unless (stringp icicle-last-completion-candidate)
           (setq icicle-last-completion-candidate  icicle-current-input
                 last-command                      (if altp
                                                       'icicle-candidate-alt-action
                                                     'icicle-candidate-action))
           (let ((icicle-help-in-mode-line-delay  0)) <span class="linecomment">; Avoid delay for candidate help.</span>
             (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                          'icicle-prefix-candidates
                                        'icicle-apropos-candidates)
                                    (not (eq icicle-current-completion-mode 'prefix)))))

         <span class="linecomment">;; NOTE: We no longer save and restore these things here.</span>
         <span class="linecomment">;; We purposely allow an action function to modify these for subsequent actions.</span>
         <span class="linecomment">;; If you need to save and restore these for a particular action function you define,</span>
         <span class="linecomment">;; then you must do so in the action function itself.  This might be the case, for instance,</span>
         <span class="linecomment">;; if your action function does its own completion (e.g. calls `completing-read'), that is, if</span>
         <span class="linecomment">;; it uses a recursive minibuffer.  (But do not save and restore if you want the side effect.)</span>
         (let (<span class="linecomment">;; (icicle-candidate-nb               icicle-candidate-nb)              ; $$$$$$</span>
               <span class="linecomment">;; (icicle-last-completion-candidate  icicle-last-completion-candidate) ; $$$$$$</span>
               <span class="linecomment">;; (icicle-completion-candidates  icicle-completion-candidates)         ; $$$$$$</span>
               )
           (when icicle-completion-candidates (funcall fn-var icicle-last-completion-candidate)))
         (when (or icicle-use-candidates-only-once-flag
                   (and altp icicle-use-candidates-only-once-alt-p))
           (icicle-remove-candidate-display-others 'all))
         (icicle-raise-Completions-frame))
        (t
         (let ((icicle-last-input         (or cand (icicle-input-from-minibuffer)))
               (icicle-default-directory  icicle-default-directory))
           (when (and (icicle-file-name-input-p) (icicle-file-directory-p icicle-last-input))
             (setq icicle-default-directory  icicle-last-input))
           <span class="linecomment">;; NOTE: We no longer save and restore these things here.</span>
           <span class="linecomment">;; We purposely allow an action function to modify these for subsequent actions.</span>
           <span class="linecomment">;; If you need to save and restore these for a particular action function you define,</span>
           <span class="linecomment">;; then you must do so in the action function itself.  This might be the case, for instance,</span>
           <span class="linecomment">;; if your action function does its own completion (e.g. calls `completing-read'), that is,</span>
           <span class="linecomment">;; uses a recursive minibuffer.  (But do not save and restore if you want the side effect.)</span>
           (let (<span class="linecomment">;; (icicle-candidate-nb               icicle-candidate-nb)              ; $$$$$$</span>
                 <span class="linecomment">;; (icicle-last-completion-candidate  icicle-last-completion-candidate) ; $$$$$$</span>
                 <span class="linecomment">;; (icicle-completion-candidates      icicle-completion-candidates)     ; $$$$$$</span>
                 )
             (funcall fn-var icicle-last-input))
           (when (and (or icicle-use-candidates-only-once-flag
                          (and altp icicle-use-candidates-only-once-alt-p))
                      (equal icicle-last-input
                             (if (icicle-file-name-input-p)
                                 (expand-file-name icicle-last-completion-candidate
                                                   (icicle-file-name-directory icicle-last-input))
                               icicle-last-completion-candidate)))
             (icicle-remove-candidate-display-others 'all))
           (icicle-raise-Completions-frame)))))


<span class="linecomment">;; Bound to `C-down-mouse-2' (`C-mouse-2') in `*Completions*'.</span>
(put 'icicle-mouse-candidate-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-action (event) <span class="linecomment">; `C-mouse-2'</span>
  "<span class="quote">Take action on the completion candidate clicked by `mouse-2'.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.</span>"
  (interactive "<span class="quote">e</span>")
  (icicle-mouse-candidate-action-1 event icicle-candidate-action-fn))


<span class="linecomment">; Bound to `C-S-down-mouse-2' (`C-S-mouse-2') in `*Completions*'.</span>
(put 'icicle-mouse-candidate-alt-action 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-alt-action (event) <span class="linecomment">; `C-S-mouse-2'</span>
  "<span class="quote">Take alternative action on the candidate clicked by `mouse-2'.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.</span>"
  (interactive "<span class="quote">e</span>")
  (icicle-mouse-candidate-action-1 event icicle-candidate-alt-action-fn))

(defun icicle-mouse-candidate-action-1 (event fn-var)
  "<span class="quote">Helper function for `icicle-mouse-candidate(-alt)-action'.</span>"
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((posn-buf  (window-buffer (posn-window (event-start event))))
        (posn-pt   (posn-point (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        choice)
    (read-event)                        <span class="linecomment">; Swallow mouse up event.</span>
    (with-current-buffer posn-buf
      (save-excursion
        (goto-char posn-pt)
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg  (previous-single-property-change beg 'mouse-face)
                end  (or (next-single-property-change end 'mouse-face) (point-max)))
          <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
          <span class="linecomment">;; in `*Completions*'. Add the newline back. `icicle-insert-candidates' puts property</span>
          <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
          <span class="linecomment">;; being just part of the display in columns.</span>
          (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
            (setq end  (1+ end)))
          (setq choice  (if (and (icicle-file-name-input-p) insert-default-directory
                                 (or (not (member (buffer-substring-no-properties beg end)
                                                  icicle-extra-candidates))
                                     icicle-extra-candidates-dir-insert-p))
                            (concat default-directory (buffer-substring-no-properties beg end))
                          <span class="linecomment">;; $$$$$$ (buffer-substring-no-properties beg end))))))</span>
                          (buffer-substring beg end)))
          (remove-text-properties 0 (length choice) '(mouse-face nil) choice))))
    (save-window-excursion
      (select-window (active-minibuffer-window))
      (delete-region (icicle-minibuffer-prompt-end) (point-max))
      (insert choice))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions posn-pt)
          icicle-last-completion-candidate  choice)
    (if (not fn-var)
        (icicle-help-on-candidate)      <span class="linecomment">; Doesn't `icicle-raise-Completions-frame'.</span>

      <span class="linecomment">;; NOTE: We no longer save and restore these things here.</span>
      <span class="linecomment">;; We purposely allow an action function to modify these for subsequent actions.</span>
      <span class="linecomment">;; If you need to save and restore these for a particular action function you define,</span>
      <span class="linecomment">;; then you must do so in the action function itself.  This might be the case, for instance,</span>
      <span class="linecomment">;; if your action function does its own completion (e.g. calls `completing-read'), that is, if</span>
      <span class="linecomment">;; it uses a recursive minibuffer.  (But do not save and restore if you want the side effect.)</span>
      (let (<span class="linecomment">;; (icicle-candidate-nb               icicle-candidate-nb)              ; $$$$$$</span>
            <span class="linecomment">;; (icicle-last-completion-candidate  icicle-last-completion-candidate) ; $$$$$$</span>
            <span class="linecomment">;; (icicle-completion-candidates      icicle-completion-candidates)     ; $$$$$$</span>
            )
        (funcall fn-var icicle-last-completion-candidate))
      (when icicle-use-candidates-only-once-flag (icicle-remove-candidate-display-others 'all))
      (when icicle-completion-candidates (icicle-update-and-next))
      (icicle-raise-Completions-frame posn-col posn-row))))


<span class="linecomment">;; $$$$$ ??? (put 'icicle-remove-candidate 'icicle-action-command t)</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-remove-candidate ()       <span class="linecomment">; Bound to `delete' in minibuffer during completion.</span>
  "<span class="quote">Remove current completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

Note: For Emacs versions prior to 22, this does not really remove a
file-name candidate as a possible candidate.  If you use \\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete] or \\[icicle-apropos-complete],
it will reappear as a possible candidate.

You can use this command only from the minibuffer (`\\[icicle-remove-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-remove-candidate-display-others))


<span class="linecomment">;; $$$$$ ??? (put 'icicle-mouse-remove-candidate 'icicle-action-command t)</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-remove-candidate (event) <span class="linecomment">; Bound to `S-mouse-2' in `*Completions*'.</span>
  "<span class="quote">Remove clicked completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

See `icicle-remove-candidate' for more information.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((posn-buf  (window-buffer (posn-window (event-start event))))
        (posn-pt   (posn-point (event-start event)))
        beg end)
    (read-event)                        <span class="linecomment">; Swallow mouse up event.</span>
    (with-current-buffer posn-buf
      (save-excursion
        (goto-char posn-pt)
        (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
          (setq end  (point)
                beg  (1+ (point))))
        (unless beg (error "<span class="quote">No completion here</span>"))
        (setq beg  (previous-single-property-change beg 'mouse-face)
              end  (or (next-single-property-change end 'mouse-face) (point-max)))
        <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
        <span class="linecomment">;; in `*Completions*'. Add the newline back. `icicle-insert-candidates' puts property</span>
        <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
        <span class="linecomment">;; being just part of the display in columns.</span>
        (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
          (setq end  (1+ end)))
        (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions posn-pt)
              icicle-last-completion-candidate  (buffer-substring beg end)))))
  (icicle-remove-candidate-display-others))

(defun icicle-remove-candidate-display-others (&optional allp)
  "<span class="quote">Remove current completion candidate from list of possible candidates.
Redisplay `*Completions*', unless there is only one candidate left.
Non-nil optional argument ALLP means remove all occurrences of the
current candidate.  Otherwise (nil) means remove only the current
occurrence.</span>"
  (unless (stringp icicle-last-completion-candidate)
    (setq icicle-last-completion-candidate  icicle-current-input
          last-command                      'icicle-delete-candidate-object)
    (let ((icicle-help-in-mode-line-delay  0)) <span class="linecomment">; Avoid delay for candidate help.</span>
      (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                   'icicle-prefix-candidates
                                 'icicle-apropos-candidates)
                             (not (eq icicle-current-completion-mode 'prefix)))))
  (let ((maybe-mct-cand  (cond ((consp minibuffer-completion-table)
                                (icicle-mctized-display-candidate icicle-last-completion-candidate))
                               ((arrayp minibuffer-completion-table)
                                (intern icicle-last-completion-candidate))
                               (t
                                icicle-last-completion-candidate))))
    (icicle-remove-cand-from-lists icicle-last-completion-candidate maybe-mct-cand allp))
  (icicle-update-and-next))


(put 'icicle-delete-candidate-object 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-candidate-object (&optional allp) <span class="linecomment">; Bound to `S-delete' in minibuffer.</span>
  "<span class="quote">Delete the object named by the current completion candidate.
With a prefix argument, delete *ALL* objects named by the current set
of candidates, after confirmation.

Do nothing if `icicle-deletion-action-flag' is nil.

Otherwise:

* If the value of variable `icicle-delete-candidate-object' is a
  function, then apply it to the current completion candidate.  This
  should delete some object named by the completion candidate.

* If `icicle-delete-candidate-object' is not a function, then it
  should be a symbol bound to an alist.  In this case, invoke
  `icicle-delete-candidate-object' to delete the object named by the
  current completion candidate from that alist.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-delete-candidate-object]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when icicle-deletion-action-flag
    (if (null icicle-completion-candidates)
        (message "<span class="quote">Nothing to delete - use `S-TAB', `TAB', or a cycle key</span>")
      (if allp
          (if (not (let ((icicle-completion-candidates  icicle-completion-candidates))
                     (yes-or-no-p "<span class="quote">Are you SURE you want to DELETE ALL of the matching objects? </span>")))
              (message "<span class="quote">OK, nothing deleted</span>")
            (dolist (cand icicle-completion-candidates) (icicle-delete-candidate-object-1 cand t))
            (icicle-erase-minibuffer))
        <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
        (unless (stringp icicle-last-completion-candidate)
          (setq icicle-last-completion-candidate  icicle-current-input
                last-command                      'icicle-delete-candidate-object)
          (let ((icicle-help-in-mode-line-delay  0)) <span class="linecomment">; Avoid delay for candidate help.</span>
            (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                         'icicle-prefix-candidates
                                       'icicle-apropos-candidates)
                                   (not (eq icicle-current-completion-mode 'prefix)))))
        (icicle-delete-candidate-object-1 icicle-last-completion-candidate)))))

(defun icicle-delete-candidate-object-1 (cand &optional no-display-p)
  "<span class="quote">Helper function for `icicle-delete-candidate-object'.
Delete object named CAND.
Optional arg NO-DISPLAY-P non-nil means don't update `*Completions*'.</span>"
  (let ((display-cand  cand)            <span class="linecomment">; Use local vars: values might change.</span>
        (maybe-mct-cand
         (cond ((consp minibuffer-completion-table) (icicle-mctized-display-candidate cand))
               ((arrayp minibuffer-completion-table) (intern cand))
               (t cand))))
    (save-selected-window
      (let ((icicle-completion-candidates  icicle-completion-candidates)) <span class="linecomment">; In case recursive minibuf.</span>
        (if (functionp icicle-delete-candidate-object)
            (funcall icicle-delete-candidate-object cand)
          (icicle-delete-current-candidate-object cand))))
    (icicle-remove-cand-from-lists display-cand maybe-mct-cand nil) <span class="linecomment">; Use local vars.</span>
    (unless no-display-p (message "<span class="quote">Deleted object named: `%s'</span>" display-cand) (sit-for 1.0)))
  (unless no-display-p (icicle-update-and-next))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-delete-current-candidate-object (&optional cand)
  "<span class="quote">Delete the object(s) corresponding to the current completion candidate.
The value of `icicle-delete-candidate-object' must be a symbol
\(variable) that is bound to a list of completion-candidate objects.

The entries in the list must be completion candidates for the current
call to `completing-read', but the list itself need not be the
COLLECTION argument to `completing-read'.  For example, the list might
be a list of symbols, and the COLLECTION argument might be an obarray
that contains those symbols.

The list can be an alist, a list of strings, or a list of symbols.
Delete, from this list, the objects that correspond to the current
completion candidate.  If the variable is also a user option, then
save the option, after deleting the candidate object.

The full candidate object is what is deleted.  If the list contains
multiple identical objects that correspond to the current completion
candidate, they are all deleted.</span>"
  (setq cand  (or cand icicle-last-completion-candidate))
  (let ((val  (and (symbolp icicle-delete-candidate-object)
                   (symbol-value icicle-delete-candidate-object))))
    <span class="linecomment">;; The message could more accurately say "Value of `icicle-delete-candidate-object' must be</span>
    <span class="linecomment">;; a symbol bound to a list", but this makes more sense.</span>
    (unless (and val (consp val)) (error "<span class="quote">Cannot delete candidate objects now</span>"))
    (set icicle-delete-candidate-object <span class="linecomment">; Update the variable.</span>
         (cond ((or icicle-whole-candidate-as-text-prop-p icicle-candidates-alist)
                (delete (funcall icicle-get-alist-candidate-function cand) val))
               ((consp (car val))
                (icicle-assoc-delete-all cand val))
               ((stringp (car val)) (delete cand val))
               ((symbolp (car val)) (delete (intern cand) val))
               (t (error "<span class="quote">Entry in list value of `icicle-delete-candidate-object' is \
not a cons, string, or symbol</span>")))))
  (when (user-variable-p icicle-delete-candidate-object) <span class="linecomment">; Save the new user-option value.</span>
    (funcall icicle-customize-save-variable-function
             icicle-delete-candidate-object
             (symbol-value icicle-delete-candidate-object))))

(defun icicle-remove-cand-from-lists (disp-cand mct-cand allp)
  "<span class="quote">Delete first occurence or all occurences of candidate.
The appropriate form of the candidate is removed from each of these:
 `icicle-candidates-alist'
 `icicle-completion-candidates'
 `minibuffer-completion-table' (if it is an alist)
DISP-CAND is the display form of the candidate to delete.
MCT-CAND is the MCT alist candidate that corresponds to DISP-CAND.
If any of these conditions is true, remove all occurrences of CAND:
 * ALLP is non-nil
 * `icicle-transform-function' is `icicle-remove-duplicates'
 * `icicle-transform-function' is `icicle-remove-dups-if-extras'
   and `icicle-extra-candidates' is non-nil</span>"
  (setq allp  (or allp (eq icicle-transform-function 'icicle-remove-duplicates)
                  (and (eq icicle-transform-function 'icicle-remove-dups-if-extras)
                       icicle-extra-candidates)))
  (when icicle-candidates-alist
    (setq icicle-candidates-alist
          (if allp
              (icicle-assoc-delete-all disp-cand icicle-candidates-alist)
            (delete (funcall icicle-get-alist-candidate-function disp-cand) icicle-candidates-alist))))
  (when (consp icicle-completion-candidates)
    (setq icicle-completion-candidates
          (if allp                      <span class="linecomment">; Delete only the first occurrence, or all if ALLP.</span>
              (delete disp-cand icicle-completion-candidates)
            (icicle-delete-count disp-cand icicle-completion-candidates 1))))

  <span class="linecomment">;; Update `minibuffer-completion-predicate' or `read-file-name-predicate'</span>
  <span class="linecomment">;; to effectively remove this candidate.</span>
  <span class="linecomment">;; The logic here is the same as for `icicle-narrow-candidates-with-predicate'.</span>
  (cond (<span class="linecomment">;; File name input, Emacs 22+.  Update `read-file-name-predicate'.</span>
         (and (icicle-file-name-input-p) (&gt; emacs-major-version 21))
         (setq read-file-name-predicate
               (if read-file-name-predicate
                   (lexical-let ((curr-pred  read-file-name-predicate))
                     `(lambda (file-cand)
                       (and (not (equal ',disp-cand file-cand)) (funcall ',curr-pred file-cand))))
                 `(lambda (file-cand) (not (equal ',disp-cand file-cand))))))

        <span class="linecomment">;; File name input, Emacs 20 or 21.  We can do nothing for file name.</span>
        <span class="linecomment">;; `TAB' or `S-TAB' will bring it back as a candidate.</span>
        ((icicle-file-name-input-p))

        (t<span class="linecomment">;; Non-file name input, all Emacs versions.  Update `minibuffer-completion-predicate'.</span>
         (setq minibuffer-completion-predicate
               (if minibuffer-completion-predicate
                   <span class="linecomment">;; Add excluding of candidate to the existing predicate.</span>
                   (lexical-let ((curr-pred  minibuffer-completion-predicate))
                     `(lambda (cand)    <span class="linecomment">; This corresponds to what we do in `icicle-mctize-all'.</span>
                       (and (not (equal cand ',(if (and (consp mct-cand) (stringp (car mct-cand)))
                                                   (cdr mct-cand)
                                                   mct-cand)))
                        (funcall ',curr-pred cand))))
                 <span class="linecomment">;; Set predicate to excluding the candidate.</span>
                 `(lambda (cand) (not (equal cand ',(if (and (consp mct-cand) (stringp (car mct-cand)))
                                                        (cdr mct-cand)
                                                        mct-cand)))))))))

<span class="linecomment">;; $$$$$$$$$$$$ COULD USE THIS INSTEAD of updating the predicate,</span>
<span class="linecomment">;; but it works only when `minibuffer-completion-table' is an alist.</span>
<span class="linecomment">;;   (when (consp minibuffer-completion-table)</span>
<span class="linecomment">;;     (setq minibuffer-completion-table</span>
<span class="linecomment">;;           (if allp</span>
<span class="linecomment">;;               (delete mct-cand minibuffer-completion-table)</span>
<span class="linecomment">;;             (icicle-delete-count mct-cand minibuffer-completion-table 1)))))</span>

(defun icicle-update-and-next ()
  "<span class="quote">Update `*Completions*' and make next candidate current.
If we don't know which candidate number this is, just display.</span>"
  (cond ((and icicle-completion-candidates (cdr icicle-completion-candidates) <span class="linecomment">; &gt; 1 candidates left.</span>
              (not (input-pending-p)))  <span class="linecomment">; Do nothing if user hit another key.</span>
         (icicle-maybe-sort-and-strip-candidates)
         (message "<span class="quote">Displaying completion candidates...</span>")
         (save-selected-window (icicle-display-candidates-in-Completions))
         (when (wholenump icicle-candidate-nb)
           (with-current-buffer "<span class="quote">*Completions*</span>"
             (goto-char (icicle-start-of-candidates-in-Completions))
             (icicle-move-to-next-completion
              (mod icicle-candidate-nb (length icicle-completion-candidates)))
             (set-window-point (get-buffer-window "<span class="quote">*Completions*</span>" 0) (point))
             (setq icicle-last-completion-candidate  (icicle-current-completion-in-Completions))
             (set-buffer-modified-p nil))))
        (icicle-completion-candidates   <span class="linecomment">; Single candidate left</span>
         (save-selected-window (icicle-remove-Completions-window))
         (let ((completion  (icicle-transform-multi-completion (car icicle-completion-candidates))))
           (select-window (active-minibuffer-window))
           (with-current-buffer (window-buffer) <span class="linecomment">; Needed if `*Completions*' redirected to minibuffer.</span>
             (goto-char (icicle-minibuffer-prompt-end))
             (icicle-clear-minibuffer)
             (insert (if (and (icicle-file-name-input-p) insert-default-directory
                              (or (not (member icicle-current-input icicle-extra-candidates))
                                  icicle-extra-candidates-dir-insert-p))
                         (icicle-file-name-directory-w-default icicle-current-input)
                       "<span class="quote"></span>")
                     completion))))
        (t                              <span class="linecomment">; No candidates left</span>
         <span class="linecomment">;; $$$$$$$$ `icicle-abort-recursive-edit' and `exit-recursive-edit' don't work,</span>
         <span class="linecomment">;; because they take us back to top level.</span>
         <span class="linecomment">;; $$$$ DO NOTHING? Do (icicle-remove-Completions-window)? Do (icicle-erase-minibuffer)?</span>
         (icicle-erase-minibuffer))))


(put 'icicle-mouse-help-on-candidate 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-help-on-candidate (event) <span class="linecomment">; Bound to `C-M-mouse-2' in minibuffer.</span>
  "<span class="quote">Display help on the minibuffer-completion candidate clicked by mouse.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((icicle-candidate-action-fn  nil)) (icicle-mouse-candidate-action event)))


<span class="linecomment">;; Free vars here: `icicle-orig-buff' is bound in `icicle-complete-keys'.</span>
<span class="linecomment">;;                 `icicle-complete-keys-alist' is bound in `icicles-var.el'.</span>
(put 'icicle-help-on-candidate 'icicle-action-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-candidate (&optional cand) <span class="linecomment">; Bound to `C-M-RET', `C-help', `C-f1' in minibuffer,</span>
                                        <span class="linecomment">; and to `C-M-RET' in *Completions.</span>
  "<span class="quote">Display help on the current minibuffer-completion candidate.
The help displayed depends on the type of candidate, as follows:

 menu item - the corresponding command is described using
             `describe-function' (only if `lacarte.el' is loaded)
 command or other function - described using `describe-function'
 keymap variable - described using `describe-keymap'
                   (if available - see library `help-fns+.el')
 user option or other variable - described using `describe-variable'
 face - described using `describe-face'
 command abbreviation - described using `apropos-command' for matches
 property list - described using `apropos-describe-plist'
 buffer name - modes described using `describe-mode' (Emacs &gt; 20)
 file name - file properties described

If the same candidate names a function, a variable, and a face, or any
two of these, then all such documentation is shown (Emacs 22+).

In the minibuffer, you can also use `C-M-down', `C-M-up',
`C-M-wheel-down', `C-M-wheel-up', `C-M-next', `C-M-prior', `C-M-end',
and `C-M-home', to display help on the candidate and then move to the
next or previous candidate.  See, for example,
`icicle-help-on-next-apropos-candidate'.

You can use this command only from the minibuffer or `*Completions*'
\(`\\[icicle-help-on-candidate]').</span>"
  (interactive)                         <span class="linecomment">; Interactively, just describes itself.</span>
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (let ((frame-with-focus  (selected-frame))
        (cand-symb         nil)
        transformed-cand)
    (cond (cand (setq icicle-last-completion-candidate  cand))
          ((eq (current-buffer) (get-buffer "<span class="quote">*Completions*</span>"))
           (setq icicle-last-completion-candidate  (icicle-current-completion-in-Completions)))
          <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
          ((not (stringp icicle-last-completion-candidate))
           (setq icicle-last-completion-candidate  icicle-current-input
                 last-command                      'icicle-help-on-candidate)
           (let ((icicle-help-in-mode-line-delay  0)) <span class="linecomment">; Avoid delay for candidate help.</span>
             (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                          'icicle-prefix-candidates
                                        'icicle-apropos-candidates)
                                    (not (eq icicle-current-completion-mode 'prefix))))))
    (cond (<span class="linecomment">;; Use special help function.</span>
           icicle-candidate-help-fn
           (funcall icicle-candidate-help-fn icicle-last-completion-candidate))

          (<span class="linecomment">;; Call to `lacarte-execute(-menu)-command' (defined in `lacarte.el').</span>
           <span class="linecomment">;; Use command associated with menu item.</span>
           (consp lacarte-menu-items-alist) <span class="linecomment">; `lacarte-menu-items-alist' is in `lacarte.el'.</span>
           (setq cand-symb  (cdr (assoc icicle-last-completion-candidate lacarte-menu-items-alist)))
           (if cand-symb
               (icicle-help-on-candidate-symbol cand-symb)
             (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>"))) <span class="linecomment">; Menu item with lambda definition.</span>

          (<span class="linecomment">;; A key-completion candidate.  Get the true command from the candidate.</span>
           icicle-completing-keys-p
           (save-match-data
             (string-match "<span class="quote">\\(.+\\)  =  \\(.+\\)</span>" icicle-last-completion-candidate)
             (setq cand-symb  (intern-soft (substring icicle-last-completion-candidate
                                                      (match-beginning 2) (match-end 2))))
             (cond ((eq '\.\.\. cand-symb) <span class="linecomment">; Prefix key - describe its binding.</span>
                    (with-current-buffer icicle-orig-buff
                      (describe-key (car-safe
                                     (cdr-safe
                                      (assq (intern-soft
                                             (substring icicle-last-completion-candidate
                                                        (match-beginning 0) (match-end 0)))
                                            icicle-complete-keys-alist))))))
                   (cand-symb (icicle-help-on-candidate-symbol cand-symb)) <span class="linecomment">; Describe key's command.</span>
                   (t (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>")))))

          (t<span class="linecomment">;; Transform candidate, in case it's a multi-completion.</span>
           (setq transformed-cand  (icicle-transform-multi-completion
                                    icicle-last-completion-candidate))
           <span class="linecomment">;; If buffer or file, describe its properties.  Otherwise, create symbol and get its help.</span>
           (cond ((and (bufferp (get-buffer transformed-cand))
                       (with-current-buffer transformed-cand (describe-mode) t)))
                 ((file-exists-p transformed-cand) (icicle-describe-file transformed-cand
                                                                         current-prefix-arg))
                 (t (icicle-help-on-candidate-symbol (intern transformed-cand))))))
    <span class="linecomment">;;$$$ (icicle-raise-Completions-frame)</span>

    <span class="linecomment">;; This is a hack for MS Windows - otherwise, we can't continue to get more candidates,</span>
    <span class="linecomment">;; because the *Help* frame takes the focus away from the minibuffer frame.</span>
    <span class="linecomment">;; MS Windows always gives focus to a newly created frame - in this case, *Help*.</span>
    (let* ((help-window  (get-buffer-window "<span class="quote">*Help*</span>" 0))
           (help-frame   (and help-window (window-frame help-window))))
      (when help-frame (redirect-frame-focus help-frame frame-with-focus))))
  (message nil))                        <span class="linecomment">; Let minibuffer contents show immediately.</span>

(defun icicle-help-on-candidate-symbol (symb)
  "<span class="quote">Helper function for `icicle-help-on-candidate'.  The arg is a symbol.</span>"
  (cond ((and (fboundp 'describe-keymap) (boundp symb) (keymapp (symbol-value symb)))
         (describe-keymap symb))
        ((and (fboundp 'help-follow-symbol) <span class="linecomment">; Emacs 22+</span>
              (or (fboundp symb) (boundp symb) (facep symb)))
         (with-current-buffer (get-buffer-create "<span class="quote">*Help*</span>")
           <span class="linecomment">;; $$$$$$ (let ((help-xref-following  t)) (help-xref-interned symb)))</span>
           (help-xref-interned symb))
         (when (fboundp 'fit-frame-if-one-window)
           (save-selected-window (select-window (get-buffer-window "<span class="quote">*Help*</span>" 'visible))
                                 (fit-frame-if-one-window))))
        ((fboundp symb) (describe-function symb))
        ((boundp symb) (describe-variable symb))
        ((facep symb) (describe-face symb))
        ((assq symb (mapcar #'cdr icicle-command-abbrev-alist))
         (let ((regexp  (icicle-command-abbrev-regexp symb))) (apropos-command regexp)))
        ((symbol-plist symb) (apropos-describe-plist symb))
        (t
         (setq symb  (symbol-name symb)) <span class="linecomment">; Convert symbol to string, and try some more.</span>
         (cond ((and (bufferp (get-buffer symb))
                     (with-current-buffer (get-buffer symb) (describe-mode) t)))
               ((file-exists-p symb) (icicle-describe-file symb current-prefix-arg))
               (t (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>"))))))

<span class="linecomment">;; This is the same as `describe-file' in `help-fns+.el', but we avoid requiring that library.</span>
<span class="linecomment">;; This is a top-level command, but we put it here to avoid library require cycles.</span>
(if (and (not (fboundp 'icicle-describe-file)) (fboundp 'describe-file))
    (defalias 'icicle-describe-file (symbol-function 'describe-file))
  (defun icicle-describe-file (filename &optional internal-form-p) <span class="linecomment">; Suggestion: bind to `C-h M-f'.</span>
    "<span class="quote">Describe the file named FILENAME.
If FILENAME is nil, describe current directory (`default-directory').

Starting with Emacs 22, if the file is an image file then:
 * Show a thumbnail of the image as well.
 * If you have command-line tool `exiftool' installed and in your
   `$PATH' or `exec-path', then show EXIF data (metadata) about the
   image.  See standard Emacs library `image-dired.el' for more
   information about `exiftool'.

If FILENAME is the name of an autofile bookmark and you use library
`Bookmark+', then show also the bookmark information (tags etc.).  In
this case, a prefix arg shows the internal form of the bookmark.</span>"
    (interactive "<span class="quote">FDescribe file: \nP</span>")
    (unless filename (setq filename default-directory))
    (help-setup-xref `(icicle-describe-file ,filename ,internal-form-p) (interactive-p))
    (let ((attrs (file-attributes filename))
          <span class="linecomment">;; Functions `bmkp-*' are defined in `bookmark+.el'.</span>
          (bmk   (and (fboundp 'bmkp-get-autofile-bookmark)  (bmkp-get-autofile-bookmark filename))))
      (unless attrs (error(format "<span class="quote">Cannot open file `%s'</span>" filename)))
      (let* ((type            (nth 0 attrs))
             (numlinks        (nth 1 attrs))
             (uid             (nth 2 attrs))
             (gid             (nth 3 attrs))
             (last-access     (nth 4 attrs))
             (last-mod        (nth 5 attrs))
             (last-status-chg (nth 6 attrs))
             (size            (nth 7 attrs))
             (permissions     (nth 8 attrs))
             <span class="linecomment">;; Skip 9: t iff file's gid would change if file were deleted and recreated.</span>
             (inode           (nth 10 attrs))
             (device          (nth 11 attrs))
             (thumb-string    (and (fboundp 'image-file-name-regexp) <span class="linecomment">; In `image-file.el' (Emacs 22+).</span>
                                   (if (fboundp 'string-match-p)
                                       (string-match-p (image-file-name-regexp) filename)
                                     (save-match-data
                                       (string-match (image-file-name-regexp) filename)))
                                   (if (fboundp 'display-graphic-p) (display-graphic-p) window-system)
                                   (require 'image-dired nil t)
                                   (image-dired-get-thumbnail-image filename)
                                   (apply #'propertize "<span class="quote">XXXX</span>"
                                          `(display ,(append (image-dired-get-thumbnail-image filename)
                                                             '(:margin 10))
                                            rear-nonsticky (display)
                                            mouse-face highlight
                                            follow-link t
                                            help-echo "<span class="quote">`mouse-2' or `RET': Show full image</span>"
                                            keymap
                                            (keymap
                                             (mouse-2 . (lambda (e) (interactive "<span class="quote">e</span>")
                                                                (find-file ,filename)))
                                             (13 . (lambda () (interactive)
                                                           (find-file ,filename))))))))
             (image-info      (and (require 'image-dired nil t)
                                   (fboundp 'image-file-name-regexp)
                                   (if (fboundp 'string-match-p)
                                       (string-match-p (image-file-name-regexp) filename)
                                     (save-match-data
                                       (string-match (image-file-name-regexp) filename)))
                                   (progn (message "<span class="quote">Gathering image data...</span>") t)
                                   (condition-case nil
                                       (let ((all  (icicle-all-exif-data (expand-file-name filename))))
                                         (concat
                                          (and all (not (zerop (length all)))
                                               (format "<span class="quote">\nImage Data (EXIF)\n-----------------\n%s</span>"
                                                       all))))
                                     (error nil))))
             (help-text
              (concat
               (format "<span class="quote">`%s'\n%s\n\n</span>" filename (make-string (+ 2 (length filename)) ?-))
               (format "<span class="quote">File Type:                       %s\n</span>"
                       (cond ((eq t type) "<span class="quote">Directory</span>")
                             ((stringp type) (format "<span class="quote">Symbolic link to `%s'</span>" type))
                             (t "<span class="quote">Normal file</span>")))
               (format "<span class="quote">Permissions:                %s\n</span>" permissions)
               (and (not (eq t type)) (format "<span class="quote">Size in bytes:              %g\n</span>" size))
               (format-time-string
                "<span class="quote">Time of last access:        %a %b %e %T %Y (%Z)\n</span>" last-access)
               (format-time-string
                "<span class="quote">Time of last modification:  %a %b %e %T %Y (%Z)\n</span>" last-mod)
               (format-time-string
                "<span class="quote">Time of last status change: %a %b %e %T %Y (%Z)\n</span>" last-status-chg)
               (format "<span class="quote">Number of links:            %d\n</span>" numlinks)
               (format "<span class="quote">User ID (UID):              %s\n</span>" uid)
               (format "<span class="quote">Group ID (GID):             %s\n</span>" gid)
               (format "<span class="quote">Inode:                      %S\n</span>" inode)
               (format "<span class="quote">Device number:              %s\n</span>" device)
               image-info)))
        (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
          (when bmk (if internal-form-p
              (let* ((bname     (bookmark-name-from-full-record bmk))
                     (bmk-defn  (format "<span class="quote">Bookmark `%s'\n%s\n\n%s</span>"
                                        bname   (make-string (+ 11 (length bname)) ?-)
                                        (pp-to-string bmk))))
                (princ bmk-defn) (terpri) (terpri))
            (princ (bmkp-bookmark-description bmk 'NO-IMAGE)) (terpri) (terpri)))
        (princ help-text))
      (when thumb-string
        (with-current-buffer "<span class="quote">*Help*</span>"
          (save-excursion
            (goto-char (point-min))
            (let ((buffer-read-only  nil))
              (when (re-search-forward "<span class="quote">Device number:.+\n</span>" nil t) (insert thumb-string))))))
      help-text))))                   <span class="linecomment">; Return displayed text.</span>

<span class="linecomment">;; This is the same as `help-all-exif-data' in `help-fns+.el', but we avoid requiring that library.</span>
(defun icicle-all-exif-data (file)
  "<span class="quote">Return all EXIF data from FILE, using command-line tool `exiftool'.</span>"
  (with-temp-buffer
    (delete-region (point-min) (point-max))
    (unless (eq 0 (call-process shell-file-name nil t nil shell-command-switch
                                (format "<span class="quote">exiftool -All \"%s\"</span>" file)))
      (error "<span class="quote">Could not get EXIF data</span>"))
    (buffer-substring (point-min) (point-max))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-read-fn-invoke () <span class="linecomment">; Bound to `M-RET' in minibuffer.</span>
  "<span class="quote">Read function name.  Invoke function on current completion candidate.
Set `icicle-candidate-action-fn' to the interned name.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-read-fn-invoke]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
  (unless (stringp icicle-last-completion-candidate)
    (setq icicle-last-completion-candidate  icicle-current-input
          last-command                      'icicle-candidate-action)
    (let ((icicle-help-in-mode-line-delay  0)) <span class="linecomment">; Avoid delay for candidate help.</span>
      (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                   'icicle-prefix-candidates
                                 'icicle-apropos-candidates)
                             (not (eq icicle-current-completion-mode 'prefix)))))
  (let ((icicle-whole-candidate-as-text-prop-p  nil)
        (enable-recursive-minibuffers            t)
        (icicle-must-pass-after-match-predicate  #'(lambda (s) (functionp (intern s))))
        (icicle-saved-completion-candidate       icicle-last-completion-candidate)
        (icicle-candidate-action-fn              'icicle-apply-to-saved-candidate))
    (icicle-apply-to-saved-candidate
     (completing-read (format "<span class="quote">Function to apply to `%s': </span>" icicle-saved-completion-candidate)
                      obarray))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-read-fn-invoke (event) <span class="linecomment">; Bound to `M-mouse-2' in `*Completions*'.</span>
  "<span class="quote">Read function name.  Invoke function on candidate clicked by mouse.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let (<span class="linecomment">;;$$$$$$ (buffer    (window-buffer))</span>
        (posn-win  (posn-window (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        choice base-size)
    <span class="linecomment">;; (read-event)                 ; Swallow mouse up event. $$ Not needed if bound to up event.</span>
    (with-current-buffer (window-buffer posn-win)
      (save-excursion
        <span class="linecomment">;; $$$$$$ (when completion-reference-buffer (setq buffer  completion-reference-buffer))</span>
        (setq base-size  completion-base-size)
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg     (previous-single-property-change beg 'mouse-face)
                end     (or (next-single-property-change end 'mouse-face)(point-max))
                choice  (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions
                                             (posn-point (event-start event)))
          icicle-last-completion-candidate  choice)
    (let ((icicle-whole-candidate-as-text-prop-p  nil)
          (enable-recursive-minibuffers            t)
          (icicle-must-pass-after-match-predicate  #'(lambda (s) (functionp (intern s))))
          (icicle-saved-completion-candidate       icicle-last-completion-candidate)
          (icicle-candidate-action-fn              'icicle-apply-to-saved-candidate))
      (icicle-apply-to-saved-candidate
       (completing-read (format "<span class="quote">Function to apply to `%s': </span>" icicle-saved-completion-candidate)
                        obarray)))))

(defun icicle-apply-to-saved-candidate (function &optional use-icicle-candidates-alist-p type)
  "<span class="quote">Apply FUNCTION to `icicle-saved-completion-candidate'.
If `current-prefix-arg' is non-nil, then pretty-print the result using
`icicle-pp-eval-expression'.
The string FUNCTION is read to obtain the real function to apply.
If optional arg USE-ICICLE-CANDIDATES-ALIST-P is non-nil, then try to
get the real function using `icicle-get-alist-candidate-function'.
If that returns nil, then read string FUNCTION.
Optional arg TYPE is the type of object that FUNCTION applies to.</span>"
  (let ((real-fn   (or (and use-icicle-candidates-alist-p
                            (cdr (funcall icicle-get-alist-candidate-function
                                          function 'no-error-no-msg)))
                       (car (read-from-string function))))
        (real-obj  (if (equal type "<span class="quote">buffer</span>") <span class="linecomment">; $$$$$$$ Eventually, perhaps look up TYPE in a list etc.</span>
                       (get-buffer icicle-saved-completion-candidate)
                     icicle-saved-completion-candidate)))
    <span class="linecomment">;; Actually, we should test more than `functionp', to rule out macros and special forms.</span>
    (unless (functionp real-fn) (error "<span class="quote">Not a function: `%S'</span>" real-fn))
    (condition-case icicle-apply-to-saved-candidate
        (if current-prefix-arg
            (icicle-pp-eval-expression '(funcall real-fn real-obj))
          (funcall real-fn real-obj)
          (when (and (not icicle-all-candidates-action) (current-message))
            (sit-for 3)))               <span class="linecomment">; In case the function displays a message.</span>
      (error (message  (format "<span class="quote">ERROR invoking `%S' on `%s': %s</span>" real-fn
                               icicle-saved-completion-candidate
                               (error-message-string icicle-apply-to-saved-candidate)))
             (sleep-for 6)))
    (select-window (minibuffer-window))
    (select-frame-set-input-focus (selected-frame))
    (icicle-raise-Completions-frame)))

(defun icicle-raise-Completions-frame (&optional mouse-col mouse-row)
  "<span class="quote">Raise `*Completions*' frame, if displayed.
This helps keep `*Completions*' on top.

If `icicle-Completions-frame-at-right-flag' is non-nil and
`*Completions*' is in its own frame, then move that frame to the
right, out of the way.

Non-nil optional args MOUSE-COL and MOUSE-ROW move the mouse pointer
to column MOUSE-COL and row MOUSE-ROW.  Do this because
`icicle-candidate-action-fn' can call `select-frame-set-input-focus',
which can position mouse pointer on a standalone minibuffer frame.</span>"
  <span class="linecomment">;; Raise `*Completions*' frame, if displayed.  This helps keep `*Completions*' on top.</span>
  (let ((compl-win  (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)))
    (when compl-win
      (save-window-excursion
        (select-window compl-win)
        <span class="linecomment">;; Move frame to the right, out of the way.</span>
        (when (and (one-window-p t) icicle-Completions-frame-at-right-flag)
          (modify-frame-parameters
           (selected-frame)             <span class="linecomment">; Hard-code 7 here - what does it depend on?</span>
           `((left . ,(- (x-display-pixel-width) (+ (frame-pixel-width) 7)))))
          (raise-frame)
          (when (and (integerp mouse-col) (integerp mouse-row))
            (set-mouse-position (selected-frame) mouse-col mouse-row)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-Completions-mouse-3-menu (event) <span class="linecomment">; Bound to `C-mouse-3' in `*Completions*'.</span>
  "<span class="quote">Pop-up menu on `C-mouse-3' for the current candidate in `*Completions*'.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let (<span class="linecomment">;; $$$$$$ (buffer    (window-buffer))</span>
        (posn-win  (posn-window (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        candidate base-size)
    <span class="linecomment">;; (read-event)                 ; Swallow mouse up event. $$ Not needed if bound to up event.</span>
    (with-current-buffer (window-buffer posn-win)
      (save-excursion
        <span class="linecomment">;; $$$$$$ (when completion-reference-buffer (setq buffer  completion-reference-buffer))</span>
        (setq base-size  completion-base-size)
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg       (previous-single-property-change beg 'mouse-face)
                end       (or (next-single-property-change end 'mouse-face)(point-max))
                candidate (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions
                                             (posn-point (event-start event)))
          icicle-last-completion-candidate  candidate)
    (let* ((menus   `((keymap "<span class="quote">Completion</span>" ,@(icicle-substitute-keymap-vars
                                              icicle-Completions-mouse-3-menu-entries))))
           (choice  (x-popup-menu event menus)))
      (icicle-Completions-popup-choice menus choice))))

(defun icicle-substitute-keymap-vars (menu-entries)
  "<span class="quote">In MENU-ENTRIES, replace keymap vars by their values.</span>"
  (let ((new  ()))
    (dolist (jj  menu-entries)
      (cond ((and (symbolp jj) (keymapp (symbol-value jj))) <span class="linecomment">; Just a keymap var.</span>
             (setq jj  (symbol-value jj))
             (dolist (ii  jj) (push ii new)))
            <span class="linecomment">;; (SYMBOL menu-item NAME MENU-KEYMAP . KEYWORDS), with a keymap var.</span>
            ((and (consp jj) (symbolp (car jj)) (eq 'menu-item (cadr jj))
                  (stringp (car (cddr jj))) (symbolp (car (cdr (cddr jj))))
                  (not (commandp (car (cdr (cddr jj))))) (boundp (car (cdr (cddr jj))))
                  (keymapp (symbol-value (car (cdr (cddr jj))))))
             (setq jj  `(,(car jj) menu-item ,(car (cddr jj))
                         ,(symbol-value (car (cdr (cddr jj)))) <span class="linecomment">; Replace keymap var by its value.</span>
                         ,@(cdr (cdr (cddr jj))))) <span class="linecomment">; Keywords.</span>
             (push jj new))
            ((and (consp jj) (symbolp (car jj)) (stringp (cadr jj)) <span class="linecomment">; (SYMBOL NAME . MENU-KEYMAP)</span>
                  (symbolp (cddr jj)) (boundp (cddr jj)) (keymapp (symbol-value (cddr jj))))
             (setq jj  `(,(car jj) ,(cadr jj) ,@(symbol-value (cddr jj)))) <span class="linecomment">; Replace keymap var by val.</span>
             (push jj new))
            (t (push jj new))))
    (nreverse new)))

<span class="linecomment">;; This is the same as `mouse3-region-popup-choice' in `mouse3.el'.</span>
(if (require 'mouse3 nil t)
    (defalias 'icicle-Completions-popup-choice 'mouse3-region-popup-choice)
  (defun icicle-Completions-popup-choice (menus choice)
    "<span class="quote">Invoke the command from MENUS that is represented by user's CHOICE.
MENUS is a list that is acceptable as the second argument for
`x-popup-menu'.  That is, it is one of the following, where MENU-TITLE
is the menu title and PANE-TITLE is a submenu title.

* a keymap - MENU-TITLE is its `keymap-prompt'
* a list of keymaps - MENU-TITLE is the first keymap's `keymap-prompt'
* a menu of multiple panes, which has this form: (MENU-TITLE PANE...),
  where each PANE has this form: (PANE-TITLE ITEM...),
  where each ITEM has one of these forms:
  - STRING - an unselectable menu item
  - (STRING . COMMAND) - a selectable item that invokes COMMAND</span>"
    (catch 'icicle-Completions-popup-choice (icicle-Completions-popup-choice-1 menus choice))))

<span class="linecomment">;; This is the same as `mouse3-region-popup-choice-1' in `mouse3.el'.</span>
(if (require 'mouse3 nil t)
    (defalias 'icicle-Completions-popup-choice-1 'mouse3-region-popup-choice-1)
  (defun icicle-Completions-popup-choice-1 (menus choice)
    "<span class="quote">Helper function for `icicle-Completions-popup-choice'.</span>"
    (cond((keymapp menus)
          <span class="linecomment">;; Look up each ITEM-LIST entry in keymap MENUS.</span>
          <span class="linecomment">;;   If what is found is a keymap, use that as MENUS for next iteration.</span>
          <span class="linecomment">;;   If what is found is a command, invoke it (done).</span>
          (let (binding)
            (while choice
              (setq binding  (lookup-key menus (vector (car choice))))
              (cond ((keymapp binding)
                     (setq menus   binding
                           choice  (cdr choice)))
                    ((commandp binding)
                     <span class="linecomment">;; You get only one.</span>
                     (throw 'icicle-Completions-popup-choice (call-interactively binding)))
                    (t (error "<span class="quote">`icicle-Completions-popup-choice', binding: %s</span>" binding))))))
         ((consp menus)                 <span class="linecomment">; A list of keymaps or panes.</span>
          (dolist (menu  menus)
            (if (keymapp menu)
                (icicle-Completions-popup-choice-1 menu choice)
              (when choice              <span class="linecomment">; MENU is a pane.</span>
                (throw 'icicle-Completions-popup-choice (call-interactively choice)))))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-widen-candidates ()       <span class="linecomment">; Bound to `M-+' in minibuffer.</span>
  "<span class="quote">Complete, allowing also candidates that match an alternative regexp.
You are prompted for the alternative input pattern.  Use `RET' to
enter it.

To (apropos) complete using a wider set of candidates, you use this
command after you have completed (`TAB' or `S-TAB').  A shortcut is to
use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-apropos-complete-and-widen]' - \
it is the same as `S-TAB' followed by `\\[icicle-widen-candidates]'.

This command turns off `icicle-expand-input-to-common-match-flag', for
clarity.  You can use `\\[icicle-toggle-expand-to-common-match]' \
to toggle that option.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (unless icicle-completion-candidates
    (error "<span class="quote">No completion candidates.  Did you use `TAB' or `S-TAB'?</span>"))
  (let* ((raw-input                     icicle-current-raw-input)
         (enable-recursive-minibuffers  t)
         (new-regexp                    (icicle-read-string "<span class="quote">Or match alternative (use RET): </span>"
                                                            nil regexp-history)))
    (setq icicle-current-raw-input
          (concat (if (&lt; emacs-major-version 22) "<span class="quote">\\(</span>" "<span class="quote">\\(?:</span>") raw-input "<span class="quote">\\|</span>" new-regexp "<span class="quote">\\)</span>")
          icicle-expand-input-to-common-match-flag  nil))
  (icicle-clear-minibuffer)
  (insert icicle-current-raw-input)
  (let ((icicle-edit-update-p  t)) (icicle-apropos-complete))
  (icicle-msg-maybe-in-minibuffer "<span class="quote">Expansion to common match is OFF. \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-expand-to-common-match]' to toggle</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-narrow-candidates ()      <span class="linecomment">; Bound to `M-*' in minibuffer.</span>
  "<span class="quote">Narrow the set of completion candidates using another input regexp.
This, in effect, performs a set intersection operation on 1) the set
of candidates in effect before the operation and 2) the set of
candidates that match the current input.  You can repeatedly use this
command to continue intersecting candidate sets, progressively
narrowing the set of matches.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-narrow-candidates]').</span>"
  <span class="linecomment">;; We handle `no-catch' errors here because `old-completing-read' and</span>
  <span class="linecomment">;; `old-read-file-file-name' can still be called in Icicle mode by, for instance, an</span>
  <span class="linecomment">;; `interactive' spec (e.g. (interactive "bBuffer: ")).  In that case, we throw to a</span>
  <span class="linecomment">;; non-existant catch.  After doing that, we just insert the result, to pass it to the</span>
  <span class="linecomment">;; next-higher recursive minibuffer.</span>
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-completion-mode  'apropos)
  (let (<span class="linecomment">;; Restore match function, in case it was bound to nil, e.g., by `C-h C-o'.</span>
        (icicle-apropos-complete-match-fn  icicle-last-apropos-complete-match-fn)
        (icicle-progressive-completing-p   t) <span class="linecomment">; Inhibit completion by `icicle-minibuffer-setup'.</span>
        (enable-recursive-minibuffers      t))
    (cond ((and icicle-completion-candidates (null (cdr icicle-completion-candidates)))
           (if (not (and icicle-top-level-when-sole-completion-flag
                         (sit-for icicle-top-level-when-sole-completion-delay)))
               (minibuffer-message "<span class="quote">  [Sole completion]</span>")
             (set minibuffer-history-variable (cons (car icicle-completion-candidates)
                                                    (symbol-value minibuffer-history-variable)))
             <span class="linecomment">;; $$$$$$ Should this now use `icicle-current-input'</span>
             <span class="linecomment">;;        instead of (car icicle-completion-candidates), for PCM?</span>
             (condition-case i-narrow-candidates
                 (throw 'icicle-read-top
                   (if (and (icicle-file-name-input-p) insert-default-directory
                            (or (not (member (car icicle-completion-candidates)
                                             icicle-extra-candidates))
                                icicle-extra-candidates-dir-insert-p))
                       (expand-file-name (car icicle-completion-candidates))
                     (car icicle-completion-candidates)))
               (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                         (icicle-retrieve-last-input)
                         icicle-current-input)
               (error (message (error-message-string i-narrow-candidates))))))
          (t
           (let* (<span class="linecomment">;; $$$$$$$$$$$$$ (icicle-whole-candidate-as-text-prop-p  nil)</span>
                  (minibuffer-setup-hook <span class="linecomment">; Make sure the new minibuffer is the reference buffer.</span>
                   (cons
                    (lambda ()
                      (with-current-buffer (get-buffer-create "<span class="quote">*Completions*</span>")
                        (set (make-local-variable 'completion-reference-buffer)
                             (window-buffer (active-minibuffer-window)))))
                    minibuffer-setup-hook))
                  (current-candidates  icicle-completion-candidates)
                  (result
                   (cond ((and (icicle-file-name-input-p)
                               (or (= emacs-major-version 22) <span class="linecomment">; Emacs 22 or 23.1</span>
                                   (and (= emacs-major-version 23) (= emacs-minor-version 1))))
                          (read-file-name "<span class="quote">Match also (regexp): </span>"
                                          (icicle-file-name-directory-w-default icicle-current-input)
                                          nil icicle-require-match-p nil
                                          (lambda (file-cand) (member file-cand current-candidates))))
                         ((and (icicle-file-name-input-p) (&gt; emacs-major-version 22)) <span class="linecomment">; Emacs 23.2+</span>
                          (let ((icicle-must-pass-after-match-predicate
                                 #'(lambda (c) (member c current-candidates))))
                            (completing-read
                             "<span class="quote">Match also (regexp): </span>" 'read-file-name-internal nil
                             icicle-require-match-p nil minibuffer-history-variable)))
                         (t             <span class="linecomment">; Emacs 20, 21</span>
                          <span class="linecomment">;; In Emacs &lt; 22, there is no PREDICATE arg to `read-file-name', so</span>
                          <span class="linecomment">;; we use `completing-read' even for file-name completion.  In that case, we</span>
                          <span class="linecomment">;; tack the `default-directory' onto each candidate, unless it is already an</span>
                          <span class="linecomment">;; absolute file name.  We also let completion functions (e.g. `S-TAB') know</span>
                          <span class="linecomment">;; that this is not really file-name completion.</span>
                          (completing-read
                           "<span class="quote">Match also (regexp): </span>"
                           (cond ((icicle-file-name-input-p)
                                  (setq minibuffer-completing-file-name  nil) <span class="linecomment">; Disavow completing file.</span>
                                  (let ((dir  (icicle-file-name-directory-w-default
                                               icicle-current-input)))
                                    (mapcar (lambda (file)
                                              (list (if (file-name-absolute-p file)
                                                        file
                                                      (concat dir file))))
                                            icicle-completion-candidates)))
                                 (icicle-whole-candidate-as-text-prop-p
                                  (mapcar (lambda (cand)
                                            (funcall icicle-get-alist-candidate-function (car cand)))
                                          (icicle-filter-alist minibuffer-completion-table
                                                               icicle-completion-candidates)))
                                 (t
                                  (mapcar #'list icicle-completion-candidates)))
                           nil icicle-require-match-p nil minibuffer-history-variable)))))
             <span class="linecomment">;; Normally, `icicle-narrow-candidates' is called from the minibuffer.</span>
             <span class="linecomment">;; If not, just return the result read.</span>
             (if (&gt; (minibuffer-depth) 0)
                 (condition-case i-narrow-candidates
                     (throw 'icicle-read-top result)
                   (no-catch (setq icicle-current-input  result)
                             (icicle-retrieve-last-input)
                             icicle-current-input)
                   (error (message (error-message-string i-narrow-candidates))))
               result))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-widen () <span class="linecomment">; Bound to `S-DEL' in minibuffer.</span>
  "<span class="quote">Apropos complete, then `icicle-widen-candidates'.
You must enter the new, alternative input pattern using `RET'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete-and-widen]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  <span class="linecomment">;; $$$$$ (let ((icicle-top-level-when-sole-completion-flag  t))</span>
  (when (eq icicle-current-completion-mode 'prefix)
    (let ((icicle-incremental-completion-p  nil)
          (regexp-quoted-input              (regexp-quote icicle-last-input)))
      (setq regexp-quoted-input  (if (icicle-file-name-input-p)
                                     (concat (icicle-file-name-directory regexp-quoted-input) "<span class="quote">^</span>"
                                             (file-name-nondirectory regexp-quoted-input))
                                   (concat "<span class="quote">^</span>" regexp-quoted-input)))
      (icicle-erase-minibuffer)
      (insert regexp-quoted-input)))
  (if (eq icicle-last-completion-command 'icicle-apropos-complete-no-display)
      (icicle-apropos-complete-no-display)
    (icicle-apropos-complete))
  (icicle-widen-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-narrow () <span class="linecomment">; Bound to `S-SPC' in minibuffer.</span>
  "<span class="quote">Apropos complete, then `icicle-narrow-candidates'.
You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete-and-narrow]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  <span class="linecomment">;; $$$$$ (let ((icicle-top-level-when-sole-completion-flag  t))</span>
  (when (and (eq icicle-current-completion-mode 'prefix)
             (eq icicle-current-TAB-method 'basic)
             icicle-last-input)
    (let ((icicle-incremental-completion-p  nil)
          (regexp-quoted-input              (regexp-quote icicle-last-input)))
      (setq regexp-quoted-input  (if (icicle-file-name-input-p)
                                     (concat (icicle-file-name-directory regexp-quoted-input) "<span class="quote">^</span>"
                                             (file-name-nondirectory regexp-quoted-input))
                                   (concat "<span class="quote">^</span>" regexp-quoted-input)))
      (icicle-erase-minibuffer)
      (insert regexp-quoted-input)))
  (setq icicle-next-apropos-complete-cycles-p  nil)
  (if (eq icicle-last-completion-command 'icicle-apropos-complete-no-display)
      (icicle-apropos-complete-no-display)
    (icicle-apropos-complete))
  (icicle-narrow-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-narrow-candidates-with-predicate (&optional predicate) <span class="linecomment">; Bound to `M-&' in minibuffer.</span>
  "<span class="quote">Narrow the set of completion candidates by applying a predicate.
You can repeatedly use this command to apply additional predicates,
progressively narrowing the set of candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-narrow-candidates-with-predicate]').

When called from Lisp with non-nil arg PREDICATE, use that to narrow.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let (<span class="linecomment">;; Restore match function, in case it was bound to nil, e.g., by `C-h C-o'.</span>
        (icicle-apropos-complete-match-fn  icicle-last-apropos-complete-match-fn)
        (icicle-progressive-completing-p   t) <span class="linecomment">; Inhibit completion by `icicle-minibuffer-setup'.</span>
        (last-completion-cmd               (or icicle-last-completion-command 'icicle-apropos-complete))
        (enable-recursive-minibuffers      t))
    (cond ((null icicle-completion-candidates)
           (error "<span class="quote">No completion candidates.  Did you use `TAB' or `S-TAB'?</span>"))
          ((null (cdr icicle-completion-candidates))
           (if (not (and icicle-top-level-when-sole-completion-flag
                         (sit-for icicle-top-level-when-sole-completion-delay)))
               (minibuffer-message "<span class="quote">  [Sole completion]</span>")
             (set minibuffer-history-variable (cons (car icicle-completion-candidates)
                                                    (symbol-value minibuffer-history-variable)))
             <span class="linecomment">;; $$$$$$ Should this now use `icicle-current-input'</span>
             <span class="linecomment">;;        instead of (car icicle-completion-candidates), for PCM?</span>
             (condition-case i-narrow-candidates
                 (throw 'icicle-read-top
                   (if (and (icicle-file-name-input-p) insert-default-directory
                            (or (not (member (car icicle-completion-candidates)
                                             icicle-extra-candidates))
                                icicle-extra-candidates-dir-insert-p))
                       (expand-file-name (car icicle-completion-candidates))
                     (car icicle-completion-candidates)))
               (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                         (icicle-retrieve-last-input)
                         icicle-current-input)
               (error (message (error-message-string i-narrow-candidates))))))
          (t                            <span class="linecomment">; Read new predicate and incorporate it.</span>
           (let ((pred  (or predicate
                            (icicle-read-from-minibuf-nil-default
                             "<span class="quote">Additional predicate to apply: </span>"
                             nil read-expression-map t (if (boundp 'function-name-history)
                                                           'function-name-history
                                                         'icicle-function-name-history)))))
             <span class="linecomment">;; Update `read-file-name-predicate' or `minibuffer-completion-predicate'</span>
             <span class="linecomment">;; to also use new predicate, PRED.</span>
             <span class="linecomment">;; The logic here is the same as for `icicle-remove-cand-from-lists'.</span>
             (cond (<span class="linecomment">;; File name input, Emacs 22+.  Update `read-file-name-predicate'.</span>
                    (and (icicle-file-name-input-p) (&gt; emacs-major-version 21))
                    (setq read-file-name-predicate
                          (if read-file-name-predicate
                              (lexical-let ((curr-pred  read-file-name-predicate))
                                `(lambda (file-cand)
                                  (and (funcall ',curr-pred file-cand) (funcall ',pred file-cand))))
                            pred)))

                   <span class="linecomment">;; File name input, Emacs 20 or 21.  We can do nothing for file name.</span>
                   <span class="linecomment">;; `TAB' or `S-TAB' will unfortunately bring it back as a candidate.</span>
                   ((icicle-file-name-input-p))

                   (t<span class="linecomment">;; Non-file name input, all versions.  Update `minibuffer-completion-predicate'.</span>
                    (setq minibuffer-completion-predicate
                          (if minibuffer-completion-predicate
                              <span class="linecomment">;; Add PRED to the existing predicate.</span>
                              (lexical-let ((curr-pred  minibuffer-completion-predicate))
                                `(lambda (cand)
                                  (and (funcall ',curr-pred cand) (funcall ',pred cand))))
                            <span class="linecomment">;; Set predicate to PRED.</span>
                            pred)))))))
    (funcall last-completion-cmd)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-save-predicate-to-variable (askp) <span class="linecomment">; Bound to `C-M-&' in minibuffer.</span>
  "<span class="quote">Save the current completion predicate to a variable.
By default, the variable is `icicle-input-string'.  If you use a
prefix argument, then you are prompted for the variable to use.

You can retrieve the saved predicate as a string using `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save-predicate-to-variable]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (let* ((pred                                    minibuffer-completion-predicate)
         (icicle-whole-candidate-as-text-prop-p   nil)
         (enable-recursive-minibuffers            t)
         (icicle-must-pass-after-match-predicate  #'(lambda (s) (boundp (intern s))))
         (var                                     (if askp
                                                      (intern
                                                       (completing-read
                                                        "<span class="quote">Save candidates in variable: </span>" obarray nil
                                                        nil nil (if (boundp 'variable-name-history)
                                                                    'variable-name-history
                                                                  'icicle-variable-name-history)))
                                                    'icicle-input-string)))
    (set var (prin1-to-string pred))
    (save-selected-window (select-window (minibuffer-window))
                          (minibuffer-message (format "<span class="quote">  [Predicate SAVED to `%s']</span>" var)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-completing-read+insert () <span class="linecomment">; Bound to `C-M-S-c' (`C-M-C') in minibuffer.</span>
  "<span class="quote">Read something with completion, and insert it.
Be sure to bind `icicle-completing-read+insert-candidates' to the set
of candidates.
Option `icicle-completing-read+insert-keys' controls which keys are
bound to this command.
Return the string that was inserted.</span>"
  (interactive)
  (if icicle-completing-read+insert-candidates
      (let ((enable-recursive-minibuffers  t)
            (use-dialog-box                nil)
            (result
             (icicle-completing-read "<span class="quote">Choose: </span>" icicle-completing-read+insert-candidates)))
        (insert result)
        result)
    (icicle-msg-maybe-in-minibuffer "<span class="quote">On-demand completion not available</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read+insert-file-name (dir-too-p) <span class="linecomment">; Bound to `C-M-S-f' (`C-M-F') in minibuffer.</span>
  "<span class="quote">Read a file name and insert it, without its directory, by default.
With a prefix argument, insert its directory also.
Option `icicle-read+insert-file-name-keys' controls which keys are
 bound to this command.
Return the string that was inserted.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((completion-ignore-case                  (memq system-type '(ms-dos windows-nt cygwin)))
        (enable-recursive-minibuffers            t)
        (use-dialog-box                          nil)
        (minibuffer-local-completion-map
         (let ((map  (make-sparse-keymap)))
           (set-keymap-parent map minibuffer-local-completion-map)
           (define-key map [(control backspace)] 'icicle-up-directory)
           (define-key map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
           map))
        (minibuffer-local-must-match-map
         (let ((map  (make-sparse-keymap)))
           (set-keymap-parent map minibuffer-local-must-match-map)
           (define-key map [(control backspace)] 'icicle-up-directory)
           (define-key map "<span class="quote">\C-c+</span>"               'icicle-make-directory)
           map))
        (icicle-must-pass-after-match-predicate  nil)
        result)
    (setq result  (icicle-read-file-name "<span class="quote">Choose file: </span>"))
    (unless dir-too-p                   <span class="linecomment">; Remove parent dir.</span>
      (setq result  (if (file-directory-p result)
                        (file-name-as-directory (file-name-nondirectory (directory-file-name result)))
                      (file-name-nondirectory result))))
    (insert result)
    result))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-swap ()     <span class="linecomment">; Bound to `C-%' in minibuffer.</span>
  "<span class="quote">Swap the saved set and current sets of completion candidates.
You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-swap]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (setq icicle-saved-completion-candidates
        (prog1 icicle-completion-candidates
          (setq icicle-completion-candidates  icicle-saved-completion-candidates)))
  (minibuffer-message "<span class="quote">  [Saved set of candidates SWAPPED with current]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-define ()   <span class="linecomment">; Bound to `C-:' in minibuffer.</span>
  "<span class="quote">Define the set of current completion candidates by evaluating a sexp.
The Lisp sexp must evaluate to a list of strings, such as is returned
by `all-completions'.

You can use this command at top level or from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-define]').</span>"
  (interactive)
  (let* ((enable-recursive-minibuffers  t)
         (evald-sexp                    (eval-minibuffer
                                         "<span class="quote">Set the completion candidates to sexp (eval): </span>")))
    (when (and evald-sexp (or (atom evald-sexp) (not (stringp (car evald-sexp)))))
      (error "<span class="quote">Sexp did not evaluate to a list of strings: %S</span>" evald-sexp))
    (setq icicle-completion-candidates  evald-sexp))
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">List of completion candidates DEFINED: %S</span>" icicle-completion-candidates)
  (when (&gt; (minibuffer-depth) 0)
    (message "<span class="quote">Displaying completion candidates...</span>")
    (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
      (display-completion-list icicle-completion-candidates))
    (icicle-narrow-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-difference () <span class="linecomment">; Bound to `C--' in minibuffer.</span>
  "<span class="quote">Take the set difference between the current and saved candidates.
The new set of candidates is the set of candidates prior to executing
this command minus the saved set of candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-difference]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (message "<span class="quote">Computing set difference: current minus saved candidates...</span>")
  (icicle-candidate-set-1 'icicle-set-difference "<span class="quote">  [saved set of candidates SUBTRACTED]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-union ()    <span class="linecomment">; Bound to `C-+' in minibuffer.</span>
  "<span class="quote">Take the set union between the current and saved candidates.
The new set of candidates is the union of the saved set of candidates
and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-union]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (message "<span class="quote">Computing set union: current plus saved candidates...</span>")
  (icicle-candidate-set-1 'icicle-set-union "<span class="quote">  [saved set of candidates ADDED]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-intersection () <span class="linecomment">; Bound to `C-*' in minibuffer.</span>
  "<span class="quote">Take the set intersection between the current and saved candidates.
The new set of candidates is the intersection of the saved set of
candidates and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-intersection]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (message "<span class="quote">Computing set intersection: current and saved candidates...</span>")
  (icicle-candidate-set-1 'icicle-set-intersection
                          "<span class="quote">  [INTERSECTION of saved and current sets of candidates]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-complement () <span class="linecomment">; Bound to `C-~' in minibuffer.</span>
  "<span class="quote">Complement the set of current completion candidates.
The new set of candidates is the set of `all-completions' minus the
set of candidates prior to executing this command - that is, all
possible completions of the appropriate type, except for those that
are in the current set of completions.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-complement]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (message "<span class="quote">Complementing current set of candidates...</span>")
  (setq icicle-completion-candidates
        (icicle-set-difference
         (condition-case nil
             (all-completions "<span class="quote"></span>" minibuffer-completion-table minibuffer-completion-predicate
                              icicle-ignore-space-prefix-flag)
           (wrong-number-of-arguments   <span class="linecomment">; Emacs 23.2+ has no 4th arg.</span>
            (all-completions "<span class="quote"></span>" minibuffer-completion-table minibuffer-completion-predicate)))
         icicle-completion-candidates))
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">Displaying completion candidates...</span>")
  (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" (display-completion-list icicle-completion-candidates))
  (minibuffer-message "<span class="quote">  [Set of candidates COMPLEMENTED]</span>")
  (icicle-narrow-candidates))

(defun icicle-candidate-set-truncate (n) <span class="linecomment">; Bound to `M-$' in minibuffer.</span>
  "<span class="quote">Trim the set of current completion candidates at the end.
The first N candidates are kept.  N is read.</span>"
  <span class="linecomment">;; Ugly hack: `icicle-saved-completion-candidates-internal'.  No way to bind a variable</span>
  <span class="linecomment">;; in `interactive' and have the binding be active in the function body.</span>
  (interactive
   (list (let ((enable-recursive-minibuffers  t))
           (setq icicle-saved-completion-candidates-internal  icicle-completion-candidates)
           (if current-prefix-arg
               (prefix-numeric-value current-prefix-arg)
             (read-number "<span class="quote">Number of candidates to keep: </span>")))))
  (setq icicle-completion-candidates  icicle-saved-completion-candidates-internal)
  (setcdr (nthcdr (1- n) icicle-completion-candidates) nil)
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">Displaying completion candidates...</span>")
  (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" (display-completion-list icicle-completion-candidates))
  (message (format "<span class="quote">  [Set of candidates TRUNCATED to %d]</span>" n))
  (icicle-narrow-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve (&optional arg) <span class="linecomment">; Bound to `C-M-&lt;' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save/unsave-candidate]', `M-S-mouse-2',
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-save]', \
`\\[icicle-candidate-set-save-to-variable]', or `\\[icicle-candidate-set-save-persistently]'.

With no prefix arg, retrieve candidates from variable
 `icicle-saved-completion-candidates'.
With a numeric prefix arg, retrieve candidates from another variable.
With a plain prefix arg (`C-u'), retrieve candidates from a cache file
 or, if option `icicle-filesets-as-saved-completion-sets-flag' is
 non-nil, an Emacs fileset name (Emacs 22 or later).  To use filesets,
 you must also load library `filesets' and use `(filesets-init)'.

Completion is available when you are prompted for a cache file,
fileset, or variable name.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-retrieve-1 arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-1 (arg &optional morep)
  "<span class="quote">Helper function for `icicle-candidate-set-retrieve(-more)'.
ARG is the same as the raw prefix arg for `icicle-candidate-set-retrieve'.
MOREP non-nil means add the saved candidates, don't replace existing.</span>"
  (let ((name        nil)
        (variablep   (and arg (atom arg)))
        (curr-cands  icicle-completion-candidates)
        saved-cands)
    (if arg
        (let ((icicle-whole-candidate-as-text-prop-p  nil)
              (enable-recursive-minibuffers           t))
          (if variablep
              <span class="linecomment">;; Retrieve from a variable.  Prompt user for the variable to use.</span>
              (setq saved-cands
                    (append (and morep curr-cands)
                            (symbol-value
                             (setq name  (intern
                                          (completing-read <span class="linecomment">; Variable name.</span>
                                           "<span class="quote">Retrieve candidates from variable: </span>"
                                           icicle-saved-candidates-variables-obarray
                                           nil nil nil (if (boundp 'variable-name-history)
                                                           'variable-name-history
                                                         'icicle-variable-name-history)))))))
            <span class="linecomment">;; Retrieve from a persistent set (and save to `icicle-saved-completion-candidates').</span>
            (setq name  (completing-read "<span class="quote">Retrieve candidates from persistent set: </span>"
                                         (if (and icicle-filesets-as-saved-completion-sets-flag
                                                  (featurep 'filesets) filesets-data)
                                             (append filesets-data icicle-saved-completion-sets)
                                           icicle-saved-completion-sets)
                                         nil nil nil 'icicle-completion-set-history))
            (icicle-retrieve-candidates-from-set name)
            (setq saved-cands  (append (and morep curr-cands) icicle-saved-completion-candidates))))
      <span class="linecomment">;; Retrieve from the default variable, `icicle-saved-completion-candidates'.</span>
      (setq saved-cands  (append (and morep curr-cands)
                                 icicle-saved-completion-candidates)))
    (cond ((null saved-cands)
           (deactivate-mark)
           (icicle-display-candidates-in-Completions)
           (message "<span class="quote">No saved candidates to restore</span>") (sit-for 2))
          (t
           (setq icicle-completion-candidates <span class="linecomment">; Remove directories if completing file names</span>
                 (if (icicle-file-name-input-p) <span class="linecomment">; using `read-file-name'.</span>
                     (mapcar #'file-name-nondirectory saved-cands)
                   saved-cands))
           (cond ((and (consp icicle-completion-candidates) (null (cdr icicle-completion-candidates)))
                  <span class="linecomment">;; $$$$$$ Should this now use `icicle-current-input'</span>
                  <span class="linecomment">;;        instead of (car icicle-completion-candidates), for PCM?</span>
                  (icicle-remove-Completions-window)
                  (icicle-insert-completion (car icicle-completion-candidates)) <span class="linecomment">; Insert sole cand.</span>
                  (minibuffer-message "<span class="quote">  [Sole candidate restored]</span>")
                  (save-selected-window (select-window (minibuffer-window))
                                        (icicle-highlight-complete-input))
                  (icicle-show-help-in-mode-line (car icicle-completion-candidates)))
                 ((consp icicle-completion-candidates)
                  (deactivate-mark)
                  (icicle-display-candidates-in-Completions)
                  (save-selected-window
                    (select-window (minibuffer-window))
                    (minibuffer-message (if name
                                            (format "<span class="quote">  [Saved candidates RESTORED from %s `%s']</span>"
                                                    (if variablep "<span class="quote">variable</span>" "<span class="quote">cache file</span>") name)
                                          "<span class="quote">  [Saved candidates RESTORED]</span>")))
                  (let ((icicle-minibuffer-setup-hook <span class="linecomment">; Pre-complete</span>
                         (cons (if (eq icicle-last-completion-command
                                       'icicle-apropos-complete-no-display)
                                   'icicle-apropos-complete-no-display
                                 'icicle-apropos-complete)
                               icicle-minibuffer-setup-hook)))
                    (icicle-narrow-candidates))))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-more (&optional arg) <span class="linecomment">; Bound to `C-&lt;' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, adding it current.
The saved candidates are added to those already current.
A prefix argument acts as for `icicle-candidate-set-retrieve'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-more]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-retrieve-1 arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-from-variable () <span class="linecomment">; Bound to `C-M-{' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save/unsave-candidate]', `M-S-mouse-2', or
`\\[icicle-candidate-set-save-to-variable]' (or `\\[icicle-candidate-set-save]' with a numeric \
prefix arg).

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-variable]').</span>"
  (interactive)
  (icicle-candidate-set-retrieve 99))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-persistent () <span class="linecomment">; Bound to `C-{' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-persistently]' or `C-u \\[icicle-candidate-set-save]'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-persistent]').</span>"
  (interactive)
  (icicle-candidate-set-retrieve '(1)))

(defun icicle-retrieve-candidates-from-set (set-name)
  "<span class="quote">Retrieve the saved set of completion candidates named SET-NAME.
SET-NAME names an Icicles saved completion set or, if
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, an Emacs
 fileset.  If that option is non-nil and SET-NAME names a saved
 completion set that contains Emacs filesets, then the files specified
 for the filesets are also retrieved. 
The candidates are retrieved to `icicle-saved-completion-candidates',
and `icicle-candidates-alist' is updated.</span>"
  (setq icicle-saved-completion-candidates  (icicle-get-candidates-from-saved-set set-name))
  (when icicle-candidates-alist         <span class="linecomment">; Redefine `icicle-candidates-alist'.</span>
    (let ((icicle-whole-candidate-as-text-prop-p  t))
      (setq icicle-candidates-alist  (mapcar icicle-get-alist-candidate-function
                                             icicle-saved-completion-candidates)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-save/unsave-candidate ()  <span class="linecomment">; Bound to `insert' in minibuffer.</span>
  "<span class="quote">Add/remove current candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.
You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save/unsave-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (if (not (wholenump icicle-candidate-nb))
      (save-selected-window (select-window (minibuffer-window))
                            (minibuffer-message "<span class="quote">  [No current candidate]</span>"))
    (let ((cand  (elt icicle-completion-candidates icicle-candidate-nb)))
      (cond ((member cand icicle-saved-completion-candidates)
             (setq icicle-saved-completion-candidates
                   (delete icicle-last-completion-candidate icicle-saved-completion-candidates))
             (save-selected-window (select-window (minibuffer-window))
                                   (minibuffer-message "<span class="quote">  [Candidate UNsaved]</span>")))
            (t
             (push cand icicle-saved-completion-candidates)
             (save-selected-window (select-window (minibuffer-window))
                                   (minibuffer-message "<span class="quote">  [Candidate SAVED]</span>")))))))
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-save/unsave-candidate (event) <span class="linecomment">; Bound to `M-S-mouse-2' in *Completions.</span>
  "<span class="quote">Add/remove clicked candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let (<span class="linecomment">;; $$$$$$ (buffer    (window-buffer))</span>
        (posn-win  (posn-window (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        choice base-size)
    (read-event)                        <span class="linecomment">; Swallow mouse up event.</span>
    (with-current-buffer (window-buffer posn-win)
      (save-excursion
        <span class="linecomment">;; $$$$$$ (when completion-reference-buffer (setq buffer  completion-reference-buffer))</span>
        (setq base-size  completion-base-size)
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg     (previous-single-property-change beg 'mouse-face)
                end     (or (next-single-property-change end 'mouse-face)(point-max))
                choice  (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions
                                             (posn-point (event-start event)))
          icicle-last-completion-candidate  choice)
    (cond ((member icicle-last-completion-candidate icicle-saved-completion-candidates)
           (setq icicle-saved-completion-candidates
                 (delete icicle-last-completion-candidate icicle-saved-completion-candidates))
           (save-selected-window (select-window (minibuffer-window))
                                 (minibuffer-message "<span class="quote">  [Candidate UNsaved]</span>")))
          (t
           (push icicle-last-completion-candidate icicle-saved-completion-candidates)
           (save-selected-window (select-window (minibuffer-window))
                                 (minibuffer-message "<span class="quote">  [Candidate SAVED]</span>"))))
    (deactivate-mark)
    (icicle-display-candidates-in-Completions)
    (icicle-raise-Completions-frame posn-col posn-row)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-set-save (ignore &optional arg) <span class="linecomment">; `M-S-mouse-3' in `*Completions*'.</span>
  "<span class="quote">`icicle-candidate-set-save(-selected)'.
If the region is active in `*Completions*', then
`icicle-candidate-set-save-selected'.  Otherwise,
`icicle-candidate-set-save'.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (if (and (get-buffer "<span class="quote">*Completions*</span>")
           (save-current-buffer
             (set-buffer (get-buffer "<span class="quote">*Completions*</span>"))
             (and mark-active (mark) (/= (point) (mark)))))
      (icicle-candidate-set-save-selected arg)
    (icicle-candidate-set-save arg)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-set-save-more (ignore &optional arg) <span class="linecomment">; `M-mouse-3' in `*Completions*'.</span>
  "<span class="quote">`icicle-candidate-set-save-more(-selected)'.
If the region is active in `*Completions*', then
`icicle-candidate-set-save-more-selected'.  Otherwise,
`icicle-candidate-set-save-more'.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (if (and (get-buffer "<span class="quote">*Completions*</span>")
           (save-current-buffer
             (set-buffer (get-buffer "<span class="quote">*Completions*</span>"))
             (and mark-active (mark) (/= (point) (mark)))))
      (icicle-candidate-set-save-more-selected arg)
    (icicle-candidate-set-save-more arg)))

<span class="linecomment">;;; `mouse-3' in `*Completions*'.</span>
(cond ((require 'mouse3 nil t)
       (defun icicle-mouse-save-then-kill (click &optional arg)
         "<span class="quote">`mouse-save-then-kill', but click same place saves selected candidates.</span>"
         (interactive "<span class="quote">e\nP</span>")
         (let ((mouse3-save-then-kill-command  `(lambda (event prefix-arg)
                                                 (icicle-mouse-candidate-set-save-more nil ,arg))))
           (mouse-save-then-kill click))
         (setq this-command  'mouse-save-then-kill)))

      ((&lt; emacs-major-version 24)
       (defun icicle-mouse-save-then-kill (click &optional arg)
         "<span class="quote">`mouse-save-then-kill', but click same place saves selected candidates.</span>"
         (interactive "<span class="quote">e\nP</span>")
         (flet ((mouse-save-then-kill-delete-region (beg end)
                  (icicle-mouse-candidate-set-save-more nil arg)))
           (mouse-save-then-kill click))
         (setq this-command  'mouse-save-then-kill)))

      (t
       <span class="linecomment">;; The only thing Icicles-specific here is replacing killing or deleting the region by a call to</span>
       <span class="linecomment">;; `icicle-mouse-candidate-set-save-more'.  Otherwise, this is just `mouse-save-then-kill'.</span>
       (defun icicle-mouse-save-then-kill (click &optional arg) <span class="linecomment">; `mouse-3' in `*Completions*'.</span>
         "<span class="quote">`mouse-save-then-kill', but click same place saves selected candidates.</span>"
         (interactive "<span class="quote">e\nP</span>")
         (mouse-minibuffer-check click)
         (let* ((posn          (event-start click))
                (click-pt      (posn-point posn))
                (window        (posn-window posn))
                (buf           (window-buffer window))
                (this-command  this-command) <span class="linecomment">; Don't let subsequent kill cmd append to this one.</span>
                <span class="linecomment">;; Check if the user has multi-clicked to select words/lines.</span>
                (click-count   (if (and (eq mouse-selection-click-count-buffer buf)
                                        (with-current-buffer buf (mark t)))
                                   mouse-selection-click-count
                                 0)))
           (cond ((not (numberp click-pt)) nil)
                 ((and (eq last-command 'icicle-mouse-save-then-kill) <span class="linecomment">; User clicked at same position.</span>
                       (eq click-pt mouse-save-then-kill-posn)
                       (eq window (selected-window)))
                  <span class="linecomment">;; Here is the Icicles difference from vanilla `mouse-save-then-kill'.</span>
                  <span class="linecomment">;; Instead of killing/deleting the region, save the selected candidates.</span>
                  (icicle-mouse-candidate-set-save-more nil arg)
                  (setq mouse-selection-click-count  0
                        mouse-save-then-kill-posn    nil))
                 <span class="linecomment">;; If there is a suitable region, adjust it by moving the closest end to CLICK-PT.</span>
                 ((or (with-current-buffer buf (region-active-p))
                      (and (eq window (selected-window))
                           (mark t)
                           (or (and (eq last-command 'icicle-mouse-save-then-kill)
                                    mouse-save-then-kill-posn)
                               (and (memq last-command '(mouse-drag-region mouse-set-region))
                                    (or mark-even-if-inactive (not transient-mark-mode))))))
                  (select-window window)
                  (let* ((range  (mouse-start-end click-pt click-pt click-count)))
                    (if (&lt; (abs (- click-pt (mark t))) (abs (- click-pt (point))))
                        (set-mark (car range))
                      (goto-char (nth 1 range)))
                    (setq deactivate-mark  nil)
                    (mouse-set-region-1)
                    (when mouse-drag-copy-region
                      <span class="linecomment">;; Previous region was copied to kill-ring, so replace with adjusted region.</span>
                      (kill-new (filter-buffer-substring (mark t) (point)) t))
                    (setq mouse-save-then-kill-posn  click-pt))) <span class="linecomment">; Repeated `mouse-3' kills region.</span>
                 (t                     <span class="linecomment">; Set the mark where point is and move to CLICK-PT.</span>
                  (select-window window)
                  (mouse-set-mark-fast click)
                  (let ((before-scroll (with-current-buffer buf point-before-scroll)))
                    (when before-scroll (goto-char before-scroll)))
                  (exchange-point-and-mark)
                  (mouse-set-region-1)
                  (when mouse-drag-copy-region (kill-new (filter-buffer-substring (mark t) (point))))
                  (setq mouse-save-then-kill-posn  click-pt)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates, for later recall.
Saves candidates in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.  To
 subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-save-1 icicle-completion-candidates arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in minibuffer.</span>
  "<span class="quote">Add current completion candidates to saved candidates set.
The current candidates are added to those already saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-more]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-save-1 icicle-completion-candidates arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-selected (&optional arg) <span class="linecomment">; Bound to `C-M-)' in minibuffer.</span>
  "<span class="quote">`icicle-candidate-set-save', but only for the selected candidates.
Candidates at least partially in the region are saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

As a special case, if no candidates are selected, then this empties
the current set of saved candidates.  That is, it UNsaves all saved
candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-selected]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save-selected-1 arg nil 'no-error))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-more-selected (&optional arg) <span class="linecomment">; Bound to `C-)' in minibuffer.</span>
  "<span class="quote">`icicle-candidate-set-save-more', but only for the selected candidates.
Candidates at least partially in the region are added to those saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-more-selected]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save-selected-1 arg t))

<span class="linecomment">;; $$$$$$$ Maybe should also allow rectangle selection.</span>
(defun icicle-candidate-set-save-selected-1 (arg &optional morep no-error-p)
  "<span class="quote">Helper function for `icicle-candidate-set-save(-more)(-region)'.</span>"
  (when (or (get-buffer-window "<span class="quote">*Completions*</span>" 0) no-error-p)
    (let ((beg-cand-nb       0)
          (end-cand-nb       0)
          (candidates        ())
          (icicle-orig-buff  (current-buffer)))
      (when (get-buffer-window "<span class="quote">*Completions*</span>" 0) <span class="linecomment">; Do nothing if not displayed.</span>
        (with-current-buffer "<span class="quote">*Completions*</span>"
          (when (and mark-active (mark) (/= (point) (mark)) icicle-completion-candidates)
            (let ((bob  (icicle-start-of-candidates-in-Completions))
                  (eob  (point-max))
                  (beg  (region-beginning))
                  (end  (region-end))
                  temp)

              <span class="linecomment">;; Extend region ends to include all of first and last selected candidates.</span>
              (unless (get-text-property beg 'mouse-face)
                (if (setq temp  (next-single-property-change beg 'mouse-face))
                    (setq beg  temp)
                  (setq beg  (next-single-property-change temp 'mouse-face))))

              (when (&gt; beg end)
                (error "<span class="quote">No candidates selected</span>")) <span class="linecomment">; Active region but none selected.</span>

              (unless (get-text-property end 'mouse-face)
                (if (setq temp  (previous-single-property-change end 'mouse-face))
                    (setq end  temp)
                  (setq end  (previous-single-property-change temp 'mouse-face))))
              (when (&gt; beg end) (setq beg  (prog1 end (setq end  beg)))) <span class="linecomment">; Swap them.</span>
              (while (and (&gt;= beg bob) (get-text-property beg 'mouse-face)) (setq beg  (1- beg)))
              (while (and (&lt;= end eob) (get-text-property end 'mouse-face)) (setq end  (1+ end)))
              (setq beg          (1+ beg)
                    end          (1- end)
                    beg-cand-nb  (icicle-nb-of-candidate-in-Completions beg)
                    end-cand-nb  (icicle-nb-of-candidate-in-Completions end))
              (when (&gt; beg-cand-nb end-cand-nb) <span class="linecomment">; Swap them</span>
                (setq beg-cand-nb  (prog1 end-cand-nb (setq end-cand-nb  beg-cand-nb))))
              (while (&lt;= beg-cand-nb end-cand-nb)
                (push (elt icicle-completion-candidates beg-cand-nb) candidates)
                (setq beg-cand-nb  (1+ beg-cand-nb)))))))
      (when (and morep (null candidates)) (error "<span class="quote">No candidates selected</span>")) <span class="linecomment">; Need selection for MOREP.</span>
      (setq candidates  (nreverse candidates))
      (icicle-candidate-set-save-1 candidates arg morep t no-error-p)
      (let ((win  (get-buffer-window icicle-orig-buff 'visible)))
        (when win (select-window win))))))

(defun icicle-candidate-set-save-1 (new-cands arg &optional morep only-selected-p no-error-p)
  "<span class="quote">Helper function for `icicle-candidate-set-save*' functions.
NEW-CANDS are the candidates to save.
ARG is the same as the raw prefix arg for `icicle-candidate-set-save'.
MOREP non-nil means add the candidates, do not replace existing set.
ONLY-SELECTED-P non-nil means NEW-CANDS are those selected in
 `*Completions*'.
NO-ERROR-P non-nil means don't raise an error if NEW-CANDS is nil.</span>"
  (unless (or new-cands no-error-p)
    (error "<span class="quote">Cannot save empty candidates set - did you use `S-TAB' or `TAB'?</span>"))
  (let (where)
    (if arg
        (let ((enable-recursive-minibuffers  t))
          (cond ((consp arg)
                 <span class="linecomment">;; Save to cache file (and to `icicle-saved-completion-candidates').</span>
                 (let* ((file-name
                         (prog1 (let ((icicle-completion-candidates  icicle-completion-candidates))
                                  (icicle-add/update-saved-completion-set))
                           (when (minibuffer-window-active-p (minibuffer-window))
                             (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" <span class="linecomment">; Redisplay.</span>
                               (display-completion-list icicle-completion-candidates)))
                           (select-window (minibuffer-window))))
                        (list-buf   (and morep (find-file-noselect file-name 'nowarn 'raw)))
                        (old-cands  ()))
                   (when morep
                     (unwind-protect
                          (condition-case nil
                              (setq old-cands  (read list-buf))
                            (end-of-file
                             (save-selected-window
                               (select-window (minibuffer-window))
                               (minibuffer-message (format "<span class="quote">  [No completion candidates in file `%s']</span>"
                                                           file-name)))))
                       (kill-buffer list-buf)))
                   <span class="linecomment">;; Convert to readable alist form, from propertized text.  Convert any markers</span>
                   <span class="linecomment">;; to the form (icicle-file-marker FILE POS) or (icicle-marker BUFFER POS).</span>
                   (when (and new-cands (get-text-property 0 'icicle-whole-candidate (car new-cands)))
                     (setq new-cands
                           (mapcar (lambda (cand)
                                     (icicle-markers-to-readable
                                      (or (funcall icicle-get-alist-candidate-function cand) cand)))
                                   new-cands)))
                   (setq icicle-saved-completion-candidates  (append new-cands old-cands)
                         where                               (format "<span class="quote">cache file `%s'</span>" file-name))
                   (with-temp-message (format "<span class="quote">Writing candidates to cache file `%s'...</span>" file-name)
                     (condition-case err
                         (with-temp-file file-name
                           (prin1 icicle-saved-completion-candidates (current-buffer)))
                       (error (error "<span class="quote">Could not write to cache file.  %S</span>"
                                     (error-message-string err)))))))
                ((zerop (prefix-numeric-value arg))
                 <span class="linecomment">;; Save to a fileset (and to `icicle-saved-completion-candidates').</span>
                 (unless (require 'filesets nil t)
                   (error "<span class="quote">Cannot save to a fileset - feature `filesets' not provided</span>"))
                 (filesets-init)
                 (let ((icicle-completion-candidates  icicle-completion-candidates))
                   (setq where  (completing-read "<span class="quote">Save to fileset: </span>" filesets-data)))
                 (dolist (cand  new-cands) (icicle-add-file-to-fileset cand where))
                 (when (minibuffer-window-active-p (minibuffer-window))
                   (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" <span class="linecomment">; Redisplay.</span>
                     (display-completion-list icicle-completion-candidates)))
                 (select-window (minibuffer-window))
                 (setq where  (format "<span class="quote">`%s'</span>" where)))
                (t                      <span class="linecomment">; Save to a variable.  Prompt for the variable to use.</span>
                 (let* ((varname
                         (prog1 (let ((icicle-completion-candidates
                                       icicle-completion-candidates)
                                      (icicle-whole-candidate-as-text-prop-p  nil))
                                  (completing-read (if morep
                                                       "<span class="quote">Add candidates to variable: </span>"
                                                     "<span class="quote">Save candidates in variable: </span>")
                                                   icicle-saved-candidates-variables-obarray
                                                   nil nil nil (if (boundp 'variable-name-history)
                                                                   'variable-name-history
                                                                 'icicle-variable-name-history)))
                           (when (minibuffer-window-active-p (minibuffer-window))
                             (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
                               (display-completion-list icicle-completion-candidates)))
                           (select-window (minibuffer-window))))
                        (var  (intern varname))) <span class="linecomment">; Intern in standard `obarray'.</span>
                   (intern varname icicle-saved-candidates-variables-obarray) <span class="linecomment">; For completion.</span>
                   (set var (if (and morep (boundp var) (listp (symbol-value var)))
                                (append new-cands (symbol-value var))
                              new-cands))
                   (setq where  (format "<span class="quote">`%s'</span>" var))))))
      <span class="linecomment">;; Save to default variable, `icicle-saved-completion-candidates'.</span>
      (setq where  "<span class="quote">`icicle-saved-completion-candidates'</span>"
            icicle-saved-completion-candidates
            (if (and morep (listp icicle-saved-completion-candidates))
                (append new-cands icicle-saved-completion-candidates)
              new-cands)))
    (deactivate-mark)
    (when (and (minibuffer-window-active-p (minibuffer-window))
               (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
      (icicle-display-candidates-in-Completions))
    (save-selected-window
      (select-window (minibuffer-window))
      (minibuffer-message
       (if morep
           (if new-cands
               (format "<span class="quote">  [%sandidates ADDED to %s]</span>" (if only-selected-p "<span class="quote">Selected c</span>" "<span class="quote">C</span>") where)
             "<span class="quote">  [NO candidates selected to add]</span>")
         (if new-cands
             (format "<span class="quote">  [%sandidates SAVED to %s]</span>" (if only-selected-p "<span class="quote">Selected c</span>" "<span class="quote">C</span>") where)
           "<span class="quote">  [Saved candidates reset to NONE]</span>"))))))

<span class="linecomment">;; This is actually a top-level command, but it is in this file because it is used by</span>
<span class="linecomment">;; `icicle-candidate-set-save-1'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; We don't define this using `icicle-define-add-to-alist-command', because we want to</span>
<span class="linecomment">;; return the cache-file name.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-add/update-saved-completion-set ()
  "<span class="quote">Add or update an entry in `icicle-saved-completion-sets'.
That is, create a new saved completion set or update an existing one.
You are prompted for the name of a set of completion candidates and
its cache file.  By default, the cache file name is the set name
without spaces, and with file extension `icy'.  List
`icicle-saved-completion-sets' is updated to have an entry with these
set and file names.  Return the cache-file name.</span>"
  (interactive)
  (let* ((icicle-whole-candidate-as-text-prop-p  nil)
         (set-name                               (icicle-substring-no-properties
                                                  (completing-read
                                                   "<span class="quote">Saved completion set: </span>"
                                                   icicle-saved-completion-sets nil nil nil
                                                   'icicle-completion-set-history)))
         (file-name                              "<span class="quote"></span>"))
    (setq file-name  (expand-file-name
                      (read-file-name "<span class="quote">Cache file for the set: </span>" default-directory nil nil
                                      (concat (icicle-delete-whitespace-from-string set-name) "<span class="quote">.icy</span>"))))
    (while (not (icicle-file-writable-p file-name))
      (setq file-name  (expand-file-name
                        (read-file-name
                         "<span class="quote">Cannot write to that file. Cache file: </span>" default-directory nil nil
                         (concat (icicle-delete-whitespace-from-string set-name) "<span class="quote">.icy</span>")))))
    (setq icicle-saved-completion-sets  <span class="linecomment">; Remove any old definition of this set.</span>
          (icicle-assoc-delete-all set-name icicle-saved-completion-sets))
    (push (cons set-name file-name) icicle-saved-completion-sets) <span class="linecomment">; Add new set definition.</span>
    (funcall icicle-customize-save-variable-function
             'icicle-saved-completion-sets
             icicle-saved-completion-sets)
    (message "<span class="quote">Added set to `icicle-saved-completion-sets': `%s'</span>" set-name)
    file-name))                         <span class="linecomment">; Return cache-file name.</span>

<span class="linecomment">;; Similar to `filesets-add-buffer', but that insists on a buffer.  This is actually a top-level</span>
<span class="linecomment">;; command, but it is in this file because it is used by `icicle-candidate-set-save-1'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-add-file-to-fileset (&optional file name)
  "<span class="quote">Add FILE to the fileset called NAME.
If FILE is nil, use file of current buffer.
If NAME is nil, prompt for the fileset.</span>"
  (interactive)
  (unless (require 'filesets nil t) (error "<span class="quote">Cannot find library `filesets'</span>"))
  (setq file  (or file (buffer-file-name) (and (interactive-p) (read-file-name "<span class="quote">File to add: </span>"
                                                                               nil nil t))
                  (error "<span class="quote">Current buffer has no associated file</span>"))
        name  (or name (and (interactive-p) (completing-read (format "<span class="quote">Add `%s' to fileset: </span>" file)
                                                             filesets-data))
                  (error "<span class="quote">No fileset</span>")))
  (let ((entry  (or (assoc name filesets-data)
                    (and (interactive-p)
                         (when (y-or-n-p (format "<span class="quote">Fileset `%s' does not exist. Create it? </span>" name))
                           (add-to-list 'filesets-data (list name '(:files)))
                           (message "<span class="quote">Fileset created.  Use `M-x filesets-save-config' to save it.</span>")
                           (car filesets-data))))))
    (if (not entry)
        (when (interactive-p) (message "<span class="quote">Operation cancelled - no fileset</span>"))
      (let* ((files  (filesets-entry-get-files entry)))
        (cond ((filesets-member file files :test 'filesets-files-equalp)
               (message "<span class="quote">`%s' is already in fileset `%s'</span>" file name))
              ((and file (eq (filesets-entry-mode entry) ':files))
               (filesets-entry-set-files entry (cons file files) t)
               (filesets-set-config name 'filesets-data filesets-data))
              (t (error "<span class="quote">Cannot add file. Fileset `%s' is not of type Files (:files)</span>" name)))))))

(defun icicle-markers-to-readable (cand)
  "<span class="quote">Convert (serialize) candidate CAND to Lisp-readable representation.
CAND is a full completion candidate (collection alist entry).
A Lisp-readable candidate uses one of the following forms to represent
a marker:
  (icicle-file-marker  FILE-NAME    MARKER-POSITION)
  (icicle-marker       BUFFER-NAME  MARKER-POSITION)</span>"
  (if (atom cand)
      (if (markerp cand)
          (let ((buf  (marker-buffer cand)))
            (unless buf (error "<span class="quote">Marker in no buffer</span>"))
            (list (if (buffer-file-name buf) 'icicle-file-marker 'icicle-marker)
                  (or (buffer-file-name buf) (buffer-name buf))
                  (marker-position cand)))
        cand)
    (cons (icicle-markers-to-readable (car cand)) (icicle-markers-to-readable (cdr cand)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-to-variable () <span class="linecomment">; Bound to `C-M-}' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates in a variable you choose.
You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-variable]' (or `\\[icicle-candidate-set-retrieve]'
with a numeric prefix arg).
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-to-variable]').</span>"
  (interactive)
  (icicle-candidate-set-save 99))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-persistently (filesetp) <span class="linecomment">; Bound to `C-}' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates persistently.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-persistent]' or `C-u \\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-persistently]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save (if filesetp 0 '(1))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-keep-only-past-inputs (&optional recent-first) <span class="linecomment">; Bound to`M-pause' in minibuffer.</span>
  "<span class="quote">Narrow completion candidates to those that have been used previously.
This filters the set of current completion candidates, keeping only
those that have been used before.  (You must first use `TAB' or
`S-TAB' to establish an explicit candidate set.)

With a prefix arg, the previous inputs are sorted chronologically,
most recent first.

Note that whatever completion mode (prefix or apropos) was in effect
before you use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-keep-only-past-inputs]' remains in \ effect for
`icicle-keep-only-past-inputs'.  This command does not use a recursive
minibuffer; it simply co-opts the current completion, changing it to
completion against the history.

You can use this command only from the minibuffer \
\(`\\[icicle-keep-only-past-inputs]').

See also `\\[icicle-history]' (`icicle-history').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (if (and recent-first (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (let ((icicle-sort-comparer  (if recent-first 'icicle-most-recent-first-p icicle-sort-comparer)))
      (when (or recent-first (eq icicle-last-completion-command 'icicle-keep-only-past-inputs))
        (icicle-complete-again-update 'no-display))
      (if (null icicle-completion-candidates)
          (minibuffer-message "<span class="quote">  [No completion candidates to filter]</span>")
        (unless (boundp minibuffer-history-variable) (set minibuffer-history-variable nil))
        (when (consp (symbol-value minibuffer-history-variable))
          (setq icicle-completion-candidates
                (icicle-remove-if-not
                 (lambda (candidate)
                   (when (icicle-file-name-input-p)
                     (setq candidate  (expand-file-name
                                       candidate (icicle-file-name-directory icicle-last-input))))
                   (member candidate (symbol-value minibuffer-history-variable)))
                 icicle-completion-candidates))
          (cond ((null icicle-completion-candidates)
                 (save-selected-window (icicle-remove-Completions-window))
                 (minibuffer-message "<span class="quote">  [None of the completions have been used before]</span>"))
                (t
                 (cond ((and (symbolp last-command) (get last-command 'icicle-cycling-command))
                        (setq icicle-current-input  icicle-last-input)
                        (icicle-retrieve-last-input))
                       (t
                        (setq icicle-current-input  (icicle-input-from-minibuffer))))
                 (cond ((null icicle-completion-candidates)
                        (setq icicle-nb-of-other-cycle-candidates  0)
                        (save-selected-window (icicle-remove-Completions-window))
                        (minibuffer-message "<span class="quote">  [No matching history element]</span>"))
                       ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single cand. Update minibuffer.</span>
                        (setq icicle-nb-of-other-cycle-candidates  0)
                        (icicle-clear-minibuffer)
                        (setq icicle-last-completion-candidate  (car icicle-completion-candidates))
                        (let ((inserted  (if (and (icicle-file-name-input-p) insert-default-directory
                                                  (or (not (member icicle-last-completion-candidate
                                                                   icicle-extra-candidates))
                                                      icicle-extra-candidates-dir-insert-p))
                                             (icicle-abbreviate-or-expand-file-name
                                              icicle-last-completion-candidate
                                              (icicle-file-name-directory-w-default
                                               icicle-current-input))
                                           icicle-last-completion-candidate)))
                          (insert inserted))
                        (save-selected-window (icicle-remove-Completions-window))
                        (icicle-highlight-complete-input)
                        (icicle-show-help-in-mode-line icicle-last-completion-candidate)
                        (minibuffer-message (format "<span class="quote">  [One matching history element]</span>")))
                       (t
                        (when (member icicle-current-input icicle-completion-candidates)
                          (icicle-highlight-complete-input)
                          (icicle-show-help-in-mode-line icicle-current-input))
                        (icicle-display-candidates-in-Completions)
                        (save-window-excursion
                          (select-window (active-minibuffer-window))
                          (minibuffer-message
                           (concat "<span class="quote">  [Filtered to (matching) historical candidates</span>"
                                   (and recent-first "<span class="quote">, most recent first</span>")
                                   "<span class="quote">]</span>")))))
                 (setq icicle-last-completion-command  'icicle-keep-only-past-inputs)))))
      icicle-completion-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-other-history (arg)       <span class="linecomment">; Bound to `C-M-pause' in minibuffer.</span>
  "<span class="quote">Choose a history, or complete against `icicle-interactive-history'.
For Emacs 23 or later, if no prefix arg and you are completing a
  command, abbrev, or keyboard macro name, then complete against
  (non-nil) `icicle-interactive-history'.
Otherwise, prompt with completion for a minibuffer history to use.
  The history choice lasts only for the current (main) completion.
  (To then complete against this history, use `M-h'.)</span>"
  (interactive "<span class="quote">P</span>")
  (if (and (&gt; emacs-major-version 22)
           (memq minibuffer-history-variable
                 '(extended-command-history icicle-command-abbrev-history icicle-kmacro-history))
           (not arg)
           icicle-interactive-history)
      (icicle-use-interactive-command-history)
    (call-interactively #'icicle-change-history-variable)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-use-interactive-command-history ()
  "<span class="quote">Complete input against `icicle-interactive-history'.
This is a history of all Emacs commands called interactively.
This history is available only for Emacs 23 and later, and only if
option `icicle-populate-interactive-history-flag' is not nil.</span>"
  (interactive)
  (icicle-change-history-variable "<span class="quote">icicle-interactive-history</span>")
  (icicle-history))

<span class="linecomment">;;;###autoload</span>
(defun icicle-change-history-variable (hist-var)
  "<span class="quote">Choose a history variable to use now for `minibuffer-history-variable'.
Use completion to choose the history to use.
The choice lasts only for the current (main) completion.
Non-interactively, arg HIST-VAR is the (string) name of a history var.</span>"
  (interactive
   (let ((enable-recursive-minibuffers  t)
         (icicle-hist-vars              `((,(symbol-name minibuffer-history-variable))
                                          (,(symbol-name 'icicle-previous-raw-file-name-inputs))
                                          (,(symbol-name 'icicle-previous-raw-non-file-name-inputs)))))
     (when (and (boundp 'icicle-populate-interactive-history-flag) <span class="linecomment">; Emacs 23+.</span>
                icicle-populate-interactive-history-flag)
       (push (symbol-name 'icicle-interactive-history)  icicle-hist-vars))
     (mapatoms (lambda (x) (when (and (boundp x) (consp (symbol-value x))
                                      (stringp (car (symbol-value x)))
                                      (string-match "<span class="quote">-\\(history\\|ring\\)\\'</span>" (symbol-name x)))
                             (push (list (symbol-name x)) icicle-hist-vars))))
     (list (completing-read "<span class="quote">Use history: </span>" icicle-hist-vars nil t nil nil nil))))
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (setq minibuffer-history-variable  (intern hist-var)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-scroll-forward (&optional arg) <span class="linecomment">; `C-M-v' in minibuffer.</span>
  "<span class="quote">Scroll `icicle-other-window' forward.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((win  (if (window-live-p icicle-other-window)
                  icicle-other-window
                (if (window-live-p icicle-orig-window)
                    icicle-orig-window
                  (get-buffer-window "<span class="quote">*Completions*</span>" 0)))))
    (when win (save-selected-window (select-window win) (scroll-up arg)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-scroll-backward (&optional arg) <span class="linecomment">; `C-M-S-v' (aka `C-M-V') in minibuffer.</span>
  "<span class="quote">Scroll `icicle-other-window' backward.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((win  (if (window-live-p icicle-other-window)
                  icicle-other-window
                (if (window-live-p icicle-orig-window)
                    icicle-orig-window
                  (get-buffer-window "<span class="quote">*Completions*</span>" 0)))))
    (when win (save-selected-window (select-window win) (scroll-down arg)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-scroll-Completions-forward (&optional reverse) <span class="linecomment">; `C-v' minib; `wheel-down' *Completions*.</span>
  "<span class="quote">Scroll the `*Completions*' window forward.
With a prefix argument, or if `icicle-scroll-Completions-reverse-p' is
non-nil, scroll backward.</span>"
  (interactive "<span class="quote">P</span>")
  (when (get-buffer-window "<span class="quote">*Completions*</span>" 0)
    (save-selected-window
      (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 0))
      (when (if (interactive-p) reverse current-prefix-arg) <span class="linecomment">; Non-interactive use is for `TAB', `S-TAB'.</span>
        (setq icicle-scroll-Completions-reverse-p  (not icicle-scroll-Completions-reverse-p)))
      (cond (icicle-scroll-Completions-reverse-p
             (if (not (= (window-start) (point-min)))
                 (scroll-down nil)
               (unless (= (window-end) (point-max))
                 (goto-char (point-max))
                 (scroll-down (1- (/ (window-height) 2)))
                 (beginning-of-line))))
            (t
             (if (not (= (window-end) (point-max)))
                 (scroll-up nil)
               (unless (= (window-start) (point-min))
                 (goto-char (icicle-start-of-candidates-in-Completions)))))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-scroll-Completions-backward () <span class="linecomment">; `M-v' in minibuf; `wheel-up' in `*Completions*'.</span>
  "<span class="quote">Scroll the `*Completions*' window backward.
If `icicle-scroll-Completions-reverse-p' is non-nil, scroll forward.</span>"
  (interactive)
  (let ((icicle-scroll-Completions-reverse-p  (not icicle-scroll-Completions-reverse-p)))
    (icicle-scroll-Completions-forward)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-history ()                <span class="linecomment">; Bound to `M-h' in minibuffer.</span>
  "<span class="quote">Access the appropriate history list using completion or cycling.
Complete the current minibuffer input against items in the history
list that is in use for the current command.

NOTE:

1. If the required input is a file or directory name, then the entire
minibuffer input is what is matched against the history list.  The
reason for this is that file names in the history list are usually
absolute.  This is unlike the case for normal file-name completion,
which assumes the default directory.

Keep this in mind for apropos (regexp) completion; it means that to
match a file-name using a substring you must, in the minibuffer,
either not specify a directory or explicitly use \".*\" before the
file-name substring.

For example, `/foo/bar/lph' will not apropos-match the previously
input file name `/foo/bar/alphabet-soup.el'; you should use either
`/foo/bar/.*lph' or `lph' (no directory).

2. This also represents a difference in behavior compared to the
similar command `icicle-keep-only-past-inputs' \
\(`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-keep-only-past-inputs]' in the
minibuffer).  That command simply filters the current set of
completion candidates, which in the case of file-name completion is a
set of relative file names.

3. Whatever completion mode (prefix or apropos) was in effect before
you use `\\&lt;minibuffer-local-completion-map&gt;\ \\[icicle-history]' remains in \
effect for `icicle-history'.  This command
does not use a recursive minibuffer; it simply co-opts the current
completion, changing it to completion against the history.

You can use this command only from the minibuffer \
\(`\\[icicle-history]').

See also `\\[icicle-keep-only-past-inputs]' (`icicle-keep-only-past-inputs').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (icicle-file-name-input-p)
    (setq minibuffer-completion-predicate  nil
          minibuffer-completing-file-name  nil))
  (when (and (arrayp minibuffer-completion-table) minibuffer-completion-predicate)
    (setq minibuffer-completion-predicate
          `(lambda (elt) (funcall ',minibuffer-completion-predicate
                          (intern (if (consp elt) (car elt) elt))))))
  (when (and (boundp minibuffer-history-variable) (consp (symbol-value minibuffer-history-variable)))
    (setq minibuffer-completion-table
          (mapcar #'list (icicle-remove-duplicates
                          <span class="linecomment">;; `command-history' is an exception: its entries are not strings.</span>
                          (if (eq 'command-history minibuffer-history-variable)
                              (mapcar #'prin1-to-string (symbol-value minibuffer-history-variable))
                            (symbol-value minibuffer-history-variable))))))
  (save-selected-window (unless icicle-last-completion-command (icicle-apropos-complete)))
  (cond (icicle-cycling-p <span class="linecomment">;; $$$ (and (symbolp last-command) (get last-command 'icicle-cycling-command))</span>
         (setq icicle-current-input  icicle-last-input)
         (icicle-retrieve-last-input))
        (t
         (setq icicle-current-input  (icicle-input-from-minibuffer)
               icicle-last-input     nil <span class="linecomment">; So `icicle-save-or-restore-input' thinks input has changed.</span>
               last-command          'icicle-history)
         (funcall (or icicle-last-completion-command 'icicle-apropos-complete)))))

<span class="linecomment">;; Not actually a minibuffer command, since `isearch' technically uses the echo area.  This is not</span>
<span class="linecomment">;; shadowed by any `icicle-mode-map' binding, since `isearch-mode-map' is also a minor mode map.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-isearch-complete ()       <span class="linecomment">; Bound to `M-TAB' and `M-o' in `isearch-mode-map'.</span>
  "<span class="quote">Complete the search string using candidates from the search ring.</span>"
  (interactive)
  (cond ((icicle-completing-p)          <span class="linecomment">; Cannot use the var here, since not sure to be in minibuf.</span>
         (setq isearch-string  (if (fboundp 'field-string) (field-string) (buffer-string)))
         (when (icicle-isearch-complete-past-string)
           (if (fboundp 'delete-field) (delete-field) (erase-buffer))
           (insert isearch-string)))
        (t
         (icicle-isearch-complete-past-string)
         (setq isearch-message  (mapconcat 'isearch-text-char-description isearch-string "<span class="quote"></span>"))
         (isearch-edit-string))))

(when (fboundp 'text-scale-increase)    <span class="linecomment">; Bound to `C-x -' in the minibuffer (Emacs 23+).</span>
  (defun icicle-doremi-zoom-Completions+ (&optional increment)
    "<span class="quote">Zoom the text in buffer `*Completions*' incrementally.
Use `=', `-', or the mouse wheel to increase or decrease text
size.  You can use the `Meta' key (`M-=' or `M--') to increment in
larger steps.</span>"
    (interactive "<span class="quote">p</span>")
    (unless (require 'doremi-frm nil t) (error "<span class="quote">This command needs library `doremi-frm.el'.</span>"))
    (unless (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)
      (if icicle-completion-candidates
          (icicle-display-candidates-in-Completions)
        (icicle-msg-maybe-in-minibuffer "<span class="quote">Did you hit `TAB' or `S-TAB'?</span>")))
    (let ((mini  (active-minibuffer-window)))
      (unwind-protect
           (save-selected-window
             (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
             (let ((enable-recursive-minibuffers  t)
                   (doremi-up-keys                '(?=))
                   (doremi-down-keys              '(?-))
                   (doremi-boost-up-keys          '(?\M-=))
                   (doremi-boost-down-keys        '(?\M--)))
               (doremi-buffer-font-size+ increment))
             (setq unread-command-events  ()))
        (unless mini (icicle-remove-Completions-window))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-doremi-candidate-width-factor+ (&optional increment) <span class="linecomment">; Bound to `C-x w' in minibuffer.</span>
  "<span class="quote">Change `icicle-candidate-width-factor' incrementally.
Use `right', `left' or mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-right') to increment in larger steps.

Use `up', `down', or the mouse wheel to adjust
`icicle-inter-candidates-min-spaces'.</span>"
  (interactive "<span class="quote">p</span>")
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
  (let ((mini  (active-minibuffer-window)))
    (unwind-protect
         (save-selected-window
           (select-window (minibuffer-window))
           (unless icicle-completion-candidates (message "<span class="quote">Hit `TAB' or `S-TAB'</span>"))
           (let ((enable-recursive-minibuffers  t)
                 (doremi-up-keys                '(left)) <span class="linecomment">; Rebind, so more intuitive for width.</span>
                 (doremi-boost-up-keys          '(M-left))
                 (doremi-down-keys              '(right))
                 (doremi-boost-down-keys        '(M-right)))
             (doremi (lambda (new-val)
                       (setq new-val                        (doremi-wrap new-val 1 100)
                             icicle-candidate-width-factor  new-val)
                       (icicle-display-candidates-in-Completions)
                       new-val)
                     icicle-candidate-width-factor
                     (- increment)))    <span class="linecomment">; Reverse, so arrows correspond.</span>
           (when (member (car unread-command-events)
                         (append doremi-up-keys   doremi-boost-up-keys 
                                 doremi-down-keys doremi-boost-down-keys))
             (icicle-doremi-inter-candidates-min-spaces+ increment))
           (setq unread-command-events  ()))
      (unless mini (icicle-remove-Completions-window)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-doremi-inter-candidates-min-spaces+ (&optional increment) <span class="linecomment">; Bound to `C-x |' in minibuf.</span>
  "<span class="quote">Change `icicle-inter-candidates-min-spaces' incrementally.
Use `up', `down' or the mouse wheel to increase or decrease.  You can
 use the `Meta' key (e.g. `M-right') to increment in larger steps.
Use `left', `right', or the mouse wheel to adjust
`icicle-candidate-width-factor'.</span>"
  (interactive "<span class="quote">p</span>")
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
  (let ((mini  (active-minibuffer-window)))
    (unwind-protect
         (save-selected-window
           (select-window (minibuffer-window))
           (unless icicle-completion-candidates (message "<span class="quote">Hit `TAB' or `S-TAB'</span>"))
           (let* ((enable-recursive-minibuffers  t))
             (doremi (lambda (new-val)
                       (setq new-val                             (doremi-limit new-val 1 nil)
                             icicle-inter-candidates-min-spaces  new-val)
                       (icicle-display-candidates-in-Completions)
                       new-val)
                     icicle-inter-candidates-min-spaces
                     increment))
           (when (member (car unread-command-events)'(left right M-left M-right))
             (icicle-doremi-candidate-width-factor+ increment))
           (setq unread-command-events  ()))
      (unless mini (icicle-remove-Completions-window)))))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-WYSIWYG-Completions 'icicle-toggle-WYSIWYG-Completions)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-WYSIWYG-Completions ()
  "<span class="quote">Toggle the value of option `icicle-WYSIWYG-Completions-flag'.</span>"
  (interactive)
  (setq icicle-WYSIWYG-Completions-flag  (not icicle-WYSIWYG-Completions-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-WYSIWYG-Completions-flag
                                      "<span class="quote">Using WYSIWYG for `*Completions*' display is now ON</span>"
                                    "<span class="quote">Using WYSIWYG for `*Completions*' display is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-~-for-home-dir 'icicle-toggle-~-for-home-dir)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-~-for-home-dir ()  <span class="linecomment">; Bound to `M-~' in minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-use-~-for-home-dir-flag'.
Bound to `M-~' in the minibuffer.</span>"
  (interactive)
  (setq icicle-use-~-for-home-dir-flag  (not icicle-use-~-for-home-dir-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-use-~-for-home-dir-flag
                                      "<span class="quote">Using `~' for home directory is now ON</span>"
                                    "<span class="quote">Using `~' for home directory is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-C-for-actions 'icicle-toggle-C-for-actions)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-C-for-actions ()   <span class="linecomment">; Bound to `M-g' in minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-use-C-for-actions-flag'.
Bound to `M-g' in the minibuffer.</span>"
  (interactive)
  (setq icicle-use-C-for-actions-flag  (not icicle-use-C-for-actions-flag))
  (icicle-toggle-icicle-mode-twice)
  (icicle-msg-maybe-in-minibuffer (if icicle-use-C-for-actions-flag
                                      "<span class="quote">Using `C-' prefix for multi-command actions is now ON</span>"
                                    "<span class="quote">Using `C-' prefix for multi-command actions is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-alternative-sorting 'icicle-toggle-alternative-sorting)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-alternative-sorting () <span class="linecomment">; Bound to `C-M-,' in minibuffer.</span>
  "<span class="quote">Toggle alternative sorting of minibuffer completion candidates.
This swaps `icicle-alternative-sort-comparer' and `icicle-sort-comparer'.
Bound to `C-M-,' in the minibuffer.</span>"
  (interactive)
  (let ((alt-sort-fn  icicle-alternative-sort-comparer))
    (setq icicle-alternative-sort-comparer  (or icicle-sort-comparer icicle-last-sort-comparer)
          icicle-sort-comparer              (or alt-sort-fn icicle-last-sort-comparer))
    (icicle-complete-again-update)
    (icicle-msg-maybe-in-minibuffer
     (format "<span class="quote">Sorting: `%s', Alternative: `%s'</span>"
             icicle-sort-comparer icicle-alternative-sort-comparer))))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-sorting 'icicle-toggle-sorting)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-sorting ()         <span class="linecomment">; Not bound to a key.</span>
  "<span class="quote">Toggle sorting of minibuffer completion candidates.
When sorting is active, comparison is done by `icicle-sort-comparer'.</span>"
  (interactive)
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (if icicle-sort-comparer
        (setq icicle-last-sort-comparer  icicle-sort-comparer <span class="linecomment">; Save it, for restoring.</span>
              icicle-sort-comparer       nil)
      (setq icicle-sort-comparer  icicle-last-sort-comparer)) <span class="linecomment">; Restore it.</span>
    (icicle-complete-again-update)
    (icicle-msg-maybe-in-minibuffer (if icicle-sort-comparer
                                        "<span class="quote">Completion-candidate sorting is now ON</span>"
                                      "<span class="quote">Completion-candidate sorting is now OFF</span>"))))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-angle-brackets 'icicle-toggle-angle-brackets)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-angle-brackets ()
  "<span class="quote">Toggle `icicle-key-descriptions-use-&lt;&gt;-flag'.</span>"
  (interactive)
  (setq icicle-key-descriptions-use-&lt;&gt;-flag  (not icicle-key-descriptions-use-&lt;&gt;-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-key-descriptions-use-&lt;&gt;-flag
                                      "<span class="quote">Displaying &lt;...&gt; in key descriptions is now ON</span>"
                                    "<span class="quote">Displaying &lt;...&gt; in key descriptions is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-proxy-candidates 'icicle-toggle-proxy-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-proxy-candidates () <span class="linecomment">; Bound to `C-M-_' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-add-proxy-candidates-flag'.
Bound to `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-proxy-candidates]' in the minibuffer.
With some commands, you must re-invoke the command for the new value
to take effect.  (This is for performance reasons.)</span>"
  (interactive)
  (setq icicle-add-proxy-candidates-flag  (not icicle-add-proxy-candidates-flag)
        icicle-saved-proxy-candidates     (prog1 icicle-proxy-candidates
                                            (setq icicle-proxy-candidates
                                                  icicle-saved-proxy-candidates)))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-add-proxy-candidates-flag
                                      "<span class="quote">Including proxy candidates is now ON</span>"
                                    "<span class="quote">Including proxy candidates is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-transforming 'icicle-toggle-transforming)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-transforming ()    <span class="linecomment">; Bound to `C-$' in minibuffer.</span>
  "<span class="quote">Toggle transforming of minibuffer completion candidates.
When transforming is active, it is done by `icicle-transform-function'.

By default, transformation, if active, simply removes duplicate
candidates.  Icicles commands already \"do the right thing\" when it
comes to duplicate removal, so you might never need this command.

Bound to `C-$' in the minibuffer.</span>"
  (interactive)
  (if icicle-transform-function
      (setq icicle-last-transform-function  icicle-transform-function <span class="linecomment">; Save it, for restoring.</span>
            icicle-transform-function       nil)
    (setq icicle-transform-function  icicle-last-transform-function)) <span class="linecomment">; Restore it.</span>
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-transform-function
                                      "<span class="quote">Completion-candidate transformation is now ON</span>"
                                    "<span class="quote">Completion-candidate transformation is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-incremental-completion 'icicle-toggle-incremental-completion)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-incremental-completion () <span class="linecomment">; Bound to `C-#' in minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-incremental-completion-flag'.
If the current value is t or `always', then it is set to nil.
If the current value is nil, then it is set to t.
This command never sets the value to non-nil and non-t.

Bound to `C-#' in the minibuffer.</span>"
  (interactive)
  (setq icicle-incremental-completion-flag  (not icicle-incremental-completion-flag)
        icicle-incremental-completion-p     icicle-incremental-completion-flag)
  (icicle-msg-maybe-in-minibuffer (if icicle-incremental-completion-flag
                                      "<span class="quote">Incremental completion is now ON</span>"
                                    "<span class="quote">Incremental completion is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-expand-to-common-match 'icicle-toggle-expand-to-common-match)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-expand-to-common-match () <span class="linecomment">; Bound to `C-;' in minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-expand-input-to-common-match-flag'.
Bound to `C-;' in the minibuffer.</span>"
  (interactive)
  (setq icicle-expand-input-to-common-match-flag  (not icicle-expand-input-to-common-match-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-expand-input-to-common-match-flag
                                      "<span class="quote">Expanding input to common match is now ON</span>"
                                    "<span class="quote">Expanding input to common match is now OFF</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-C-^ ()           <span class="linecomment">; Bound to `C-^' in minibuffer.</span>
  "<span class="quote">Do the right thing for `C-^'
When Icicles searching, call `icicle-toggle-highlight-all-current'.
Otherwise, call `icicle-toggle-remote-file-testing'.
Bound to `C-^' in the minibuffer.</span>"
  (interactive)
  (if icicle-searching-p (icicle-toggle-highlight-all-current) (icicle-toggle-remote-file-testing)))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-remote-file-testing 'icicle-toggle-remote-file-testing)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-remote-file-testing () <span class="linecomment">; Bound to `C-^' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-test-for-remote-files-flag'.
If you use Tramp for accessing remote files, then turning this off
also turns off Tramp file-name completion.  Therefore, if you use this
command to turn off testing of remote file names, then use it also to
turn testing back on (instead of just setting the option to non-nil).

Bound to `C-^' in the minibuffer, except during Icicles searching.</span>"
  (interactive)
  (setq icicle-test-for-remote-files-flag  (not icicle-test-for-remote-files-flag))
  (when (require 'tramp nil t)
    (if (not icicle-test-for-remote-files-flag)
        (tramp-unload-file-name-handlers) <span class="linecomment">; Turn off Tramp remote file-name completion.</span>
      <span class="linecomment">;; Bind `partial-completion-mode' to force Tramp file-name handlers unconditionally, for older</span>
      <span class="linecomment">;; Tramp versions than 2.1 (ugly HACK).  This code should work for all Tramp versions.</span>
      (let ((non-essential            t) <span class="linecomment">; Emacs 23.2+</span>
            (partial-completion-mode  t))
        (condition-case nil
            (tramp-register-file-name-handlers) <span class="linecomment">; Emacs 22+</span>
          (void-function
           (tramp-register-file-name-handler) <span class="linecomment">; The order of these two matters.</span>
           (tramp-register-completion-file-name-handler))))))
  (message "<span class="quote">Updating completions...</span>")
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-test-for-remote-files-flag
                                      "<span class="quote">Testing remote file names is now ON</span>"
                                    "<span class="quote">Testing remote file names is now OFF</span>")))

<span class="linecomment">;; NOT a top-level command (most toggle commands can be used at top-level).</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-highlight-all-current 'icicle-toggle-highlight-all-current)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-highlight-all-current () <span class="linecomment">; Bound to `C-^' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-search-highlight-all-current-flag'.
Bound to `C-^' in the minibuffer during Icicles searching (only).</span>"
  (interactive)
  (icicle-barf-if-outside-Completions-and-minibuffer)
  (setq icicle-search-highlight-all-current-flag  (not icicle-search-highlight-all-current-flag))
  <span class="linecomment">;; Rehighlight to see effect of toggle.</span>
  (let ((icicle-candidate-nb  icicle-candidate-nb))
    (let ((icicle-current-input             icicle-current-input)
          (icicle-incremental-completion-p  nil))
      (icicle-erase-minibuffer))
    (icicle-retrieve-last-input)
    (funcall (or icicle-last-completion-command  (if (eq icicle-current-completion-mode 'prefix)
                                                     #'icicle-prefix-complete
                                                   #'icicle-apropos-complete))))
  (icicle-search-highlight-all-input-matches icicle-current-input)
  (when icicle-candidate-nb (icicle-search-action "<span class="quote">DUMMY</span>")) <span class="linecomment">; Get back to current.</span>
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame))
  (icicle-msg-maybe-in-minibuffer
   (if icicle-search-highlight-all-current-flag
       "<span class="quote">Highlighting current input match in each main search hit is now ON</span>"
     "<span class="quote">Highlighting current input match in each main search hit is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-hiding-common-match 'icicle-toggle-hiding-common-match)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-hiding-common-match () <span class="linecomment">; Bound to `C-M-.' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-hide-common-match-in-Completions-flag'.
Bound to `C-M-.' in the minibuffer.</span>"
  (interactive)
  (setq icicle-hide-common-match-in-Completions-flag
        (not icicle-hide-common-match-in-Completions-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-hide-common-match-in-Completions-flag
                                      "<span class="quote">Hiding common match in `*Completions*' is now ON</span>"
                                    "<span class="quote">Hiding common match in `*Completions*' is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-show-multi-completion 'icicle-toggle-show-multi-completion)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-show-multi-completion () <span class="linecomment">; Bound to `M-m' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-show-multi-completion-flag'.
Bound to `M-m' in the minibuffer.</span>"
  (interactive)
  (setq icicle-show-multi-completion-flag  (not icicle-show-multi-completion-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer
   (if icicle-show-multi-completion-flag
       "<span class="quote">Showing multi-completions (when available) is now ON</span>"
     "<span class="quote">Showing multi-completions (when available) is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-ignored-space-prefix 'icicle-toggle-ignored-space-prefix)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignored-space-prefix () <span class="linecomment">; Bound to `M-_' in minibuffer, except when searching.</span>
  "<span class="quote">Toggle `icicle-ignore-space-prefix-flag'.
Bound to `M-_' in the minibuffer, except during Icicles searching.

Note: If the current command binds `icicle-ignore-space-prefix-flag'
locally, then it is the local, not the global, value that is changed.
For example, `icicle-buffer' binds it to the value of
`icicle-buffer-ignore-space-prefix-flag'.  If that is non-nil, then
\\&lt;minibuffer-local-completion-map&gt;`\\[icicle-toggle-ignored-space-prefix]' toggles \
`icicle-ignore-space-prefix-flag' to nil only for the
duration of `icicle-buffer'.</span>"
  (interactive)
  (setq icicle-ignore-space-prefix-flag  (not icicle-ignore-space-prefix-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-ignore-space-prefix-flag
                                      "<span class="quote">Ignoring space prefix is now ON</span>"
                                    "<span class="quote">Ignoring space prefix is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-highlight-historical-candidates
    'icicle-toggle-highlight-historical-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-highlight-historical-candidates () <span class="linecomment">; Bound to `C-pause' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-highlight-historical-candidates-flag'.
Bound to `C-pause' in the minibuffer.</span>"
  (interactive)
  (setq icicle-highlight-historical-candidates-flag  (not icicle-highlight-historical-candidates-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer
   (if icicle-highlight-historical-candidates-flag
       "<span class="quote">Highlighting previously used inputs in `*Completions*' is now ON</span>"
     "<span class="quote">Highlighting previously used inputs in `*Completions*' is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-highlight-saved-candidates
    'icicle-toggle-highlight-saved-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-highlight-saved-candidates () <span class="linecomment">; Bound to `S-pause' in minibuffer.</span>
  "<span class="quote">Toggle `icicle-highlight-saved-candidates-flag'.
Bound to `S-pause' in the minibuffer.</span>"
  (interactive)
  (setq icicle-highlight-saved-candidates-flag  (not icicle-highlight-saved-candidates-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer
   (if icicle-highlight-saved-candidates-flag
       "<span class="quote">Highlighting saved candidates in `*Completions*' is now ON</span>"
     "<span class="quote">Highlighting saved candidates in `*Completions*' is now OFF</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-C-. ()           <span class="linecomment">; Bound to `C-.' in minibuffer.</span>
  "<span class="quote">Do the right thing for `C-.'.
When using Icicles search (`icicle-search' and similar commands), call
 `icicle-toggle-search-cleanup'.
Otherwise, call `icicle-toggle-ignored-extensions'.

Bound to `C-.' in the minibuffer.</span>"
  (interactive)
  (if icicle-searching-p (icicle-toggle-search-cleanup) (icicle-toggle-ignored-extensions)))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-ignored-extensions 'icicle-toggle-ignored-extensions)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignored-extensions () <span class="linecomment">; Bound to `C-.' in minibuffer except in Icicles search.</span>
  "<span class="quote">Toggle respect of `completion-ignored-extensions'.
Bound to `C-.' in minibuffer during file-name input.</span>"
  (interactive)
  (if (consp completion-ignored-extensions)
      (setq icicle-saved-ignored-extensions   completion-ignored-extensions <span class="linecomment">; Save it.</span>
            completion-ignored-extensions     ()
            icicle-ignored-extensions-regexp  nil)
    (setq completion-ignored-extensions  icicle-saved-ignored-extensions <span class="linecomment">; Restore it.</span>
          icicle-ignored-extensions-regexp <span class="linecomment">; Make regexp for ignored file extensions.</span>
          (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">$\\|</span>") "<span class="quote">$\\)\\'</span>")))
  <span class="linecomment">;; Flag to prevent updating `icicle-ignored-extensions-regexp' unless</span>
  <span class="linecomment">;; `completion-ignored-extensions' changes.</span>
  (setq icicle-ignored-extensions  completion-ignored-extensions)
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if completion-ignored-extensions
                                      "<span class="quote">Ignoring selected file extensions is now ON</span>"
                                    "<span class="quote">Ignoring selected file extensions is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-search-cleanup 'icicle-toggle-search-cleanup)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-cleanup ()  <span class="linecomment">; Bound to `C-.' in minibuffer during Icicles search.</span>
  "<span class="quote">Toggle removal of `icicle-search' highlighting after a search.
This toggles option `icicle-search-cleanup-flag'.
Bound to `C-.' in the minibuffer, except for file-name input.</span>"
  (interactive)
  (setq icicle-search-cleanup-flag  (not icicle-search-cleanup-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-search-cleanup-flag
                                      "<span class="quote">Removal of Icicles search highlighting is now ON</span>"
                                    "<span class="quote">Removal of Icicles search highlighting is now OFF</span>")))

<span class="linecomment">;;$$$ (defun icicle-dispatch-C-backquote ()   ; Bound to `C-`' in minibuffer.</span>
<span class="linecomment">;;   "Do the right thing for `C-`'.</span>
<span class="linecomment">;; When searching, call `icicle-toggle-literal-replacement'.</span>
<span class="linecomment">;; Otherwise, call `icicle-toggle-regexp-quote'.</span>

<span class="linecomment">;; Bound to `C-`' in the minibuffer."</span>
<span class="linecomment">;;   (interactive)</span>
<span class="linecomment">;;   (if icicle-searching-p (icicle-toggle-literal-replacement) (icicle-toggle-regexp-quote)))</span>


<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-regexp-quote 'icicle-toggle-regexp-quote)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-regexp-quote ()    <span class="linecomment">; Bound to `C-`' in minibuffer.</span>
  "<span class="quote">Toggle escaping of regexp special chars (`icicle-regexp-quote-flag').
Bound to `C-`' in the minibuffer.</span>"
  (interactive)
  (setq icicle-regexp-quote-flag  (not icicle-regexp-quote-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-regexp-quote-flag
                                      "<span class="quote">Escaping of regexp special characters is now ON</span>"
                                    "<span class="quote">Escaping of regexp special characters is now OFF</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-regexp-quote-input (beg end) <span class="linecomment">; Bound to `M-%' in minibuffer.</span>
  "<span class="quote">Regexp quote current input or its active region, then apropos-complete.
Use this if you want to literally match all of what is currently in
the minibuffer or selected text there, but you also want to use that
literal text as part of a regexp for apropos completion.

This turns off `icicle-expand-input-to-common-match-flag'.
You can toggle that option using `C-;'.

Bound to `M-%' in the minibuffer.</span>"
  (interactive (if (and mark-active (mark))
                   (list (region-beginning) (region-end))
                 (list (point-max) (point-max))))
  (icicle-barf-if-outside-Completions-and-minibuffer)
  (let ((regionp  (and mark-active (mark) (/= (point) (mark))))
        quoted-part)
    (save-excursion
      (save-restriction
        (narrow-to-region (if regionp beg (icicle-minibuffer-prompt-end)) (if regionp end (point-max)))
        (setq quoted-part  (regexp-quote (icicle-input-from-minibuffer)))
        (delete-region (icicle-minibuffer-prompt-end) (point-max))
        (insert quoted-part))))
  (setq icicle-current-input                      (icicle-input-from-minibuffer)
        icicle-expand-input-to-common-match-flag  nil)
  (icicle-apropos-complete)
  (icicle-msg-maybe-in-minibuffer (substitute-command-keys "<span class="quote">Expansion to common match is OFF. \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-expand-to-common-match]' to toggle</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-literal-replacement 'icicle-toggle-literal-replacement)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-literal-replacement () <span class="linecomment">; Bound to `C-M-`' in minibuffer.</span>
  "<span class="quote">Toggle escaping of regexp special chars in replacement text.
This toggles option `icicle-search-replace-literally-flag'.

Bound to `C-M-`' in the minibuffer.</span>"
  (interactive)
  (setq icicle-search-replace-literally-flag  (not icicle-search-replace-literally-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-replace-literally-flag
                                      "<span class="quote">Replacement of text literally is now ON</span>"
                                    "<span class="quote">Replacement of text literally is now OFF</span>")))

<span class="linecomment">;; Top-level commands.  Could instead be in `icicles-cmd2.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defalias 'toggle-icicle-case-sensitivity 'icicle-toggle-case-sensitivity)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-case-sensitivity (file+buff-p) <span class="linecomment">; Bound to `C-S-a' in minibuffer, i.e., `C-A'.</span>
  "<span class="quote">Toggle case sensitivity.

This toggles `case-fold-search' and `completion-ignore-case'.  With a
prefix arg, it also toggles `read-file-name-completion-ignore-case'
\(Emacs 22 and later) and `read-buffer-completion-ignore-case' (Emacs
23 and later).

More precisely, this command first toggles the default value of
`case-fold-search', and then it sets the other variables to the value
of `case-fold-search'.

Note:
1. This toggles the default value of `case-fold-search'.  This means
that it does not matter which buffer is current when you call this
command - all buffers are affected henceforth.

2. Some Icicles commands bind one or more of these variables, so
invoking this command during command execution will not necessarily
toggle the global values of all of the variables.

Bound to `C-A' in the minibuffer, that is, `C-S-a'.</span>"
  (interactive "<span class="quote">P</span>")
  (setq-default case-fold-search        (not case-fold-search)
                completion-ignore-case  case-fold-search)
  (when file+buff-p
    (when (boundp 'read-file-name-completion-ignore-case) <span class="linecomment">; Emacs 22+</span>
      (setq read-file-name-completion-ignore-case  case-fold-search))
    (when (boundp 'read-buffer-completion-ignore-case) <span class="linecomment">; Emacs 23+</span>
      (setq read-buffer-completion-ignore-case  case-fold-search)))
  (icicle-complete-again-update)
  (icicle-highlight-lighter)
  (icicle-msg-maybe-in-minibuffer
   (cond ((and case-fold-search
               (or (not (boundp 'read-file-name-completion-ignore-case))
                   read-file-name-completion-ignore-case)
               (or (not (boundp 'read-buffer-completion-ignore-case))
                   read-buffer-completion-ignore-case))
          "<span class="quote">Case-sensitive comparison is now OFF, everywhere</span>")
         (case-fold-search "<span class="quote">Case-sensitive comparison is now OFF, except for files and buffers</span>")
         (t "<span class="quote">Case-sensitive comparison is now ON, everywhere</span>"))))

<span class="linecomment">;; `icicle-delete-window' (`C-x 0') does this in minibuffer.</span>
<span class="linecomment">;; `icicle-abort-recursive-edit' call this with non-nil FORCE.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-remove-Completions-window (&optional force)
  "<span class="quote">Remove the `*Completions*' window.
If not called interactively and `*Completions*' is the selected
window, then do not remove it unless optional arg FORCE is non-nil.</span>"
  (interactive)
  <span class="linecomment">;; We do nothing if `*Completions*' is the selected window</span>
  <span class="linecomment">;; or the minibuffer window is selected and `*Completions*' window was selected just before.</span>
  (let ((swin  (selected-window)))
    <span class="linecomment">;; Emacs 20-21 has no `minibuffer-selected-window' function, but we just ignore that.</span>
    (when (and (window-minibuffer-p swin) (fboundp 'minibuffer-selected-window))
      (setq swin  (minibuffer-selected-window)))
    (cond (<span class="linecomment">;; `*Completions*' is shown in the selected frame.</span>
           (and (get-buffer-window "<span class="quote">*Completions*</span>")
                (or force               <span class="linecomment">; Let user use `C-g' to get rid of it even if selected.</span>
                    (and (window-live-p swin) <span class="linecomment">; Not sure needed.</span>
                         (not (eq (window-buffer swin) (get-buffer "<span class="quote">*Completions*</span>"))))
                    (interactive-p)))
           <span class="linecomment">;; Ignore error, in particular, "Attempt to delete the sole visible or iconified frame".</span>
           (condition-case nil (delete-window (get-buffer-window "<span class="quote">*Completions*</span>")) (error nil))
           (bury-buffer (get-buffer "<span class="quote">*Completions*</span>")))
          (<span class="linecomment">;; `*Completions*' is shown in a different frame.</span>
           (and (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)
                (or force               <span class="linecomment">; Let user use `C-g' to get rid of it even if selected.</span>
                    (and (window-live-p swin)
                         (not (eq (window-buffer swin) (get-buffer "<span class="quote">*Completions*</span>"))))
                    (interactive-p)))
           <span class="linecomment">;; Ignore error, in particular, "Attempt to delete the sole visible or iconified frame".</span>
           (when (window-dedicated-p (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
             (condition-case nil (icicle-delete-windows-on "<span class="quote">*Completions*</span>")  (error nil)))
           (bury-buffer (get-buffer "<span class="quote">*Completions*</span>"))))))

<span class="linecomment">;; This is actually a top-level command, but it is in this file because it is used by</span>
<span class="linecomment">;; `icicle-remove-Completions-window'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-windows-on (buffer)
  "<span class="quote">Delete all windows showing BUFFER.
If such a window is alone in its frame, then delete the frame - unless
it is the only frame or a standalone minibuffer frame.</span>"
  (interactive
   (list (let ((enable-recursive-minibuffers  t))
           (read-buffer "<span class="quote">Remove all windows showing buffer: </span>" (current-buffer) 'existing))))
  (setq buffer  (get-buffer buffer))    <span class="linecomment">; Convert to buffer.</span>
  (when buffer                          <span class="linecomment">; Do nothing if null BUFFER.</span>
    <span class="linecomment">;; Avoid error message "Attempt to delete minibuffer or sole ordinary window".</span>
    (let* ((this-buffer-frames  (icicle-frames-on buffer t))
           (this-frame          (car this-buffer-frames)))
      (unless (and this-frame (frame-visible-p this-frame)
                   (null (cdr this-buffer-frames)) <span class="linecomment">; Only one frame shows BUFFER.</span>
                   (eq (cdr (assoc 'minibuffer (frame-parameters this-frame)))
                       (active-minibuffer-window)) <span class="linecomment">; Has an active minibuffer.</span>
                   (save-window-excursion
                     (select-frame this-frame)
                     (one-window-p t 'SELECTED-FRAME-ONLY))) <span class="linecomment">; Only one window.</span>
        (let (win)
          (dolist (fr  this-buffer-frames)
            (setq win  (get-buffer-window buffer fr))
            (select-window win)
            (if (and (one-window-p t) (cdr (visible-frame-list))) <span class="linecomment">; Sole window but not sole frame.</span>
                (delete-frame)
              (delete-window (selected-window)))))))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-mcmd)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-mcmd.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-mcmd.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mcmd.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-mcmd.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-mcmd.el">Administration</a></span><span class="time"><br /> Last edited 2011-06-27 03:19 UTC by <a class="author" title="from 148.87.67.197" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-mcmd.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
