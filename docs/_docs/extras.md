---
title: Extras
permalink: /docs/extras/
---

There are a number of (optional) extra features that Bunto supports that you
may want to install, depending on how you plan to use Bunto.

## Math Support

Kramdown comes with optional support for LaTeX to PNG rendering via [MathJax](https://www.mathjax.org) within math blocks. See the Kramdown documentation on [math blocks](http://kramdown.gettalong.org/syntax.html#math-blocks) and [math support](http://kramdown.gettalong.org/converter/html.html#math-support) for more details. MathJax requires you to include JavaScript or CSS to render the LaTeX, e.g.

```html
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
```

For more information about getting started, check out [this excellent blog post](http://gastonsanchez.com/visually-enforced/opinion/2014/02/16/Mathjax-with-bunto/).

## Alternative Markdown Processors

See the Markdown section on the [configuration page](/docs/configuration/#markdown-options) for instructions on how to use and configure alternative Markdown processors, as well as how to create [custom processors](/docs/configuration/#custom-markdown-processors).
