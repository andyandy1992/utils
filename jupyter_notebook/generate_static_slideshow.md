Having created a slideshow with https://github.com/damianavila/RISE

Generate with:


```
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
```

Then following [stack](https://stackoverflow.com/a/38023879/5179470)

`jupyter nbconvert Presentation.ipynb --to slides --post serve --reveal-prefix "http://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0"`
