<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-face.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-face.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-face.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-face.el" />
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
      title="Changes for icicles-face.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-face.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-face.el%22">icicles-face.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/icicles-face.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-face.el --- Faces for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-face.el</span>
<span class="linecomment">;; Description: Faces for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:19:43 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Wed May  4 11:11:39 2011 (-0700)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 528</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-face.el</span>
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
<span class="linecomment">;;  customization groups and faces.  For Icicles documentation, see</span>
<span class="linecomment">;;  `icicles-doc1.el' and `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Groups defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `Icicles', `Icicles-Buffers', `Icicles-Completions-Display',</span>
<span class="linecomment">;;    `Icicles-Files', `Icicles-Key-Bindings',</span>
<span class="linecomment">;;    `Icicles-Key-Completion', `Icicles-Matching',</span>
<span class="linecomment">;;    `Icicles-Minibuffer-Display', `Icicles-Miscellaneous',</span>
<span class="linecomment">;;    `Icicles-Searching'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Faces defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-candidate-part',</span>
<span class="linecomment">;;    `icicle-common-match-highlight-Completions',</span>
<span class="linecomment">;;    `icicle-complete-input', `icicle-completion',</span>
<span class="linecomment">;;    `icicle-Completions-instruction-1',</span>
<span class="linecomment">;;    `icicle-Completions-instruction-2',</span>
<span class="linecomment">;;    `icicle-current-candidate-highlight', `icicle-extra-candidate',</span>
<span class="linecomment">;;    `icicle-historical-candidate', `icicle-input-completion-fail',</span>
<span class="linecomment">;;    `icicle-input-completion-fail-lax',</span>
<span class="linecomment">;;    `icicle-match-highlight-Completions',</span>
<span class="linecomment">;;    `icicle-match-highlight-minibuffer', `icicle-mode-line-help',</span>
<span class="linecomment">;;    `icicle-multi-command-completion',</span>
<span class="linecomment">;;    `icicle-mustmatch-completion', `icicle-proxy-candidate',</span>
<span class="linecomment">;;    `icicle-saved-candidate', `icicle-search-context-level-1',</span>
<span class="linecomment">;;    `icicle-search-context-level-2',</span>
<span class="linecomment">;;    `icicle-search-context-level-3',</span>
<span class="linecomment">;;    `icicle-search-context-level-4',</span>
<span class="linecomment">;;    `icicle-search-context-level-5',</span>
<span class="linecomment">;;    `icicle-search-context-level-6',</span>
<span class="linecomment">;;    `icicle-search-context-level-7',</span>
<span class="linecomment">;;    `icicle-search-context-level-8', `icicle-search-current-input',</span>
<span class="linecomment">;;    `icicle-search-main-regexp-current',</span>
<span class="linecomment">;;    `icicle-search-main-regexp-others', `icicle-special-candidate',</span>
<span class="linecomment">;;    `icicle-whitespace-highlight', `minibuffer-prompt'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-increment-color-hue',</span>
<span class="linecomment">;;    `icicle-increment-color-saturation'.</span>
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
<span class="linecomment">;;  (@&gt; "Groups, organized alphabetically")</span>
<span class="linecomment">;;  (@&gt; "Faces, organized alphabetically")</span>
 
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

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Groups, organized alphabetically")</span>

<span class="linecomment">;;; Groups, organized alphabetically ---------------------------------</span>

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles nil
  "<span class="quote">Minibuffer input completion and cycling of completion candidates.</span>"
  :prefix "<span class="quote">icicle-</span>"
  :group 'completion :group 'convenience :group 'help :group 'apropos
  :group 'dabbrev :group 'matching :group 'minibuffer :group 'recentf
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Buffers nil
  "<span class="quote">Icicles preferences related to buffers.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Files nil
  "<span class="quote">Icicles preferences related to files.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Completions-Display nil
  "<span class="quote">Icicles preferences related to display of completion candidates.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Key-Bindings nil
  "<span class="quote">Icicles preferences related to key bindings.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Key-Completion nil
  "<span class="quote">Icicles preferences related to key completion (`icicle-complete-keys').</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Matching nil
  "<span class="quote">Icicles preferences related to matching input for completion.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Minibuffer-Display nil
  "<span class="quote">Icicles preferences related to minibuffer display during completion.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Miscellaneous nil
  "<span class="quote">Miscellaneous Icicles preferences.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )

<span class="linecomment">;;;###autoload</span>
(defgroup Icicles-Searching nil
  "<span class="quote">Icicles preferences related to searching.</span>"
  :prefix "<span class="quote">icicle-</span>" :group 'Icicles
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>"
                   "<span class="quote">.com?subject=icicles.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and Icicles library versions.</span>"))
  :link '(url-link :tag "<span class="quote">Other Libraries by Drew</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/DrewsElispLibraries</span>")
  :link '(url-link :tag "<span class="quote">Download</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/icicles.el</span>")
  :link '(url-link :tag "<span class="quote">Description</span>"
          "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part2</span>" "<span class="quote">icicles-doc2</span>")
  :link '(emacs-commentary-link :tag "<span class="quote">Doc-Part1</span>" "<span class="quote">icicles-doc1</span>")
  )
 
<span class="linecomment">;;(@* "Faces, organized alphabetically")</span>

<span class="linecomment">;;; Faces, organized alphabetically ----------------------------------</span>

<span class="linecomment">;;;###autoload</span>
(defface icicle-candidate-part
    '((((background dark)) (:background "<span class="quote">#451700143197</span>")) <span class="linecomment">; a very dark magenta</span>
      (t (:background "<span class="quote">#EF84FFEAF427</span>"))) <span class="linecomment">; A light green.</span>
  "<span class="quote">*Face used to highlight part(s) of a candidate in `*Completions*'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-common-match-highlight-Completions
    '((((background dark)) (:foreground "<span class="quote">#2017A71F2017</span>")) <span class="linecomment">; a dark green</span>
      (t (:foreground "<span class="quote">magenta3</span>")))
  "<span class="quote">*Face used to highlight candidates common match, in `*Completions*'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-complete-input
  '((((background dark)) (:foreground "<span class="quote">#B19E6A64B19E</span>")) <span class="linecomment">; a dark magenta</span>
    (t (:foreground "<span class="quote">DarkGreen</span>")))
  "<span class="quote">*Face used to highlight input when it is complete.</span>"
  :group 'Icicles-Minibuffer-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-completion
    '((((background dark)) (:foreground "<span class="quote">#0000D53CD53C</span>")) <span class="linecomment">; a dark cyan</span>
      (t (:foreground "<span class="quote">Red</span>")))                            <span class="linecomment">; red</span>
  "<span class="quote">*Face used to indicate minibuffer completion.
It highlights the minibuffer indicator and the `Icy' minor-mode
lighter during completion.
Not used for versions of Emacs before version 21.</span>"
  :group 'Icicles-Minibuffer-Display :group 'Icicles-Miscellaneous :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-Completions-instruction-1
  '((((background dark)) (:foreground "<span class="quote">#AC4AAC4A0000</span>")) <span class="linecomment">; a dark yellow</span>
    (t (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used to highlight first line of `*Completions*' buffer.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-Completions-instruction-2
    '((((background dark)) (:foreground "<span class="quote">#0000D53CD53C</span>")) <span class="linecomment">; a dark cyan</span>
      (t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">*Face used to highlight second line of `*Completions*' buffer.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-current-candidate-highlight
  '((((background dark)) (:background "<span class="quote">#69D40A460000</span>")) <span class="linecomment">; a red brown</span>
    (t (:background "<span class="quote">CadetBlue1</span>")))
  "<span class="quote">*Face used to highlight the current candidate, in `*Completions*'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-extra-candidate
    '((((background dark)) (:background "<span class="quote">#4517305D0000</span>")) <span class="linecomment">; a dark brown</span>
      (t (:background "<span class="quote">#C847D8FEFFFF</span>"))) <span class="linecomment">; a light blue</span>
  "<span class="quote">*Face used to highlight `*Completions*' candidates that are extra.
This means that they belong to list `icicle-extra-candidates'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-historical-candidate
  '((((background dark)) (:foreground "<span class="quote">#DBD599DF0000</span>")) <span class="linecomment">; a dark orange</span>
    (t (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used to highlight `*Completions*' candidates that have been used.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-input-completion-fail
    '((((background dark)) (:background "<span class="quote">#22225F5F2222</span>")) <span class="linecomment">; a dark green</span>
      (t (:foreground "<span class="quote">Black</span>" :background "<span class="quote">Plum</span>")))
  "<span class="quote">*Face for highlighting failed part of input during strict completion.</span>"
  :group 'Icicles-Minibuffer-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-input-completion-fail-lax
    '((((background dark)) (:background "<span class="quote">#00005E3B5A8D</span>")) <span class="linecomment">; a dark cyan</span>
      (t (:foreground "<span class="quote">Black</span>" :background "<span class="quote">#FFFFB8C4BB87</span>")))
  "<span class="quote">*Face for highlighting failed part of input during lax completion.</span>"
  :group 'Icicles-Minibuffer-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-match-highlight-Completions
    '((((background dark)) (:foreground "<span class="quote">#1F1FA21CA21C</span>")) <span class="linecomment">; a very dark cyan</span>
      (t (:foreground "<span class="quote">Red3</span>")))
  "<span class="quote">*Face used to highlight root that was completed, in `*Completions*'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-match-highlight-minibuffer '((t (:underline t)))
  "<span class="quote">*Face used to highlight root that was completed, in minibuffer.</span>"
  :group 'Icicles-Minibuffer-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-mode-line-help
  '((((background dark)) (:foreground "<span class="quote">#AC4AAC4A0000</span>")) <span class="linecomment">; a dark yellow</span>
    (t (:foreground "<span class="quote">Blue</span>")))
  "<span class="quote">*Face used to highlight help shown in the mode-line.</span>"
  :group 'Icicles-Completions-Display :group 'Icicles-Miscellaneous :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-multi-command-completion
    '((((background dark)) <span class="linecomment">; a dark cyan on a dark magenta</span>
       (:foreground "<span class="quote">#0000D53CD53C</span>" :background "<span class="quote">#8B3500007533</span>"))
      (t (:foreground "<span class="quote">Red</span>" :background "<span class="quote">#78F6FFFF8E4F</span>"))) <span class="linecomment">; red on a light green</span>
  "<span class="quote">*Face used to indicate Icicles multi-command completion.
It highlights the minibuffer indicator and the `Icy+' minor-mode
lighter during multi-command completion.
Not used for versions of Emacs before version 21.</span>"
  :group 'Icicles-Minibuffer-Display :group 'Icicles-Miscellaneous :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-mustmatch-completion
    '((((type x w32 mac graphic) (class color))
       (:box (:line-width -2 :color "<span class="quote">Blue</span>"))) <span class="linecomment">; blue box</span>
      (t (:inverse-video t)))
  "<span class="quote">*Face used to indicate strict minibuffer completion.
It highlights the minibuffer indicator and the `Icy' or `Icy+'
minor-mode lighter during strict completion.
Not used for versions of Emacs before version 21.</span>"
  :group 'Icicles-Minibuffer-Display :group 'Icicles-Miscellaneous :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-proxy-candidate
    '((((background dark)) (:background "<span class="quote">#316B22970000</span>")) <span class="linecomment">; a very dark brown</span>
      (t (:background "<span class="quote">#E1E1EAEAFFFF</span>"   <span class="linecomment">; A light blue.</span>
          :box (:line-width 2 :color "<span class="quote">White</span>" :style released-button))))
  "<span class="quote">*Face used to highlight proxy candidates in `*Completions*'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-saved-candidate
    '((((background dark)) (:background "<span class="quote">gray20</span>"))   <span class="linecomment">; a dark gray</span>
      (t (:background "<span class="quote">gray80</span>"))) <span class="linecomment">; a light gray</span>
  "<span class="quote">*Face used to highlight `*Completions*' candidates that have been saved.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-main-regexp-current
  '((((background dark)) (:background "<span class="quote">#00004AA652F1</span>")) <span class="linecomment">; a dark cyan</span>
    (t (:background "<span class="quote">misty rose</span>")))
  "<span class="quote">*Face used to highlight current match of your search context regexp.
This highlighting is done during Icicles searching.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for hue only.</span>
<span class="linecomment">;; Must be before `icicle-search-context-level-1'.</span>
(defun icicle-increment-color-hue (color increment)
  "<span class="quote">Increase hue component of COLOR by INCREMENT.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-increment-color-hue' requires library `hexrgb.el'</span>"))
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb         (x-color-values color))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq hue  (+ hue (/ increment 100.0)))
    (when (&gt; hue 1.0) (setq hue  (1- hue)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for saturation only.</span>
<span class="linecomment">;; Must be before `icicle-search-context-level-1'.</span>
(defun icicle-increment-color-saturation (color increment)
  "<span class="quote">Increase saturation component of COLOR by INCREMENT.</span>"
  (unless (featurep 'hexrgb)
    (error "<span class="quote">`icicle-increment-color-saturation' requires library `hexrgb.el'</span>"))
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb         (x-color-values color))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq saturation  (+ saturation (/ increment 100.0)))
    (when (&gt; saturation 1.0) (setq saturation  (1- saturation)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-1
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-saturation
                            (icicle-increment-color-hue context-bg 80) 10)
                           "<span class="quote">#071F473A0000</span>"))) <span class="linecomment">; a dark green</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-saturation
                              (icicle-increment-color-hue context-bg 80) 10)
                             "<span class="quote">#FA6CC847FFFF</span>"))))) <span class="linecomment">; a light magenta</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 1 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-2
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-saturation
                            (icicle-increment-color-hue context-bg 40) 10)
                           "<span class="quote">#507400002839</span>"))) <span class="linecomment">; a dark red</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-saturation
                              (icicle-increment-color-hue context-bg 40) 10)
                             "<span class="quote">#C847FFFFE423</span>"))))) <span class="linecomment">; a light cyan</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 2 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-3
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-saturation
                            (icicle-increment-color-hue context-bg 60) 10)
                           "<span class="quote">#4517305D0000</span>"))) <span class="linecomment">; a dark brown</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-saturation
                              (icicle-increment-color-hue context-bg 60) 10)
                             "<span class="quote">#C847D8FEFFFF</span>"))))) <span class="linecomment">; a light blue</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 3 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-4
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-saturation
                            (icicle-increment-color-hue context-bg 20) 10)
                           "<span class="quote">#176900004E0A</span>"))) <span class="linecomment">; a dark blue</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-saturation
                              (icicle-increment-color-hue context-bg 20) 10)
                             "<span class="quote">#EF47FFFFC847</span>"))))) <span class="linecomment">; a light yellow</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 4 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-5
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-hue context-bg 80)
                           "<span class="quote">#04602BC00000</span>"))) <span class="linecomment">; a very dark green</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-hue context-bg 80)
                             "<span class="quote">#FCFCE1E1FFFF</span>"))))) <span class="linecomment">; a light magenta</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 5 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-6
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-hue context-bg 40)
                           "<span class="quote">#32F200001979</span>"))) <span class="linecomment">; a very dark red</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-hue context-bg 40)
                             "<span class="quote">#E1E1FFFFF0F0</span>"))))) <span class="linecomment">; a light cyan</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 6 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-7
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-hue context-bg 60)
                           "<span class="quote">#316B22970000</span>"))) <span class="linecomment">; a very dark brown</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-hue context-bg 60)
                             "<span class="quote">#E1E1EAEAFFFF</span>"))))) <span class="linecomment">; a light blue</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 7 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-context-level-8
    (let ((context-bg  (face-background 'icicle-search-main-regexp-current)))
      `((((background dark))
         (:background ,(if (featurep 'hexrgb)
                           (icicle-increment-color-hue context-bg 20)
                           "<span class="quote">#12EC00003F0E</span>"))) <span class="linecomment">; a very dark blue</span>
        (t (:background ,(if (featurep 'hexrgb)
                             (icicle-increment-color-hue context-bg 20)
                             "<span class="quote">#F6F5FFFFE1E1</span>"))))) <span class="linecomment">; a light yellow</span>
  "<span class="quote">*Face used to highlight level (subgroup match) 8 of your search context.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-current-input
    '((((background dark))
       (:foreground "<span class="quote">White</span>" :background "<span class="quote">#7F0D00007F0D</span>")) <span class="linecomment">; a dark magenta</span>
      (t (:foreground "<span class="quote">Black</span>" :background "<span class="quote">Green</span>")))
  "<span class="quote">*Face used to highlight what your current input matches.
This highlighting is done during Icicles searching whenever
`icicle-search-highlight-context-levels-flag' is non-nil and the
search context corresponds to the entire regexp.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-search-main-regexp-others
  '((((background dark)) (:background "<span class="quote">#348608690000</span>")) <span class="linecomment">; a very dark brown</span>
    (t (:background "<span class="quote">CadetBlue1</span>")))
  "<span class="quote">*Face used to highlight other matches of your search context regexp.
If user option `icicle-search-highlight-threshold' is less than one,
then this face is not used.
This highlighting is done during Icicles searching.</span>"
  :group 'Icicles-Searching :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-special-candidate
    '((((background dark)) (:background "<span class="quote">#176900004E0A</span>")) <span class="linecomment">; a dark blue</span>
      (t (:background "<span class="quote">#EF47FFFFC847</span>")))   <span class="linecomment">; A light yellow.</span>
  "<span class="quote">*Face used to highlight `*Completions*' candidates that are special.
The meaning of special is that their names match
`icicle-special-candidate-regexp'.</span>"
  :group 'Icicles-Completions-Display :group 'faces)

<span class="linecomment">;;;###autoload</span>
(defface icicle-whitespace-highlight
    '((((background dark)) (:background "<span class="quote">#000093F402A2</span>")) <span class="linecomment">; a medium green</span>
      (t (:background "<span class="quote">Magenta</span>")))
  "<span class="quote">*Face used to highlight initial whitespace in minibuffer input.</span>"
  :group 'Icicles-Minibuffer-Display :group 'faces)

<span class="linecomment">;; This is defined in `faces.el', Emacs 22.  This is for Emacs &lt; 22.  This is used</span>
<span class="linecomment">;; only for versions of Emacs that have `propertize' but don't have this face.</span>
(unless (facep 'minibuffer-prompt)
  (defface minibuffer-prompt '((((background dark)) (:foreground "<span class="quote">cyan</span>"))
                               (t (:foreground "<span class="quote">dark blue</span>")))
    "<span class="quote">*Face for minibuffer prompts.</span>"
    :group 'basic-faces))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-face)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-face.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-face.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-face.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-face.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-face.el">Administration</a></span><span class="time"><br /> Last edited 2011-05-04 21:47 UTC by <a class="author" title="from inet-hqmc04-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-face.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
