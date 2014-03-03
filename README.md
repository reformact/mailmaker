Mailtemplate
===

Easy e-mail making in the making.

```
$ bundle install
$ foreman start
$ vim public/email.css                        # edit to your hearts content
$ open -a Safari http://localhost:5000/       # normal source
$ open -a Safari http://localhost:5000/email  # e-mail compatible source
```

Put images (.png .jpg .gif) in `project-directory/base64` and they'll be available in views by like this `@base64[:foo]` (original image is named foo.png).
