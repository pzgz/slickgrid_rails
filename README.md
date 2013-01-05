# Slickgrid for rails

A simple wrap of [SlickGrid](https://github.com/mleibman/SlickGrid) for rails, asset pipeline enabled.

## Installation

Add this line to your application's Gemfile:

    gem 'slickgrid_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slickgrid_rails

## Updating slickrails from original fork

The slickrails javascript lib has been imported via submodule, to update this gem, do following:

    git submodule foreach git pull
    rake

## Usage

### Javascripts

#### Easy way

In ```application.js``` file, added following to include all javascript files for slickgrid:

```js
//= require slickgrid
```

#### More detail way

In ```application.js``` file, added following to include all javascript files for slickgrid, ofcoz, you can specify only the js files you need to load:

```js
//= require slickgrid/core
//= require slickgrid/controls
//= require slickgrid/plugins
```

#### Most detail way

You also can breakdown all the files for including:

```js
//= require slickgrid/core/slick.core.js
//= require slickgrid/core/slick.grid.js
//= require slickgrid/core/slick.editors.js
//= require slickgrid/core/slick.formatters.js
//= require slickgrid/core/slick.groupitemmetadataprovider.js

//= require slickgrid/controls/slick.columnpicker.js
//= require slickgrid/controls/slick.pager.js

//= require slickgrid/plugins/slick.autotooltips.js
//= require slickgrid/plugins/slick.cellcopymanager.js
//= require slickgrid/plugins/slick.cellrangedecorator.js
//= require slickgrid/plugins/slick.cellrangeselector.js
//= require slickgrid/plugins/slick.cellselectionmodel.js
//= require slickgrid/plugins/slick.checkboxselectcolumn.js
//= require slickgrid/plugins/slick.headerbuttons.js
//= require slickgrid/plugins/slick.headermenu.js
//= require slickgrid/plugins/slick.rowmovemanager.js
//= require slickgrid/plugins/slick.rowselectionmodel.js
```

### Stylesheets

#### Easiest way

Add following line to ```application.css``` file:

```css
 *= require slickgrid
```

### More detail way

Just like what we did in javascript part, we can include only the part of files we needed:

```css
 *= require slickgrid/core.css
 *= require slickgrid/controls.css
 *= require slickgrid/plugins.css
```

### Most detail way

Furthermore, if we need to breakdown all style files, following are the files we provided:

```css
 *= require slickgrid/core/slick.grid.css
 *= require slickgrid/core/slick-default-theme.css
 
 *= require slickgrid/controls/slick.columnpicker.css
 *= require slickgrid/controls/slick.pager.css

 *= require slickgrid/plugins/slick.headerbuttons.css
 *= require slickgrid/plugins/slick.headermenu.css
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
