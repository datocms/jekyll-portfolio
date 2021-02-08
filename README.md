# Jekyll Portfolio Website

This repo contains a working static website written with [Jekyll](https://jekyllrb.com), integrated with content coming from DatoCMS.

By clicking the following button you'll set up a project on DatoCMS with the schema and data that you need to run this example.

[![Deploy with DatoCMS](https://dashboard.datocms.com/deploy/button.svg)](https://dashboard.datocms.com/projects/new-from-template/static-website/jekyll-portfolio)

## Usage

First, install the dependencies of this project:

```
npm install && bundle install
```

Add an `.env` file containing the read-only API token of your DatoCMS site:

```
echo 'DATO_API_TOKEN=abc123' >> .env
```

Then, to run this website in development mode (with live-reload):

```
npm start
```

To build the final, production ready static website:

```
npm run build
```

The final result will be saved in the `public` directory.

## About

The goal of this project is to show how easily you can create static sites using the content (text, images, links, etc.) stored on [DatoCMS](https://www.datocms.com). This project is configured to fetch data from a specific administrative area using [the API DatoCMS provides](https://www.datocms.com/docs/content-management-api).

This websites uses:

* [Yarn](https://yarnpkg.com/) as package manager;
* [Webpack](https://webpack.github.io/) to compile and bundle assets (Sass/ES2015 JS);
* [dato](https://github.com/datocms/ruby-datocms-client) gem to integrate the website with DatoCMS.

## The `dato.config.rb` file

To convert the content stored on DatoCMS into local Markdown files that can be digested by Jekyll, the datocms-client plugin requires an explicit mapping file called [`dato.config.js`](https://github.com/datocms/jekyll-portfolio/blob/master/dato.config.rb). You can read more about the commands available in this file [in the official documentation](https://docs.datocms.com/jekyll/overview.html).


