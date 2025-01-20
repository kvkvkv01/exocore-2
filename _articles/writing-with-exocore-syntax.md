---
published: true
subtitle:
topic: meta
date: 2025-01-20
tags: exocore
foam_template:
  filepath: '_articles/writing-with-exocore-syntax.md'
  name: Article
---

# Writing with Exocore Syntax

## Markdown Basics

The Exocore utilizes standardized Markdown syntax, along with some additional extensions. Much of the content of this article covers existing markdown syntax used universally in plain text formatting. However, some syntax, such as [[writing-with-exocore-syntax#Examples of Wikilinks|text]] and [[writing-with-exocore-syntax#Inserting images|images]] are particular to the Exocore.

* [A Simple markdown cheat sheet](https://www.markdownguide.org/cheat-sheet/#basic-syntax)

* [A more comprehensive markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Headers

The above is a level 2 heading, preceded by `##` and a space.

There's nothing special about the way the Exocore processes headers— it's just standard markdown. However, each header will render with an anchor link. If you hover over a heading and click the link icon that appears, the URL in your browser will reflect the section that you clicked. Now, if you copy that URL it will link directly to the heading that you clicked.

### Heading levels

The above is a level 3 heading, preceded by `###` and a space.

Here's some advice: Only use top-level headings (preceded by `#`) for the document's title. Aside from being markdown best practice, the Exocore takes your first top-level heading to use as the title of the page in the final rendered output. For intra-document section titles, use a level 2 heading. It's for the best.

## Examples of Wikilinks

Here is a basic wikilink, pointing to other posts on this Exocore: `[[Exocore Executive Summary]]` It renders like this: [[exocore-executive-summary]].

It is written as the title of their corresponding markdown file, surrounded by double square brackets. However, in the final render they are presented by default as the page's title. This saves you typing out the whole page title in your markdown document, and allows the Foam VSCode extension to suggest files as you type. Below you can read about how to change their presentation.

You can alias a link like this: ``[[chinese-ginseng-chicken-tonic-soup|this link]]`` if you don't want to keep the title. Heads up— ``[[chinese-ginseng-chicken-tonic-soup|This link]]`` points to a recipe for Chinese ginseng chicken Soup.

You can also point to headers within a page: `[[Writing with Exocore Syntax#Wikilink Embeds|This wikilink]]`. [[writing-with-exocore-syntax#Wikilink Embeds]] points to a header further down on this page, by using a `#`. Under that header you will find a different sort of wikilink — an embed. The content of another note is embedded within the current note. You can also point to a particular header within another note.  

Check out the backlinks section at the bottom of any post, and you'll find a list of every post that links back to it. Backlinks are automatically generated, and display all posts with links pointing to them.

## Wikilink Embeds

The below text is embedded, using the same wikilink syntax as normal, but with an `!` prepended. The full text of the linked note will be included. For example, here is an example of embedded note syntax:

![[2025-01-jade-post]]

## External Hyperlinks

Hyperlinks to external sites are not the same as wikilinks. A wikilink is a simple way to hyperlink to other posts on your Exocore without using the full processed URL as it is rendered online. A wikilink works locally in VSCode, allowing you to navigate between posts, and is transformed at render time to a web hyperlink, so that it always points to the correct page.

If hyperlinks come from wikipedia or PDFs a a pop-up containing the linked page will show up.

[[BAP, BRONZE AGE MINDSET.pdf]]

To create a hyperlink, use single normal parentheses around the URL you want to point to, and square brackets around the text you want displayed:

[https://en.wikipedia.org/wiki/Parenthesis](https://en.wikipedia.org/wiki/Parenthesis)

`[https://en.wikipedia.org/wiki/Parenthesis](https://en.wikipedia.org/wiki/Parenthesis)`

You can alias a hyperlink by changing the text in the square brackets, like this:

[Here's some information about Hyperlinks.](https://en.wikipedia.org/wiki/Hyperlink)

`[Here's some information about Hyperlinks.](https://en.wikipedia.org/wiki/Hyperlink)`

## Applying classes to a paragraph or image

{:.right-aside}
**Oh, by the way:** You can apply the `{:.right-aside}` class to create an aside, like this one. An aside floats to one side and other text wraps around it. `{:.left-aside}` is also available for some variety.

Kramdown, the Markdown parser used by this implementation of the Exocore, has the ability to apply a CSS class to a paragraph by including syntax like `{:.classname}` at the top or bottom of a paragraph. The class will be applied to the whole paragraph. The Exocore stylesheet includes a few general classes meant to be used for just this purpose, which you should feel free to add to.

**The following classes are pre-defined in the Exocore stylesheet:**

* `{:.center}` — *Reduces width of paragraph and centers it for emphasis*
* `{:.left-aside}`, `{:.right-aside}` — *Applies a border and floats to the left/right. Other text will wrap around it*
* `{:.left}`, `{:.right}` - *Reduces width and places to the left/right (meant for images)*
* `{:.border}` - *applies a thin border*
* `{:.shadow}` - *applies a dark blurred drop shadow*
* `{:.glow}` - *applies a bright blurred drop shadow (produces a glowing effect)*
* `{:.flip}` - *flips the image (or text) horizontally*

## Tables

```markdown
| You can           | create a          | simple table      | like this.     |
| ----------------- | ----------------- | ----------------- | -------------- |
| A new line        | in markdown       | extends the table | vertically.    |
| A pipe            | extends the table | laterally.        |                |
```

| You can           |  create a         | simple table      | like this.      |
| ----------------- | ----------------- | ----------------- | --------------- |
| A new line        | in markdown       | extends the table | vertically.     |
| A pipe            | extends the table | laterally.        |                 |

For more options, check out the 'advanced tables' plugin in the sidebar. This plugin will assist you with spacing and syntax, and includes a powerful formula function, about which you can find information [here](https://github.com/tgrosinger/md-advanced-tables/blob/main/docs/formulas.md).

## Graphviz

For more complex data representation, [Graphviz](https://en.wikipedia.org/wiki/Graphviz) can be used in conjunction with the Exocore. Read more about Graphviz syntax [here](https://graphviz.org/documentation/), and find a demonstration of the way it is used with the Exocore [[2025-01-exocore-workflow|here]].

## Sidenotes and Footnotes

Footnotes are done with `[^1]`, and look like this: [^1] Each footnote is an anchor link to the bottom of the page, with a return link attached. Notice the sidenote in the right margin, identical to the footnote.

All footnotes are also rendered as sidenotes. A footnote forms a commentary or citation best kept separate from the main text, and a sidenote is an easy way for a reader to access such commentary without breaking ergonomy by jumping up and down the page.

If you want to add multi-paragraph footnotes, indent your second paragraph, like this (see footnote at bottom).[^2]

```markdown
[^2]: For longer footnotes, you may want to use multiple paragraphs.

    Indent paragraphs to include them in the footnote.
```

You can put a footnote's markdown reference immediately under a paragraph, like this[^3], or clump them at the end. Either way, they will appear at the bottom in your rendered content.

`[^3]: This footnote appears immediately underneath its referring paragraph in this document's original markdown, but on the rendered website it shows at the bottom.`

[^3]: This footnote appears immediately underneath its referring paragraph in this document's original markdown, but on the rendered website it shows at the bottom.

Footnotes automatically form a numbered list, and can also be mapped by name, like this: `[^named-footnote]`[^named-footnote]

[^1]: This is the first footnote. Note the return button:

[^2]: For longer footnotes, you may want to use multiple paragraphs.

	Indent paragraphs to include them in the footnote.

[^named-footnote]: This footnote has the name 'named-footnote'. it's still numbered and appears in sequence the same way the others do, but naming it might help you manage a document with many footnotes when dealing with your local markdown.

## Inserting images

To insert an image, use the following syntax:

```markdown
![](/images/mouse.jpg)
```

You can insert alt text and a caption like this:

```markdown
![This is alt text](/images/mouse.jpg)
*Insert a caption by placing italicised text immediately underneath the image*
```

The above snippet produces the below outcome:

![This is alt text](/images/mouse.jpg)*Insert a caption by placing italicised text immediately underneath the image, with no empty line in between.*

## Embedded Code

To embed a piece of code so that characters are rendered verbatim, surround the code snippet with ``` on either side, like so:

```bash
#!/bin/zsh
cd ~/desktop/cvcvcv && bundle exec jekyll serve --baseurl ''
```

Use just one ` to embed code in the same line as the rest of your text.

## Naming files

Don't use whitespace in your filenames— instead, name-them-like-this. This way, titles are easily converted to URLs and the back end of the Exocore remains happy. This of course applies only to filenames, and you may title your posts how you wish.

## Collapsed text

Managing complexity of pages is a balancing act. It is good to provide all necessary code to reproduce results, but does the reader really want to look at a big block of code? Sometimes they always would, sometimes only a few readers interested in the gory details will want to read the code. Similarly, a section might go into detail on a tangential topic or provide additional justification, which most readers don’t want to plow through to continue with the main theme. Should the code or section be deleted? No. But relegating it to an appendix, or another page entirely is not satisfactory either—for code blocks particularly, one loses the literate programming aspect if code blocks are being shuffled around out of order.

A nice solution is to simply use a little JavaScript to implement [code folding](https://en.wikipedia.org/wiki/Code_folding) approach where sections or code blocks can be visually shrunk or collapsed, and expanded on demand by a mouse click. Collapsed sections are specified by a HTML class, and summaries of a collapsed section can be displayed, defined by another class. This allows code blocks to be collapse by default where they are lengthy or distracting, and for entire regions to be collapsed & summarized, without resorting to many appendices or forcing the reader to an entirely separate page.

You can use collapsible sections like this:

```md
{% include collapsible.html
    preview='{Preview Text}'
    content='{Preview Content}'
%}
```

Here is an example:

{% include collapsible.html
    preview='From “Narrative Consumption” to “Database Consumption”'
    content='

To summarize the discussion up to this point, there is no longer a narrative in the deep inner layer, beneath the works and products such as comics, anime, games, novels, illustrations, trading cards, figurines, and so on. In the multimedia environment of the 1990s, it is only characters that unite various works and products. The consumer, knowing this, moves easily back and forth between projects with a narrative (comics, anime, novels) and projects without one (illustrations and figurines). Here, the individual projects are the simulacra and behind them is the database of characters and settings.

At yet another level, however, each character is merely a simulacrum, derived from the database of moe-elements. In other words, the double-layer structure of the simulacra and the database is again doubled, forming a complex system. The otaku first consume individual works, and sometimes are moved by them. But they are also aware that, in fact, the works are merely simulacra, consisting only of the characters. Then they consume characters, and sometimes feel moe in them. But they are also aware that, in fact, the characters are just simulacra, consisting only of combinations of moe-elements. In my observation, Di Gi Charat is a project created with a high degree of self-awareness of the doubled (and perhaps even tripled) consciousness of the otaku.

Therefore, to consume Di Gi Charat is not simply to consume a work (a small narrative) or a worldview behind it (a grand narrative), nor to consume characters and settings (a grand nonnarrative). Rather, it is linked to consuming the database of otaku culture as a whole. I call this consumer behavior database consumption, in contrast with Ōtsuka’s “narrative consumption.”

In the shift from modernity to postmodernity, our world image is experiencing a sea change, from one sustained by a narrative -like, cinematic perspective on the entire world to one read -up by search engines, characterized by databases and interfaces. Amid this change, the Japanese otaku lost the grand narrative in the 1970s, learned to fabricate the lost grand narrative in the 1980s (narrative consumption), and in the 1990s, abandoned the necessity for even such fabrication and learned simply to desire the database (database consumption). Roughly speaking, such a trend may be surmised from Ōtsuka’s critical essay and my own observation.
    '
%}

---

That should be everything to get you started!

[//begin]: # "Autogenerated link references for markdown compatibility"
[writing-with-exocore-syntax#Examples of Wikilinks|text]: writing-with-exocore-syntax "Writing with Exocore Syntax"
[writing-with-exocore-syntax#Inserting images|images]: writing-with-exocore-syntax "Writing with Exocore Syntax"
[exocore-executive-summary]: exocore-executive-summary "The Exocore Package"
[writing-with-exocore-syntax#Wikilink Embeds]: writing-with-exocore-syntax "Writing with Exocore Syntax"
[2025-01-jade-post]: ../_journal/2025-01-jade-post "Jade post"
[BAP, BRONZE AGE MINDSET.pdf]: <../library/BAP%2C BRONZE AGE MINDSET.pdf> "BAP, BRONZE AGE MINDSET.pdf"
[//end]: # "Autogenerated link references"