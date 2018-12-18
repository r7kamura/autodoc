# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.7.0

### Changed

- Shell-escape given path.
- Use `#to_hash` to response headers if it can respond it.

## 0.6.2

### Fixed

- Support multibyte query parameters.

## 0.6.1

### Fixed

- Fix Ruby-level warnings.

## 0.6.0

### Changed

- Change the message capitalization rule.

## 0.5.3

### Fixed

- Fix bugs on pending examples.

## 0.5.2

### Fixed

- Fix version detector.

## 0.5.1

### Fixed

- Fix lambda syntax.

## 0.5.0

### Added

- Add `Autodoc.configuration.document_path_from_example`.

## 0.4.5

### Added

- Support other specs directory than spec/requests.

## 0.4.4

### Added

- Support image response.

## 0.4.3

### Added

- Support nested parameters on weak_parameters.

## 0.4.2

### Added

- Add HTML Documentation support.

## 0.4.1

### Added

- Support RSpec 2.99.

## 0.4.0

### Added

- Support RSpec 3.

## 0.3.6

### Added

- Show dummy message if Content-Type might be BINARY.

## 0.3.5

### Added

- Support PATCH method.

## 0.3.4

### Added

- Some improvements on the document template file.

## 0.3.3

### Fixed

- Fix ToC template for specs in sub-directory.

## 0.3.2

### Fixed

- Fix template & document bug.

## 0.3.1

### Added

- Filter request & response header by Autodoc.configuration.suppress_{request,response}_header.

### Changed

- Prettify JSON request body.

## 0.3.0

### Changed

- Change Autodoc::Document interface & template to mimic HTTP text.

## 0.2.8

### Changed

- Include query string into document template.

## 0.2.7

### Changed

- Sort list in ToC.

## 0.2.6

### Fixed

- Fix ToC generator.

## 0.2.5

### Added

- Add ToC generator.
- Use Autodoc.configuration.path to change documents path.

## 0.2.4

### Added

- Add Documents class.

## 0.2.3

### Changed

- Clean up dependencies & implementation.

## 0.2.2

### Fixed

- Fix default documented headers.

## 0.2.1

### Fixed

- Fix load dependency on rspec.

## 0.2.0

### Changed

- Remove dependency on awesome_print.

## 0.1.9

### Fixed

- Fix encoding error at ruby 1.9 or earlier versions.

## 0.1.8

### Added

- Support rack-test.

## 0.1.7

### Changed

- Change response format from Ruby hash table to JSON object.

## 0.1.6

### Added

- Support WeakParameter's :description option.

## 0.1.1

### Added

- Custom template.

## 0.1.0

### Added

- AUTODOC environment variable.

## 0.0.8

### Changed

- Show request body.

## 0.0.3

### Added

- Configurable response header.

## 0.0.1

### Added

- 1st release on 2013-06-07.
