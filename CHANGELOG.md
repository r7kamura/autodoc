# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 0.7.2 - 2019-01-09

### Fixed

- Fixed broken symlink on spec/dummy/spec.

## 0.7.1 - 2018-12-18

## 0.7.0 - 2018-08-30

### Changed

- Shell-escape given path.
- Use `#to_hash` to response headers if it can respond it.

## 0.6.2 - 2017-08-22

### Fixed

- Support multibyte query parameters.

## 0.6.1 - 2017-05-30

### Fixed

- Fix Ruby-level warnings.

## 0.6.0 - 2016-03-03

### Changed

- Change the message capitalization rule.

## 0.5.3 - 2016-02-19

### Fixed

- Fix bugs on pending examples.

## 0.5.2 - 2015-09-18

### Fixed

- Fix version detector.

## 0.5.1 - 2015-06-28

### Fixed

- Fix lambda syntax.

## 0.5.0 - 2015-04-22

### Added

- Add `Autodoc.configuration.document_path_from_example`.

## 0.4.5 - 2015-04-10

### Added

- Support other specs directory than spec/requests.

## 0.4.4 - 2015-03-31

### Added

- Support image response.

## 0.4.3 - 2015-02-28

### Added

- Support nested parameters on weak_parameters.

## 0.4.2 - 2015-02-13

### Added

- Add HTML Documentation support.

## 0.4.1 - 2015-01-13

### Added

- Support RSpec 2.99.

## 0.4.0 - 2014-10-29

### Added

- Support RSpec 3.

## 0.3.6 - 2014-05-19

### Added

- Show dummy message if Content-Type might be BINARY.

## 0.3.5 - 2014-02-15

### Added

- Support PATCH method.

## 0.3.4 - 2014-01-24

### Added

- Some improvements on the document template file.

## 0.3.3 - 2013-12-30

### Fixed

- Fix ToC template for specs in sub-directory.

## 0.3.2 - 2013-12-18

### Fixed

- Fix template & document bug.

## 0.3.1 - 2013-12-17

### Added

- Filter request & response header by Autodoc.configuration.suppress_{request,response}_header.

### Changed

- Prettify JSON request body.

## 0.3.0 - 2013-12-17

### Changed

- Change Autodoc::Document interface & template to mimic HTTP text.

## 0.2.8 - 2013-12-17

### Changed

- Include query string into document template.

## 0.2.7 - 2013-12-05

### Changed

- Sort list in ToC.

## 0.2.6 - 2013-12-02

### Fixed

- Fix ToC generator.

## 0.2.5 - 2013-11-30

### Added

- Add ToC generator.
- Use Autodoc.configuration.path to change documents path.

## 0.2.4 - 2013-11-30

### Added

- Add Documents class.

## 0.2.3 - 2013-11-30

### Changed

- Clean up dependencies & implementation.

## 0.2.2 - 2013-11-29

### Fixed

- Fix default documented headers.

## 0.2.1 - 2013-11-29

### Fixed

- Fix load dependency on rspec.

## 0.2.0 - 2013-11-29

### Changed

- Remove dependency on awesome_print.

## 0.1.9 - 2013-11-01

### Fixed

- Fix encoding error at ruby 1.9 or earlier versions.

## 0.1.8 - 2013-10-23

### Added

- Support rack-test.

## 0.1.7 - 2013-10-08

### Changed

- Change response format from Ruby hash table to JSON object.

## 0.1.6 - 2013-09-04

### Added

- Support WeakParameter's :description option.

## 0.1.5 - 2013-08-22

## 0.1.4 - 2013-08-20

## 0.1.3 - 2013-08-20

## 0.1.2 - 2013-07-29

## 0.1.1 - 2013-07-29

### Added

- Custom template.

## 0.1.0 - 2013-07-12

### Added

- AUTODOC environment variable.

## 0.0.9 - 2013-07-08

## 0.0.8 - 2013-07-08

### Changed

- Show request body.

## 0.0.7 - 2013-06-18

## 0.0.6 - 2013-06-14

## 0.0.5 - 2013-06-11

## 0.0.4 - 2013-06-11

## 0.0.3 - 2013-06-11

### Added

- Configurable response header.

## 0.0.2 - 2013-06-10

## 0.0.1 - 2013-06-07

### Added

- 1st release on 2013-06-07.
