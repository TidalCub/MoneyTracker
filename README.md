# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Versioning
This project uses [Semantic Versioning](https://semver.org/). To release a new version, run one of the following rake tasks:
```bash
bundle exec rake bake:semver:major # will increment major version number e.g. v1.0.0
bundle exec rake bake:semver:minor # will increment minor version number e.g. v0.1.0
bundle exec rake bake:semver:patch # will increment patch version number e.g. v0.0.1

git push origin main --tags
```
--- 

# Template information
## Devise 

Device has been installed and configured to the User model, the views have been generated.

## Testing
Rspec rails has been included.
Simplecov has been included and configured to start automatically when running tests.

## SCSS
`application.css` has been renamed to `application.scss`
Bootstrap is included and has been imported into `application.scss`

## HTML
Slim has been included

## Linters
Rubocop and Slim Lint has been included
