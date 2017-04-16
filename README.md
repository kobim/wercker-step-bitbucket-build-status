# bitbucket-build-status

Posts wercker build status to the bitbucket repository.

[![wercker status](https://app.wercker.com/status/d3a53826349f440a8dd568ec421f1e7f/m "wercker status")](https://app.wercker.com/project/bykey/d3a53826349f440a8dd568ec421f1e7f)

### Required fields

* `username` - API username.
* `password` - API password.

# Example

```yaml
    build:
        steps:
            - kobim/bitbucket-build-status: # Sets the build status to INPROGRESS
                username: $BITBUCKET_USER
                password: $BITBUCKET_PASS
            - npm-install
            - npm-testk
        after-steps:
            - kobim/bitbucket-build-status: # Sets the build status to PASSED/FAILED
                username: $BITBUCKET_USER
                password: $BITBUCKET_PASS
```

# License

The MIT License (MIT)

Copyright (c) 2017 Kobi Meirson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog

## 0.0.1
- initial version
