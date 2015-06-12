# wintersmith-yaml-page

Just like JSON pages for Wintersmith, this allows you to specify just metadata in YAML files and it will produce a page.

## Why?

I like the idea of the [JSON content files](https://github.com/jnordberg/wintersmith#model) built into wintersmith itself, but really dislike writing JSON by hand. I find YAML to be much easier to read and write, especially in these very simple key-value situations. If you need to pass complex types to the template context then JSON might still be the best choice, but you should be able to get pretty far with YAML.

## Installing

Install using `npm`:

```
npm install --save wintersmith-yaml-page
```

and add `wintersmith-yaml-page` to your config.json

```json
{
  "plugins": [
    "wintersmith-yaml-page"
  ]
}
```

## Usage

Create a file in your content folder that has a `.yml` or `.yaml` extension and defines metadata in the YAML format.

```yaml
template: about.jade
filename: about/index.html
```

## Author

© 2015 Paul McLanahan <http://pmac.io>

## License

Released under the [MIT License](http://pmac.mit-license.org).
