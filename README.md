### prereqs
[See directions here](http://docs.basho.com/riak/latest/ops/building/installing/erlang/) or use [homebrew](http://mxcl.github.com/homebrew/) if you're on a Mac:

    brew install erlang

Install heroku gem:

    gem install heroku


### install

Clone this repo with `git clone git://github.com/6/heroku-erlang-example.git`

`cd` into it, and then:

    make
    foreman start

This will start the web server locally at [http://localhost:5000](http://localhost:5000)

### running on heroku with Heroku's [erlang buildpack](https://github.com/heroku/heroku-buildpack-erlang)

    heroku create
    heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-erlang.git

Then just push it to heroku with `git push heroku master`
